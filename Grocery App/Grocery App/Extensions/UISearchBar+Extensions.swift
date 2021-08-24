//
//  UISearchBar+Extensions.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit


extension UISearchBar {
    
    func setFieldColor(_ color: UIColor) {
        let textFields = allSubviewsOf(type: UITextField.self)

        for textField in textFields {
            textField.backgroundColor = color
        }
    }
    
}
