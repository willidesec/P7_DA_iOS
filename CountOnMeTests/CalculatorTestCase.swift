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
    
    

    
}
