//
//  OperationService.swift
//  CalculatorKit
//
//  Created by Mohammad reza Koohkan on 4/19/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

public protocol OperationService {

    func calculate(_ lhs: Operand, _ rhs: Operand) -> Operand
}
