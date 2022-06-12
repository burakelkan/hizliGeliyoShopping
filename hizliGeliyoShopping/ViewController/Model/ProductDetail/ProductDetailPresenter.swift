//
//  ProductDetailPresenter.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation

protocol ProductDetailPresenterDetail {
    func viewDidLoad()
}
class ProductDetailPresenter {
//HizliGeliyo:- ProductDetaile veri aktarma
    weak var view: ProductDetailViewInterface?
    private let name: String
    private let image: String
    private let price: String
    private let description: String
    init(view: ProductDetailViewInterface?, name: String,image: String, price: String, description: String) {
        self.view = view
        self.name = name
        self.image = image
        self.price = price
        self.description = description
    }
}
extension ProductDetailPresenter: ProductDetailPresenterDetail {
    func viewDidLoad() {
        view?.fetchProductDetails(name: name, image: image, price: price, description: description)
    }
}
