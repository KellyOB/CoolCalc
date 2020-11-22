//
//  LogicTests.swift
//  CoolCalcTests
//
//  Created by Kelly O' on 8/31/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import XCTest
@testable import CoolCalc

class LogicTests: XCTestCase {
    
    var sut: Logic!
    
    override func setUp() {
        super.setUp()
        sut = Logic()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAdd_WhenCalledAddsValue() {
        sut.setNumber(2)
        sut.intermediateCalculation = (firstNumber: 10, operation: "+")
        let result = sut.calculate(sign: "=")
        
        XCTAssertEqual(result, 12.0)
    }
    
    func testSubstract_WhenCalledSubtractsValue() {
        sut.setNumber(2)
        sut.intermediateCalculation = (firstNumber: 10, operation: "-")
        let result = sut.calculate(sign: "=")
        
        XCTAssertEqual(result, 8.0)
    }
    
    func testMultiply_WhenCalledMultipliesValue() {
        sut.setNumber(2)
        sut.intermediateCalculation = (firstNumber: 10, operation: "x")
        let result = sut.calculate(sign: "=")
        
        XCTAssertEqual(result, 20.0)
    }
    
    func testDecimals_WhenCalledAddValue() {
        sut.setNumber(3.2)
        sut.intermediateCalculation = (firstNumber: 7, operation: "+")
        let result = sut.calculate(sign: "=")
        
        XCTAssertEqual(result, 10.2)
    }
    
    func testDivide_WhenCalledDividesValue() {
        sut.setNumber(3)
        sut.intermediateCalculation = (firstNumber: 10, operation: "/")
        let result = sut.calculate(sign: "=")
        let computedDecimal = Double((result?.computeDecimal())!)
        XCTAssertEqual(computedDecimal, 3.33333333)
    }
        
    func testPositiveNegative_WhenCalledMakesPositiveOrNegativeValue() {
        sut.setNumber(10)
        XCTAssertEqual(sut.calculate(sign: "+/-"), -10)
    }
    
    func testPercent_WhenCalledMakesPercentValue() {
        sut.setNumber(3)
        XCTAssertEqual(sut.calculate(sign: "%"), 0.03)
    }
    
    func testClear_WhenCalledClearValues() {
        sut.setNumber(10)
        XCTAssertEqual(sut.calculate(sign: "C"), 0)
    }
}
