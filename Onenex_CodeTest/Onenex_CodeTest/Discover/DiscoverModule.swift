//
//  DiscoverModule.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 31/05/2023.
//

import Foundation
import UIKit


enum DiscoverModule {
    static func createModule() -> Discover? {
        let st = UIStoryboard(name: "Discover", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Discover.self)) as? Discover else { return nil }
        let item = UITabBarItem()
        item.image = UIImage(named: "discovery")
        item.title = "Discover"
        vc.tabBarItem = item
        return vc
    }
}
