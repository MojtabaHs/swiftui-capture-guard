// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "CaptureGuard",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "CaptureGuard", targets: ["CaptureGuard"]),
    ],
    targets: [
        .target(name: "CaptureGuard"),
    ]
)
