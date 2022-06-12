//
//  Network.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
//HizliGeliyo:- Network Katmanı
class Network {
    
    let apiURL = "https://fakestoreapi.com/products"
    static let shared = Network()
    
    func fetchProducts(completionHandler:@escaping (ProductModels) -> ()){
        guard let requestURL = URL(string: apiURL) else {return}
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            
            guard let data = data else {
                Logger.log(text: "\(String(describing: error))")
                return
            }
            Logger.log(text: "\(data)")
            do {
                let products = try JSONDecoder().decode(ProductModels.self, from: data)
                completionHandler(products)
            }
            catch(let error){
                Logger.log(text: "\(error)")
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
