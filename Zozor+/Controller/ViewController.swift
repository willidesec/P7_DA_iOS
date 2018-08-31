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
    
    @IBAction func tappedOperationButton(_ sender: UIButton) {
        operation.alertDelegate = self
        guard let buttonTitle = sender.currentTitle else { return }
        if buttonTitle == "=" {
            if !operation.isExpressionCorrect {
                return
            }
            textView.text = textView.text + "=\(operation.calculateTotal())"
        } else {
            textView.text = operation.addNewOperator(buttonTitle)
        }
    }
    
    @IBAction func tappedAddMemoryButton() {
        operation.memory = operation.addResultToMemory(operation.total)
        print(operation.memory)
    }
    
}

extension ViewController: AlertControllerDelegate {
    func displayAlert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
