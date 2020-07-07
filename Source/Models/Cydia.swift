//
//  Cydia.swift
//  SecurityKit
//
//  Created by Mohammad reza Koohkan on 4/17/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UIApplication

/// Cydia.app recognizer
///
public class Cydia {
    
    private static let sharedInstance: Cydia = Cydia()
    public static var shared: Cydia { return Cydia.sharedInstance }
    
    private var deeplink: String {
        return "cydia://"
    }
    
    private var substratePath: String {
        return "/Library/MobileSubstrate/MobileSubstrate.dylib"
    }
    
    private var cydiaPath: String {
        return "/Applications/Cydia.app"
    }
    
    /// Returns true if device can open cydia:// deeplink (URI)
    ///
    private func canOpen() -> Bool {
        guard let url = URL(string: self.deeplink) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    /// Returns true if Cydia.app exist in Applications directory
    ///
    private func isExists() -> Bool {
        return FileManager.default.fileExists(atPath: self.cydiaPath)
    }
    
    /// Returns true if MobileSubstrate.dylib exist in Library directory
    ///
    private func isSubstrateExists() -> Bool {
        return FileManager.default.fileExists(atPath: self.substratePath)
    }
    
}

extension Cydia: Service {
    

    /// Returns true if there is no Cydia in device
    ///
    public var qualified: Bool {
        return !self.canOpen()
            && !self.isExists()
            && !self.isSubstrateExists()
    }
}
