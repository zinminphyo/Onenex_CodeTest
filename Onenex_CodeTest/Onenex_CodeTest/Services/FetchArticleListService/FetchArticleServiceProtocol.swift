//
//  FetchArticleServiceProtocol.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


protocol FetchArticleServiceProtocol {
    func fetch() async throws -> PaginationResponseModel<[String:ArticleModel]>
}
