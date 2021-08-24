//
//  UIDevice+Extensions.swift
//  Grocery App
//
//  Created by Adriano Rezena on 22/08/21.
//

import UIKit


enum ScreenType: String {
    case iPhones_4_4S = "iPhone 4 or iPhone 4S"
    case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
    case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
    case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
    case iPhones_X_XS_11_Pro = "iPhone X, iPhone XS or iPhone 11 Pro"
    case iPhone_XR_11 = "iPhone XR or iPhone 11"
    case iPhone_XSMax_11_Pro_Max = "iPhone XS Max ou iPhone 11 Pro Max"
    case iPadMini_iPad9_7
    case iPad10_2
    case iPad10_5
    case iPadPro11
    case iPadPro12
    case unknown
 }


extension UIDevice {
    
    static var screenType: ScreenType {       
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR_11
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS_11_Pro
        case 2688:
            return .iPhone_XSMax_11_Pro_Max
        case 2048:
           return .iPadMini_iPad9_7
        case 2160:
           return .iPad10_2
        case 2224:
           return .iPad10_5
        case 2388:
           return .iPadPro11
        case 2732:
           return .iPadPro12
           
        default:
            return .unknown
        }
    }
    
}
