//
//  DoubleExtensions.swift
//  Calculator
//
//  Created by Egehan Acar on 2.01.2022.
//

import Foundation

extension Double {
    
    /// Converts to string, removing ".0" suffix, if there is.
    func toString() -> String {
        var str = String(self)
        if str.hasSuffix(".0") {
            str.remove(at: str.index(before: str.endIndex))
            str.remove(at: str.index(before: str.endIndex))
        }
        return str
    }
    
}
