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
        XCTAssertEqual(operation.calculateTotal(), "=" + String(2))
    }

    func testGivenTwoMinusOne_WhenCalculateTotal_ThenTotalIsOne() {
        addOperation(2, "-", 1)

        XCTAssertEqual(operation.calculateTotal(), "=" + String(1))
    }
    
    func testGivenAddNewNumber_WhenCheckBoolExpression_ThenAddString() {
        _ = operation.addNewNumber(1)
        
        XCTAssertTrue(operation.isExpressionCorrect)
        
    }
    
    func testGivenOneNumberToAddition_WhenCalculateTotal_ThenExpressionReturnFalse() {
        _ = operation.addNewNumber(1)
        _ = operation.addNewOperator("+")
        _ = operation.calculateTotal()
        
        XCTAssertFalse(operation.isExpressionCorrect)
    }
    
    func testGivenNewOperator_WhenStringNumbersContainsNothing_ThenExpressionReturnFalse() {
        _ = operation.addNewOperator("+")
        
        XCTAssertFalse(operation.isExpressionCorrect)
    }
    

    // Bonus
    func testGivenAResult_WhenAddingResultToMemory_ThenTotalIsKeepInMemory() {
        addOperation(2, "+", 1)
        _ = operation.calculateTotal()
        _ = operation.addResultToMemory(operation.total)
        
        XCTAssertEqual(operation.memory, 3)
    }
    
    func testGiveMemoryAddNumber_WhenAddMemoryToOperation_ThenAddNewNumber() {
        operation.memory = 4
        _ = operation.addMemoryToOperation()
        
        XCTAssertEqual(operation.stringNumbers.last, "4")
    }
    

    
    

    
}
