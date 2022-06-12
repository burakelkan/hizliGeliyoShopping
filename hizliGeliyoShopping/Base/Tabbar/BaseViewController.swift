//
//  GeliyoTabBarController.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import UIKit
//HizliGeliyo:- Tabbar için dışarda yazdırıp sayfalara aktarmak için var olan sınıf
class BaseViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(1)
        tabBar.unselectedItemTintColor =  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).withAlphaComponent(2)
        tabBar.tintColor =  #colorLiteral(red: 0.9978141189, green: 0.7873669267, blue: 0, alpha: 1)
        geliyoTabbar()
    }
    private func geliyoTabbar() {
        let productNav = UINavigationController()
        let productVC = ProductRouter.createModule(navigationController: productNav)
        productNav.viewControllers = [productVC]
        let secondVC = CategoryViewController()
        let navigation2 = templateNavigationController(image: UIImage(systemName: "circle.grid.3x3.fill")!, rootViewController: secondVC)
        
        let ThirdVC = CartViewController()
        let navigation3 = templateNavigationController(image: UIImage(systemName: "bell")!, rootViewController: ThirdVC)
        
        let ProfileVC = ProfileViewController()
        let navigation4 = templateNavigationController(image: UIImage(systemName: "person.fill")!, rootViewController: ProfileVC)
        self.addChild(productNav)
        self.addChild(navigation2)
        self.addChild(navigation3)
        self.addChild(navigation4)
        productNav.tabBarItem.image = UIImage(systemName: "house")
    }
    
    private func templateNavigationController(image:UIImage,rootViewController: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem.image = image
        navigation.navigationBar.barTintColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return navigation
    }
}
