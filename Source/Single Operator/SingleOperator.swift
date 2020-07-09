//
//  SingleOperator.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

public final class SingleOperator: Symbol<SingleOperation>, SymbolChild, SymbolOperator {
    
    public class var clear: SingleOperator {
        return .init(rawValue: .clear)
    }
    
    public class var rotate: SingleOperator {
        return .init(rawValue: .rotate)
    }
}

extension SingleOperator: SingleOperationService {
    
    public func calculate(_ last: Operand) -> Operand {
        switch self.rawValue {
        case .rotate:
            return Operand(rawValue: last.rawValue * -1)
        case .clear:
            return Operand(rawValue: last.rawValue * 0)
        }
    }
}

