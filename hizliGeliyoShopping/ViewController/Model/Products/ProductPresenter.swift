//
//  ProductPresenter.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
//HizliGeliyo:- Product Protocol
protocol ProductPresenterInterface {
    func viewDidLoad()
    func productForIndex(_ indexPath: Int) -> Product
    var numberOfProducts: Int{ get }
    func update(with filter: String)
    func selectProduct(at indexPath: Int)
}
class ProductPresenter {
    weak var view: ProductViewInterface?
    private let interactor: ProductInteractorInterface
    private let router: ProductRouterInterface
    private var Product = ProductModels()
    
    init(view: ProductViewInterface?, interactor: ProductInteractorInterface, router: ProductRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    private func fetchRequest(){
        interactor.fetchProducts()
    }
}
extension ProductPresenter: ProductPresenterInterface {
    func selectProduct(at indexPath: Int) {
        let product = Product[indexPath]
        self.router.navigateToVC(name: product.title, image: product.image, price: String(product.price),description: product.description)
    }
//HizliGeliyo:- Apilerden çekilen verileri işleme alma filtreleme ve yazdırma.
    func update(with filter: String) {
        Network.shared.fetchProducts { products in
            self.Product = products
            var filteredProducts = ProductModels()
            switch filter {
            case "Men's Clothing":
                self.Product.forEach { product in
                    if product.category == "men's clothing" {
                        filteredProducts.append(product)
                    }
                }
            case "Women's Clothing":
                self.Product.forEach { product in
                    if product.category == "women's clothing" {
                        filteredProducts.append(product)
                    }
                }
            case "Electronics":
                self.Product.forEach { product in
                    if product.category == "electronics" {
                        filteredProducts.append(product)
                    }
                }
            default:
                self.Product.forEach { product in
                    if product.category == "jewelery" {
                        filteredProducts.append(product)
                    }
                }
            }
            self.Product = filteredProducts
            
            DispatchQueue.main.async {
                self.view?.reloadProducts()
            }
        }
    }
    func productForIndex(_ indexPath: Int) -> Product {
        Product[indexPath]
    }
    var numberOfProducts: Int {
        Product.count
    }
    func viewDidLoad() {
        view?.prepareNavBar()
        view?.prepareButtons()
        view?.prepareCollectionView()
        fetchRequest()
    }
}
extension ProductPresenter: ProductInteractorOutput {
    func handleFetchResult(products: ProductModels) {
        self.Product = products
        DispatchQueue.main.async {
            self.view?.reloadProducts()
        }
    }
}
