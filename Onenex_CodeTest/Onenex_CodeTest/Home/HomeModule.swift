//
//  HomeModule.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 31/05/2023.
//

import Foundation
import UIKit


enum HomeModule {
    static func createModule() -> Home? {
        let st = UIStoryboard(name: "Home", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Home.self)) as? Home else { return nil }
        let item = UITabBarItem()
        item.image = UIImage(systemName: "house")
        item.title = "Home"
        vc.tabBarItem = item
        
        let presenter = HomePresenter()
        presenter.viewDelegate = vc
        
        vc.presenter = presenter
        
        let interactor = HomeInteractor()
        presenter.interactor = interactor
        
        return vc
    }
}
