//
//  HomeInteractor.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 03/06/2023.
//

import Foundation


class HomeInteractor: HomeInteracting {
    
    func fetchArticleLists() async throws -> PaginationResponseModel<[String : ArticleModel]> {
        let service = FetchArticleService()
        return try await service.fetch()
    }
    
    
}
