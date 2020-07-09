//
//  Operator.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

public final class Operator: Symbol<Operation>, SymbolChild, SymbolOperator {
    
    public class var plus: Operator {
        return .init(rawValue: .plus)
    }
    
    public class var minus: Operator {
        return .init(rawValue: .minus)
    }
    
    public class var multiply: Operator {
        return .init(rawValue: .multiply)
    }
    
    public class var divide: Operator {
        return .init(rawValue: .divide)
    }
    
}

extension Operator: OperationService {
    
    public func calculate(_ lhs: Operand, _ rhs: Operand) -> Operand {
        let lhsValue = lhs.rawValue
        let rhsValue = rhs.rawValue
        switch self.rawValue {
        case .plus:
            return Operand(rawValue: lhsValue + rhsValue)
        case .minus:
            return Operand(rawValue: lhsValue - rhsValue)
        case .multiply:
            return Operand(rawValue: lhsValue * rhsValue)
        case .divide:
            return lhsValue == 0 && rhsValue == 0
                ? Operand(rawValue: 0)
                : Operand(rawValue: lhsValue / rhsValue)
        }
    }
}
