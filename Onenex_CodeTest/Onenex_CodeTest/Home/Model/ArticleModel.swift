//
//  ArticleModel.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


struct ArticleModel: Decodable {
    let id: Int
    let articleId: Int
    let title: String
    let content: String
    let createdAt: String
     
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case articleId = "article_category_id"
        case createdAt = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        
        lazy var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
            return formatter
        }()
        
        lazy var formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "dd MMM"
            return formatter
        }()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        articleId = try container.decode(Int.self, forKey: .articleId)
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
        let created_at = try container.decode(String.self, forKey: .createdAt)
        if let created_at_date = dateFormatter.date(from: created_at) {
            createdAt = formatter.string(from: created_at_date)
        } else {
            createdAt = "_"
        }
    }
}
