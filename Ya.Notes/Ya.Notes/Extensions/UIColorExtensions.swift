//
//  UIColorExtensions.swift
//  Ya.Notes
//
//  Created by Daniel Kunis on 08/08/2019.
//  Copyright © 2019 Daniel Kunis. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
    
    /**
     the six-digit hexadecimal representation of color of the form #RRGGBB.
     - parameter hex6:  Six-digit hexadecimal value.
     - parameter alpha: alpha: 0.0 - 1.0. The default is 1.0.
     */
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let red = CGFloat((hex6 & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((hex6 & 0x00FF00) >> 8) / 0xFF
        let blue = CGFloat((hex6 & 0x0000FF) >> 0) / 0xFF
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     the six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
     - parameter hex8: Eight-digit hexadecimal value.
     */
    convenience init(hex8: UInt32) {
        let red = CGFloat((hex8 & 0xFF000000) >> 24) / 0xFF
        let green = CGFloat((hex8 & 0x00FF0000) >> 16) / 0xFF
        let blue = CGFloat((hex8 & 0x0000FF00) >> 8) / 0xFF
        let alpha = CGFloat((hex8 & 0x000000FF) >> 0) / 0xFF
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     convenience failable initializer which creates an instance with given hex color values if string has a correct format
     - parameter hexString: hex string with red green and blue values (can have `#` sign)
     - parameter alpha: alpha component used if not given in hexString
     */
    convenience init?(hexString: String, alpha: CGFloat = 1) {
        let hexStr: String
        
        if hexString.hasPrefix("#") {
            hexStr = String(hexString[hexString.index(hexString.startIndex, offsetBy: 1)...])
        } else {
            hexStr = hexString
        }
        
        let charactersCount = hexStr.count
        
        switch charactersCount {
        case 6, 8:
            if let hex = UInt32(hexStr, radix: 16) {
                if charactersCount == 6 {
                    self.init(hex6: hex, alpha: alpha)
                } else {
                    self.init(hex8: hex)
                }
            } else {
                return nil
            }
            
        default:
            return nil
        }
    }
    
    /// Hex representation of UIColor as String
    var hexString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let intRepresentation = alpha == 1
            ? Int(red * 255) << 16 | Int(green * 255) << 8 | Int(blue * 255) << 0
            : Int(red * 255) << 24 | Int(green * 255) << 16 | Int(blue * 255) << 8 | Int(alpha * 255) << 0
        
        return String(intRepresentation, radix: 16)
    }
}
