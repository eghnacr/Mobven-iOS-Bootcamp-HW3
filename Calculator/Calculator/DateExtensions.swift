//
//  DateExtensions.swift
//  Calculator
//
//  Created by Egehan Acar on 28.12.2021.
//

import Foundation

extension Date {
    var day: Int {
        get {
            Calendar.current.component(.day, from: self)
        }
    }

    var month: Int {
        get {
            Calendar.current.component(.month, from: self)
        }
    }

    var year: Int {
        get {
            Calendar.current.component(.year, from: self)
        }
    }

    var dateAsPrettyString: String {
        get {
            "\(day)<>\(month)<>\(year)"
        }
    }
}
