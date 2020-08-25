//
//  File.swift
//  Example
//
//  Created by Mohammad reza Koohkan on 6/4/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation
import UIKit.UIApplication

protocol File {

    var deeplink: String { get }

    var path: String { get }

    func canOpen() -> Bool

    func isExist() -> Bool

}

extension File {

    /// Returns true if device can open `TheFile`:// deeplink (URI)
    ///
    /// Always returns false if you didnt add `TheFile` (for example cydia) scheme to LSApplicationQueriesSchemes in `info.plist`
    ///
    /// ```
    ///<key>LSApplicationQueriesSchemes</key>
    ///<array>
    ///    <string>TheFile</string>
    ///</array>
    /// ```
    ///
    func canOpen() -> Bool {
        guard let url = URL(string: self.deeplink) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }

    /// Returns true if `TheFile`.app (for example Cydia.app) exist in Applications directory
    ///
    func isExist() -> Bool {
        return FileManager.default.fileExists(atPath: self.path)
    }

}
