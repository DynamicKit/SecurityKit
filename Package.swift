// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CalculatorKit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v8),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "CalculatorKit",
            targets: ["CalculatorKit"]),
    ],
    targets: [
        .target(
            name: "CalculatorKit",
            path: "Source"
        ),
        .testTarget(
            name: "CalculatorKitTests",
            dependencies: ["CalculatorKit"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
