//
//  MyPockerModule.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation
import UIKit


enum MyPocketModule {
    static func createModule() -> MyPocket? {
        let st = UIStoryboard(name: "MyPocket", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: MyPocket.self)) as? MyPocket else { return nil }
        let item = UITabBarItem()
        item.image = UIImage(named: "wallet")
        item.title = "My Pocket"
        vc.tabBarItem = item
        return vc
    }
}
