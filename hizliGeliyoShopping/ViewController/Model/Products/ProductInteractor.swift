//
//  ProductInteractor.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
//HizliGeliyo:- Product sayfasının yardımcıları
protocol ProductInteractorInterface {
    func fetchProducts()
}
protocol ProductInteractorOutput: AnyObject {
    func handleFetchResult(products: ProductModels)
}
class ProductInteractor{
    weak var output: ProductInteractorOutput?
}
extension ProductInteractor: ProductInteractorInterface {
    func fetchProducts() {
        Network.shared.fetchProducts { products in
            self.output?.handleFetchResult(products: products)
        }
    }
}
