//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet weak var acButton: UIButton!

    private let brain = CalculatorBrain()
    private var isUserTyping = false

    var result: Double {
        get {
            resultLabel.text!.toDouble()
        }
        set {
            acButton.titleLabel?.text = newValue == 0 ? "AC" : "C"
            resultLabel.text = newValue.toString()
        }
    }

    @IBAction func digitButtonTapped(_ sender: UIButton) {
        let digit = sender.tag
        if isUserTyping {
            resultLabel.text! += String(digit)
        } else {
            result = Double(digit)
            isUserTyping.toggle()
        }
    }

    @IBAction func commaButtonTapped(_ sender: UIButton) {
        resultLabel.text! += "."
        isUserTyping = true
    }
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        let operation = sender.titleLabel!.text!
        isUserTyping = false
        brain.setOperand(result)
        brain.performOperation(operation)
        result = brain.result
    }
}

