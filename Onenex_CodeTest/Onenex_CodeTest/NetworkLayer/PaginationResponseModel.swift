//
//  PaginationResponseModel.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


struct PaginationResponseModel<T: Decodable>: Decodable {
    
    let message: String
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }
}
