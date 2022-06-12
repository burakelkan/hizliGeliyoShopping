//
//  Double+Extensions.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation

extension Double {
    
    var toString: String {
        return String(self)
    }
    
    var toStringWithCurrency: String {
        return self.toString + "TL"
    }
}
