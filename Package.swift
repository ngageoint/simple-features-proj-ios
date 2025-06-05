// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SimpleFeaturesProjections",
    platforms: [
        .iOS(.v13), .macOS(.v12)
    ],
    products: [
        .library(
            name: "SimpleFeaturesProjections",
            targets: ["SimpleFeaturesProjections"])
    ],
    dependencies: [
        .package(url: "https://github.com/ngageoint/simple-features-ios", from: "5.0.0"),
        .package(url: "https://github.com/ngageoint/projections-ios", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "SimpleFeaturesProjections",
            dependencies: [
                .product(name: "SimpleFeatures", package: "simple-features-ios"),
                .product(name: "Projections", package: "projections-ios")
            ],
            path: "sf-proj-ios"
        ),
        .testTarget(
            name: "SimpleFeaturesProjectionsTests",
            dependencies: [
                "SimpleFeaturesProjections",
                "TestUtils"
            ],
            path: "sf-proj-iosTests"
        ),
        .testTarget(
            name: "SimpleFeaturesProjectionsTestsSwift",
            dependencies: [
                "SimpleFeaturesProjections",
                "TestUtils"
            ],
            path: "sf-proj-iosTests-swift"
        ),
        .target(
            name: "TestUtils",
            dependencies: [
                "SimpleFeaturesProjections"
            ],
            path: "TestUtils",
            publicHeadersPath: ""
        )
    ]
)
