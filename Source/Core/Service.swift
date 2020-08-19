//
//  Service.swift
//  SecurityKit
//
//  Created by Mohammad reza Koohkan on 4/17/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// Service interface for security stuff
///
public protocol Service {
    
    /// Returns whether service is qualified and valid or not
    ///
    static var qualified: Bool { get }
}

