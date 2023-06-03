//
//  HomeViewDelegate.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


protocol HomeViewDelegate: LoadingPresentable {
    var presenter: HomePresenting? { get set }
    func render(state: Home.State)
}
