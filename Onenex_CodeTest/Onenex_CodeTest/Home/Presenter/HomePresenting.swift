//
//  HomePresenting.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


protocol HomePresenting {
    var viewDelegate: HomeViewDelegate? { get set }
    var interactor: HomeInteracting? { get set }
    func fetchArticleLists()
}
