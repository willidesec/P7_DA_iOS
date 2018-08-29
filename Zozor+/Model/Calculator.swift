//
//  Calculator.swift
//  CountOnMe
//
//  Created by William on 22/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation
import UIKit

protocol AlertControllerDelegate {
    func displayAlert(message: String)
}

class Calculator {
    // MARK: - Properties
    public var alertDelegate: AlertControllerDelegate!
    fileprivate var total = 0
    fileprivate var stringNumbers: [String] = [String()]
    fileprivate var operators: [String] = ["+"]
    public var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    alertDelegate.displayAlert(message: "Démarrez un nouveau calcul !")
                } else {
                    alertDelegate.displayAlert(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    fileprivate var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                alertDelegate.displayAlert(message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    // MARK: - Methods
    public func addNewNumber(_ newNumber: Int) -> String {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        let text = updateDisplay()
        return text
    }
    
    public func addNewOperator(_ operationSign: String) -> String {
        var text = ""
        if canAddOperator {
            operators.append(operationSign)
            stringNumbers.append("")
            text = updateDisplay()
        }
        return text
    }
    
    public func calculateTotal() -> Int {
        total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        clear()
        return total
    }
    
    fileprivate func updateDisplay() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    
    fileprivate func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
}
