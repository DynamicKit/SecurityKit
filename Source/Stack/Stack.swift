//
//  Stack.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

public final class Stack {
    
    public private (set) var symbols: [SymbolChild] = []
    
    public func push(_ symbol: SymbolChild) -> Result<[SymbolChild], StackError> {
        
        // combine [...,9,4] to [...,94]
        if let operand = symbol as? Operand,
            let topOperand = symbols.last as? Operand {
            let result = self.combine(operand: operand, to: topOperand)
            self.replace(last: result)
            return .failure(.notAcceptable)
            
        }else if let operatorSymbol = symbol as? Operator {
            
            // dont append when last is kind of plus
            if let lastOperator = self.symbols.last as? Operator,
                operatorSymbol.rawValue.rawValue == lastOperator.rawValue.rawValue {
                return .failure(.notAcceptable)

                // dont append when last is kind of AC
            }else if let _ = self.symbols.last as? SingleOperator {
                return .failure(.notAcceptable)
            }
        }else if let singleOperator = symbol as? SingleOperator {
            /// rotate if given symbol is in set [...,9,-+] -> [...,-9] or reverse
            if singleOperator.rawValue == .rotate {
                if let topOperand = symbols.last as? Operand {
                    let newLast = singleOperator.calculate(topOperand)
                    self.replace(last: newLast)
                }else{
                    return .failure(.notAcceptable)
                }
                
                /// clean stack
            }else if singleOperator.rawValue == .clear {
                self.symbols = []
            }
            return .success(self.symbols)
        }
        self.symbols.append(symbol)
        return .success(self.symbols)
    }
    
    /// 94 to 9
    /// 9 to 0
    public func popLastOperand() {
        for (offset, element) in self.symbols.reversed().enumerated() {
            guard let last = element as? Operand else { continue }
            let lastIndex = (self.symbols.count - 1)
            let notReversedOffset = lastIndex - offset
            var elements: [String.Element] = Array(last.stringValue)
            guard elements.count > 1 else {
                let symbol = Operand(rawValue: 0)
                self.replace(symbol: symbol, at: notReversedOffset)
                break
            }
            elements.removeLast()
            let symbol = Operand(rawValue: Double(String(elements))!)
            self.replace(symbol: symbol, at: notReversedOffset)
            break
        }
    }
    
    
    private func combine(operand: Operand, to next: Operand) -> Operand {
        return Operand(rawValue: Double(operand.stringValue + next.stringValue)!)
    }
    
    private func removeLast() {
        self.symbols.removeLast()
    }
    
    private func remove(at index: Int) {
        self.symbols.remove(at: index)
    }
    
    private func replace<T: SymbolChild>(last symbol: T) {
        self.replace(symbol: symbol, at: self.symbols.count - 1)
    }
    
    private func replace<T: SymbolChild>(first symbol: T) {
        self.replace(symbol: symbol, at: 0)
    }
    
    private func replace<T: SymbolChild>(symbol: T, at index: Int) {
        self.symbols[index] = symbol
    }
    
}
