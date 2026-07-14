// swift-tools-version:6.3

import Foundation

import PackageDescription



let platformSwiftDefines: [SwiftSetting] = [
    .define("VK_USE_PLATFORM_WIN32_KHR", .when(platforms: [.windows])),
    .define("VK_USE_PLATFORM_MACOS_MVK", .when(platforms: [.macOS])),
    .define("VK_USE_PLATFORM_METAL_EXT", .when(platforms: [.macOS])),
    .define("VK_USE_PLATFORM_IOS_MVK", .when(platforms: [.iOS])),
    .define("VK_USE_PLATFORM_METAL_EXT", .when(platforms: [.iOS])),
    .define("VK_USE_PLATFORM_ANDROID_KHR", .when(platforms: [.android])),
    .define("VK_USE_PLATFORM_WAYLAND_KHR", .when(platforms: [.linux])),
]
let package = Package(
    name: "swift-vulkan",
    products: [
        .library(
            name: "Vulkan",
            targets: ["Vulkan", "CVulkan"]
        )
    ],
    traits: [
        .trait(name: "VK_USE_PLATFORM_XLIB_KHR"),
        .trait(name: "VK_USE_PLATFORM_XLIB_XRANDR_KHR"),
        .trait(name: "VK_USE_PLATFORM_XLIB_KHR"),
    ],
    targets: [
        .target(
            name: "CVulkan",
        ),
        .target(
            name: "Vulkan",
            dependencies: [
                "CVulkan",
            ],
            swiftSettings: platformSwiftDefines + [
                .enableExperimentalFeature("Lifetimes"),
                .enableExperimentalFeature("BuiltinModule"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6],
    cxxLanguageStandard: .cxx17,
)
