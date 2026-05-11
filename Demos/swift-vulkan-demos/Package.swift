// swift-tools-version:6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-vulkan-demos",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../..")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(
            name: "CGLFW"),
        .executableTarget(
            name: "DemoInfo",
            dependencies: [
                .product(name: "Vulkan", package: "swift-vulkan")
            ]
        ),
        .executableTarget(
            name: "DemoClearColor",
            dependencies: [
                .product(name: "Vulkan", package: "swift-vulkan"),
                "CGLFW",
            ]
        ),
        .executableTarget(
            name: "DemoTriangle",
            dependencies: [
                .product(name: "Vulkan", package: "swift-vulkan"),
                "CGLFW",
            ]
        ),
    ]
)
