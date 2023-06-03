//
//  Alamofire+Extension.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation
import Alamofire


public extension DataRequest {
    
    @discardableResult
    func asyncDecodable<T: Decodable>(of type: T.Type = T.self,
                                      queue: DispatchQueue = .main,
                                      dataPreprocessor: DataPreprocessor = DecodableResponseSerializer<T>.defaultDataPreprocessor,
                                      decoder: DataDecoder = JSONDecoder(),
                                      emptyResponseCodes: Set<Int> = DecodableResponseSerializer<T>.defaultEmptyResponseCodes,
                                      emptyRequestMethods: Set<HTTPMethod> = DecodableResponseSerializer<T>.defaultEmptyRequestMethods) async throws -> T {
        
        return try await withCheckedThrowingContinuation({ continuation in
            
            self.responseDecodable(of: type, queue: queue, dataPreprocessor: dataPreprocessor, decoder: decoder, emptyResponseCodes: emptyResponseCodes, emptyRequestMethods: emptyRequestMethods) { response in
                
                switch response.result {
                case .success(let decodedResponse):
                    continuation.resume(returning: decodedResponse)
                case .failure(let error):
                    let errorMessage: String = self.handleError(response, error)
                    continuation.resume(throwing: NetworkError.customError(errorMessage))
                }
            }
        })
    }
    
    private func handleError<T>(
        _ response: DataResponse<T, AFError>,
        _ error: (AFError)) -> String {
            
            var respBody : String = ""
            
            if let respData = response.data {
                respBody = String(data: respData, encoding: .utf8) ?? "empty response body"
            }
            
            /// 2 - Extract debug info
            let respCode : Int = response.response?.statusCode ?? 0
            
            let sourcePath = response.request?.url?.absoluteString ?? "no url"
            
            
            /// 1 - Essential debug info
            print(
            """
             ======================
             URL
             -> \(sourcePath)
             
             Status
             -> \(respCode)
             
             Body
             -> \(respBody)
            
             Underlying Error
             -> \(String(describing: error.underlyingError))
             
             Error Description
             -> \(error.errorDescription!)
             ======================
            """
            )
            
            /// 4 - Client display
            return error.errorDescription ?? "undefined"
            
        }
}
