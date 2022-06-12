//
//  BaseViewController.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import UIKit
//HizliGeliyo:- Navigation için dışarda yazdırıp sayfalara aktarmak için var olan sınıf
class NavigationBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        let backButton = UIBarButtonItem(title: "Hızlı Geliyo", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
    
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
  
}
