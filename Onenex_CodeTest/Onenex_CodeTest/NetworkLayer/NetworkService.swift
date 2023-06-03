//
//  NetworkService.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation
import Alamofire




class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    func request<T:Decodable>(router: ApiRouter) async throws -> PaginationResponseModel<T> {
        let router = ApiRouter.fetchArticleLists
        return try await AF.request(router, method: router.method, parameters: router.parameters, encoding: router.encoding, headers: router.header)
            .asyncDecodable(of: PaginationResponseModel<T>.self)
            
    }
}
