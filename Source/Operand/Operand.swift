//
//  Operand.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation


public final class Operand: Symbol<OperandValue>, SymbolChild {
    
    public class var zero: Operand {
        return .init(rawValue: 0)
    }
    
    public class var one: Operand {
        return .init(rawValue: 1)
    }
    
    public class var two: Operand {
        return .init(rawValue: 2)
    }
    
    public class var three: Operand {
        return .init(rawValue: 3)
    }
    
    public class var four: Operand {
        return .init(rawValue: 4)
    }
    
    public class var five: Operand {
        return .init(rawValue: 5)
    }
    
    public class var six: Operand {
        return .init(rawValue: 6)
    }
    
    public class var seven: Operand {
        return .init(rawValue: 7)
    }
    
    public class var eight: Operand {
        return .init(rawValue: 8)
    }
    
    public class var nine: Operand {
        return .init(rawValue: 9)
    }

}

extension Operand: OperandService {
    
    public var stringValue: String {
        return String(self.rawValue)
    }
}
