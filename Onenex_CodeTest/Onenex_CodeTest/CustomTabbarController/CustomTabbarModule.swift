//
//  CustomTabbarModule.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import Foundation
import UIKit


enum CustomTabbarControllerModule {
    static func createModule() -> CustomTabbarController? {
        let st = UIStoryboard(name: "CustomTabbarController", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: CustomTabbarController.self)) as? CustomTabbarController else { return nil }
        return vc
    }
}
