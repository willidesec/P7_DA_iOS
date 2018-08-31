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
    public var total = 0
    public var stringNumbers: [String] = [String()]
    public var operators: [String] = ["+"]
    public var memory = 0
    public var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                guard let alerteDelegate = alertDelegate else { return  false }
                if stringNumbers.count == 1 {
                    alerteDelegate.displayAlert(message: "Démarrez un nouveau calcul !")
                } else {
                    alerteDelegate.displayAlert(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    public var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                guard let alerteDelegate = alertDelegate else { return  false }
                alerteDelegate.displayAlert(message: "Expression incorrecte !")
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
    
    // Bonus
    public func addResultToMemory(_ result: Int) -> Int {
        memory = result
        return memory
    }

}
