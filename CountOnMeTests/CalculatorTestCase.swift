//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by William on 26/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    var operation: Calculator!
    
    override func setUp() {
        super.setUp()
        operation = Calculator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func addOperation(_ number1: Int, _ operationSign: String, _ number2: Int) {
        _ = operation.addNewNumber(number1)
        _ = operation.addNewOperator(operationSign)
        _ = operation.addNewNumber(number2)
    }
    
    func testGivenOnePlusOne_WhenCalculateTotal_ThenTotalIsTwo() {
        addOperation(1, "+", 1)
        
        XCTAssertTrue(operation.isExpressionCorrect)
        XCTAssertEqual(operation.calculateTotal(), 2)
    }
    
    func testGivenTwoMinusOne_WhenCalculateTotal_ThenTotalIsOne() {
        addOperation(2, "-", 1)
        
        XCTAssertEqual(operation.calculateTotal(), 1)
    }
    
    func testGivenNoNumberAdd_WhenAddingOperatorSign_ThenCantAddOperatorSign() {
        _ = operation.addNewOperator("+")
        guard let stringNumber = operation.stringNumbers.last else { return }

        XCTAssertFalse(operation.canAddOperator)
        XCTAssertTrue(stringNumber.isEmpty)
    }
    
    func testGivenNoNumberTapped_WhenEqualButtonIsTapped_ThenAlertIsDisplay() {
        _ = operation.calculateTotal()
        
        XCTAssertEqual(operation.stringNumbers.count, 1)
        XCTAssertFalse(operation.isExpressionCorrect)
    }
    
    // Bonus
    
    func testGivenAResult_WhenAddingResultToMemory_ThenTotalIsKeepInMemory() {
        addOperation(2, "+", 1)
        let result = operation.calculateTotal()
        
        operation.memory = operation.addResultToMemory(result)
        
        XCTAssertEqual(operation.memory, 3)
    }
    

    
    

    
}
