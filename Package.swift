// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SecurityKit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v8),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "SecurityKit",
            targets: ["SecurityKit"]),
    ],
    targets: [
        .target(
            name: "SecurityKit",
            path: "Source"
        ),
        .testTarget(
            name: "SecurityKitTests",
            dependencies: ["SecurityKit"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
