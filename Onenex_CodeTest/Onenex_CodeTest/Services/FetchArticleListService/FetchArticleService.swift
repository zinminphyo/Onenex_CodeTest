//
//  FetchArticleService.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


struct FetchArticleService: FetchArticleServiceProtocol {
    func fetch() async throws -> PaginationResponseModel<[String : ArticleModel]> {
        let router = ApiRouter.fetchArticleLists
        return try await NetworkService.shared.request(router: router)
    }
}
