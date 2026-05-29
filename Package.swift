// swift-tools-version:6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-vulkan",
    products: [
        .library(
            name: "Vulkan",
            targets: ["Vulkan"])
    ],
    traits: [
        .trait(name: "VK_USE_PLATFORM_XLIB_KHR"),
        .trait(name: "VK_USE_PLATFORM_XLIB_XRANDR_EXT"),
        .trait(name: "VK_USE_PLATFORM_XCB_KHR"),
        .trait(name: "VK_USE_PLATFORM_WAYLAND_KHR"),
        .trait(name: "VK_USE_PLATFORM_UBM_SEC"),
        .trait(name: "VK_USE_PLATFORM_DIRECTFB_EXT"),
        .trait(name: "VK_USE_PLATFORM_ANDROID_KHR"),
        .trait(name: "VK_USE_PLATFORM_WIN32_KHR"),
        .trait(name: "VK_USE_PLATFORM_VI_NN"),
        .trait(name: "VK_USE_PLATFORM_IOS_MVK"),
        .trait(name: "VK_USE_PLATFORM_MACOS_MVK"),
        .trait(name: "VK_USE_PLATFORM_METAL_EXT"),
        .trait(name: "VK_USE_PLATFORM_FUCHSIA"),
        .trait(name: "VK_USE_PLATFORM_GGP"),
        .trait(name: "VK_USE_PLATFORM_SCI"),
        .trait(name: "VK_ENABLE_BETA_EXTENSIONS"),
        .trait(name: "VK_USE_PLATFORM_SCREEN_QNX"),
        .trait(name: "VK_USE_PLATFORM_OHOS"),
    ],
    dependencies: [],
    targets: [
        .target(name: "CVulkan"),
        .target(
            name: "Vulkan",
            dependencies: ["CVulkan"]),
    ],
    swiftLanguageModes: [.v5]
)
