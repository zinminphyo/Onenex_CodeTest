//
//  CollectModule.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation
import UIKit


enum CollectModule {
    static func createModule() -> Collect? {
        let st = UIStoryboard(name: "Collect", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Collect.self)) as? Collect else { return nil }
        let item = UITabBarItem()
        item.image = UIImage(systemName: "qrcode.viewfinder")
        item.title = "Collect/Pay"
        vc.tabBarItem = item
        return vc
    }
}
