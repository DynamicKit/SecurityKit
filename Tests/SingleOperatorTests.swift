//
//  SingleOperatorTests.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import XCTest
@testable import CalculatorKit

class SingleOperatorTests: XCTestCase {
    
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
    
    
    func testRotate() {
        self.lhsOperand = .two
        self.sut.calculate(&self.lhsOperand, singleOperator: .rotate)
        XCTAssertEqual(self.lhsOperand.rawValue, -2)
    }
    
    func testRotateZero() {
        self.lhsOperand = .zero
        self.sut.calculate(&self.lhsOperand, singleOperator: .rotate)
        XCTAssertEqual(self.lhsOperand.rawValue, 0)
    }
    
    func testReRotate() {
        self.lhsOperand = .two
        self.sut.calculate(&self.lhsOperand, singleOperator: .rotate)
        self.sut.calculate(&self.lhsOperand, singleOperator: .rotate)
        XCTAssertEqual(self.lhsOperand.rawValue, 2)
    }
    
    func testClear() {
        self.lhsOperand = .eight
        self.sut.calculate(&self.lhsOperand, singleOperator: .rotate)
        XCTAssertEqual(self.lhsOperand.rawValue, -8)
        self.sut.calculate(&self.lhsOperand, singleOperator: .clear)
        XCTAssertEqual(self.lhsOperand.rawValue, 0)
    }
}
