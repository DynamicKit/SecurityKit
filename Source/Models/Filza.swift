//
//  Filza.swift
//  Example
//
//  Created by Mohammad reza Koohkan on 6/4/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// Filza.app recognizer
///
public class Filza: File, Sensor {
    private static let sharedInstance: Filza = Filza()
    public static var shared: Filza { return Filza.sharedInstance }

    let deeplink: String = "filza://"
    let path: String = "/Applications/Filza.app"
}

extension Filza: Service {

    /// Returns true if there is Filza in device
    ///
    public static var qualified: Bool {
        return Filza.shared.canOpen() && Filza.shared.isExist()
    }
}
