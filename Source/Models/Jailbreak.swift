//
//  Jailbreak.swift
//  SecurityKit
//
//  Created by Mohammad reza Koohkan on 4/17/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UIApplication

/// Jailbreak sensor
///
public class Jailbreak {
    
    private static let sharedInstance: Jailbreak = Jailbreak()
    public static var shared: Jailbreak { return Jailbreak.sharedInstance }
    
    private var bashPath: String {
        return "/bin/bash"
    }
    
    private var sshdPath: String {
        return "/usr/sbin/sshd"
    }
    
    private var aptPath: String {
        return "/etc/apt"
    }
    
    private var privateAptPath: String {
        return "/private/var/lib/apt/"
    }
    
    /// Returns true if bash script exist in bin directory
    ///
    private func isBashExists() -> Bool {
        FileManager.default.fileExists(atPath: self.bashPath)
    }
    
    /// Returns true if sshd exist in sbin directory
    ///
    private func isSshdExists() -> Bool {
        FileManager.default.fileExists(atPath: self.sshdPath)
    }
    
    /// Returns true if apt exist in etc directory
    ///
    private func isAptExists() -> Bool {
        FileManager.default.fileExists(atPath: self.aptPath)
    }
    
    /// Returns true if apt exist in /private/var/lib directory
    ///
    private func isPrivateAptExists() -> Bool {
        FileManager.default.fileExists(atPath: self.privateAptPath)
    }
}

extension Jailbreak: Service {
    
    /// Returns true if device is not jailbroken
    ///
    public var qualified: Bool {
        return Cydia.shared.qualified
            && !self.isBashExists()
            && !self.isBashExists()
            && !self.isAptExists()
            && !self.isPrivateAptExists()
    }
}
