//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let operation = Calculator()
    var isExpressionCorrect: Bool {
        if let stringNumber = operation.stringNumbers.last {
            if stringNumber.isEmpty {
                if operation.stringNumbers.count == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = operation.stringNumbers.last {
            if stringNumber.isEmpty {
                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }

    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
               textView.text = operation.addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        if canAddOperator {
        	operation.operators.append("+")
        	operation.stringNumbers.append("")
            textView.text = operation.updateDisplay()
        }
    }

    @IBAction func minus() {
        if canAddOperator {
            operation.operators.append("-")
            operation.stringNumbers.append("")
            textView.text = operation.updateDisplay()
        }
    }

    @IBAction func equal() {
        if !isExpressionCorrect {
            return
        }
        textView.text = textView.text + "=\(operation.calculateTotal())"
    }

}
