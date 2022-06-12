//
//  ProductModel.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
//HizliGeliyo:- veri çekme
struct Product: Codable {
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}
//HizliGeliyo:- Veriler için boş küme array tanımlayıp filtreleme sayfasına yazdırma
typealias ProductModels = [Product]
