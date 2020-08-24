//
//  Jailbreak.swift
//  SecurityKit
//
//  Created by Mohammad reza Koohkan on 4/17/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// Jailbreak sensor
///
public class Jailbreak: Sensor {
    private static let sharedInstance: Jailbreak = Jailbreak()
    public static var shared: Jailbreak { return Jailbreak.sharedInstance }

}

extension Jailbreak: Service {
    
    /// Returns true if device is jailbroken
    ///
    public static var qualified: Bool {
        return Cydia.qualified && SystemPath.qualified

    }
}
