//
//  UIImageView+Extensions.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(with imageUrl: String?) {
        
        guard let imageUrl = imageUrl,
              let url = URL(string: imageUrl) else { return }

    }
}
