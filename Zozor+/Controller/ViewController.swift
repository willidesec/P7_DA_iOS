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
    var memoryLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        // Enable autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Methods
    fileprivate func setUpLayout() {
        memoryLabel.bottomAnchor.constraint(equalTo: calculView.bottomAnchor, constant: 0).isActive = true
        memoryLabel.leftAnchor.constraint(equalTo: calculView.leftAnchor, constant: 5).isActive = true
        memoryLabel.rightAnchor.constraint(equalTo: calculView.rightAnchor, constant: 5).isActive = true
        memoryLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var calculView: UIView!
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        calculView.addSubview(memoryLabel)
        setUpLayout()
    }
    

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
//            if !operation.isExpressionCorrect {
//                return
//            }
            textView.text = textView.text + "=\(operation.calculateTotal())"
        } else {
            textView.text = operation.addNewOperator(buttonTitle)
        }
    }
    
    // Bonus
    @IBAction func tappedAddMemoryButton() {
        memoryLabel.text = "Memory = \(operation.addResultToMemory(operation.total))"
    }
    
    @IBAction func tappedMemoryButton() {
        textView.text = operation.addMemoryToOperation()
    }
    
    
}

extension ViewController: AlertControllerDelegate {
    func displayAlert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
