//
//  String+Ex.swift
//  RockyHelpers
//
//  Created by Airat Uraev on 02/11/15.
//  Copyright © 2015 rockyhome. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    var length: Int {
        var length: Int! = self.rangeOfString(self)?.count
        if length == nil {
            length = 0
        }
        
        return length
    }
    
    func replaceSpacesToNonBreak() -> String {
        return self.stringByReplacingOccurrencesOfString(" ", withString: "\u{00a0}")
    }
    
    func replaceSpacesBreak() -> String {
        return self.stringByReplacingOccurrencesOfString("\u{00a0}", withString: " ")
    }
    
}