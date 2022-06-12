//
//  ProductRouter.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
import UIKit
//HizliGeliyo:- Protocol
protocol ProductRouterInterface {
    func navigateToVC(name: String,image: String, price: String, description: String)
}

class ProductRouter{
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
//HizliGeliyo:- Product sayfasına yönlendirme
    static func createModule(navigationController: UINavigationController) -> ProductViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        let interactor = ProductInteractor()
        let router = ProductRouter(navigationController: navigationController)
        let presenter = ProductPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}
extension ProductRouter: ProductRouterInterface {
    
    func navigateToVC(name: String, image: String, price: String, description: String) {
        let productDetailVC = ProductDetailRouter.createModule(name: name, image: image, price: price, description: description)
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
