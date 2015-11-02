//
//  ColorsBase.swift
//  RockyHelpers
//
//  Created by Airat Uraev on 02/11/15.
//
//

import Foundation

public class ColorsBase {
    
    // MARK: - Methods
    
    static let numberFormatter: NSNumberFormatter = {
        var formatter = NSNumberFormatter()
        return formatter}()
    
    class func colorFromText(hexText: String) -> UIColor! {
        let hexValue: Int! = numberFormatter.numberFromString(hexText.stringByReplacingOccurrencesOfString("#", withString: ""))?.integerValue
        var color: UIColor!
        
        if hexValue != nil {
            color = UIColor(red: CGFloat(((hexValue & 0xFF0000) >> 16))/255.0, green: CGFloat(((hexValue & 0xFF00) >> 8))/255.0, blue: CGFloat(((hexValue & 0xFF) >> 0))/255.0, alpha: 1.0)
        }
        
        return color
    }
    
    class func colorFromHex(hexValue: UInt) -> UIColor {
        var alpha: CGFloat! = 1.0
        
        if hexValue > 0xFFFFFF {
            alpha = CGFloat(((hexValue & 0xFF000000) >> 24))
        }
        
        return UIColor(red: CGFloat(((hexValue & 0xFF0000) >> 16))/255.0, green: CGFloat(((hexValue & 0xFF00) >> 8))/255.0, blue: CGFloat(((hexValue & 0xFF) >> 0))/255.0, alpha: alpha)
    }
    
    class func textFromColor(color: UIColor) -> String {
        var result: String
        let ciColor: CIColor = CIColor(CGColor: color.CGColor)
        
        result = String(format: "%@", ciColor.stringRepresentation)
        
        return result
    }
    
}