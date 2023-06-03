//
//  HomeInteracting.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 03/06/2023.
//

import Foundation


protocol HomeInteracting {
    func fetchArticleLists() async throws -> PaginationResponseModel<[String:ArticleModel]>
}
