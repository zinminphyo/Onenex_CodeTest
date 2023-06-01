//
//  CustomTabbar.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    var upperLineView: UIView!
    
    let spacing: CGFloat = 12
    
    private let vc = [
        HomeModule.createModule() ?? UIViewController(),
        DiscoverModule.createModule() ?? UIViewController()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.delegate = self
        configureHierarchy()
        
        
    }
    
    private func configureHierarchy() {
        configureTopView()
        self.viewControllers = vc
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    
    
    private func configureTopView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.width, height: 2))
        view.backgroundColor = UIColor.tertiarySystemFill
        self.tabBar.addSubview(view)
        
        
    }

    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
          guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
              return
          }
          if !isFirstTime{
              upperLineView.removeFromSuperview()
          }
          upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 4))
          upperLineView.backgroundColor = UIColor.black
          tabBar.addSubview(upperLineView)
      }
    

}


extension CustomTabbarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
