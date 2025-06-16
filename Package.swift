// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SentryCocoaLumberjack",
    platforms: [
        .macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v3)
    ],
    products: [.library(name: "SentryCocoaLumberjack",
                    targets: ["SentryCocoaLumberjack"])],
    dependencies: [
        .package(name: "Sentry", url: "https://github.com/getsentry/sentry-cocoa", from: "8.52.1"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack", from: "3.8.5")
    ],
    targets: [
        .target(
            name: "SentryCocoaLumberjack",
            dependencies: [ "Sentry", .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack")],
            exclude: [ "Example" ]),
        .target(
            name: "Example",
            dependencies: [
                "Sentry",
                "SentryCocoaLumberjack",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack")],
            path: "Example")
    ]
)
