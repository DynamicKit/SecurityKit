//
//  SystemPath.swift
//  Example
//
//  Created by Mohammad reza Koohkan on 5/29/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// System paths sensor
///
enum SystemPath: String, CaseIterable, Sensor {
    case liveClock = "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist"
    case veency = "/Library/MobileSubstrate/DynamicLibraries/Veency.plist"
    case aptEtc = "/etc/apt"
    case aptDir = "/private/var/lib/apt"
    case apt = "/private/var/lib/apt/"
    case cydia = "/private/var/lib/cydia"
    case cydiaLog = "/private/var/tmp/cydia.log"
    case cydiaStartup = "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"
    case themes = "/private/var/mobile/Library/SBSettings/Themes"
    case stash = "/private/var/stash"
    case ikey = "/System/Library/LaunchDaemons/com.ikey.bbot.plist"
    case sshdBin = "/usr/bin/sshd"
    case sshdSBin = "/usr/sbin/sshd"
    case sftpServer = "/usr/libexec/sftp-server"
    case bash = "/bin/bash"
    case mobileSubstrate = "/Library/MobileSubstrate/MobileSubstrate.dylib"

    private var manager: FileManager {
        return .default
    }

    private var isExist: Bool {
        return self.manager.fileExists(atPath: self.rawValue)
    }

}

extension SystemPath: Service {

    /// Returns true if none of system paths was available
    ///
    public static var qualified: Bool {
        return self.allCases.compactMap { $0.isExist ? $0 : nil }.isEmpty
    }
}
