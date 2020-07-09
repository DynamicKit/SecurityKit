//
//  Symbol.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

public class Symbol<T>: RawRepresentable {
    
    public typealias RawValue = T
    
    public let rawValue: RawValue
    
    required public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}
