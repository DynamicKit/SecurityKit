//
//  Calculator.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

public final class Calculator {
    
    private static let sharedInstance: Calculator = Calculator()
    public class var shared: Calculator { return sharedInstance }
    
    @discardableResult
    public func calculate(_ lhs: inout Operand,
                          operator op: Operator,
                          _ rhs: Operand) -> Operand {
        
        lhs = op.calculate(lhs, rhs)
        return lhs
    }
    
    @discardableResult
    public func calculate(_ lhs: inout Operand,
                          singleOperator op: SingleOperator) -> Operand {
        
        lhs = op.calculate(lhs)
        return lhs
    }
    
    
}

//public final class Calculator {
//
//    public let stack: Stack
//
//    public init(stack: Stack) {
//        self.stack = stack
//    }
//
//    func view() {
//        print(self.stack.symbols)
//    }
//
//
//    func push<T: SymbolChild>(_ symbol: T) {
//        switch self.stack.push(symbol) {
//        case .success(let symbols):
//            let operand = self.calculate(symbols: symbols)
//        case .failure(let error):
//            break
//        }
//    }
//
//    func calculate(symbols symbolElements: [SymbolChild] = []) -> Operand {
//        var operand: Operand? = nil
//        var `operator`: Operator? = nil
//        let symbols = symbolElements.isEmpty ? self.stack.symbols : symbolElements
//        var indexFromOperand = 0
//        repeat {
//            indexFromOperand += 1
//        } while indexFromOperand =  {
//            <#code#>
//        }
//        for symbol in symbols {
//            switch symbol {
//            case is Operand:
//
//            case is Operator:
//
//            case is SingleOperator:
//
//            default:
//                break
//            }
//        }
//        return result
//    }
//}

// 2 + 1 * 3 / 1 + 2
// 3 * 3 / 1 + 2
// 9 / 1 + 2
// 9 + 2
// 11
