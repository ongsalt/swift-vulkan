// swift-tools-version:6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

// this wont get passed into
// let extraNames: [String] = [
//  "VK_USE_PLATFORM_DIRECTFB_EXT",
//     "VK_USE_PLATFORM_FUCHSIA",
//     "VK_USE_PLATFORM_GGP", "VK_USE_PLATFORM_SCI",
//     "VK_USE_PLATFORM_SCREEN_QNX", "VK_USE_PLATFORM_OHOS",
//     "VK_USE_PLATFORM_VI_NN", "VK_ENABLE_BETA_EXTENSIONS",
// ]

import Foundation

import PackageDescription

let env = ProcessInfo.processInfo.environment
let autoDetectedNames: [(String, Platform)] = [
    ("VK_USE_PLATFORM_WIN32_KHR", .windows),
    ("VK_USE_PLATFORM_MACOS_MVK", .macOS),
    ("VK_USE_PLATFORM_METAL_EXT", .macOS),
    ("VK_USE_PLATFORM_IOS_MVK", .iOS),
    ("VK_USE_PLATFORM_METAL_EXT", .iOS),
    ("VK_USE_PLATFORM_ANDROID_KHR", .android),
    ("VK_USE_PLATFORM_WAYLAND_KHR", .linux),
    // ("VK_USE_PLATFORM_XLIB_KHR", .linux),
    // ("VK_USE_PLATFORM_XLIB_XRANDR_KHR", .linux),
    // ("VK_USE_PLATFORM_XCB_KHR", .linux),
]
let platformSwiftDefines: [SwiftSetting] =
    autoDetectedNames.map { .define($0, .when(platforms: [$1])) }
let package = Package(
    name: "swift-vulkan",
    products: [
        .library(
            name: "Vulkan",
            targets: ["Vulkan", "CVulkan"]
        )
    ],
    traits: [
        .trait(name: "UnsafeMutableRef")
    ],
    targets: [
        .target(
            name: "CVulkan"
        ),
        // .target(
        //     name: "UpcomingSwiftStd",
        //     swiftSettings: [
        //         .enableExperimentalFeature("Lifetimes"),
        //         .enableExperimentalFeature("BuiltinModule"),
        //         .enableExperimentalFeature("BorrowAndMutateAccessors"),
        //     ]
        // ),
        .target(
            name: "Vulkan",
            dependencies: [
                "CVulkan",
                // .byName(name: "UpcomingSwiftStd", condition: .when(traits: ["UnsafeMutableRef"])),
            ],
            swiftSettings: platformSwiftDefines
        ),
    ],
    swiftLanguageModes: [.v6]
)
