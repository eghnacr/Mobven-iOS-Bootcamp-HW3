//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {

    private var accumulator: Double = 0 {
        didSet {
            oldAccumulator = oldValue
        }
    }

    private var oldAccumulator = 0.0
    private var selectedOperation: ((Double, Double) -> Double)?

    var result: Double {
        get {
            return accumulator
        }
    }

    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }

        switch operation {
        case "√":
            accumulator = sqrt(result)
        case "±":
            accumulator = -accumulator
        case "+":
            doOperation()
            selectedOperation = { $0 + $1 }
        case "−":
            doOperation()
            selectedOperation = { $0 - $1 }
        case "÷":
            doOperation()
            selectedOperation = { $0 / $1 }
        case "×":
            doOperation()
            selectedOperation = { $0 * $1 }
        case "=":
            doOperation()
        case "%":
            accumulator /= 100
        case "C":
            accumulator = 0
        case "AC":
            accumulator = 0
            oldAccumulator = 0
        default:
            break
        }
    }

    func doOperation() {
        if selectedOperation == nil { return }
        accumulator = selectedOperation!(oldAccumulator, accumulator)
        selectedOperation = nil
    }

    func setOperand(_ value: Double) {
        accumulator = value
    }
}
