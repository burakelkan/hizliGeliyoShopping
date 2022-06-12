//
//  UIView+Extensions.swift
//  hizliGeliyoShopping
//
//  Created by Yusuf Burak Elkan on 09.06.2022.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable
    var borderWidth: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable
    var shadowOpacity: CGFloat{
        set{
            layer.shadowOpacity = Float(newValue)
        }
        get {
            return CGFloat(layer.shadowOpacity)
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat{
        set{
            layer.shadowRadius = CGFloat(Float(newValue))
        }
        get {
            return CGFloat(layer.shadowRadius)
        }
    }
}
