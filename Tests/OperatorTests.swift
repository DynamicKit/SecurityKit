//
//  CalculatorKitTests.swift
//  CalculatorKitTests
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import XCTest
@testable import CalculatorKit

class OperatorTests: XCTestCase {
    
    var sut: Calculator!
    var lhsOperand: Operand!
    
    override func setUp() {
        super.setUp()
        self.sut = .shared
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
        self.lhsOperand = nil
    }
    
    
    func testPlus() {
        self.lhsOperand = .zero
        self.sut.calculate(&self.lhsOperand, operator: Operator.plus, .nine)
        XCTAssertEqual(self.lhsOperand.rawValue, 9)
    }
    
    func testMinus() {
        self.lhsOperand = .eight
        self.sut.calculate(&self.lhsOperand, operator: Operator.minus, .nine)
        XCTAssertEqual(self.lhsOperand.rawValue, -1)
    }
    
    func testMultiply() {
        self.lhsOperand = .nine
        self.sut.calculate(&self.lhsOperand, operator: Operator.multiply, .six)
        XCTAssertEqual(self.lhsOperand.rawValue, 54)
    }
    
    func testDivide() {
        self.lhsOperand = .nine
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, .three)
        XCTAssertEqual(self.lhsOperand.rawValue, 3)
    }
    
    func testFloatingDivide() {
        self.lhsOperand = .five
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, .two)
        XCTAssertEqual(self.lhsOperand.rawValue, 2.5)
    }
    
    func testFloatingNearZeroDivide() {
        self.lhsOperand = .init(rawValue: 2.5)
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, .five)
        XCTAssertEqual(self.lhsOperand.rawValue, 0.5)
    }
    
    func testZeroDivideOnValue() {
        self.lhsOperand = .zero
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, .six)
        XCTAssertEqual(self.lhsOperand.rawValue, 0)
    }
    
    func testValueDivideOnZero() {
        self.lhsOperand = .six
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, .zero)
        XCTAssertEqual(self.lhsOperand.rawValue, Double.infinity)
    }
    
    func testZeroDivide() {
        self.lhsOperand = .zero
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, .zero)
        XCTAssertEqual(self.lhsOperand.rawValue, 0)
    }
    
    func testHighNumberMultiply() {
        self.lhsOperand = .init(rawValue: 20028517)
        let rhsOperand: Operand = .init(rawValue: 1233)
        self.sut.calculate(&self.lhsOperand, operator: Operator.multiply, rhsOperand)
        XCTAssertEqual(self.lhsOperand.rawValue, 24695161461)
    }
    
    func testHighNumberDivide() {
        self.lhsOperand = .init(rawValue: 20028517)
        let rhsOperand: Operand = .init(rawValue: 1233)
        self.sut.calculate(&self.lhsOperand, operator: Operator.divide, rhsOperand)
        XCTAssert(self.lhsOperand.rawValue > 16243 && self.lhsOperand.rawValue < 16244)
    }
}
