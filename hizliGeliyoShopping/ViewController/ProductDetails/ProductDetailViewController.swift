//
//  ProductDetailsViewController.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import UIKit
import SDWebImage

protocol ProductDetailViewInterface: AnyObject{
    func fetchProductDetails(name: String, image: String, price: String, description: String)
}
class ProductDetailViewController: NavigationBaseViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    var presenter: ProductDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}
extension ProductDetailViewController: ProductDetailViewInterface {
    func fetchProductDetails(name: String,image: String,price: String, description: String) {
        self.productTitleLabel.text = name
        self.productImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
        self.productPriceLabel.text = price + " TL"
        self.productDescriptionLabel.text = description
    }
}
