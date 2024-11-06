// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SecureInput",
    platforms: [
      .macOS(.v14),
      .iOS(.v17)
    ],
    products: [
        .library(
            name: "SecureInput",
            targets: ["SecureInput"])
    ],
    dependencies: [
      .package(url: "https://github.com/sentryco/HybridColor", branch: "main"),
      .package(url: "https://github.com/sentryco/MockGen", branch: "main"),
      .package(url: "https://github.com/sentryco/TextColorizer", branch: "main")
    ],
    targets: [
      .target(
         name: "SecureInput",
         dependencies: [
            .product(name: "HybridColor", package: "HybridColor"),
            .product(name: "MockGen", package: "MockGen"),
            .product(name: "TextColorizer", package: "TextColorizer")
         ]),
      .testTarget(
         name: "SecureInputTests",
         dependencies: ["SecureInput"])
    ]
)
