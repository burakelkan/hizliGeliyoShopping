//
//  ProductDetailRouter.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
import UIKit

class ProductDetailRouter{
//HizliGeliyo:- ProductDetaile sayfa yönlendirme
    var sayfa = NavigationBaseViewController()
    static func createModule(name: String, image: String, price: String, description: String ) -> ProductDetailViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
  
        let presenter = ProductDetailPresenter(view: view,name: name, image: image, price: price, description: description)
        view.presenter = presenter
        return view
    }
}
