//
//  UIColor+Extensions.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit


extension UIColor {
    //New colors
    
    // header
    static let mainLabel = UIColor(named: "mainLabel")!
    static let mainLabelSec = UIColor(named: "mainLabelSec")!
    static let mainLabelDest = UIColor(named: "mainLabelDest")!
    
    static let mainBackground = UIColor(named: "mainBackground")!
    static let mainBackgroundSec = UIColor(named: "mainBackgroundSec")!
    
    static let mainGreen = UIColor(named: "mainGreen")!
    static let mainGreenSec = UIColor(named: "mainGreenSec")!
    static let mainGreenTer = UIColor(named: "mainGreenTer")!
    
    static let mainButtonGradientDark = UIColor(named: "mainButtonGradientDark")!
    static let mainButtonGradientLight = UIColor(named: "mainButtonGradientLight")!
    static let mainButtonAssetNav = UIColor(named: "mainButtonAssetNav")!
    
    
    
    public convenience init(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            //let start = hexString.startIndex.hashValue.advanced(by: 1)
            //let hexColor0 = hexString.substring(from: hexString.index(after: hexString.startIndex))
            let index = hex.index(after: hex.startIndex)
            let hexColor = String(hex[index...])
            //let hexColor = hexString.substringFromIndex(start)

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        } else {
            let hexColor = hex

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }

        }

        self.init(red: 1, green: 1, blue: 1, alpha: 1)
        return
    }
    
}
