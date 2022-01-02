//
//  StringExtensions.swift
//  Calculator
//
//  Created by Egehan Acar on 2.01.2022.
//

import Foundation

extension String {
    
    /// Converts to double, removing "," suffix, if there is.
    mutating func toDouble() -> Double {
        if self.hasSuffix(".") {
            self.remove(at: self.index(before: self.endIndex))
        }
        return Double(self)!
    }
    
}
