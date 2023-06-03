//
//  LoadingPresentable.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 04/06/2023.
//

import Foundation
import SVProgressHUD
import UIKit

protocol LoadingPresentable {
    func showLoading()
    func hideLoading()
}


extension LoadingPresentable where Self: UIViewController {
    func showLoading() {
        SVProgressHUD.show()
    }
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
