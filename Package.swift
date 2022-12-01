// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "swift-dedici-vapor-fluent-mysql-toolbox",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "DediciVaporFluentMySQLToolbox",
            targets: ["DediciVaporFluentMySQLToolbox"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.65.1"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.5.0"),
        .package(url: "https://github.com/vapor/fluent-mysql-driver.git", from: "4.2.0"),
    ],
    targets: [
        .target(
            name: "DediciVaporFluentMySQLToolbox",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentMySQLDriver", package: "fluent-mysql-driver"),
            ]
        ),
    ]
)
