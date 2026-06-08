#if defined(_WIN32) || defined(_WIN64)
    #define VK_USE_PLATFORM_WIN32_KHR

#elif defined(__APPLE__)
    #include <TargetConditionals.h>
    
    #if TARGET_OS_IPHONE
        // iOS Conditions
        #define VK_USE_PLATFORM_IOS_MVK
        #define VK_USE_PLATFORM_METAL_EXT
    #else
        // macOS Conditions
        #define VK_USE_PLATFORM_MACOS_MVK
        #define VK_USE_PLATFORM_METAL_EXT
    #endif

#elif defined(__ANDROID__)
    #define VK_USE_PLATFORM_ANDROID_KHR

#elif defined(__linux__)
    #define VK_USE_PLATFORM_WAYLAND_KHR
    // #define VK_USE_PLATFORM_XLIB_KHR
    // #define VK_USE_PLATFORM_XLIB_XRANDR_KHR
    // #define VK_USE_PLATFORM_XCB_KHR

#endif
