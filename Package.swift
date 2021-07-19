// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "VaporExample",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.7.0")),
        .package(url: "https://github.com/mongodb/mongodb-vapor", .upToNextMajor(from: "1.0.0")){{#leaf}},
        .package(url: "https://github.com/vapor/leaf", .upToNextMajor(from: "4.0.0")){{/leaf}}
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "MongoDBVapor", package: "mongodb-vapor"){{#leaf}},
                .product(name: "Leaf", package: "leaf"){{/leaf}}
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of the
                // `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release builds. See
                // <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .target(name: "Run", dependencies: [
            .target(name: "App"),
            .product(name: "MongoDBVapor", package: "mongodb-vapor")
        ]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
