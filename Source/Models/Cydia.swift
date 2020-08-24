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
public class Cydia: Sensor {
    private static let sharedInstance: Cydia = Cydia()
    public static var shared: Cydia { return Cydia.sharedInstance }
    
    private var deeplink: String {
        return "cydia://"
    }

    private var cydiaPath: String {
        return "/Applications/Cydia.app"
    }
    
    /// Returns true if device can open cydia:// deeplink (URI)
    ///
    /// Always returns false if you didnt add cydia scheme to LSApplicationQueriesSchemes in `info.plist`
    ///
    /// ```
    ///<key>LSApplicationQueriesSchemes</key>
    ///<array>
    ///    <string>cydia</string>
    ///</array>
    /// ```
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

}

extension Cydia: Service {

    /// Returns true if there is Cydia in device
    ///
    public static var qualified: Bool {
        return Cydia.shared.canOpen() && Cydia.shared.isExists()
    }
}
