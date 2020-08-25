//
//  Cydia.swift
//  SecurityKit
//
//  Created by Mohammad reza Koohkan on 4/17/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// Cydia.app recognizer
///
public class Cydia: File, Sensor {
    private static let sharedInstance: Cydia = Cydia()
    public static var shared: Cydia { return Cydia.sharedInstance }
    
    let deeplink: String = "cydia://"
    let path: String = "/Applications/Cydia.app"
}

extension Cydia: Service {

    /// Returns true if there is Cydia in device
    ///
    public static var qualified: Bool {
        return Cydia.shared.canOpen() && Cydia.shared.isExist()
    }
}
