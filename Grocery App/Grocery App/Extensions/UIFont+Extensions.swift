//
//  UIFont+Extensions.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit


extension UIFont {
    
    class func custom(_ type: CustomFontType, size: CGFloat = 14) -> UIFont {
        let font = UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
        return font
    }
    
    func withAutoSize(_ fontSize: CGFloat, constant: CGFloat? = nil) -> UIFont {
        let fontConstant = constant ?? 0
        
        if UIDevice.screenType == .iPhones_5_5s_5c_SE {
            return withSize((fontSize * 0.875) + fontConstant)
        }
            
        return withSize(fontSize + fontConstant)
    }
    
}
