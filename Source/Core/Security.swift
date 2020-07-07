//
//  Security.swift
//  SecurityKit
//
//  Created by Mohammad reza Koohkan on 4/17/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// Security types
///
public enum Security {
    
    case cydia
    case jailbreak
    
    var service: Service {
        switch self {
        case .cydia:
            return Cydia.shared
        case .jailbreak:
            return Jailbreak.shared
        }
    }
}
