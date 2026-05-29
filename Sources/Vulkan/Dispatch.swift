import CVulkan

struct EntryDispatchTable {
    let vkCreateInstance: PFN_vkCreateInstance!
    let vkEnumerateInstanceVersion: PFN_vkEnumerateInstanceVersion!
    let vkEnumerateInstanceLayerProperties: PFN_vkEnumerateInstanceLayerProperties!
    let vkEnumerateInstanceExtensionProperties: PFN_vkEnumerateInstanceExtensionProperties!

    init(vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr) {
        self.vkCreateInstance = unsafeBitCast(vkGetInstanceProcAddr(nil, "vkCreateInstance"), to: PFN_vkCreateInstance?.self)
        self.vkEnumerateInstanceVersion = unsafeBitCast(vkGetInstanceProcAddr(nil, "vkEnumerateInstanceVersion"), to: PFN_vkEnumerateInstanceVersion?.self)
        self.vkEnumerateInstanceLayerProperties = unsafeBitCast(vkGetInstanceProcAddr(nil, "vkEnumerateInstanceLayerProperties"), to: PFN_vkEnumerateInstanceLayerProperties?.self)
        self.vkEnumerateInstanceExtensionProperties = unsafeBitCast(vkGetInstanceProcAddr(nil, "vkEnumerateInstanceExtensionProperties"), to: PFN_vkEnumerateInstanceExtensionProperties?.self)
    }
}

struct InstanceDispatchTable {
    let vkDestroyInstance: PFN_vkDestroyInstance!
    let vkEnumeratePhysicalDevices: PFN_vkEnumeratePhysicalDevices!
    let vkGetDeviceProcAddr: PFN_vkGetDeviceProcAddr!
    let vkGetPhysicalDeviceProperties: PFN_vkGetPhysicalDeviceProperties!
    let vkGetPhysicalDeviceQueueFamilyProperties: PFN_vkGetPhysicalDeviceQueueFamilyProperties!
    let vkGetPhysicalDeviceMemoryProperties: PFN_vkGetPhysicalDeviceMemoryProperties!
    let vkGetPhysicalDeviceFeatures: PFN_vkGetPhysicalDeviceFeatures!
    let vkGetPhysicalDeviceFormatProperties: PFN_vkGetPhysicalDeviceFormatProperties!
    let vkGetPhysicalDeviceImageFormatProperties: PFN_vkGetPhysicalDeviceImageFormatProperties!
    let vkCreateDevice: PFN_vkCreateDevice!
    let vkEnumerateDeviceLayerProperties: PFN_vkEnumerateDeviceLayerProperties!
    let vkEnumerateDeviceExtensionProperties: PFN_vkEnumerateDeviceExtensionProperties!
    let vkGetPhysicalDeviceSparseImageFormatProperties: PFN_vkGetPhysicalDeviceSparseImageFormatProperties!
    #if VK_USE_PLATFORM_ANDROID_KHR
    let vkCreateAndroidSurfaceKHR: PFN_vkCreateAndroidSurfaceKHR!
    #endif
    #if VK_USE_PLATFORM_OHOS
    let vkCreateSurfaceOHOS: PFN_vkCreateSurfaceOHOS!
    #endif
    let vkGetPhysicalDeviceDisplayPropertiesKHR: PFN_vkGetPhysicalDeviceDisplayPropertiesKHR!
    let vkGetPhysicalDeviceDisplayPlanePropertiesKHR: PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR!
    let vkGetDisplayPlaneSupportedDisplaysKHR: PFN_vkGetDisplayPlaneSupportedDisplaysKHR!
    let vkGetDisplayModePropertiesKHR: PFN_vkGetDisplayModePropertiesKHR!
    let vkCreateDisplayModeKHR: PFN_vkCreateDisplayModeKHR!
    let vkGetDisplayPlaneCapabilitiesKHR: PFN_vkGetDisplayPlaneCapabilitiesKHR!
    let vkCreateDisplayPlaneSurfaceKHR: PFN_vkCreateDisplayPlaneSurfaceKHR!
    let vkDestroySurfaceKHR: PFN_vkDestroySurfaceKHR!
    let vkGetPhysicalDeviceSurfaceSupportKHR: PFN_vkGetPhysicalDeviceSurfaceSupportKHR!
    let vkGetPhysicalDeviceSurfaceCapabilitiesKHR: PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR!
    let vkGetPhysicalDeviceSurfaceFormatsKHR: PFN_vkGetPhysicalDeviceSurfaceFormatsKHR!
    let vkGetPhysicalDeviceSurfacePresentModesKHR: PFN_vkGetPhysicalDeviceSurfacePresentModesKHR!
    #if VK_USE_PLATFORM_VI_NN
    let vkCreateViSurfaceNN: PFN_vkCreateViSurfaceNN!
    #endif
    #if VK_USE_PLATFORM_WAYLAND_KHR
    let vkCreateWaylandSurfaceKHR: PFN_vkCreateWaylandSurfaceKHR!
    #endif
    #if VK_USE_PLATFORM_WAYLAND_KHR
    let vkGetPhysicalDeviceWaylandPresentationSupportKHR: PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR!
    #endif
    #if VK_USE_PLATFORM_UBM_SEC
    let vkCreateUbmSurfaceSEC: PFN_vkCreateUbmSurfaceSEC!
    #endif
    #if VK_USE_PLATFORM_UBM_SEC
    let vkGetPhysicalDeviceUbmPresentationSupportSEC: PFN_vkGetPhysicalDeviceUbmPresentationSupportSEC!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkCreateWin32SurfaceKHR: PFN_vkCreateWin32SurfaceKHR!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetPhysicalDeviceWin32PresentationSupportKHR: PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR!
    #endif
    #if VK_USE_PLATFORM_XLIB_KHR
    let vkCreateXlibSurfaceKHR: PFN_vkCreateXlibSurfaceKHR!
    #endif
    #if VK_USE_PLATFORM_XLIB_KHR
    let vkGetPhysicalDeviceXlibPresentationSupportKHR: PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR!
    #endif
    #if VK_USE_PLATFORM_XCB_KHR
    let vkCreateXcbSurfaceKHR: PFN_vkCreateXcbSurfaceKHR!
    #endif
    #if VK_USE_PLATFORM_XCB_KHR
    let vkGetPhysicalDeviceXcbPresentationSupportKHR: PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR!
    #endif
    #if VK_USE_PLATFORM_DIRECTFB_EXT
    let vkCreateDirectFBSurfaceEXT: PFN_vkCreateDirectFBSurfaceEXT!
    #endif
    #if VK_USE_PLATFORM_DIRECTFB_EXT
    let vkGetPhysicalDeviceDirectFBPresentationSupportEXT: PFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkCreateImagePipeSurfaceFUCHSIA: PFN_vkCreateImagePipeSurfaceFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_GGP
    let vkCreateStreamDescriptorSurfaceGGP: PFN_vkCreateStreamDescriptorSurfaceGGP!
    #endif
    #if VK_USE_PLATFORM_SCREEN_QNX
    let vkCreateScreenSurfaceQNX: PFN_vkCreateScreenSurfaceQNX!
    #endif
    #if VK_USE_PLATFORM_SCREEN_QNX
    let vkGetPhysicalDeviceScreenPresentationSupportQNX: PFN_vkGetPhysicalDeviceScreenPresentationSupportQNX!
    #endif
    let vkCreateDebugReportCallbackEXT: PFN_vkCreateDebugReportCallbackEXT!
    let vkDestroyDebugReportCallbackEXT: PFN_vkDestroyDebugReportCallbackEXT!
    let vkDebugReportMessageEXT: PFN_vkDebugReportMessageEXT!
    let vkGetPhysicalDeviceExternalImageFormatPropertiesNV: PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV!
    let vkGetPhysicalDeviceFeatures2: PFN_vkGetPhysicalDeviceFeatures2!
    let vkGetPhysicalDeviceProperties2: PFN_vkGetPhysicalDeviceProperties2!
    let vkGetPhysicalDeviceFormatProperties2: PFN_vkGetPhysicalDeviceFormatProperties2!
    let vkGetPhysicalDeviceImageFormatProperties2: PFN_vkGetPhysicalDeviceImageFormatProperties2!
    let vkGetPhysicalDeviceQueueFamilyProperties2: PFN_vkGetPhysicalDeviceQueueFamilyProperties2!
    let vkGetPhysicalDeviceMemoryProperties2: PFN_vkGetPhysicalDeviceMemoryProperties2!
    let vkGetPhysicalDeviceSparseImageFormatProperties2: PFN_vkGetPhysicalDeviceSparseImageFormatProperties2!
    let vkGetPhysicalDeviceExternalBufferProperties: PFN_vkGetPhysicalDeviceExternalBufferProperties!
    let vkGetPhysicalDeviceExternalSemaphoreProperties: PFN_vkGetPhysicalDeviceExternalSemaphoreProperties!
    let vkGetPhysicalDeviceExternalFenceProperties: PFN_vkGetPhysicalDeviceExternalFenceProperties!
    let vkReleaseDisplayEXT: PFN_vkReleaseDisplayEXT!
    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    let vkAcquireXlibDisplayEXT: PFN_vkAcquireXlibDisplayEXT!
    #endif
    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    let vkGetRandROutputDisplayEXT: PFN_vkGetRandROutputDisplayEXT!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkAcquireWinrtDisplayNV: PFN_vkAcquireWinrtDisplayNV!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetWinrtDisplayNV: PFN_vkGetWinrtDisplayNV!
    #endif
    let vkGetPhysicalDeviceSurfaceCapabilities2EXT: PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT!
    let vkEnumeratePhysicalDeviceGroups: PFN_vkEnumeratePhysicalDeviceGroups!
    let vkGetPhysicalDevicePresentRectanglesKHR: PFN_vkGetPhysicalDevicePresentRectanglesKHR!
    #if VK_USE_PLATFORM_IOS_MVK
    let vkCreateIOSSurfaceMVK: PFN_vkCreateIOSSurfaceMVK!
    #endif
    #if VK_USE_PLATFORM_MACOS_MVK
    let vkCreateMacOSSurfaceMVK: PFN_vkCreateMacOSSurfaceMVK!
    #endif
    #if VK_USE_PLATFORM_METAL_EXT
    let vkCreateMetalSurfaceEXT: PFN_vkCreateMetalSurfaceEXT!
    #endif
    let vkGetPhysicalDeviceMultisamplePropertiesEXT: PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT!
    let vkGetPhysicalDeviceSurfaceCapabilities2KHR: PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR!
    let vkGetPhysicalDeviceSurfaceFormats2KHR: PFN_vkGetPhysicalDeviceSurfaceFormats2KHR!
    let vkGetPhysicalDeviceDisplayProperties2KHR: PFN_vkGetPhysicalDeviceDisplayProperties2KHR!
    let vkGetPhysicalDeviceDisplayPlaneProperties2KHR: PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR!
    let vkGetDisplayModeProperties2KHR: PFN_vkGetDisplayModeProperties2KHR!
    let vkGetDisplayPlaneCapabilities2KHR: PFN_vkGetDisplayPlaneCapabilities2KHR!
    let vkGetPhysicalDeviceCalibrateableTimeDomainsKHR: PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR!
    let vkCreateDebugUtilsMessengerEXT: PFN_vkCreateDebugUtilsMessengerEXT!
    let vkDestroyDebugUtilsMessengerEXT: PFN_vkDestroyDebugUtilsMessengerEXT!
    let vkSubmitDebugUtilsMessageEXT: PFN_vkSubmitDebugUtilsMessageEXT!
    let vkGetPhysicalDeviceCooperativeMatrixPropertiesNV: PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV!
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetPhysicalDeviceSurfacePresentModes2EXT: PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT!
    #endif
    let vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR: PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR!
    let vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR: PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR!
    let vkCreateHeadlessSurfaceEXT: PFN_vkCreateHeadlessSurfaceEXT!
    let vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV: PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV!
    let vkGetPhysicalDeviceToolProperties: PFN_vkGetPhysicalDeviceToolProperties!
    let vkGetPhysicalDeviceFragmentShadingRatesKHR: PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR!
    let vkGetPhysicalDeviceVideoCapabilitiesKHR: PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR!
    let vkGetPhysicalDeviceVideoFormatPropertiesKHR: PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR!
    let vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR: PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR!
    let vkAcquireDrmDisplayEXT: PFN_vkAcquireDrmDisplayEXT!
    let vkGetDrmDisplayEXT: PFN_vkGetDrmDisplayEXT!
    let vkGetPhysicalDeviceOpticalFlowImageFormatsNV: PFN_vkGetPhysicalDeviceOpticalFlowImageFormatsNV!
    let vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR: PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR!
    let vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV: PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV!
    let vkGetPhysicalDeviceCooperativeVectorPropertiesNV: PFN_vkGetPhysicalDeviceCooperativeVectorPropertiesNV!
    let vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM: PFN_vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM!
    let vkGetPhysicalDeviceExternalTensorPropertiesARM: PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM!
    let vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM!
    let vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM!
    let vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM: PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM!
    let vkGetPhysicalDeviceDescriptorSizeEXT: PFN_vkGetPhysicalDeviceDescriptorSizeEXT!
    let vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM!
    let vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM!

    init(vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr, instance: VkInstance) {
        self.vkDestroyInstance = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkDestroyInstance"), to: PFN_vkDestroyInstance?.self)
        self.vkEnumeratePhysicalDevices = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDevices"), to: PFN_vkEnumeratePhysicalDevices?.self)
        self.vkGetDeviceProcAddr = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDeviceProcAddr"), to: PFN_vkGetDeviceProcAddr?.self)
        self.vkGetPhysicalDeviceProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceProperties"), to: PFN_vkGetPhysicalDeviceProperties?.self)
        self.vkGetPhysicalDeviceQueueFamilyProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyProperties"), to: PFN_vkGetPhysicalDeviceQueueFamilyProperties?.self)
        self.vkGetPhysicalDeviceMemoryProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMemoryProperties"), to: PFN_vkGetPhysicalDeviceMemoryProperties?.self)
        self.vkGetPhysicalDeviceFeatures = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFeatures"), to: PFN_vkGetPhysicalDeviceFeatures?.self)
        self.vkGetPhysicalDeviceFormatProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFormatProperties"), to: PFN_vkGetPhysicalDeviceFormatProperties?.self)
        self.vkGetPhysicalDeviceImageFormatProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceImageFormatProperties"), to: PFN_vkGetPhysicalDeviceImageFormatProperties?.self)
        self.vkCreateDevice = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateDevice"), to: PFN_vkCreateDevice?.self)
        self.vkEnumerateDeviceLayerProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumerateDeviceLayerProperties"), to: PFN_vkEnumerateDeviceLayerProperties?.self)
        self.vkEnumerateDeviceExtensionProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumerateDeviceExtensionProperties"), to: PFN_vkEnumerateDeviceExtensionProperties?.self)
        self.vkGetPhysicalDeviceSparseImageFormatProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties"), to: PFN_vkGetPhysicalDeviceSparseImageFormatProperties?.self)
        #if VK_USE_PLATFORM_ANDROID_KHR
        self.vkCreateAndroidSurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateAndroidSurfaceKHR"), to: PFN_vkCreateAndroidSurfaceKHR?.self)
        #endif
        #if VK_USE_PLATFORM_OHOS
        self.vkCreateSurfaceOHOS = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateSurfaceOHOS"), to: PFN_vkCreateSurfaceOHOS?.self)
        #endif
        self.vkGetPhysicalDeviceDisplayPropertiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayPropertiesKHR"), to: PFN_vkGetPhysicalDeviceDisplayPropertiesKHR?.self)
        self.vkGetPhysicalDeviceDisplayPlanePropertiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR"), to: PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR?.self)
        self.vkGetDisplayPlaneSupportedDisplaysKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDisplayPlaneSupportedDisplaysKHR"), to: PFN_vkGetDisplayPlaneSupportedDisplaysKHR?.self)
        self.vkGetDisplayModePropertiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDisplayModePropertiesKHR"), to: PFN_vkGetDisplayModePropertiesKHR?.self)
        self.vkCreateDisplayModeKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateDisplayModeKHR"), to: PFN_vkCreateDisplayModeKHR?.self)
        self.vkGetDisplayPlaneCapabilitiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDisplayPlaneCapabilitiesKHR"), to: PFN_vkGetDisplayPlaneCapabilitiesKHR?.self)
        self.vkCreateDisplayPlaneSurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateDisplayPlaneSurfaceKHR"), to: PFN_vkCreateDisplayPlaneSurfaceKHR?.self)
        self.vkDestroySurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkDestroySurfaceKHR"), to: PFN_vkDestroySurfaceKHR?.self)
        self.vkGetPhysicalDeviceSurfaceSupportKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceSupportKHR"), to: PFN_vkGetPhysicalDeviceSurfaceSupportKHR?.self)
        self.vkGetPhysicalDeviceSurfaceCapabilitiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"), to: PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR?.self)
        self.vkGetPhysicalDeviceSurfaceFormatsKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceFormatsKHR"), to: PFN_vkGetPhysicalDeviceSurfaceFormatsKHR?.self)
        self.vkGetPhysicalDeviceSurfacePresentModesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfacePresentModesKHR"), to: PFN_vkGetPhysicalDeviceSurfacePresentModesKHR?.self)
        #if VK_USE_PLATFORM_VI_NN
        self.vkCreateViSurfaceNN = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateViSurfaceNN"), to: PFN_vkCreateViSurfaceNN?.self)
        #endif
        #if VK_USE_PLATFORM_WAYLAND_KHR
        self.vkCreateWaylandSurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateWaylandSurfaceKHR"), to: PFN_vkCreateWaylandSurfaceKHR?.self)
        #endif
        #if VK_USE_PLATFORM_WAYLAND_KHR
        self.vkGetPhysicalDeviceWaylandPresentationSupportKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR"), to: PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR?.self)
        #endif
        #if VK_USE_PLATFORM_UBM_SEC
        self.vkCreateUbmSurfaceSEC = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateUbmSurfaceSEC"), to: PFN_vkCreateUbmSurfaceSEC?.self)
        #endif
        #if VK_USE_PLATFORM_UBM_SEC
        self.vkGetPhysicalDeviceUbmPresentationSupportSEC = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceUbmPresentationSupportSEC"), to: PFN_vkGetPhysicalDeviceUbmPresentationSupportSEC?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkCreateWin32SurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateWin32SurfaceKHR"), to: PFN_vkCreateWin32SurfaceKHR?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetPhysicalDeviceWin32PresentationSupportKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR"), to: PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR?.self)
        #endif
        #if VK_USE_PLATFORM_XLIB_KHR
        self.vkCreateXlibSurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateXlibSurfaceKHR"), to: PFN_vkCreateXlibSurfaceKHR?.self)
        #endif
        #if VK_USE_PLATFORM_XLIB_KHR
        self.vkGetPhysicalDeviceXlibPresentationSupportKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR"), to: PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR?.self)
        #endif
        #if VK_USE_PLATFORM_XCB_KHR
        self.vkCreateXcbSurfaceKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateXcbSurfaceKHR"), to: PFN_vkCreateXcbSurfaceKHR?.self)
        #endif
        #if VK_USE_PLATFORM_XCB_KHR
        self.vkGetPhysicalDeviceXcbPresentationSupportKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR"), to: PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR?.self)
        #endif
        #if VK_USE_PLATFORM_DIRECTFB_EXT
        self.vkCreateDirectFBSurfaceEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateDirectFBSurfaceEXT"), to: PFN_vkCreateDirectFBSurfaceEXT?.self)
        #endif
        #if VK_USE_PLATFORM_DIRECTFB_EXT
        self.vkGetPhysicalDeviceDirectFBPresentationSupportEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT"), to: PFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkCreateImagePipeSurfaceFUCHSIA = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateImagePipeSurfaceFUCHSIA"), to: PFN_vkCreateImagePipeSurfaceFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_GGP
        self.vkCreateStreamDescriptorSurfaceGGP = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateStreamDescriptorSurfaceGGP"), to: PFN_vkCreateStreamDescriptorSurfaceGGP?.self)
        #endif
        #if VK_USE_PLATFORM_SCREEN_QNX
        self.vkCreateScreenSurfaceQNX = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateScreenSurfaceQNX"), to: PFN_vkCreateScreenSurfaceQNX?.self)
        #endif
        #if VK_USE_PLATFORM_SCREEN_QNX
        self.vkGetPhysicalDeviceScreenPresentationSupportQNX = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX"), to: PFN_vkGetPhysicalDeviceScreenPresentationSupportQNX?.self)
        #endif
        self.vkCreateDebugReportCallbackEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateDebugReportCallbackEXT"), to: PFN_vkCreateDebugReportCallbackEXT?.self)
        self.vkDestroyDebugReportCallbackEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkDestroyDebugReportCallbackEXT"), to: PFN_vkDestroyDebugReportCallbackEXT?.self)
        self.vkDebugReportMessageEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkDebugReportMessageEXT"), to: PFN_vkDebugReportMessageEXT?.self)
        self.vkGetPhysicalDeviceExternalImageFormatPropertiesNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV"), to: PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV?.self)
        self.vkGetPhysicalDeviceFeatures2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFeatures2"), to: PFN_vkGetPhysicalDeviceFeatures2?.self)
        self.vkGetPhysicalDeviceProperties2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceProperties2"), to: PFN_vkGetPhysicalDeviceProperties2?.self)
        self.vkGetPhysicalDeviceFormatProperties2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFormatProperties2"), to: PFN_vkGetPhysicalDeviceFormatProperties2?.self)
        self.vkGetPhysicalDeviceImageFormatProperties2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceImageFormatProperties2"), to: PFN_vkGetPhysicalDeviceImageFormatProperties2?.self)
        self.vkGetPhysicalDeviceQueueFamilyProperties2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyProperties2"), to: PFN_vkGetPhysicalDeviceQueueFamilyProperties2?.self)
        self.vkGetPhysicalDeviceMemoryProperties2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMemoryProperties2"), to: PFN_vkGetPhysicalDeviceMemoryProperties2?.self)
        self.vkGetPhysicalDeviceSparseImageFormatProperties2 = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties2"), to: PFN_vkGetPhysicalDeviceSparseImageFormatProperties2?.self)
        self.vkGetPhysicalDeviceExternalBufferProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalBufferProperties"), to: PFN_vkGetPhysicalDeviceExternalBufferProperties?.self)
        self.vkGetPhysicalDeviceExternalSemaphoreProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalSemaphoreProperties"), to: PFN_vkGetPhysicalDeviceExternalSemaphoreProperties?.self)
        self.vkGetPhysicalDeviceExternalFenceProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalFenceProperties"), to: PFN_vkGetPhysicalDeviceExternalFenceProperties?.self)
        self.vkReleaseDisplayEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkReleaseDisplayEXT"), to: PFN_vkReleaseDisplayEXT?.self)
        #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
        self.vkAcquireXlibDisplayEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkAcquireXlibDisplayEXT"), to: PFN_vkAcquireXlibDisplayEXT?.self)
        #endif
        #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
        self.vkGetRandROutputDisplayEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetRandROutputDisplayEXT"), to: PFN_vkGetRandROutputDisplayEXT?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkAcquireWinrtDisplayNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkAcquireWinrtDisplayNV"), to: PFN_vkAcquireWinrtDisplayNV?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetWinrtDisplayNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetWinrtDisplayNV"), to: PFN_vkGetWinrtDisplayNV?.self)
        #endif
        self.vkGetPhysicalDeviceSurfaceCapabilities2EXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT"), to: PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT?.self)
        self.vkEnumeratePhysicalDeviceGroups = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceGroups"), to: PFN_vkEnumeratePhysicalDeviceGroups?.self)
        self.vkGetPhysicalDevicePresentRectanglesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDevicePresentRectanglesKHR"), to: PFN_vkGetPhysicalDevicePresentRectanglesKHR?.self)
        #if VK_USE_PLATFORM_IOS_MVK
        self.vkCreateIOSSurfaceMVK = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateIOSSurfaceMVK"), to: PFN_vkCreateIOSSurfaceMVK?.self)
        #endif
        #if VK_USE_PLATFORM_MACOS_MVK
        self.vkCreateMacOSSurfaceMVK = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateMacOSSurfaceMVK"), to: PFN_vkCreateMacOSSurfaceMVK?.self)
        #endif
        #if VK_USE_PLATFORM_METAL_EXT
        self.vkCreateMetalSurfaceEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateMetalSurfaceEXT"), to: PFN_vkCreateMetalSurfaceEXT?.self)
        #endif
        self.vkGetPhysicalDeviceMultisamplePropertiesEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceMultisamplePropertiesEXT"), to: PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT?.self)
        self.vkGetPhysicalDeviceSurfaceCapabilities2KHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR"), to: PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR?.self)
        self.vkGetPhysicalDeviceSurfaceFormats2KHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfaceFormats2KHR"), to: PFN_vkGetPhysicalDeviceSurfaceFormats2KHR?.self)
        self.vkGetPhysicalDeviceDisplayProperties2KHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayProperties2KHR"), to: PFN_vkGetPhysicalDeviceDisplayProperties2KHR?.self)
        self.vkGetPhysicalDeviceDisplayPlaneProperties2KHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR"), to: PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR?.self)
        self.vkGetDisplayModeProperties2KHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDisplayModeProperties2KHR"), to: PFN_vkGetDisplayModeProperties2KHR?.self)
        self.vkGetDisplayPlaneCapabilities2KHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDisplayPlaneCapabilities2KHR"), to: PFN_vkGetDisplayPlaneCapabilities2KHR?.self)
        self.vkGetPhysicalDeviceCalibrateableTimeDomainsKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR"), to: PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR?.self)
        self.vkCreateDebugUtilsMessengerEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateDebugUtilsMessengerEXT"), to: PFN_vkCreateDebugUtilsMessengerEXT?.self)
        self.vkDestroyDebugUtilsMessengerEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkDestroyDebugUtilsMessengerEXT"), to: PFN_vkDestroyDebugUtilsMessengerEXT?.self)
        self.vkSubmitDebugUtilsMessageEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkSubmitDebugUtilsMessageEXT"), to: PFN_vkSubmitDebugUtilsMessageEXT?.self)
        self.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"), to: PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV?.self)
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetPhysicalDeviceSurfacePresentModes2EXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSurfacePresentModes2EXT"), to: PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT?.self)
        #endif
        self.vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"), to: PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR?.self)
        self.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR"), to: PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR?.self)
        self.vkCreateHeadlessSurfaceEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkCreateHeadlessSurfaceEXT"), to: PFN_vkCreateHeadlessSurfaceEXT?.self)
        self.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"), to: PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV?.self)
        self.vkGetPhysicalDeviceToolProperties = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceToolProperties"), to: PFN_vkGetPhysicalDeviceToolProperties?.self)
        self.vkGetPhysicalDeviceFragmentShadingRatesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceFragmentShadingRatesKHR"), to: PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR?.self)
        self.vkGetPhysicalDeviceVideoCapabilitiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceVideoCapabilitiesKHR"), to: PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR?.self)
        self.vkGetPhysicalDeviceVideoFormatPropertiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceVideoFormatPropertiesKHR"), to: PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR?.self)
        self.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR"), to: PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR?.self)
        self.vkAcquireDrmDisplayEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkAcquireDrmDisplayEXT"), to: PFN_vkAcquireDrmDisplayEXT?.self)
        self.vkGetDrmDisplayEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetDrmDisplayEXT"), to: PFN_vkGetDrmDisplayEXT?.self)
        self.vkGetPhysicalDeviceOpticalFlowImageFormatsNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV"), to: PFN_vkGetPhysicalDeviceOpticalFlowImageFormatsNV?.self)
        self.vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR"), to: PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR?.self)
        self.vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV"), to: PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV?.self)
        self.vkGetPhysicalDeviceCooperativeVectorPropertiesNV = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV"), to: PFN_vkGetPhysicalDeviceCooperativeVectorPropertiesNV?.self)
        self.vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM"), to: PFN_vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM?.self)
        self.vkGetPhysicalDeviceExternalTensorPropertiesARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceExternalTensorPropertiesARM"), to: PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM?.self)
        self.vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM"), to: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM?.self)
        self.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM"), to: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM?.self)
        self.vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM"), to: PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM?.self)
        self.vkGetPhysicalDeviceDescriptorSizeEXT = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceDescriptorSizeEXT"), to: PFN_vkGetPhysicalDeviceDescriptorSizeEXT?.self)
        self.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM"), to: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM?.self)
        self.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM = unsafeBitCast(vkGetInstanceProcAddr(instance, "vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM"), to: PFN_vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM?.self)
    }
}

struct DeviceDispatchTable {
    let vkDestroyDevice: PFN_vkDestroyDevice!
    let vkGetDeviceQueue: PFN_vkGetDeviceQueue!
    let vkQueueSubmit: PFN_vkQueueSubmit!
    let vkQueueWaitIdle: PFN_vkQueueWaitIdle!
    let vkDeviceWaitIdle: PFN_vkDeviceWaitIdle!
    let vkAllocateMemory: PFN_vkAllocateMemory!
    let vkFreeMemory: PFN_vkFreeMemory!
    let vkMapMemory: PFN_vkMapMemory!
    let vkUnmapMemory: PFN_vkUnmapMemory!
    let vkFlushMappedMemoryRanges: PFN_vkFlushMappedMemoryRanges!
    let vkInvalidateMappedMemoryRanges: PFN_vkInvalidateMappedMemoryRanges!
    let vkGetDeviceMemoryCommitment: PFN_vkGetDeviceMemoryCommitment!
    let vkGetBufferMemoryRequirements: PFN_vkGetBufferMemoryRequirements!
    let vkBindBufferMemory: PFN_vkBindBufferMemory!
    let vkGetImageMemoryRequirements: PFN_vkGetImageMemoryRequirements!
    let vkBindImageMemory: PFN_vkBindImageMemory!
    let vkGetImageSparseMemoryRequirements: PFN_vkGetImageSparseMemoryRequirements!
    let vkQueueBindSparse: PFN_vkQueueBindSparse!
    let vkCreateFence: PFN_vkCreateFence!
    let vkDestroyFence: PFN_vkDestroyFence!
    let vkResetFences: PFN_vkResetFences!
    let vkGetFenceStatus: PFN_vkGetFenceStatus!
    let vkWaitForFences: PFN_vkWaitForFences!
    let vkCreateSemaphore: PFN_vkCreateSemaphore!
    let vkDestroySemaphore: PFN_vkDestroySemaphore!
    let vkCreateEvent: PFN_vkCreateEvent!
    let vkDestroyEvent: PFN_vkDestroyEvent!
    let vkGetEventStatus: PFN_vkGetEventStatus!
    let vkSetEvent: PFN_vkSetEvent!
    let vkResetEvent: PFN_vkResetEvent!
    let vkCreateQueryPool: PFN_vkCreateQueryPool!
    let vkDestroyQueryPool: PFN_vkDestroyQueryPool!
    let vkGetQueryPoolResults: PFN_vkGetQueryPoolResults!
    let vkResetQueryPool: PFN_vkResetQueryPool!
    let vkCreateBuffer: PFN_vkCreateBuffer!
    let vkDestroyBuffer: PFN_vkDestroyBuffer!
    let vkCreateBufferView: PFN_vkCreateBufferView!
    let vkDestroyBufferView: PFN_vkDestroyBufferView!
    let vkCreateImage: PFN_vkCreateImage!
    let vkDestroyImage: PFN_vkDestroyImage!
    let vkGetImageSubresourceLayout: PFN_vkGetImageSubresourceLayout!
    let vkCreateImageView: PFN_vkCreateImageView!
    let vkDestroyImageView: PFN_vkDestroyImageView!
    let vkCreateShaderModule: PFN_vkCreateShaderModule!
    let vkDestroyShaderModule: PFN_vkDestroyShaderModule!
    let vkCreatePipelineCache: PFN_vkCreatePipelineCache!
    let vkDestroyPipelineCache: PFN_vkDestroyPipelineCache!
    let vkGetPipelineCacheData: PFN_vkGetPipelineCacheData!
    let vkMergePipelineCaches: PFN_vkMergePipelineCaches!
    let vkCreatePipelineBinariesKHR: PFN_vkCreatePipelineBinariesKHR!
    let vkDestroyPipelineBinaryKHR: PFN_vkDestroyPipelineBinaryKHR!
    let vkGetPipelineKeyKHR: PFN_vkGetPipelineKeyKHR!
    let vkGetPipelineBinaryDataKHR: PFN_vkGetPipelineBinaryDataKHR!
    let vkReleaseCapturedPipelineDataKHR: PFN_vkReleaseCapturedPipelineDataKHR!
    let vkCreateGraphicsPipelines: PFN_vkCreateGraphicsPipelines!
    let vkCreateComputePipelines: PFN_vkCreateComputePipelines!
    let vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI: PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI!
    let vkDestroyPipeline: PFN_vkDestroyPipeline!
    let vkCreatePipelineLayout: PFN_vkCreatePipelineLayout!
    let vkDestroyPipelineLayout: PFN_vkDestroyPipelineLayout!
    let vkCreateSampler: PFN_vkCreateSampler!
    let vkDestroySampler: PFN_vkDestroySampler!
    let vkCreateDescriptorSetLayout: PFN_vkCreateDescriptorSetLayout!
    let vkDestroyDescriptorSetLayout: PFN_vkDestroyDescriptorSetLayout!
    let vkCreateDescriptorPool: PFN_vkCreateDescriptorPool!
    let vkDestroyDescriptorPool: PFN_vkDestroyDescriptorPool!
    let vkResetDescriptorPool: PFN_vkResetDescriptorPool!
    let vkAllocateDescriptorSets: PFN_vkAllocateDescriptorSets!
    let vkFreeDescriptorSets: PFN_vkFreeDescriptorSets!
    let vkUpdateDescriptorSets: PFN_vkUpdateDescriptorSets!
    let vkCreateFramebuffer: PFN_vkCreateFramebuffer!
    let vkDestroyFramebuffer: PFN_vkDestroyFramebuffer!
    let vkCreateRenderPass: PFN_vkCreateRenderPass!
    let vkDestroyRenderPass: PFN_vkDestroyRenderPass!
    let vkGetRenderAreaGranularity: PFN_vkGetRenderAreaGranularity!
    let vkGetRenderingAreaGranularity: PFN_vkGetRenderingAreaGranularity!
    let vkCreateCommandPool: PFN_vkCreateCommandPool!
    let vkDestroyCommandPool: PFN_vkDestroyCommandPool!
    let vkResetCommandPool: PFN_vkResetCommandPool!
    let vkAllocateCommandBuffers: PFN_vkAllocateCommandBuffers!
    let vkFreeCommandBuffers: PFN_vkFreeCommandBuffers!
    let vkBeginCommandBuffer: PFN_vkBeginCommandBuffer!
    let vkEndCommandBuffer: PFN_vkEndCommandBuffer!
    let vkResetCommandBuffer: PFN_vkResetCommandBuffer!
    let vkCmdBindPipeline: PFN_vkCmdBindPipeline!
    let vkCmdSetPrimitiveRestartIndexEXT: PFN_vkCmdSetPrimitiveRestartIndexEXT!
    let vkCmdSetAttachmentFeedbackLoopEnableEXT: PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT!
    let vkCmdSetViewport: PFN_vkCmdSetViewport!
    let vkCmdSetScissor: PFN_vkCmdSetScissor!
    let vkCmdSetLineWidth: PFN_vkCmdSetLineWidth!
    let vkCmdSetDepthBias: PFN_vkCmdSetDepthBias!
    let vkCmdSetBlendConstants: PFN_vkCmdSetBlendConstants!
    let vkCmdSetDepthBounds: PFN_vkCmdSetDepthBounds!
    let vkCmdSetStencilCompareMask: PFN_vkCmdSetStencilCompareMask!
    let vkCmdSetStencilWriteMask: PFN_vkCmdSetStencilWriteMask!
    let vkCmdSetStencilReference: PFN_vkCmdSetStencilReference!
    let vkCmdBindDescriptorSets: PFN_vkCmdBindDescriptorSets!
    let vkCmdBindIndexBuffer: PFN_vkCmdBindIndexBuffer!
    let vkCmdBindVertexBuffers: PFN_vkCmdBindVertexBuffers!
    let vkCmdDraw: PFN_vkCmdDraw!
    let vkCmdDrawIndexed: PFN_vkCmdDrawIndexed!
    let vkCmdDrawMultiEXT: PFN_vkCmdDrawMultiEXT!
    let vkCmdDrawMultiIndexedEXT: PFN_vkCmdDrawMultiIndexedEXT!
    let vkCmdDrawIndirect: PFN_vkCmdDrawIndirect!
    let vkCmdDrawIndexedIndirect: PFN_vkCmdDrawIndexedIndirect!
    let vkCmdDispatch: PFN_vkCmdDispatch!
    let vkCmdDispatchIndirect: PFN_vkCmdDispatchIndirect!
    let vkCmdSubpassShadingHUAWEI: PFN_vkCmdSubpassShadingHUAWEI!
    let vkCmdDrawClusterHUAWEI: PFN_vkCmdDrawClusterHUAWEI!
    let vkCmdDrawClusterIndirectHUAWEI: PFN_vkCmdDrawClusterIndirectHUAWEI!
    let vkCmdUpdatePipelineIndirectBufferNV: PFN_vkCmdUpdatePipelineIndirectBufferNV!
    let vkCmdCopyBuffer: PFN_vkCmdCopyBuffer!
    let vkCmdCopyImage: PFN_vkCmdCopyImage!
    let vkCmdBlitImage: PFN_vkCmdBlitImage!
    let vkCmdCopyBufferToImage: PFN_vkCmdCopyBufferToImage!
    let vkCmdCopyImageToBuffer: PFN_vkCmdCopyImageToBuffer!
    let vkCmdCopyMemoryIndirectNV: PFN_vkCmdCopyMemoryIndirectNV!
    let vkCmdCopyMemoryIndirectKHR: PFN_vkCmdCopyMemoryIndirectKHR!
    let vkCmdCopyMemoryToImageIndirectNV: PFN_vkCmdCopyMemoryToImageIndirectNV!
    let vkCmdCopyMemoryToImageIndirectKHR: PFN_vkCmdCopyMemoryToImageIndirectKHR!
    let vkCmdUpdateBuffer: PFN_vkCmdUpdateBuffer!
    let vkCmdFillBuffer: PFN_vkCmdFillBuffer!
    let vkCmdClearColorImage: PFN_vkCmdClearColorImage!
    let vkCmdClearDepthStencilImage: PFN_vkCmdClearDepthStencilImage!
    let vkCmdClearAttachments: PFN_vkCmdClearAttachments!
    let vkCmdResolveImage: PFN_vkCmdResolveImage!
    let vkCmdSetEvent: PFN_vkCmdSetEvent!
    let vkCmdResetEvent: PFN_vkCmdResetEvent!
    let vkCmdWaitEvents: PFN_vkCmdWaitEvents!
    let vkCmdPipelineBarrier: PFN_vkCmdPipelineBarrier!
    let vkCmdBeginQuery: PFN_vkCmdBeginQuery!
    let vkCmdEndQuery: PFN_vkCmdEndQuery!
    let vkCmdBeginConditionalRenderingEXT: PFN_vkCmdBeginConditionalRenderingEXT!
    let vkCmdEndConditionalRenderingEXT: PFN_vkCmdEndConditionalRenderingEXT!
    let vkCmdBeginCustomResolveEXT: PFN_vkCmdBeginCustomResolveEXT!
    let vkCmdResetQueryPool: PFN_vkCmdResetQueryPool!
    let vkCmdWriteTimestamp: PFN_vkCmdWriteTimestamp!
    let vkCmdCopyQueryPoolResults: PFN_vkCmdCopyQueryPoolResults!
    let vkCmdPushConstants: PFN_vkCmdPushConstants!
    let vkCmdBeginRenderPass: PFN_vkCmdBeginRenderPass!
    let vkCmdNextSubpass: PFN_vkCmdNextSubpass!
    let vkCmdEndRenderPass: PFN_vkCmdEndRenderPass!
    let vkCmdExecuteCommands: PFN_vkCmdExecuteCommands!
    let vkCreateSharedSwapchainsKHR: PFN_vkCreateSharedSwapchainsKHR!
    let vkCreateSwapchainKHR: PFN_vkCreateSwapchainKHR!
    let vkDestroySwapchainKHR: PFN_vkDestroySwapchainKHR!
    let vkGetSwapchainImagesKHR: PFN_vkGetSwapchainImagesKHR!
    let vkAcquireNextImageKHR: PFN_vkAcquireNextImageKHR!
    let vkQueuePresentKHR: PFN_vkQueuePresentKHR!
    let vkDebugMarkerSetObjectNameEXT: PFN_vkDebugMarkerSetObjectNameEXT!
    let vkDebugMarkerSetObjectTagEXT: PFN_vkDebugMarkerSetObjectTagEXT!
    let vkCmdDebugMarkerBeginEXT: PFN_vkCmdDebugMarkerBeginEXT!
    let vkCmdDebugMarkerEndEXT: PFN_vkCmdDebugMarkerEndEXT!
    let vkCmdDebugMarkerInsertEXT: PFN_vkCmdDebugMarkerInsertEXT!
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetMemoryWin32HandleNV: PFN_vkGetMemoryWin32HandleNV!
    #endif
    let vkCmdExecuteGeneratedCommandsNV: PFN_vkCmdExecuteGeneratedCommandsNV!
    let vkCmdPreprocessGeneratedCommandsNV: PFN_vkCmdPreprocessGeneratedCommandsNV!
    let vkCmdBindPipelineShaderGroupNV: PFN_vkCmdBindPipelineShaderGroupNV!
    let vkGetGeneratedCommandsMemoryRequirementsNV: PFN_vkGetGeneratedCommandsMemoryRequirementsNV!
    let vkCreateIndirectCommandsLayoutNV: PFN_vkCreateIndirectCommandsLayoutNV!
    let vkDestroyIndirectCommandsLayoutNV: PFN_vkDestroyIndirectCommandsLayoutNV!
    let vkCmdExecuteGeneratedCommandsEXT: PFN_vkCmdExecuteGeneratedCommandsEXT!
    let vkCmdPreprocessGeneratedCommandsEXT: PFN_vkCmdPreprocessGeneratedCommandsEXT!
    let vkGetGeneratedCommandsMemoryRequirementsEXT: PFN_vkGetGeneratedCommandsMemoryRequirementsEXT!
    let vkCreateIndirectCommandsLayoutEXT: PFN_vkCreateIndirectCommandsLayoutEXT!
    let vkDestroyIndirectCommandsLayoutEXT: PFN_vkDestroyIndirectCommandsLayoutEXT!
    let vkCreateIndirectExecutionSetEXT: PFN_vkCreateIndirectExecutionSetEXT!
    let vkDestroyIndirectExecutionSetEXT: PFN_vkDestroyIndirectExecutionSetEXT!
    let vkUpdateIndirectExecutionSetPipelineEXT: PFN_vkUpdateIndirectExecutionSetPipelineEXT!
    let vkUpdateIndirectExecutionSetShaderEXT: PFN_vkUpdateIndirectExecutionSetShaderEXT!
    let vkCmdPushDescriptorSet: PFN_vkCmdPushDescriptorSet!
    let vkTrimCommandPool: PFN_vkTrimCommandPool!
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetMemoryWin32HandleKHR: PFN_vkGetMemoryWin32HandleKHR!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetMemoryWin32HandlePropertiesKHR: PFN_vkGetMemoryWin32HandlePropertiesKHR!
    #endif
    let vkGetMemoryFdKHR: PFN_vkGetMemoryFdKHR!
    let vkGetMemoryFdPropertiesKHR: PFN_vkGetMemoryFdPropertiesKHR!
    #if VK_USE_PLATFORM_FUCHSIA
    let vkGetMemoryZirconHandleFUCHSIA: PFN_vkGetMemoryZirconHandleFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkGetMemoryZirconHandlePropertiesFUCHSIA: PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA!
    #endif
    let vkGetMemoryRemoteAddressNV: PFN_vkGetMemoryRemoteAddressNV!
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetSemaphoreWin32HandleKHR: PFN_vkGetSemaphoreWin32HandleKHR!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkImportSemaphoreWin32HandleKHR: PFN_vkImportSemaphoreWin32HandleKHR!
    #endif
    let vkGetSemaphoreFdKHR: PFN_vkGetSemaphoreFdKHR!
    let vkImportSemaphoreFdKHR: PFN_vkImportSemaphoreFdKHR!
    #if VK_USE_PLATFORM_FUCHSIA
    let vkGetSemaphoreZirconHandleFUCHSIA: PFN_vkGetSemaphoreZirconHandleFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkImportSemaphoreZirconHandleFUCHSIA: PFN_vkImportSemaphoreZirconHandleFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetFenceWin32HandleKHR: PFN_vkGetFenceWin32HandleKHR!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkImportFenceWin32HandleKHR: PFN_vkImportFenceWin32HandleKHR!
    #endif
    let vkGetFenceFdKHR: PFN_vkGetFenceFdKHR!
    let vkImportFenceFdKHR: PFN_vkImportFenceFdKHR!
    let vkDisplayPowerControlEXT: PFN_vkDisplayPowerControlEXT!
    let vkRegisterDeviceEventEXT: PFN_vkRegisterDeviceEventEXT!
    let vkRegisterDisplayEventEXT: PFN_vkRegisterDisplayEventEXT!
    let vkGetSwapchainCounterEXT: PFN_vkGetSwapchainCounterEXT!
    let vkGetDeviceGroupPeerMemoryFeatures: PFN_vkGetDeviceGroupPeerMemoryFeatures!
    let vkBindBufferMemory2: PFN_vkBindBufferMemory2!
    let vkBindImageMemory2: PFN_vkBindImageMemory2!
    let vkCmdSetDeviceMask: PFN_vkCmdSetDeviceMask!
    let vkGetDeviceGroupPresentCapabilitiesKHR: PFN_vkGetDeviceGroupPresentCapabilitiesKHR!
    let vkGetDeviceGroupSurfacePresentModesKHR: PFN_vkGetDeviceGroupSurfacePresentModesKHR!
    let vkAcquireNextImage2KHR: PFN_vkAcquireNextImage2KHR!
    let vkCmdDispatchBase: PFN_vkCmdDispatchBase!
    let vkCreateDescriptorUpdateTemplate: PFN_vkCreateDescriptorUpdateTemplate!
    let vkDestroyDescriptorUpdateTemplate: PFN_vkDestroyDescriptorUpdateTemplate!
    let vkUpdateDescriptorSetWithTemplate: PFN_vkUpdateDescriptorSetWithTemplate!
    let vkCmdPushDescriptorSetWithTemplate: PFN_vkCmdPushDescriptorSetWithTemplate!
    let vkSetHdrMetadataEXT: PFN_vkSetHdrMetadataEXT!
    let vkGetSwapchainStatusKHR: PFN_vkGetSwapchainStatusKHR!
    let vkGetRefreshCycleDurationGOOGLE: PFN_vkGetRefreshCycleDurationGOOGLE!
    let vkGetPastPresentationTimingGOOGLE: PFN_vkGetPastPresentationTimingGOOGLE!
    let vkCmdSetViewportWScalingNV: PFN_vkCmdSetViewportWScalingNV!
    let vkCmdSetDiscardRectangleEXT: PFN_vkCmdSetDiscardRectangleEXT!
    let vkCmdSetDiscardRectangleEnableEXT: PFN_vkCmdSetDiscardRectangleEnableEXT!
    let vkCmdSetDiscardRectangleModeEXT: PFN_vkCmdSetDiscardRectangleModeEXT!
    let vkCmdSetSampleLocationsEXT: PFN_vkCmdSetSampleLocationsEXT!
    let vkGetBufferMemoryRequirements2: PFN_vkGetBufferMemoryRequirements2!
    let vkGetImageMemoryRequirements2: PFN_vkGetImageMemoryRequirements2!
    let vkGetImageSparseMemoryRequirements2: PFN_vkGetImageSparseMemoryRequirements2!
    let vkGetDeviceBufferMemoryRequirements: PFN_vkGetDeviceBufferMemoryRequirements!
    let vkGetDeviceImageMemoryRequirements: PFN_vkGetDeviceImageMemoryRequirements!
    let vkGetDeviceImageSparseMemoryRequirements: PFN_vkGetDeviceImageSparseMemoryRequirements!
    let vkCreateSamplerYcbcrConversion: PFN_vkCreateSamplerYcbcrConversion!
    let vkDestroySamplerYcbcrConversion: PFN_vkDestroySamplerYcbcrConversion!
    let vkGetDeviceQueue2: PFN_vkGetDeviceQueue2!
    let vkCreateValidationCacheEXT: PFN_vkCreateValidationCacheEXT!
    let vkDestroyValidationCacheEXT: PFN_vkDestroyValidationCacheEXT!
    let vkGetValidationCacheDataEXT: PFN_vkGetValidationCacheDataEXT!
    let vkMergeValidationCachesEXT: PFN_vkMergeValidationCachesEXT!
    let vkGetDescriptorSetLayoutSupport: PFN_vkGetDescriptorSetLayoutSupport!
    let vkGetShaderInfoAMD: PFN_vkGetShaderInfoAMD!
    let vkSetLocalDimmingAMD: PFN_vkSetLocalDimmingAMD!
    let vkGetCalibratedTimestampsKHR: PFN_vkGetCalibratedTimestampsKHR!
    let vkSetDebugUtilsObjectNameEXT: PFN_vkSetDebugUtilsObjectNameEXT!
    let vkSetDebugUtilsObjectTagEXT: PFN_vkSetDebugUtilsObjectTagEXT!
    let vkQueueBeginDebugUtilsLabelEXT: PFN_vkQueueBeginDebugUtilsLabelEXT!
    let vkQueueEndDebugUtilsLabelEXT: PFN_vkQueueEndDebugUtilsLabelEXT!
    let vkQueueInsertDebugUtilsLabelEXT: PFN_vkQueueInsertDebugUtilsLabelEXT!
    let vkCmdBeginDebugUtilsLabelEXT: PFN_vkCmdBeginDebugUtilsLabelEXT!
    let vkCmdEndDebugUtilsLabelEXT: PFN_vkCmdEndDebugUtilsLabelEXT!
    let vkCmdInsertDebugUtilsLabelEXT: PFN_vkCmdInsertDebugUtilsLabelEXT!
    let vkGetMemoryHostPointerPropertiesEXT: PFN_vkGetMemoryHostPointerPropertiesEXT!
    let vkCmdWriteBufferMarkerAMD: PFN_vkCmdWriteBufferMarkerAMD!
    let vkCreateRenderPass2: PFN_vkCreateRenderPass2!
    let vkCmdBeginRenderPass2: PFN_vkCmdBeginRenderPass2!
    let vkCmdNextSubpass2: PFN_vkCmdNextSubpass2!
    let vkCmdEndRenderPass2: PFN_vkCmdEndRenderPass2!
    let vkGetSemaphoreCounterValue: PFN_vkGetSemaphoreCounterValue!
    let vkWaitSemaphores: PFN_vkWaitSemaphores!
    let vkSignalSemaphore: PFN_vkSignalSemaphore!
    #if VK_USE_PLATFORM_ANDROID_KHR
    let vkGetAndroidHardwareBufferPropertiesANDROID: PFN_vkGetAndroidHardwareBufferPropertiesANDROID!
    #endif
    #if VK_USE_PLATFORM_ANDROID_KHR
    let vkGetMemoryAndroidHardwareBufferANDROID: PFN_vkGetMemoryAndroidHardwareBufferANDROID!
    #endif
    let vkCmdDrawIndirectCount: PFN_vkCmdDrawIndirectCount!
    let vkCmdDrawIndexedIndirectCount: PFN_vkCmdDrawIndexedIndirectCount!
    let vkCmdSetCheckpointNV: PFN_vkCmdSetCheckpointNV!
    let vkGetQueueCheckpointDataNV: PFN_vkGetQueueCheckpointDataNV!
    let vkCmdBindTransformFeedbackBuffersEXT: PFN_vkCmdBindTransformFeedbackBuffersEXT!
    let vkCmdBeginTransformFeedbackEXT: PFN_vkCmdBeginTransformFeedbackEXT!
    let vkCmdEndTransformFeedbackEXT: PFN_vkCmdEndTransformFeedbackEXT!
    let vkCmdBeginQueryIndexedEXT: PFN_vkCmdBeginQueryIndexedEXT!
    let vkCmdEndQueryIndexedEXT: PFN_vkCmdEndQueryIndexedEXT!
    let vkCmdDrawIndirectByteCountEXT: PFN_vkCmdDrawIndirectByteCountEXT!
    let vkCmdSetExclusiveScissorNV: PFN_vkCmdSetExclusiveScissorNV!
    let vkCmdSetExclusiveScissorEnableNV: PFN_vkCmdSetExclusiveScissorEnableNV!
    let vkCmdBindShadingRateImageNV: PFN_vkCmdBindShadingRateImageNV!
    let vkCmdSetViewportShadingRatePaletteNV: PFN_vkCmdSetViewportShadingRatePaletteNV!
    let vkCmdSetCoarseSampleOrderNV: PFN_vkCmdSetCoarseSampleOrderNV!
    let vkCmdDrawMeshTasksNV: PFN_vkCmdDrawMeshTasksNV!
    let vkCmdDrawMeshTasksIndirectNV: PFN_vkCmdDrawMeshTasksIndirectNV!
    let vkCmdDrawMeshTasksIndirectCountNV: PFN_vkCmdDrawMeshTasksIndirectCountNV!
    let vkCmdDrawMeshTasksEXT: PFN_vkCmdDrawMeshTasksEXT!
    let vkCmdDrawMeshTasksIndirectEXT: PFN_vkCmdDrawMeshTasksIndirectEXT!
    let vkCmdDrawMeshTasksIndirectCountEXT: PFN_vkCmdDrawMeshTasksIndirectCountEXT!
    let vkCompileDeferredNV: PFN_vkCompileDeferredNV!
    let vkCreateAccelerationStructureNV: PFN_vkCreateAccelerationStructureNV!
    let vkCmdBindInvocationMaskHUAWEI: PFN_vkCmdBindInvocationMaskHUAWEI!
    let vkDestroyAccelerationStructureKHR: PFN_vkDestroyAccelerationStructureKHR!
    let vkDestroyAccelerationStructureNV: PFN_vkDestroyAccelerationStructureNV!
    let vkGetAccelerationStructureMemoryRequirementsNV: PFN_vkGetAccelerationStructureMemoryRequirementsNV!
    let vkBindAccelerationStructureMemoryNV: PFN_vkBindAccelerationStructureMemoryNV!
    let vkCmdCopyAccelerationStructureNV: PFN_vkCmdCopyAccelerationStructureNV!
    let vkCmdCopyAccelerationStructureKHR: PFN_vkCmdCopyAccelerationStructureKHR!
    let vkCopyAccelerationStructureKHR: PFN_vkCopyAccelerationStructureKHR!
    let vkCmdCopyAccelerationStructureToMemoryKHR: PFN_vkCmdCopyAccelerationStructureToMemoryKHR!
    let vkCopyAccelerationStructureToMemoryKHR: PFN_vkCopyAccelerationStructureToMemoryKHR!
    let vkCmdCopyMemoryToAccelerationStructureKHR: PFN_vkCmdCopyMemoryToAccelerationStructureKHR!
    let vkCopyMemoryToAccelerationStructureKHR: PFN_vkCopyMemoryToAccelerationStructureKHR!
    let vkCmdWriteAccelerationStructuresPropertiesKHR: PFN_vkCmdWriteAccelerationStructuresPropertiesKHR!
    let vkCmdWriteAccelerationStructuresPropertiesNV: PFN_vkCmdWriteAccelerationStructuresPropertiesNV!
    let vkCmdBuildAccelerationStructureNV: PFN_vkCmdBuildAccelerationStructureNV!
    let vkWriteAccelerationStructuresPropertiesKHR: PFN_vkWriteAccelerationStructuresPropertiesKHR!
    let vkCmdTraceRaysKHR: PFN_vkCmdTraceRaysKHR!
    let vkCmdTraceRaysNV: PFN_vkCmdTraceRaysNV!
    let vkGetRayTracingShaderGroupHandlesKHR: PFN_vkGetRayTracingShaderGroupHandlesKHR!
    let vkGetRayTracingCaptureReplayShaderGroupHandlesKHR: PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR!
    let vkGetAccelerationStructureHandleNV: PFN_vkGetAccelerationStructureHandleNV!
    let vkCreateRayTracingPipelinesNV: PFN_vkCreateRayTracingPipelinesNV!
    let vkCreateRayTracingPipelinesKHR: PFN_vkCreateRayTracingPipelinesKHR!
    let vkCmdTraceRaysIndirectKHR: PFN_vkCmdTraceRaysIndirectKHR!
    let vkCmdTraceRaysIndirect2KHR: PFN_vkCmdTraceRaysIndirect2KHR!
    let vkGetClusterAccelerationStructureBuildSizesNV: PFN_vkGetClusterAccelerationStructureBuildSizesNV!
    let vkCmdBuildClusterAccelerationStructureIndirectNV: PFN_vkCmdBuildClusterAccelerationStructureIndirectNV!
    let vkGetDeviceAccelerationStructureCompatibilityKHR: PFN_vkGetDeviceAccelerationStructureCompatibilityKHR!
    let vkGetRayTracingShaderGroupStackSizeKHR: PFN_vkGetRayTracingShaderGroupStackSizeKHR!
    let vkCmdSetRayTracingPipelineStackSizeKHR: PFN_vkCmdSetRayTracingPipelineStackSizeKHR!
    let vkGetImageViewHandleNVX: PFN_vkGetImageViewHandleNVX!
    let vkGetImageViewHandle64NVX: PFN_vkGetImageViewHandle64NVX!
    let vkGetImageViewAddressNVX: PFN_vkGetImageViewAddressNVX!
    let vkGetDeviceCombinedImageSamplerIndexNVX: PFN_vkGetDeviceCombinedImageSamplerIndexNVX!
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkGetDeviceGroupSurfacePresentModes2EXT: PFN_vkGetDeviceGroupSurfacePresentModes2EXT!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkAcquireFullScreenExclusiveModeEXT: PFN_vkAcquireFullScreenExclusiveModeEXT!
    #endif
    #if VK_USE_PLATFORM_WIN32_KHR
    let vkReleaseFullScreenExclusiveModeEXT: PFN_vkReleaseFullScreenExclusiveModeEXT!
    #endif
    let vkAcquireProfilingLockKHR: PFN_vkAcquireProfilingLockKHR!
    let vkReleaseProfilingLockKHR: PFN_vkReleaseProfilingLockKHR!
    let vkGetImageDrmFormatModifierPropertiesEXT: PFN_vkGetImageDrmFormatModifierPropertiesEXT!
    let vkGetBufferOpaqueCaptureAddress: PFN_vkGetBufferOpaqueCaptureAddress!
    let vkGetBufferDeviceAddress: PFN_vkGetBufferDeviceAddress!
    let vkInitializePerformanceApiINTEL: PFN_vkInitializePerformanceApiINTEL!
    let vkUninitializePerformanceApiINTEL: PFN_vkUninitializePerformanceApiINTEL!
    let vkCmdSetPerformanceMarkerINTEL: PFN_vkCmdSetPerformanceMarkerINTEL!
    let vkCmdSetPerformanceStreamMarkerINTEL: PFN_vkCmdSetPerformanceStreamMarkerINTEL!
    let vkCmdSetPerformanceOverrideINTEL: PFN_vkCmdSetPerformanceOverrideINTEL!
    let vkAcquirePerformanceConfigurationINTEL: PFN_vkAcquirePerformanceConfigurationINTEL!
    let vkReleasePerformanceConfigurationINTEL: PFN_vkReleasePerformanceConfigurationINTEL!
    let vkQueueSetPerformanceConfigurationINTEL: PFN_vkQueueSetPerformanceConfigurationINTEL!
    let vkGetPerformanceParameterINTEL: PFN_vkGetPerformanceParameterINTEL!
    let vkGetDeviceMemoryOpaqueCaptureAddress: PFN_vkGetDeviceMemoryOpaqueCaptureAddress!
    let vkGetPipelineExecutablePropertiesKHR: PFN_vkGetPipelineExecutablePropertiesKHR!
    let vkGetPipelineExecutableStatisticsKHR: PFN_vkGetPipelineExecutableStatisticsKHR!
    let vkGetPipelineExecutableInternalRepresentationsKHR: PFN_vkGetPipelineExecutableInternalRepresentationsKHR!
    let vkCmdSetLineStipple: PFN_vkCmdSetLineStipple!
    let vkCreateAccelerationStructureKHR: PFN_vkCreateAccelerationStructureKHR!
    let vkCmdBuildAccelerationStructuresKHR: PFN_vkCmdBuildAccelerationStructuresKHR!
    let vkCmdBuildAccelerationStructuresIndirectKHR: PFN_vkCmdBuildAccelerationStructuresIndirectKHR!
    let vkBuildAccelerationStructuresKHR: PFN_vkBuildAccelerationStructuresKHR!
    let vkGetAccelerationStructureDeviceAddressKHR: PFN_vkGetAccelerationStructureDeviceAddressKHR!
    let vkCreateDeferredOperationKHR: PFN_vkCreateDeferredOperationKHR!
    let vkDestroyDeferredOperationKHR: PFN_vkDestroyDeferredOperationKHR!
    let vkGetDeferredOperationMaxConcurrencyKHR: PFN_vkGetDeferredOperationMaxConcurrencyKHR!
    let vkGetDeferredOperationResultKHR: PFN_vkGetDeferredOperationResultKHR!
    let vkDeferredOperationJoinKHR: PFN_vkDeferredOperationJoinKHR!
    let vkGetPipelineIndirectMemoryRequirementsNV: PFN_vkGetPipelineIndirectMemoryRequirementsNV!
    let vkGetPipelineIndirectDeviceAddressNV: PFN_vkGetPipelineIndirectDeviceAddressNV!
    let vkAntiLagUpdateAMD: PFN_vkAntiLagUpdateAMD!
    let vkCmdSetCullMode: PFN_vkCmdSetCullMode!
    let vkCmdSetFrontFace: PFN_vkCmdSetFrontFace!
    let vkCmdSetPrimitiveTopology: PFN_vkCmdSetPrimitiveTopology!
    let vkCmdSetViewportWithCount: PFN_vkCmdSetViewportWithCount!
    let vkCmdSetScissorWithCount: PFN_vkCmdSetScissorWithCount!
    let vkCmdBindIndexBuffer2: PFN_vkCmdBindIndexBuffer2!
    let vkCmdBindVertexBuffers2: PFN_vkCmdBindVertexBuffers2!
    let vkCmdSetDepthTestEnable: PFN_vkCmdSetDepthTestEnable!
    let vkCmdSetDepthWriteEnable: PFN_vkCmdSetDepthWriteEnable!
    let vkCmdSetDepthCompareOp: PFN_vkCmdSetDepthCompareOp!
    let vkCmdSetDepthBoundsTestEnable: PFN_vkCmdSetDepthBoundsTestEnable!
    let vkCmdSetStencilTestEnable: PFN_vkCmdSetStencilTestEnable!
    let vkCmdSetStencilOp: PFN_vkCmdSetStencilOp!
    let vkCmdSetPatchControlPointsEXT: PFN_vkCmdSetPatchControlPointsEXT!
    let vkCmdSetRasterizerDiscardEnable: PFN_vkCmdSetRasterizerDiscardEnable!
    let vkCmdSetDepthBiasEnable: PFN_vkCmdSetDepthBiasEnable!
    let vkCmdSetLogicOpEXT: PFN_vkCmdSetLogicOpEXT!
    let vkCmdSetPrimitiveRestartEnable: PFN_vkCmdSetPrimitiveRestartEnable!
    let vkCmdSetTessellationDomainOriginEXT: PFN_vkCmdSetTessellationDomainOriginEXT!
    let vkCmdSetDepthClampEnableEXT: PFN_vkCmdSetDepthClampEnableEXT!
    let vkCmdSetPolygonModeEXT: PFN_vkCmdSetPolygonModeEXT!
    let vkCmdSetRasterizationSamplesEXT: PFN_vkCmdSetRasterizationSamplesEXT!
    let vkCmdSetSampleMaskEXT: PFN_vkCmdSetSampleMaskEXT!
    let vkCmdSetAlphaToCoverageEnableEXT: PFN_vkCmdSetAlphaToCoverageEnableEXT!
    let vkCmdSetAlphaToOneEnableEXT: PFN_vkCmdSetAlphaToOneEnableEXT!
    let vkCmdSetLogicOpEnableEXT: PFN_vkCmdSetLogicOpEnableEXT!
    let vkCmdSetColorBlendEnableEXT: PFN_vkCmdSetColorBlendEnableEXT!
    let vkCmdSetColorBlendEquationEXT: PFN_vkCmdSetColorBlendEquationEXT!
    let vkCmdSetColorWriteMaskEXT: PFN_vkCmdSetColorWriteMaskEXT!
    let vkCmdSetRasterizationStreamEXT: PFN_vkCmdSetRasterizationStreamEXT!
    let vkCmdSetConservativeRasterizationModeEXT: PFN_vkCmdSetConservativeRasterizationModeEXT!
    let vkCmdSetExtraPrimitiveOverestimationSizeEXT: PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT!
    let vkCmdSetDepthClipEnableEXT: PFN_vkCmdSetDepthClipEnableEXT!
    let vkCmdSetSampleLocationsEnableEXT: PFN_vkCmdSetSampleLocationsEnableEXT!
    let vkCmdSetColorBlendAdvancedEXT: PFN_vkCmdSetColorBlendAdvancedEXT!
    let vkCmdSetProvokingVertexModeEXT: PFN_vkCmdSetProvokingVertexModeEXT!
    let vkCmdSetLineRasterizationModeEXT: PFN_vkCmdSetLineRasterizationModeEXT!
    let vkCmdSetLineStippleEnableEXT: PFN_vkCmdSetLineStippleEnableEXT!
    let vkCmdSetDepthClipNegativeOneToOneEXT: PFN_vkCmdSetDepthClipNegativeOneToOneEXT!
    let vkCmdSetViewportWScalingEnableNV: PFN_vkCmdSetViewportWScalingEnableNV!
    let vkCmdSetViewportSwizzleNV: PFN_vkCmdSetViewportSwizzleNV!
    let vkCmdSetCoverageToColorEnableNV: PFN_vkCmdSetCoverageToColorEnableNV!
    let vkCmdSetCoverageToColorLocationNV: PFN_vkCmdSetCoverageToColorLocationNV!
    let vkCmdSetCoverageModulationModeNV: PFN_vkCmdSetCoverageModulationModeNV!
    let vkCmdSetCoverageModulationTableEnableNV: PFN_vkCmdSetCoverageModulationTableEnableNV!
    let vkCmdSetCoverageModulationTableNV: PFN_vkCmdSetCoverageModulationTableNV!
    let vkCmdSetShadingRateImageEnableNV: PFN_vkCmdSetShadingRateImageEnableNV!
    let vkCmdSetCoverageReductionModeNV: PFN_vkCmdSetCoverageReductionModeNV!
    let vkCmdSetRepresentativeFragmentTestEnableNV: PFN_vkCmdSetRepresentativeFragmentTestEnableNV!
    let vkCreatePrivateDataSlot: PFN_vkCreatePrivateDataSlot!
    let vkDestroyPrivateDataSlot: PFN_vkDestroyPrivateDataSlot!
    let vkSetPrivateData: PFN_vkSetPrivateData!
    let vkGetPrivateData: PFN_vkGetPrivateData!
    let vkCmdCopyBuffer2: PFN_vkCmdCopyBuffer2!
    let vkCmdCopyImage2: PFN_vkCmdCopyImage2!
    let vkCmdBlitImage2: PFN_vkCmdBlitImage2!
    let vkCmdCopyBufferToImage2: PFN_vkCmdCopyBufferToImage2!
    let vkCmdCopyImageToBuffer2: PFN_vkCmdCopyImageToBuffer2!
    let vkCmdResolveImage2: PFN_vkCmdResolveImage2!
    let vkCmdSetFragmentShadingRateKHR: PFN_vkCmdSetFragmentShadingRateKHR!
    let vkCmdSetFragmentShadingRateEnumNV: PFN_vkCmdSetFragmentShadingRateEnumNV!
    let vkGetAccelerationStructureBuildSizesKHR: PFN_vkGetAccelerationStructureBuildSizesKHR!
    let vkCmdSetVertexInputEXT: PFN_vkCmdSetVertexInputEXT!
    let vkCmdSetColorWriteEnableEXT: PFN_vkCmdSetColorWriteEnableEXT!
    let vkCmdSetEvent2: PFN_vkCmdSetEvent2!
    let vkCmdResetEvent2: PFN_vkCmdResetEvent2!
    let vkCmdWaitEvents2: PFN_vkCmdWaitEvents2!
    let vkCmdPipelineBarrier2: PFN_vkCmdPipelineBarrier2!
    let vkQueueSubmit2: PFN_vkQueueSubmit2!
    let vkCmdWriteTimestamp2: PFN_vkCmdWriteTimestamp2!
    let vkCmdWriteBufferMarker2AMD: PFN_vkCmdWriteBufferMarker2AMD!
    let vkGetQueueCheckpointData2NV: PFN_vkGetQueueCheckpointData2NV!
    let vkCopyMemoryToImage: PFN_vkCopyMemoryToImage!
    let vkCopyImageToMemory: PFN_vkCopyImageToMemory!
    let vkCopyImageToImage: PFN_vkCopyImageToImage!
    let vkTransitionImageLayout: PFN_vkTransitionImageLayout!
    let vkCreateVideoSessionKHR: PFN_vkCreateVideoSessionKHR!
    let vkDestroyVideoSessionKHR: PFN_vkDestroyVideoSessionKHR!
    let vkCreateVideoSessionParametersKHR: PFN_vkCreateVideoSessionParametersKHR!
    let vkUpdateVideoSessionParametersKHR: PFN_vkUpdateVideoSessionParametersKHR!
    let vkGetEncodedVideoSessionParametersKHR: PFN_vkGetEncodedVideoSessionParametersKHR!
    let vkDestroyVideoSessionParametersKHR: PFN_vkDestroyVideoSessionParametersKHR!
    let vkGetVideoSessionMemoryRequirementsKHR: PFN_vkGetVideoSessionMemoryRequirementsKHR!
    let vkBindVideoSessionMemoryKHR: PFN_vkBindVideoSessionMemoryKHR!
    let vkCmdDecodeVideoKHR: PFN_vkCmdDecodeVideoKHR!
    let vkCmdBeginVideoCodingKHR: PFN_vkCmdBeginVideoCodingKHR!
    let vkCmdControlVideoCodingKHR: PFN_vkCmdControlVideoCodingKHR!
    let vkCmdEndVideoCodingKHR: PFN_vkCmdEndVideoCodingKHR!
    let vkCmdEncodeVideoKHR: PFN_vkCmdEncodeVideoKHR!
    let vkCmdDecompressMemoryNV: PFN_vkCmdDecompressMemoryNV!
    let vkCmdDecompressMemoryIndirectCountNV: PFN_vkCmdDecompressMemoryIndirectCountNV!
    let vkGetPartitionedAccelerationStructuresBuildSizesNV: PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV!
    let vkCmdBuildPartitionedAccelerationStructuresNV: PFN_vkCmdBuildPartitionedAccelerationStructuresNV!
    let vkCmdDecompressMemoryEXT: PFN_vkCmdDecompressMemoryEXT!
    let vkCmdDecompressMemoryIndirectCountEXT: PFN_vkCmdDecompressMemoryIndirectCountEXT!
    let vkCreateCuModuleNVX: PFN_vkCreateCuModuleNVX!
    let vkCreateCuFunctionNVX: PFN_vkCreateCuFunctionNVX!
    let vkDestroyCuModuleNVX: PFN_vkDestroyCuModuleNVX!
    let vkDestroyCuFunctionNVX: PFN_vkDestroyCuFunctionNVX!
    let vkCmdCuLaunchKernelNVX: PFN_vkCmdCuLaunchKernelNVX!
    let vkGetDescriptorSetLayoutSizeEXT: PFN_vkGetDescriptorSetLayoutSizeEXT!
    let vkGetDescriptorSetLayoutBindingOffsetEXT: PFN_vkGetDescriptorSetLayoutBindingOffsetEXT!
    let vkGetDescriptorEXT: PFN_vkGetDescriptorEXT!
    let vkCmdBindDescriptorBuffersEXT: PFN_vkCmdBindDescriptorBuffersEXT!
    let vkCmdSetDescriptorBufferOffsetsEXT: PFN_vkCmdSetDescriptorBufferOffsetsEXT!
    let vkCmdBindDescriptorBufferEmbeddedSamplersEXT: PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT!
    let vkGetBufferOpaqueCaptureDescriptorDataEXT: PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT!
    let vkGetImageOpaqueCaptureDescriptorDataEXT: PFN_vkGetImageOpaqueCaptureDescriptorDataEXT!
    let vkGetImageViewOpaqueCaptureDescriptorDataEXT: PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT!
    let vkGetSamplerOpaqueCaptureDescriptorDataEXT: PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT!
    let vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT: PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT!
    let vkSetDeviceMemoryPriorityEXT: PFN_vkSetDeviceMemoryPriorityEXT!
    let vkWaitForPresent2KHR: PFN_vkWaitForPresent2KHR!
    let vkWaitForPresentKHR: PFN_vkWaitForPresentKHR!
    #if VK_USE_PLATFORM_FUCHSIA
    let vkCreateBufferCollectionFUCHSIA: PFN_vkCreateBufferCollectionFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkSetBufferCollectionBufferConstraintsFUCHSIA: PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkSetBufferCollectionImageConstraintsFUCHSIA: PFN_vkSetBufferCollectionImageConstraintsFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkDestroyBufferCollectionFUCHSIA: PFN_vkDestroyBufferCollectionFUCHSIA!
    #endif
    #if VK_USE_PLATFORM_FUCHSIA
    let vkGetBufferCollectionPropertiesFUCHSIA: PFN_vkGetBufferCollectionPropertiesFUCHSIA!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCreateCudaModuleNV: PFN_vkCreateCudaModuleNV!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkGetCudaModuleCacheNV: PFN_vkGetCudaModuleCacheNV!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCreateCudaFunctionNV: PFN_vkCreateCudaFunctionNV!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkDestroyCudaModuleNV: PFN_vkDestroyCudaModuleNV!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkDestroyCudaFunctionNV: PFN_vkDestroyCudaFunctionNV!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCmdCudaLaunchKernelNV: PFN_vkCmdCudaLaunchKernelNV!
    #endif
    let vkCmdBeginRendering: PFN_vkCmdBeginRendering!
    let vkCmdEndRendering: PFN_vkCmdEndRendering!
    let vkCmdEndRendering2KHR: PFN_vkCmdEndRendering2KHR!
    let vkGetDescriptorSetLayoutHostMappingInfoVALVE: PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE!
    let vkGetDescriptorSetHostMappingVALVE: PFN_vkGetDescriptorSetHostMappingVALVE!
    let vkGetShaderModuleIdentifierEXT: PFN_vkGetShaderModuleIdentifierEXT!
    let vkGetShaderModuleCreateInfoIdentifierEXT: PFN_vkGetShaderModuleCreateInfoIdentifierEXT!
    let vkGetImageSubresourceLayout2: PFN_vkGetImageSubresourceLayout2!
    let vkGetPipelinePropertiesEXT: PFN_vkGetPipelinePropertiesEXT!
    #if VK_USE_PLATFORM_METAL_EXT
    let vkExportMetalObjectsEXT: PFN_vkExportMetalObjectsEXT!
    #endif
    let vkCmdBindTileMemoryQCOM: PFN_vkCmdBindTileMemoryQCOM!
    let vkGetFramebufferTilePropertiesQCOM: PFN_vkGetFramebufferTilePropertiesQCOM!
    let vkGetDynamicRenderingTilePropertiesQCOM: PFN_vkGetDynamicRenderingTilePropertiesQCOM!
    let vkCreateOpticalFlowSessionNV: PFN_vkCreateOpticalFlowSessionNV!
    let vkDestroyOpticalFlowSessionNV: PFN_vkDestroyOpticalFlowSessionNV!
    let vkBindOpticalFlowSessionImageNV: PFN_vkBindOpticalFlowSessionImageNV!
    let vkCmdOpticalFlowExecuteNV: PFN_vkCmdOpticalFlowExecuteNV!
    let vkGetDeviceFaultInfoEXT: PFN_vkGetDeviceFaultInfoEXT!
    let vkGetDeviceFaultReportsKHR: PFN_vkGetDeviceFaultReportsKHR!
    let vkGetDeviceFaultDebugInfoKHR: PFN_vkGetDeviceFaultDebugInfoKHR!
    let vkCmdSetDepthBias2EXT: PFN_vkCmdSetDepthBias2EXT!
    let vkReleaseSwapchainImagesKHR: PFN_vkReleaseSwapchainImagesKHR!
    let vkGetDeviceImageSubresourceLayout: PFN_vkGetDeviceImageSubresourceLayout!
    let vkMapMemory2: PFN_vkMapMemory2!
    let vkUnmapMemory2: PFN_vkUnmapMemory2!
    let vkCreateShadersEXT: PFN_vkCreateShadersEXT!
    let vkDestroyShaderEXT: PFN_vkDestroyShaderEXT!
    let vkGetShaderBinaryDataEXT: PFN_vkGetShaderBinaryDataEXT!
    let vkCmdBindShadersEXT: PFN_vkCmdBindShadersEXT!
    let vkSetSwapchainPresentTimingQueueSizeEXT: PFN_vkSetSwapchainPresentTimingQueueSizeEXT!
    let vkGetSwapchainTimingPropertiesEXT: PFN_vkGetSwapchainTimingPropertiesEXT!
    let vkGetSwapchainTimeDomainPropertiesEXT: PFN_vkGetSwapchainTimeDomainPropertiesEXT!
    let vkGetPastPresentationTimingEXT: PFN_vkGetPastPresentationTimingEXT!
    #if VK_USE_PLATFORM_SCREEN_QNX
    let vkGetScreenBufferPropertiesQNX: PFN_vkGetScreenBufferPropertiesQNX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkGetExecutionGraphPipelineScratchSizeAMDX: PFN_vkGetExecutionGraphPipelineScratchSizeAMDX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkGetExecutionGraphPipelineNodeIndexAMDX: PFN_vkGetExecutionGraphPipelineNodeIndexAMDX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCreateExecutionGraphPipelinesAMDX: PFN_vkCreateExecutionGraphPipelinesAMDX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCmdInitializeGraphScratchMemoryAMDX: PFN_vkCmdInitializeGraphScratchMemoryAMDX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCmdDispatchGraphAMDX: PFN_vkCmdDispatchGraphAMDX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCmdDispatchGraphIndirectAMDX: PFN_vkCmdDispatchGraphIndirectAMDX!
    #endif
    #if VK_ENABLE_BETA_EXTENSIONS
    let vkCmdDispatchGraphIndirectCountAMDX: PFN_vkCmdDispatchGraphIndirectCountAMDX!
    #endif
    let vkCmdBindDescriptorSets2: PFN_vkCmdBindDescriptorSets2!
    let vkCmdPushConstants2: PFN_vkCmdPushConstants2!
    let vkCmdPushDescriptorSet2: PFN_vkCmdPushDescriptorSet2!
    let vkCmdPushDescriptorSetWithTemplate2: PFN_vkCmdPushDescriptorSetWithTemplate2!
    let vkCmdSetDescriptorBufferOffsets2EXT: PFN_vkCmdSetDescriptorBufferOffsets2EXT!
    let vkCmdBindDescriptorBufferEmbeddedSamplers2EXT: PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT!
    let vkSetLatencySleepModeNV: PFN_vkSetLatencySleepModeNV!
    let vkLatencySleepNV: PFN_vkLatencySleepNV!
    let vkSetLatencyMarkerNV: PFN_vkSetLatencyMarkerNV!
    let vkGetLatencyTimingsNV: PFN_vkGetLatencyTimingsNV!
    let vkQueueNotifyOutOfBandNV: PFN_vkQueueNotifyOutOfBandNV!
    let vkCmdSetRenderingAttachmentLocations: PFN_vkCmdSetRenderingAttachmentLocations!
    let vkCmdSetRenderingInputAttachmentIndices: PFN_vkCmdSetRenderingInputAttachmentIndices!
    let vkCmdSetDepthClampRangeEXT: PFN_vkCmdSetDepthClampRangeEXT!
    #if VK_USE_PLATFORM_METAL_EXT
    let vkGetMemoryMetalHandleEXT: PFN_vkGetMemoryMetalHandleEXT!
    #endif
    #if VK_USE_PLATFORM_METAL_EXT
    let vkGetMemoryMetalHandlePropertiesEXT: PFN_vkGetMemoryMetalHandlePropertiesEXT!
    #endif
    let vkConvertCooperativeVectorMatrixNV: PFN_vkConvertCooperativeVectorMatrixNV!
    let vkCmdConvertCooperativeVectorMatrixNV: PFN_vkCmdConvertCooperativeVectorMatrixNV!
    let vkCmdDispatchTileQCOM: PFN_vkCmdDispatchTileQCOM!
    let vkCmdBeginPerTileExecutionQCOM: PFN_vkCmdBeginPerTileExecutionQCOM!
    let vkCmdEndPerTileExecutionQCOM: PFN_vkCmdEndPerTileExecutionQCOM!
    let vkCreateExternalComputeQueueNV: PFN_vkCreateExternalComputeQueueNV!
    let vkDestroyExternalComputeQueueNV: PFN_vkDestroyExternalComputeQueueNV!
    let vkGetExternalComputeQueueDataNV: PFN_vkGetExternalComputeQueueDataNV!
    let vkCreateShaderInstrumentationARM: PFN_vkCreateShaderInstrumentationARM!
    let vkDestroyShaderInstrumentationARM: PFN_vkDestroyShaderInstrumentationARM!
    let vkCmdBeginShaderInstrumentationARM: PFN_vkCmdBeginShaderInstrumentationARM!
    let vkCmdEndShaderInstrumentationARM: PFN_vkCmdEndShaderInstrumentationARM!
    let vkGetShaderInstrumentationValuesARM: PFN_vkGetShaderInstrumentationValuesARM!
    let vkClearShaderInstrumentationMetricsARM: PFN_vkClearShaderInstrumentationMetricsARM!
    let vkCreateTensorARM: PFN_vkCreateTensorARM!
    let vkDestroyTensorARM: PFN_vkDestroyTensorARM!
    let vkCreateTensorViewARM: PFN_vkCreateTensorViewARM!
    let vkDestroyTensorViewARM: PFN_vkDestroyTensorViewARM!
    let vkGetTensorMemoryRequirementsARM: PFN_vkGetTensorMemoryRequirementsARM!
    let vkBindTensorMemoryARM: PFN_vkBindTensorMemoryARM!
    let vkGetDeviceTensorMemoryRequirementsARM: PFN_vkGetDeviceTensorMemoryRequirementsARM!
    let vkCmdCopyTensorARM: PFN_vkCmdCopyTensorARM!
    let vkGetTensorOpaqueCaptureDescriptorDataARM: PFN_vkGetTensorOpaqueCaptureDescriptorDataARM!
    let vkGetTensorViewOpaqueCaptureDescriptorDataARM: PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM!
    let vkCreateDataGraphPipelinesARM: PFN_vkCreateDataGraphPipelinesARM!
    let vkCreateDataGraphPipelineSessionARM: PFN_vkCreateDataGraphPipelineSessionARM!
    let vkGetDataGraphPipelineSessionBindPointRequirementsARM: PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM!
    let vkGetDataGraphPipelineSessionMemoryRequirementsARM: PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM!
    let vkBindDataGraphPipelineSessionMemoryARM: PFN_vkBindDataGraphPipelineSessionMemoryARM!
    let vkDestroyDataGraphPipelineSessionARM: PFN_vkDestroyDataGraphPipelineSessionARM!
    let vkCmdDispatchDataGraphARM: PFN_vkCmdDispatchDataGraphARM!
    let vkGetDataGraphPipelineAvailablePropertiesARM: PFN_vkGetDataGraphPipelineAvailablePropertiesARM!
    let vkGetDataGraphPipelinePropertiesARM: PFN_vkGetDataGraphPipelinePropertiesARM!
    #if VK_USE_PLATFORM_OHOS
    let vkGetNativeBufferPropertiesOHOS: PFN_vkGetNativeBufferPropertiesOHOS!
    #endif
    #if VK_USE_PLATFORM_OHOS
    let vkGetMemoryNativeBufferOHOS: PFN_vkGetMemoryNativeBufferOHOS!
    #endif
    let vkQueueSetPerfHintQCOM: PFN_vkQueueSetPerfHintQCOM!
    let vkCmdSetComputeOccupancyPriorityNV: PFN_vkCmdSetComputeOccupancyPriorityNV!
    let vkWriteSamplerDescriptorsEXT: PFN_vkWriteSamplerDescriptorsEXT!
    let vkWriteResourceDescriptorsEXT: PFN_vkWriteResourceDescriptorsEXT!
    let vkCmdBindSamplerHeapEXT: PFN_vkCmdBindSamplerHeapEXT!
    let vkCmdBindResourceHeapEXT: PFN_vkCmdBindResourceHeapEXT!
    let vkCmdPushDataEXT: PFN_vkCmdPushDataEXT!
    let vkRegisterCustomBorderColorEXT: PFN_vkRegisterCustomBorderColorEXT!
    let vkUnregisterCustomBorderColorEXT: PFN_vkUnregisterCustomBorderColorEXT!
    let vkGetImageOpaqueCaptureDataEXT: PFN_vkGetImageOpaqueCaptureDataEXT!
    let vkGetTensorOpaqueCaptureDataARM: PFN_vkGetTensorOpaqueCaptureDataARM!
    let vkCmdCopyMemoryKHR: PFN_vkCmdCopyMemoryKHR!
    let vkCmdCopyMemoryToImageKHR: PFN_vkCmdCopyMemoryToImageKHR!
    let vkCmdCopyImageToMemoryKHR: PFN_vkCmdCopyImageToMemoryKHR!
    let vkCmdUpdateMemoryKHR: PFN_vkCmdUpdateMemoryKHR!
    let vkCmdFillMemoryKHR: PFN_vkCmdFillMemoryKHR!
    let vkCmdCopyQueryPoolResultsToMemoryKHR: PFN_vkCmdCopyQueryPoolResultsToMemoryKHR!
    let vkCmdBeginConditionalRendering2EXT: PFN_vkCmdBeginConditionalRendering2EXT!
    let vkCmdBindTransformFeedbackBuffers2EXT: PFN_vkCmdBindTransformFeedbackBuffers2EXT!
    let vkCmdBeginTransformFeedback2EXT: PFN_vkCmdBeginTransformFeedback2EXT!
    let vkCmdEndTransformFeedback2EXT: PFN_vkCmdEndTransformFeedback2EXT!
    let vkCmdDrawIndirectByteCount2EXT: PFN_vkCmdDrawIndirectByteCount2EXT!
    let vkCmdWriteMarkerToMemoryAMD: PFN_vkCmdWriteMarkerToMemoryAMD!
    let vkCmdBindIndexBuffer3KHR: PFN_vkCmdBindIndexBuffer3KHR!
    let vkCmdBindVertexBuffers3KHR: PFN_vkCmdBindVertexBuffers3KHR!
    let vkCmdDrawIndirect2KHR: PFN_vkCmdDrawIndirect2KHR!
    let vkCmdDrawIndexedIndirect2KHR: PFN_vkCmdDrawIndexedIndirect2KHR!
    let vkCmdDrawIndirectCount2KHR: PFN_vkCmdDrawIndirectCount2KHR!
    let vkCmdDrawIndexedIndirectCount2KHR: PFN_vkCmdDrawIndexedIndirectCount2KHR!
    let vkCmdDrawMeshTasksIndirect2EXT: PFN_vkCmdDrawMeshTasksIndirect2EXT!
    let vkCmdDrawMeshTasksIndirectCount2EXT: PFN_vkCmdDrawMeshTasksIndirectCount2EXT!
    let vkCmdDispatchIndirect2KHR: PFN_vkCmdDispatchIndirect2KHR!
    let vkCreateAccelerationStructure2KHR: PFN_vkCreateAccelerationStructure2KHR!
    let vkCmdSetDispatchParametersARM: PFN_vkCmdSetDispatchParametersARM!

    init(vkGetDeviceProcAddr: PFN_vkGetDeviceProcAddr, device: VkDevice) {
        self.vkDestroyDevice = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyDevice"), to: PFN_vkDestroyDevice?.self)
        self.vkGetDeviceQueue = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceQueue"), to: PFN_vkGetDeviceQueue?.self)
        self.vkQueueSubmit = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueSubmit"), to: PFN_vkQueueSubmit?.self)
        self.vkQueueWaitIdle = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueWaitIdle"), to: PFN_vkQueueWaitIdle?.self)
        self.vkDeviceWaitIdle = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDeviceWaitIdle"), to: PFN_vkDeviceWaitIdle?.self)
        self.vkAllocateMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAllocateMemory"), to: PFN_vkAllocateMemory?.self)
        self.vkFreeMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkFreeMemory"), to: PFN_vkFreeMemory?.self)
        self.vkMapMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkMapMemory"), to: PFN_vkMapMemory?.self)
        self.vkUnmapMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUnmapMemory"), to: PFN_vkUnmapMemory?.self)
        self.vkFlushMappedMemoryRanges = unsafeBitCast(vkGetDeviceProcAddr(device, "vkFlushMappedMemoryRanges"), to: PFN_vkFlushMappedMemoryRanges?.self)
        self.vkInvalidateMappedMemoryRanges = unsafeBitCast(vkGetDeviceProcAddr(device, "vkInvalidateMappedMemoryRanges"), to: PFN_vkInvalidateMappedMemoryRanges?.self)
        self.vkGetDeviceMemoryCommitment = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceMemoryCommitment"), to: PFN_vkGetDeviceMemoryCommitment?.self)
        self.vkGetBufferMemoryRequirements = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetBufferMemoryRequirements"), to: PFN_vkGetBufferMemoryRequirements?.self)
        self.vkBindBufferMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindBufferMemory"), to: PFN_vkBindBufferMemory?.self)
        self.vkGetImageMemoryRequirements = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageMemoryRequirements"), to: PFN_vkGetImageMemoryRequirements?.self)
        self.vkBindImageMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindImageMemory"), to: PFN_vkBindImageMemory?.self)
        self.vkGetImageSparseMemoryRequirements = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageSparseMemoryRequirements"), to: PFN_vkGetImageSparseMemoryRequirements?.self)
        self.vkQueueBindSparse = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueBindSparse"), to: PFN_vkQueueBindSparse?.self)
        self.vkCreateFence = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateFence"), to: PFN_vkCreateFence?.self)
        self.vkDestroyFence = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyFence"), to: PFN_vkDestroyFence?.self)
        self.vkResetFences = unsafeBitCast(vkGetDeviceProcAddr(device, "vkResetFences"), to: PFN_vkResetFences?.self)
        self.vkGetFenceStatus = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetFenceStatus"), to: PFN_vkGetFenceStatus?.self)
        self.vkWaitForFences = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWaitForFences"), to: PFN_vkWaitForFences?.self)
        self.vkCreateSemaphore = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateSemaphore"), to: PFN_vkCreateSemaphore?.self)
        self.vkDestroySemaphore = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroySemaphore"), to: PFN_vkDestroySemaphore?.self)
        self.vkCreateEvent = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateEvent"), to: PFN_vkCreateEvent?.self)
        self.vkDestroyEvent = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyEvent"), to: PFN_vkDestroyEvent?.self)
        self.vkGetEventStatus = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetEventStatus"), to: PFN_vkGetEventStatus?.self)
        self.vkSetEvent = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetEvent"), to: PFN_vkSetEvent?.self)
        self.vkResetEvent = unsafeBitCast(vkGetDeviceProcAddr(device, "vkResetEvent"), to: PFN_vkResetEvent?.self)
        self.vkCreateQueryPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateQueryPool"), to: PFN_vkCreateQueryPool?.self)
        self.vkDestroyQueryPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyQueryPool"), to: PFN_vkDestroyQueryPool?.self)
        self.vkGetQueryPoolResults = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetQueryPoolResults"), to: PFN_vkGetQueryPoolResults?.self)
        self.vkResetQueryPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkResetQueryPool"), to: PFN_vkResetQueryPool?.self)
        self.vkCreateBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateBuffer"), to: PFN_vkCreateBuffer?.self)
        self.vkDestroyBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyBuffer"), to: PFN_vkDestroyBuffer?.self)
        self.vkCreateBufferView = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateBufferView"), to: PFN_vkCreateBufferView?.self)
        self.vkDestroyBufferView = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyBufferView"), to: PFN_vkDestroyBufferView?.self)
        self.vkCreateImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateImage"), to: PFN_vkCreateImage?.self)
        self.vkDestroyImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyImage"), to: PFN_vkDestroyImage?.self)
        self.vkGetImageSubresourceLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageSubresourceLayout"), to: PFN_vkGetImageSubresourceLayout?.self)
        self.vkCreateImageView = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateImageView"), to: PFN_vkCreateImageView?.self)
        self.vkDestroyImageView = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyImageView"), to: PFN_vkDestroyImageView?.self)
        self.vkCreateShaderModule = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateShaderModule"), to: PFN_vkCreateShaderModule?.self)
        self.vkDestroyShaderModule = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyShaderModule"), to: PFN_vkDestroyShaderModule?.self)
        self.vkCreatePipelineCache = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreatePipelineCache"), to: PFN_vkCreatePipelineCache?.self)
        self.vkDestroyPipelineCache = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyPipelineCache"), to: PFN_vkDestroyPipelineCache?.self)
        self.vkGetPipelineCacheData = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineCacheData"), to: PFN_vkGetPipelineCacheData?.self)
        self.vkMergePipelineCaches = unsafeBitCast(vkGetDeviceProcAddr(device, "vkMergePipelineCaches"), to: PFN_vkMergePipelineCaches?.self)
        self.vkCreatePipelineBinariesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreatePipelineBinariesKHR"), to: PFN_vkCreatePipelineBinariesKHR?.self)
        self.vkDestroyPipelineBinaryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyPipelineBinaryKHR"), to: PFN_vkDestroyPipelineBinaryKHR?.self)
        self.vkGetPipelineKeyKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineKeyKHR"), to: PFN_vkGetPipelineKeyKHR?.self)
        self.vkGetPipelineBinaryDataKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineBinaryDataKHR"), to: PFN_vkGetPipelineBinaryDataKHR?.self)
        self.vkReleaseCapturedPipelineDataKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkReleaseCapturedPipelineDataKHR"), to: PFN_vkReleaseCapturedPipelineDataKHR?.self)
        self.vkCreateGraphicsPipelines = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateGraphicsPipelines"), to: PFN_vkCreateGraphicsPipelines?.self)
        self.vkCreateComputePipelines = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateComputePipelines"), to: PFN_vkCreateComputePipelines?.self)
        self.vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI"), to: PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI?.self)
        self.vkDestroyPipeline = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyPipeline"), to: PFN_vkDestroyPipeline?.self)
        self.vkCreatePipelineLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreatePipelineLayout"), to: PFN_vkCreatePipelineLayout?.self)
        self.vkDestroyPipelineLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyPipelineLayout"), to: PFN_vkDestroyPipelineLayout?.self)
        self.vkCreateSampler = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateSampler"), to: PFN_vkCreateSampler?.self)
        self.vkDestroySampler = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroySampler"), to: PFN_vkDestroySampler?.self)
        self.vkCreateDescriptorSetLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateDescriptorSetLayout"), to: PFN_vkCreateDescriptorSetLayout?.self)
        self.vkDestroyDescriptorSetLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyDescriptorSetLayout"), to: PFN_vkDestroyDescriptorSetLayout?.self)
        self.vkCreateDescriptorPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateDescriptorPool"), to: PFN_vkCreateDescriptorPool?.self)
        self.vkDestroyDescriptorPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyDescriptorPool"), to: PFN_vkDestroyDescriptorPool?.self)
        self.vkResetDescriptorPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkResetDescriptorPool"), to: PFN_vkResetDescriptorPool?.self)
        self.vkAllocateDescriptorSets = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAllocateDescriptorSets"), to: PFN_vkAllocateDescriptorSets?.self)
        self.vkFreeDescriptorSets = unsafeBitCast(vkGetDeviceProcAddr(device, "vkFreeDescriptorSets"), to: PFN_vkFreeDescriptorSets?.self)
        self.vkUpdateDescriptorSets = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUpdateDescriptorSets"), to: PFN_vkUpdateDescriptorSets?.self)
        self.vkCreateFramebuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateFramebuffer"), to: PFN_vkCreateFramebuffer?.self)
        self.vkDestroyFramebuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyFramebuffer"), to: PFN_vkDestroyFramebuffer?.self)
        self.vkCreateRenderPass = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateRenderPass"), to: PFN_vkCreateRenderPass?.self)
        self.vkDestroyRenderPass = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyRenderPass"), to: PFN_vkDestroyRenderPass?.self)
        self.vkGetRenderAreaGranularity = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetRenderAreaGranularity"), to: PFN_vkGetRenderAreaGranularity?.self)
        self.vkGetRenderingAreaGranularity = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetRenderingAreaGranularity"), to: PFN_vkGetRenderingAreaGranularity?.self)
        self.vkCreateCommandPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateCommandPool"), to: PFN_vkCreateCommandPool?.self)
        self.vkDestroyCommandPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyCommandPool"), to: PFN_vkDestroyCommandPool?.self)
        self.vkResetCommandPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkResetCommandPool"), to: PFN_vkResetCommandPool?.self)
        self.vkAllocateCommandBuffers = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAllocateCommandBuffers"), to: PFN_vkAllocateCommandBuffers?.self)
        self.vkFreeCommandBuffers = unsafeBitCast(vkGetDeviceProcAddr(device, "vkFreeCommandBuffers"), to: PFN_vkFreeCommandBuffers?.self)
        self.vkBeginCommandBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBeginCommandBuffer"), to: PFN_vkBeginCommandBuffer?.self)
        self.vkEndCommandBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkEndCommandBuffer"), to: PFN_vkEndCommandBuffer?.self)
        self.vkResetCommandBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkResetCommandBuffer"), to: PFN_vkResetCommandBuffer?.self)
        self.vkCmdBindPipeline = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindPipeline"), to: PFN_vkCmdBindPipeline?.self)
        self.vkCmdSetPrimitiveRestartIndexEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPrimitiveRestartIndexEXT"), to: PFN_vkCmdSetPrimitiveRestartIndexEXT?.self)
        self.vkCmdSetAttachmentFeedbackLoopEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetAttachmentFeedbackLoopEnableEXT"), to: PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT?.self)
        self.vkCmdSetViewport = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetViewport"), to: PFN_vkCmdSetViewport?.self)
        self.vkCmdSetScissor = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetScissor"), to: PFN_vkCmdSetScissor?.self)
        self.vkCmdSetLineWidth = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetLineWidth"), to: PFN_vkCmdSetLineWidth?.self)
        self.vkCmdSetDepthBias = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthBias"), to: PFN_vkCmdSetDepthBias?.self)
        self.vkCmdSetBlendConstants = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetBlendConstants"), to: PFN_vkCmdSetBlendConstants?.self)
        self.vkCmdSetDepthBounds = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthBounds"), to: PFN_vkCmdSetDepthBounds?.self)
        self.vkCmdSetStencilCompareMask = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetStencilCompareMask"), to: PFN_vkCmdSetStencilCompareMask?.self)
        self.vkCmdSetStencilWriteMask = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetStencilWriteMask"), to: PFN_vkCmdSetStencilWriteMask?.self)
        self.vkCmdSetStencilReference = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetStencilReference"), to: PFN_vkCmdSetStencilReference?.self)
        self.vkCmdBindDescriptorSets = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindDescriptorSets"), to: PFN_vkCmdBindDescriptorSets?.self)
        self.vkCmdBindIndexBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindIndexBuffer"), to: PFN_vkCmdBindIndexBuffer?.self)
        self.vkCmdBindVertexBuffers = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindVertexBuffers"), to: PFN_vkCmdBindVertexBuffers?.self)
        self.vkCmdDraw = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDraw"), to: PFN_vkCmdDraw?.self)
        self.vkCmdDrawIndexed = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndexed"), to: PFN_vkCmdDrawIndexed?.self)
        self.vkCmdDrawMultiEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMultiEXT"), to: PFN_vkCmdDrawMultiEXT?.self)
        self.vkCmdDrawMultiIndexedEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMultiIndexedEXT"), to: PFN_vkCmdDrawMultiIndexedEXT?.self)
        self.vkCmdDrawIndirect = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndirect"), to: PFN_vkCmdDrawIndirect?.self)
        self.vkCmdDrawIndexedIndirect = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndexedIndirect"), to: PFN_vkCmdDrawIndexedIndirect?.self)
        self.vkCmdDispatch = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatch"), to: PFN_vkCmdDispatch?.self)
        self.vkCmdDispatchIndirect = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchIndirect"), to: PFN_vkCmdDispatchIndirect?.self)
        self.vkCmdSubpassShadingHUAWEI = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSubpassShadingHUAWEI"), to: PFN_vkCmdSubpassShadingHUAWEI?.self)
        self.vkCmdDrawClusterHUAWEI = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawClusterHUAWEI"), to: PFN_vkCmdDrawClusterHUAWEI?.self)
        self.vkCmdDrawClusterIndirectHUAWEI = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawClusterIndirectHUAWEI"), to: PFN_vkCmdDrawClusterIndirectHUAWEI?.self)
        self.vkCmdUpdatePipelineIndirectBufferNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdUpdatePipelineIndirectBufferNV"), to: PFN_vkCmdUpdatePipelineIndirectBufferNV?.self)
        self.vkCmdCopyBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyBuffer"), to: PFN_vkCmdCopyBuffer?.self)
        self.vkCmdCopyImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyImage"), to: PFN_vkCmdCopyImage?.self)
        self.vkCmdBlitImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBlitImage"), to: PFN_vkCmdBlitImage?.self)
        self.vkCmdCopyBufferToImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyBufferToImage"), to: PFN_vkCmdCopyBufferToImage?.self)
        self.vkCmdCopyImageToBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyImageToBuffer"), to: PFN_vkCmdCopyImageToBuffer?.self)
        self.vkCmdCopyMemoryIndirectNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryIndirectNV"), to: PFN_vkCmdCopyMemoryIndirectNV?.self)
        self.vkCmdCopyMemoryIndirectKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryIndirectKHR"), to: PFN_vkCmdCopyMemoryIndirectKHR?.self)
        self.vkCmdCopyMemoryToImageIndirectNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryToImageIndirectNV"), to: PFN_vkCmdCopyMemoryToImageIndirectNV?.self)
        self.vkCmdCopyMemoryToImageIndirectKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryToImageIndirectKHR"), to: PFN_vkCmdCopyMemoryToImageIndirectKHR?.self)
        self.vkCmdUpdateBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdUpdateBuffer"), to: PFN_vkCmdUpdateBuffer?.self)
        self.vkCmdFillBuffer = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdFillBuffer"), to: PFN_vkCmdFillBuffer?.self)
        self.vkCmdClearColorImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdClearColorImage"), to: PFN_vkCmdClearColorImage?.self)
        self.vkCmdClearDepthStencilImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdClearDepthStencilImage"), to: PFN_vkCmdClearDepthStencilImage?.self)
        self.vkCmdClearAttachments = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdClearAttachments"), to: PFN_vkCmdClearAttachments?.self)
        self.vkCmdResolveImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdResolveImage"), to: PFN_vkCmdResolveImage?.self)
        self.vkCmdSetEvent = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetEvent"), to: PFN_vkCmdSetEvent?.self)
        self.vkCmdResetEvent = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdResetEvent"), to: PFN_vkCmdResetEvent?.self)
        self.vkCmdWaitEvents = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWaitEvents"), to: PFN_vkCmdWaitEvents?.self)
        self.vkCmdPipelineBarrier = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPipelineBarrier"), to: PFN_vkCmdPipelineBarrier?.self)
        self.vkCmdBeginQuery = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginQuery"), to: PFN_vkCmdBeginQuery?.self)
        self.vkCmdEndQuery = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndQuery"), to: PFN_vkCmdEndQuery?.self)
        self.vkCmdBeginConditionalRenderingEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginConditionalRenderingEXT"), to: PFN_vkCmdBeginConditionalRenderingEXT?.self)
        self.vkCmdEndConditionalRenderingEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndConditionalRenderingEXT"), to: PFN_vkCmdEndConditionalRenderingEXT?.self)
        self.vkCmdBeginCustomResolveEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginCustomResolveEXT"), to: PFN_vkCmdBeginCustomResolveEXT?.self)
        self.vkCmdResetQueryPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdResetQueryPool"), to: PFN_vkCmdResetQueryPool?.self)
        self.vkCmdWriteTimestamp = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteTimestamp"), to: PFN_vkCmdWriteTimestamp?.self)
        self.vkCmdCopyQueryPoolResults = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyQueryPoolResults"), to: PFN_vkCmdCopyQueryPoolResults?.self)
        self.vkCmdPushConstants = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushConstants"), to: PFN_vkCmdPushConstants?.self)
        self.vkCmdBeginRenderPass = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginRenderPass"), to: PFN_vkCmdBeginRenderPass?.self)
        self.vkCmdNextSubpass = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdNextSubpass"), to: PFN_vkCmdNextSubpass?.self)
        self.vkCmdEndRenderPass = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndRenderPass"), to: PFN_vkCmdEndRenderPass?.self)
        self.vkCmdExecuteCommands = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdExecuteCommands"), to: PFN_vkCmdExecuteCommands?.self)
        self.vkCreateSharedSwapchainsKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateSharedSwapchainsKHR"), to: PFN_vkCreateSharedSwapchainsKHR?.self)
        self.vkCreateSwapchainKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateSwapchainKHR"), to: PFN_vkCreateSwapchainKHR?.self)
        self.vkDestroySwapchainKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroySwapchainKHR"), to: PFN_vkDestroySwapchainKHR?.self)
        self.vkGetSwapchainImagesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSwapchainImagesKHR"), to: PFN_vkGetSwapchainImagesKHR?.self)
        self.vkAcquireNextImageKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAcquireNextImageKHR"), to: PFN_vkAcquireNextImageKHR?.self)
        self.vkQueuePresentKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueuePresentKHR"), to: PFN_vkQueuePresentKHR?.self)
        self.vkDebugMarkerSetObjectNameEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDebugMarkerSetObjectNameEXT"), to: PFN_vkDebugMarkerSetObjectNameEXT?.self)
        self.vkDebugMarkerSetObjectTagEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDebugMarkerSetObjectTagEXT"), to: PFN_vkDebugMarkerSetObjectTagEXT?.self)
        self.vkCmdDebugMarkerBeginEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDebugMarkerBeginEXT"), to: PFN_vkCmdDebugMarkerBeginEXT?.self)
        self.vkCmdDebugMarkerEndEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDebugMarkerEndEXT"), to: PFN_vkCmdDebugMarkerEndEXT?.self)
        self.vkCmdDebugMarkerInsertEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDebugMarkerInsertEXT"), to: PFN_vkCmdDebugMarkerInsertEXT?.self)
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetMemoryWin32HandleNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryWin32HandleNV"), to: PFN_vkGetMemoryWin32HandleNV?.self)
        #endif
        self.vkCmdExecuteGeneratedCommandsNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdExecuteGeneratedCommandsNV"), to: PFN_vkCmdExecuteGeneratedCommandsNV?.self)
        self.vkCmdPreprocessGeneratedCommandsNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPreprocessGeneratedCommandsNV"), to: PFN_vkCmdPreprocessGeneratedCommandsNV?.self)
        self.vkCmdBindPipelineShaderGroupNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindPipelineShaderGroupNV"), to: PFN_vkCmdBindPipelineShaderGroupNV?.self)
        self.vkGetGeneratedCommandsMemoryRequirementsNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetGeneratedCommandsMemoryRequirementsNV"), to: PFN_vkGetGeneratedCommandsMemoryRequirementsNV?.self)
        self.vkCreateIndirectCommandsLayoutNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateIndirectCommandsLayoutNV"), to: PFN_vkCreateIndirectCommandsLayoutNV?.self)
        self.vkDestroyIndirectCommandsLayoutNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyIndirectCommandsLayoutNV"), to: PFN_vkDestroyIndirectCommandsLayoutNV?.self)
        self.vkCmdExecuteGeneratedCommandsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdExecuteGeneratedCommandsEXT"), to: PFN_vkCmdExecuteGeneratedCommandsEXT?.self)
        self.vkCmdPreprocessGeneratedCommandsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPreprocessGeneratedCommandsEXT"), to: PFN_vkCmdPreprocessGeneratedCommandsEXT?.self)
        self.vkGetGeneratedCommandsMemoryRequirementsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetGeneratedCommandsMemoryRequirementsEXT"), to: PFN_vkGetGeneratedCommandsMemoryRequirementsEXT?.self)
        self.vkCreateIndirectCommandsLayoutEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateIndirectCommandsLayoutEXT"), to: PFN_vkCreateIndirectCommandsLayoutEXT?.self)
        self.vkDestroyIndirectCommandsLayoutEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyIndirectCommandsLayoutEXT"), to: PFN_vkDestroyIndirectCommandsLayoutEXT?.self)
        self.vkCreateIndirectExecutionSetEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateIndirectExecutionSetEXT"), to: PFN_vkCreateIndirectExecutionSetEXT?.self)
        self.vkDestroyIndirectExecutionSetEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyIndirectExecutionSetEXT"), to: PFN_vkDestroyIndirectExecutionSetEXT?.self)
        self.vkUpdateIndirectExecutionSetPipelineEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUpdateIndirectExecutionSetPipelineEXT"), to: PFN_vkUpdateIndirectExecutionSetPipelineEXT?.self)
        self.vkUpdateIndirectExecutionSetShaderEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUpdateIndirectExecutionSetShaderEXT"), to: PFN_vkUpdateIndirectExecutionSetShaderEXT?.self)
        self.vkCmdPushDescriptorSet = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushDescriptorSet"), to: PFN_vkCmdPushDescriptorSet?.self)
        self.vkTrimCommandPool = unsafeBitCast(vkGetDeviceProcAddr(device, "vkTrimCommandPool"), to: PFN_vkTrimCommandPool?.self)
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetMemoryWin32HandleKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryWin32HandleKHR"), to: PFN_vkGetMemoryWin32HandleKHR?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetMemoryWin32HandlePropertiesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryWin32HandlePropertiesKHR"), to: PFN_vkGetMemoryWin32HandlePropertiesKHR?.self)
        #endif
        self.vkGetMemoryFdKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryFdKHR"), to: PFN_vkGetMemoryFdKHR?.self)
        self.vkGetMemoryFdPropertiesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryFdPropertiesKHR"), to: PFN_vkGetMemoryFdPropertiesKHR?.self)
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkGetMemoryZirconHandleFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryZirconHandleFUCHSIA"), to: PFN_vkGetMemoryZirconHandleFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkGetMemoryZirconHandlePropertiesFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryZirconHandlePropertiesFUCHSIA"), to: PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA?.self)
        #endif
        self.vkGetMemoryRemoteAddressNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryRemoteAddressNV"), to: PFN_vkGetMemoryRemoteAddressNV?.self)
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetSemaphoreWin32HandleKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSemaphoreWin32HandleKHR"), to: PFN_vkGetSemaphoreWin32HandleKHR?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkImportSemaphoreWin32HandleKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkImportSemaphoreWin32HandleKHR"), to: PFN_vkImportSemaphoreWin32HandleKHR?.self)
        #endif
        self.vkGetSemaphoreFdKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSemaphoreFdKHR"), to: PFN_vkGetSemaphoreFdKHR?.self)
        self.vkImportSemaphoreFdKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkImportSemaphoreFdKHR"), to: PFN_vkImportSemaphoreFdKHR?.self)
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkGetSemaphoreZirconHandleFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSemaphoreZirconHandleFUCHSIA"), to: PFN_vkGetSemaphoreZirconHandleFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkImportSemaphoreZirconHandleFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkImportSemaphoreZirconHandleFUCHSIA"), to: PFN_vkImportSemaphoreZirconHandleFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetFenceWin32HandleKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetFenceWin32HandleKHR"), to: PFN_vkGetFenceWin32HandleKHR?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkImportFenceWin32HandleKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkImportFenceWin32HandleKHR"), to: PFN_vkImportFenceWin32HandleKHR?.self)
        #endif
        self.vkGetFenceFdKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetFenceFdKHR"), to: PFN_vkGetFenceFdKHR?.self)
        self.vkImportFenceFdKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkImportFenceFdKHR"), to: PFN_vkImportFenceFdKHR?.self)
        self.vkDisplayPowerControlEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDisplayPowerControlEXT"), to: PFN_vkDisplayPowerControlEXT?.self)
        self.vkRegisterDeviceEventEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkRegisterDeviceEventEXT"), to: PFN_vkRegisterDeviceEventEXT?.self)
        self.vkRegisterDisplayEventEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkRegisterDisplayEventEXT"), to: PFN_vkRegisterDisplayEventEXT?.self)
        self.vkGetSwapchainCounterEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSwapchainCounterEXT"), to: PFN_vkGetSwapchainCounterEXT?.self)
        self.vkGetDeviceGroupPeerMemoryFeatures = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceGroupPeerMemoryFeatures"), to: PFN_vkGetDeviceGroupPeerMemoryFeatures?.self)
        self.vkBindBufferMemory2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindBufferMemory2"), to: PFN_vkBindBufferMemory2?.self)
        self.vkBindImageMemory2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindImageMemory2"), to: PFN_vkBindImageMemory2?.self)
        self.vkCmdSetDeviceMask = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDeviceMask"), to: PFN_vkCmdSetDeviceMask?.self)
        self.vkGetDeviceGroupPresentCapabilitiesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceGroupPresentCapabilitiesKHR"), to: PFN_vkGetDeviceGroupPresentCapabilitiesKHR?.self)
        self.vkGetDeviceGroupSurfacePresentModesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceGroupSurfacePresentModesKHR"), to: PFN_vkGetDeviceGroupSurfacePresentModesKHR?.self)
        self.vkAcquireNextImage2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAcquireNextImage2KHR"), to: PFN_vkAcquireNextImage2KHR?.self)
        self.vkCmdDispatchBase = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchBase"), to: PFN_vkCmdDispatchBase?.self)
        self.vkCreateDescriptorUpdateTemplate = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateDescriptorUpdateTemplate"), to: PFN_vkCreateDescriptorUpdateTemplate?.self)
        self.vkDestroyDescriptorUpdateTemplate = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyDescriptorUpdateTemplate"), to: PFN_vkDestroyDescriptorUpdateTemplate?.self)
        self.vkUpdateDescriptorSetWithTemplate = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUpdateDescriptorSetWithTemplate"), to: PFN_vkUpdateDescriptorSetWithTemplate?.self)
        self.vkCmdPushDescriptorSetWithTemplate = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushDescriptorSetWithTemplate"), to: PFN_vkCmdPushDescriptorSetWithTemplate?.self)
        self.vkSetHdrMetadataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetHdrMetadataEXT"), to: PFN_vkSetHdrMetadataEXT?.self)
        self.vkGetSwapchainStatusKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSwapchainStatusKHR"), to: PFN_vkGetSwapchainStatusKHR?.self)
        self.vkGetRefreshCycleDurationGOOGLE = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetRefreshCycleDurationGOOGLE"), to: PFN_vkGetRefreshCycleDurationGOOGLE?.self)
        self.vkGetPastPresentationTimingGOOGLE = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPastPresentationTimingGOOGLE"), to: PFN_vkGetPastPresentationTimingGOOGLE?.self)
        self.vkCmdSetViewportWScalingNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetViewportWScalingNV"), to: PFN_vkCmdSetViewportWScalingNV?.self)
        self.vkCmdSetDiscardRectangleEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDiscardRectangleEXT"), to: PFN_vkCmdSetDiscardRectangleEXT?.self)
        self.vkCmdSetDiscardRectangleEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDiscardRectangleEnableEXT"), to: PFN_vkCmdSetDiscardRectangleEnableEXT?.self)
        self.vkCmdSetDiscardRectangleModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDiscardRectangleModeEXT"), to: PFN_vkCmdSetDiscardRectangleModeEXT?.self)
        self.vkCmdSetSampleLocationsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetSampleLocationsEXT"), to: PFN_vkCmdSetSampleLocationsEXT?.self)
        self.vkGetBufferMemoryRequirements2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetBufferMemoryRequirements2"), to: PFN_vkGetBufferMemoryRequirements2?.self)
        self.vkGetImageMemoryRequirements2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageMemoryRequirements2"), to: PFN_vkGetImageMemoryRequirements2?.self)
        self.vkGetImageSparseMemoryRequirements2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageSparseMemoryRequirements2"), to: PFN_vkGetImageSparseMemoryRequirements2?.self)
        self.vkGetDeviceBufferMemoryRequirements = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceBufferMemoryRequirements"), to: PFN_vkGetDeviceBufferMemoryRequirements?.self)
        self.vkGetDeviceImageMemoryRequirements = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceImageMemoryRequirements"), to: PFN_vkGetDeviceImageMemoryRequirements?.self)
        self.vkGetDeviceImageSparseMemoryRequirements = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceImageSparseMemoryRequirements"), to: PFN_vkGetDeviceImageSparseMemoryRequirements?.self)
        self.vkCreateSamplerYcbcrConversion = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateSamplerYcbcrConversion"), to: PFN_vkCreateSamplerYcbcrConversion?.self)
        self.vkDestroySamplerYcbcrConversion = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroySamplerYcbcrConversion"), to: PFN_vkDestroySamplerYcbcrConversion?.self)
        self.vkGetDeviceQueue2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceQueue2"), to: PFN_vkGetDeviceQueue2?.self)
        self.vkCreateValidationCacheEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateValidationCacheEXT"), to: PFN_vkCreateValidationCacheEXT?.self)
        self.vkDestroyValidationCacheEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyValidationCacheEXT"), to: PFN_vkDestroyValidationCacheEXT?.self)
        self.vkGetValidationCacheDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetValidationCacheDataEXT"), to: PFN_vkGetValidationCacheDataEXT?.self)
        self.vkMergeValidationCachesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkMergeValidationCachesEXT"), to: PFN_vkMergeValidationCachesEXT?.self)
        self.vkGetDescriptorSetLayoutSupport = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDescriptorSetLayoutSupport"), to: PFN_vkGetDescriptorSetLayoutSupport?.self)
        self.vkGetShaderInfoAMD = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetShaderInfoAMD"), to: PFN_vkGetShaderInfoAMD?.self)
        self.vkSetLocalDimmingAMD = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetLocalDimmingAMD"), to: PFN_vkSetLocalDimmingAMD?.self)
        self.vkGetCalibratedTimestampsKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetCalibratedTimestampsKHR"), to: PFN_vkGetCalibratedTimestampsKHR?.self)
        self.vkSetDebugUtilsObjectNameEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetDebugUtilsObjectNameEXT"), to: PFN_vkSetDebugUtilsObjectNameEXT?.self)
        self.vkSetDebugUtilsObjectTagEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetDebugUtilsObjectTagEXT"), to: PFN_vkSetDebugUtilsObjectTagEXT?.self)
        self.vkQueueBeginDebugUtilsLabelEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueBeginDebugUtilsLabelEXT"), to: PFN_vkQueueBeginDebugUtilsLabelEXT?.self)
        self.vkQueueEndDebugUtilsLabelEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueEndDebugUtilsLabelEXT"), to: PFN_vkQueueEndDebugUtilsLabelEXT?.self)
        self.vkQueueInsertDebugUtilsLabelEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueInsertDebugUtilsLabelEXT"), to: PFN_vkQueueInsertDebugUtilsLabelEXT?.self)
        self.vkCmdBeginDebugUtilsLabelEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginDebugUtilsLabelEXT"), to: PFN_vkCmdBeginDebugUtilsLabelEXT?.self)
        self.vkCmdEndDebugUtilsLabelEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndDebugUtilsLabelEXT"), to: PFN_vkCmdEndDebugUtilsLabelEXT?.self)
        self.vkCmdInsertDebugUtilsLabelEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdInsertDebugUtilsLabelEXT"), to: PFN_vkCmdInsertDebugUtilsLabelEXT?.self)
        self.vkGetMemoryHostPointerPropertiesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryHostPointerPropertiesEXT"), to: PFN_vkGetMemoryHostPointerPropertiesEXT?.self)
        self.vkCmdWriteBufferMarkerAMD = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteBufferMarkerAMD"), to: PFN_vkCmdWriteBufferMarkerAMD?.self)
        self.vkCreateRenderPass2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateRenderPass2"), to: PFN_vkCreateRenderPass2?.self)
        self.vkCmdBeginRenderPass2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginRenderPass2"), to: PFN_vkCmdBeginRenderPass2?.self)
        self.vkCmdNextSubpass2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdNextSubpass2"), to: PFN_vkCmdNextSubpass2?.self)
        self.vkCmdEndRenderPass2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndRenderPass2"), to: PFN_vkCmdEndRenderPass2?.self)
        self.vkGetSemaphoreCounterValue = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSemaphoreCounterValue"), to: PFN_vkGetSemaphoreCounterValue?.self)
        self.vkWaitSemaphores = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWaitSemaphores"), to: PFN_vkWaitSemaphores?.self)
        self.vkSignalSemaphore = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSignalSemaphore"), to: PFN_vkSignalSemaphore?.self)
        #if VK_USE_PLATFORM_ANDROID_KHR
        self.vkGetAndroidHardwareBufferPropertiesANDROID = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetAndroidHardwareBufferPropertiesANDROID"), to: PFN_vkGetAndroidHardwareBufferPropertiesANDROID?.self)
        #endif
        #if VK_USE_PLATFORM_ANDROID_KHR
        self.vkGetMemoryAndroidHardwareBufferANDROID = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryAndroidHardwareBufferANDROID"), to: PFN_vkGetMemoryAndroidHardwareBufferANDROID?.self)
        #endif
        self.vkCmdDrawIndirectCount = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndirectCount"), to: PFN_vkCmdDrawIndirectCount?.self)
        self.vkCmdDrawIndexedIndirectCount = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndexedIndirectCount"), to: PFN_vkCmdDrawIndexedIndirectCount?.self)
        self.vkCmdSetCheckpointNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCheckpointNV"), to: PFN_vkCmdSetCheckpointNV?.self)
        self.vkGetQueueCheckpointDataNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetQueueCheckpointDataNV"), to: PFN_vkGetQueueCheckpointDataNV?.self)
        self.vkCmdBindTransformFeedbackBuffersEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindTransformFeedbackBuffersEXT"), to: PFN_vkCmdBindTransformFeedbackBuffersEXT?.self)
        self.vkCmdBeginTransformFeedbackEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginTransformFeedbackEXT"), to: PFN_vkCmdBeginTransformFeedbackEXT?.self)
        self.vkCmdEndTransformFeedbackEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndTransformFeedbackEXT"), to: PFN_vkCmdEndTransformFeedbackEXT?.self)
        self.vkCmdBeginQueryIndexedEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginQueryIndexedEXT"), to: PFN_vkCmdBeginQueryIndexedEXT?.self)
        self.vkCmdEndQueryIndexedEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndQueryIndexedEXT"), to: PFN_vkCmdEndQueryIndexedEXT?.self)
        self.vkCmdDrawIndirectByteCountEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndirectByteCountEXT"), to: PFN_vkCmdDrawIndirectByteCountEXT?.self)
        self.vkCmdSetExclusiveScissorNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetExclusiveScissorNV"), to: PFN_vkCmdSetExclusiveScissorNV?.self)
        self.vkCmdSetExclusiveScissorEnableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetExclusiveScissorEnableNV"), to: PFN_vkCmdSetExclusiveScissorEnableNV?.self)
        self.vkCmdBindShadingRateImageNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindShadingRateImageNV"), to: PFN_vkCmdBindShadingRateImageNV?.self)
        self.vkCmdSetViewportShadingRatePaletteNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetViewportShadingRatePaletteNV"), to: PFN_vkCmdSetViewportShadingRatePaletteNV?.self)
        self.vkCmdSetCoarseSampleOrderNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoarseSampleOrderNV"), to: PFN_vkCmdSetCoarseSampleOrderNV?.self)
        self.vkCmdDrawMeshTasksNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksNV"), to: PFN_vkCmdDrawMeshTasksNV?.self)
        self.vkCmdDrawMeshTasksIndirectNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksIndirectNV"), to: PFN_vkCmdDrawMeshTasksIndirectNV?.self)
        self.vkCmdDrawMeshTasksIndirectCountNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksIndirectCountNV"), to: PFN_vkCmdDrawMeshTasksIndirectCountNV?.self)
        self.vkCmdDrawMeshTasksEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksEXT"), to: PFN_vkCmdDrawMeshTasksEXT?.self)
        self.vkCmdDrawMeshTasksIndirectEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksIndirectEXT"), to: PFN_vkCmdDrawMeshTasksIndirectEXT?.self)
        self.vkCmdDrawMeshTasksIndirectCountEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksIndirectCountEXT"), to: PFN_vkCmdDrawMeshTasksIndirectCountEXT?.self)
        self.vkCompileDeferredNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCompileDeferredNV"), to: PFN_vkCompileDeferredNV?.self)
        self.vkCreateAccelerationStructureNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateAccelerationStructureNV"), to: PFN_vkCreateAccelerationStructureNV?.self)
        self.vkCmdBindInvocationMaskHUAWEI = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindInvocationMaskHUAWEI"), to: PFN_vkCmdBindInvocationMaskHUAWEI?.self)
        self.vkDestroyAccelerationStructureKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyAccelerationStructureKHR"), to: PFN_vkDestroyAccelerationStructureKHR?.self)
        self.vkDestroyAccelerationStructureNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyAccelerationStructureNV"), to: PFN_vkDestroyAccelerationStructureNV?.self)
        self.vkGetAccelerationStructureMemoryRequirementsNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetAccelerationStructureMemoryRequirementsNV"), to: PFN_vkGetAccelerationStructureMemoryRequirementsNV?.self)
        self.vkBindAccelerationStructureMemoryNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindAccelerationStructureMemoryNV"), to: PFN_vkBindAccelerationStructureMemoryNV?.self)
        self.vkCmdCopyAccelerationStructureNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyAccelerationStructureNV"), to: PFN_vkCmdCopyAccelerationStructureNV?.self)
        self.vkCmdCopyAccelerationStructureKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyAccelerationStructureKHR"), to: PFN_vkCmdCopyAccelerationStructureKHR?.self)
        self.vkCopyAccelerationStructureKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCopyAccelerationStructureKHR"), to: PFN_vkCopyAccelerationStructureKHR?.self)
        self.vkCmdCopyAccelerationStructureToMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyAccelerationStructureToMemoryKHR"), to: PFN_vkCmdCopyAccelerationStructureToMemoryKHR?.self)
        self.vkCopyAccelerationStructureToMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCopyAccelerationStructureToMemoryKHR"), to: PFN_vkCopyAccelerationStructureToMemoryKHR?.self)
        self.vkCmdCopyMemoryToAccelerationStructureKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryToAccelerationStructureKHR"), to: PFN_vkCmdCopyMemoryToAccelerationStructureKHR?.self)
        self.vkCopyMemoryToAccelerationStructureKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCopyMemoryToAccelerationStructureKHR"), to: PFN_vkCopyMemoryToAccelerationStructureKHR?.self)
        self.vkCmdWriteAccelerationStructuresPropertiesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteAccelerationStructuresPropertiesKHR"), to: PFN_vkCmdWriteAccelerationStructuresPropertiesKHR?.self)
        self.vkCmdWriteAccelerationStructuresPropertiesNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteAccelerationStructuresPropertiesNV"), to: PFN_vkCmdWriteAccelerationStructuresPropertiesNV?.self)
        self.vkCmdBuildAccelerationStructureNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBuildAccelerationStructureNV"), to: PFN_vkCmdBuildAccelerationStructureNV?.self)
        self.vkWriteAccelerationStructuresPropertiesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWriteAccelerationStructuresPropertiesKHR"), to: PFN_vkWriteAccelerationStructuresPropertiesKHR?.self)
        self.vkCmdTraceRaysKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdTraceRaysKHR"), to: PFN_vkCmdTraceRaysKHR?.self)
        self.vkCmdTraceRaysNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdTraceRaysNV"), to: PFN_vkCmdTraceRaysNV?.self)
        self.vkGetRayTracingShaderGroupHandlesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetRayTracingShaderGroupHandlesKHR"), to: PFN_vkGetRayTracingShaderGroupHandlesKHR?.self)
        self.vkGetRayTracingCaptureReplayShaderGroupHandlesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR"), to: PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR?.self)
        self.vkGetAccelerationStructureHandleNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetAccelerationStructureHandleNV"), to: PFN_vkGetAccelerationStructureHandleNV?.self)
        self.vkCreateRayTracingPipelinesNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateRayTracingPipelinesNV"), to: PFN_vkCreateRayTracingPipelinesNV?.self)
        self.vkCreateRayTracingPipelinesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateRayTracingPipelinesKHR"), to: PFN_vkCreateRayTracingPipelinesKHR?.self)
        self.vkCmdTraceRaysIndirectKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdTraceRaysIndirectKHR"), to: PFN_vkCmdTraceRaysIndirectKHR?.self)
        self.vkCmdTraceRaysIndirect2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdTraceRaysIndirect2KHR"), to: PFN_vkCmdTraceRaysIndirect2KHR?.self)
        self.vkGetClusterAccelerationStructureBuildSizesNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetClusterAccelerationStructureBuildSizesNV"), to: PFN_vkGetClusterAccelerationStructureBuildSizesNV?.self)
        self.vkCmdBuildClusterAccelerationStructureIndirectNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBuildClusterAccelerationStructureIndirectNV"), to: PFN_vkCmdBuildClusterAccelerationStructureIndirectNV?.self)
        self.vkGetDeviceAccelerationStructureCompatibilityKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceAccelerationStructureCompatibilityKHR"), to: PFN_vkGetDeviceAccelerationStructureCompatibilityKHR?.self)
        self.vkGetRayTracingShaderGroupStackSizeKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetRayTracingShaderGroupStackSizeKHR"), to: PFN_vkGetRayTracingShaderGroupStackSizeKHR?.self)
        self.vkCmdSetRayTracingPipelineStackSizeKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRayTracingPipelineStackSizeKHR"), to: PFN_vkCmdSetRayTracingPipelineStackSizeKHR?.self)
        self.vkGetImageViewHandleNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageViewHandleNVX"), to: PFN_vkGetImageViewHandleNVX?.self)
        self.vkGetImageViewHandle64NVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageViewHandle64NVX"), to: PFN_vkGetImageViewHandle64NVX?.self)
        self.vkGetImageViewAddressNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageViewAddressNVX"), to: PFN_vkGetImageViewAddressNVX?.self)
        self.vkGetDeviceCombinedImageSamplerIndexNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceCombinedImageSamplerIndexNVX"), to: PFN_vkGetDeviceCombinedImageSamplerIndexNVX?.self)
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkGetDeviceGroupSurfacePresentModes2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceGroupSurfacePresentModes2EXT"), to: PFN_vkGetDeviceGroupSurfacePresentModes2EXT?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkAcquireFullScreenExclusiveModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAcquireFullScreenExclusiveModeEXT"), to: PFN_vkAcquireFullScreenExclusiveModeEXT?.self)
        #endif
        #if VK_USE_PLATFORM_WIN32_KHR
        self.vkReleaseFullScreenExclusiveModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkReleaseFullScreenExclusiveModeEXT"), to: PFN_vkReleaseFullScreenExclusiveModeEXT?.self)
        #endif
        self.vkAcquireProfilingLockKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAcquireProfilingLockKHR"), to: PFN_vkAcquireProfilingLockKHR?.self)
        self.vkReleaseProfilingLockKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkReleaseProfilingLockKHR"), to: PFN_vkReleaseProfilingLockKHR?.self)
        self.vkGetImageDrmFormatModifierPropertiesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageDrmFormatModifierPropertiesEXT"), to: PFN_vkGetImageDrmFormatModifierPropertiesEXT?.self)
        self.vkGetBufferOpaqueCaptureAddress = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetBufferOpaqueCaptureAddress"), to: PFN_vkGetBufferOpaqueCaptureAddress?.self)
        self.vkGetBufferDeviceAddress = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetBufferDeviceAddress"), to: PFN_vkGetBufferDeviceAddress?.self)
        self.vkInitializePerformanceApiINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkInitializePerformanceApiINTEL"), to: PFN_vkInitializePerformanceApiINTEL?.self)
        self.vkUninitializePerformanceApiINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUninitializePerformanceApiINTEL"), to: PFN_vkUninitializePerformanceApiINTEL?.self)
        self.vkCmdSetPerformanceMarkerINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPerformanceMarkerINTEL"), to: PFN_vkCmdSetPerformanceMarkerINTEL?.self)
        self.vkCmdSetPerformanceStreamMarkerINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPerformanceStreamMarkerINTEL"), to: PFN_vkCmdSetPerformanceStreamMarkerINTEL?.self)
        self.vkCmdSetPerformanceOverrideINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPerformanceOverrideINTEL"), to: PFN_vkCmdSetPerformanceOverrideINTEL?.self)
        self.vkAcquirePerformanceConfigurationINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAcquirePerformanceConfigurationINTEL"), to: PFN_vkAcquirePerformanceConfigurationINTEL?.self)
        self.vkReleasePerformanceConfigurationINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkReleasePerformanceConfigurationINTEL"), to: PFN_vkReleasePerformanceConfigurationINTEL?.self)
        self.vkQueueSetPerformanceConfigurationINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueSetPerformanceConfigurationINTEL"), to: PFN_vkQueueSetPerformanceConfigurationINTEL?.self)
        self.vkGetPerformanceParameterINTEL = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPerformanceParameterINTEL"), to: PFN_vkGetPerformanceParameterINTEL?.self)
        self.vkGetDeviceMemoryOpaqueCaptureAddress = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceMemoryOpaqueCaptureAddress"), to: PFN_vkGetDeviceMemoryOpaqueCaptureAddress?.self)
        self.vkGetPipelineExecutablePropertiesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineExecutablePropertiesKHR"), to: PFN_vkGetPipelineExecutablePropertiesKHR?.self)
        self.vkGetPipelineExecutableStatisticsKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineExecutableStatisticsKHR"), to: PFN_vkGetPipelineExecutableStatisticsKHR?.self)
        self.vkGetPipelineExecutableInternalRepresentationsKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineExecutableInternalRepresentationsKHR"), to: PFN_vkGetPipelineExecutableInternalRepresentationsKHR?.self)
        self.vkCmdSetLineStipple = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetLineStipple"), to: PFN_vkCmdSetLineStipple?.self)
        self.vkCreateAccelerationStructureKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateAccelerationStructureKHR"), to: PFN_vkCreateAccelerationStructureKHR?.self)
        self.vkCmdBuildAccelerationStructuresKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBuildAccelerationStructuresKHR"), to: PFN_vkCmdBuildAccelerationStructuresKHR?.self)
        self.vkCmdBuildAccelerationStructuresIndirectKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBuildAccelerationStructuresIndirectKHR"), to: PFN_vkCmdBuildAccelerationStructuresIndirectKHR?.self)
        self.vkBuildAccelerationStructuresKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBuildAccelerationStructuresKHR"), to: PFN_vkBuildAccelerationStructuresKHR?.self)
        self.vkGetAccelerationStructureDeviceAddressKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetAccelerationStructureDeviceAddressKHR"), to: PFN_vkGetAccelerationStructureDeviceAddressKHR?.self)
        self.vkCreateDeferredOperationKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateDeferredOperationKHR"), to: PFN_vkCreateDeferredOperationKHR?.self)
        self.vkDestroyDeferredOperationKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyDeferredOperationKHR"), to: PFN_vkDestroyDeferredOperationKHR?.self)
        self.vkGetDeferredOperationMaxConcurrencyKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeferredOperationMaxConcurrencyKHR"), to: PFN_vkGetDeferredOperationMaxConcurrencyKHR?.self)
        self.vkGetDeferredOperationResultKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeferredOperationResultKHR"), to: PFN_vkGetDeferredOperationResultKHR?.self)
        self.vkDeferredOperationJoinKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDeferredOperationJoinKHR"), to: PFN_vkDeferredOperationJoinKHR?.self)
        self.vkGetPipelineIndirectMemoryRequirementsNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineIndirectMemoryRequirementsNV"), to: PFN_vkGetPipelineIndirectMemoryRequirementsNV?.self)
        self.vkGetPipelineIndirectDeviceAddressNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelineIndirectDeviceAddressNV"), to: PFN_vkGetPipelineIndirectDeviceAddressNV?.self)
        self.vkAntiLagUpdateAMD = unsafeBitCast(vkGetDeviceProcAddr(device, "vkAntiLagUpdateAMD"), to: PFN_vkAntiLagUpdateAMD?.self)
        self.vkCmdSetCullMode = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCullMode"), to: PFN_vkCmdSetCullMode?.self)
        self.vkCmdSetFrontFace = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetFrontFace"), to: PFN_vkCmdSetFrontFace?.self)
        self.vkCmdSetPrimitiveTopology = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPrimitiveTopology"), to: PFN_vkCmdSetPrimitiveTopology?.self)
        self.vkCmdSetViewportWithCount = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetViewportWithCount"), to: PFN_vkCmdSetViewportWithCount?.self)
        self.vkCmdSetScissorWithCount = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetScissorWithCount"), to: PFN_vkCmdSetScissorWithCount?.self)
        self.vkCmdBindIndexBuffer2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindIndexBuffer2"), to: PFN_vkCmdBindIndexBuffer2?.self)
        self.vkCmdBindVertexBuffers2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindVertexBuffers2"), to: PFN_vkCmdBindVertexBuffers2?.self)
        self.vkCmdSetDepthTestEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthTestEnable"), to: PFN_vkCmdSetDepthTestEnable?.self)
        self.vkCmdSetDepthWriteEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthWriteEnable"), to: PFN_vkCmdSetDepthWriteEnable?.self)
        self.vkCmdSetDepthCompareOp = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthCompareOp"), to: PFN_vkCmdSetDepthCompareOp?.self)
        self.vkCmdSetDepthBoundsTestEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthBoundsTestEnable"), to: PFN_vkCmdSetDepthBoundsTestEnable?.self)
        self.vkCmdSetStencilTestEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetStencilTestEnable"), to: PFN_vkCmdSetStencilTestEnable?.self)
        self.vkCmdSetStencilOp = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetStencilOp"), to: PFN_vkCmdSetStencilOp?.self)
        self.vkCmdSetPatchControlPointsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPatchControlPointsEXT"), to: PFN_vkCmdSetPatchControlPointsEXT?.self)
        self.vkCmdSetRasterizerDiscardEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRasterizerDiscardEnable"), to: PFN_vkCmdSetRasterizerDiscardEnable?.self)
        self.vkCmdSetDepthBiasEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthBiasEnable"), to: PFN_vkCmdSetDepthBiasEnable?.self)
        self.vkCmdSetLogicOpEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetLogicOpEXT"), to: PFN_vkCmdSetLogicOpEXT?.self)
        self.vkCmdSetPrimitiveRestartEnable = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPrimitiveRestartEnable"), to: PFN_vkCmdSetPrimitiveRestartEnable?.self)
        self.vkCmdSetTessellationDomainOriginEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetTessellationDomainOriginEXT"), to: PFN_vkCmdSetTessellationDomainOriginEXT?.self)
        self.vkCmdSetDepthClampEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthClampEnableEXT"), to: PFN_vkCmdSetDepthClampEnableEXT?.self)
        self.vkCmdSetPolygonModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetPolygonModeEXT"), to: PFN_vkCmdSetPolygonModeEXT?.self)
        self.vkCmdSetRasterizationSamplesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRasterizationSamplesEXT"), to: PFN_vkCmdSetRasterizationSamplesEXT?.self)
        self.vkCmdSetSampleMaskEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetSampleMaskEXT"), to: PFN_vkCmdSetSampleMaskEXT?.self)
        self.vkCmdSetAlphaToCoverageEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetAlphaToCoverageEnableEXT"), to: PFN_vkCmdSetAlphaToCoverageEnableEXT?.self)
        self.vkCmdSetAlphaToOneEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetAlphaToOneEnableEXT"), to: PFN_vkCmdSetAlphaToOneEnableEXT?.self)
        self.vkCmdSetLogicOpEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetLogicOpEnableEXT"), to: PFN_vkCmdSetLogicOpEnableEXT?.self)
        self.vkCmdSetColorBlendEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetColorBlendEnableEXT"), to: PFN_vkCmdSetColorBlendEnableEXT?.self)
        self.vkCmdSetColorBlendEquationEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetColorBlendEquationEXT"), to: PFN_vkCmdSetColorBlendEquationEXT?.self)
        self.vkCmdSetColorWriteMaskEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetColorWriteMaskEXT"), to: PFN_vkCmdSetColorWriteMaskEXT?.self)
        self.vkCmdSetRasterizationStreamEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRasterizationStreamEXT"), to: PFN_vkCmdSetRasterizationStreamEXT?.self)
        self.vkCmdSetConservativeRasterizationModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetConservativeRasterizationModeEXT"), to: PFN_vkCmdSetConservativeRasterizationModeEXT?.self)
        self.vkCmdSetExtraPrimitiveOverestimationSizeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT"), to: PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT?.self)
        self.vkCmdSetDepthClipEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthClipEnableEXT"), to: PFN_vkCmdSetDepthClipEnableEXT?.self)
        self.vkCmdSetSampleLocationsEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetSampleLocationsEnableEXT"), to: PFN_vkCmdSetSampleLocationsEnableEXT?.self)
        self.vkCmdSetColorBlendAdvancedEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetColorBlendAdvancedEXT"), to: PFN_vkCmdSetColorBlendAdvancedEXT?.self)
        self.vkCmdSetProvokingVertexModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetProvokingVertexModeEXT"), to: PFN_vkCmdSetProvokingVertexModeEXT?.self)
        self.vkCmdSetLineRasterizationModeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetLineRasterizationModeEXT"), to: PFN_vkCmdSetLineRasterizationModeEXT?.self)
        self.vkCmdSetLineStippleEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetLineStippleEnableEXT"), to: PFN_vkCmdSetLineStippleEnableEXT?.self)
        self.vkCmdSetDepthClipNegativeOneToOneEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthClipNegativeOneToOneEXT"), to: PFN_vkCmdSetDepthClipNegativeOneToOneEXT?.self)
        self.vkCmdSetViewportWScalingEnableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetViewportWScalingEnableNV"), to: PFN_vkCmdSetViewportWScalingEnableNV?.self)
        self.vkCmdSetViewportSwizzleNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetViewportSwizzleNV"), to: PFN_vkCmdSetViewportSwizzleNV?.self)
        self.vkCmdSetCoverageToColorEnableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoverageToColorEnableNV"), to: PFN_vkCmdSetCoverageToColorEnableNV?.self)
        self.vkCmdSetCoverageToColorLocationNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoverageToColorLocationNV"), to: PFN_vkCmdSetCoverageToColorLocationNV?.self)
        self.vkCmdSetCoverageModulationModeNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoverageModulationModeNV"), to: PFN_vkCmdSetCoverageModulationModeNV?.self)
        self.vkCmdSetCoverageModulationTableEnableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoverageModulationTableEnableNV"), to: PFN_vkCmdSetCoverageModulationTableEnableNV?.self)
        self.vkCmdSetCoverageModulationTableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoverageModulationTableNV"), to: PFN_vkCmdSetCoverageModulationTableNV?.self)
        self.vkCmdSetShadingRateImageEnableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetShadingRateImageEnableNV"), to: PFN_vkCmdSetShadingRateImageEnableNV?.self)
        self.vkCmdSetCoverageReductionModeNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetCoverageReductionModeNV"), to: PFN_vkCmdSetCoverageReductionModeNV?.self)
        self.vkCmdSetRepresentativeFragmentTestEnableNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRepresentativeFragmentTestEnableNV"), to: PFN_vkCmdSetRepresentativeFragmentTestEnableNV?.self)
        self.vkCreatePrivateDataSlot = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreatePrivateDataSlot"), to: PFN_vkCreatePrivateDataSlot?.self)
        self.vkDestroyPrivateDataSlot = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyPrivateDataSlot"), to: PFN_vkDestroyPrivateDataSlot?.self)
        self.vkSetPrivateData = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetPrivateData"), to: PFN_vkSetPrivateData?.self)
        self.vkGetPrivateData = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPrivateData"), to: PFN_vkGetPrivateData?.self)
        self.vkCmdCopyBuffer2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyBuffer2"), to: PFN_vkCmdCopyBuffer2?.self)
        self.vkCmdCopyImage2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyImage2"), to: PFN_vkCmdCopyImage2?.self)
        self.vkCmdBlitImage2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBlitImage2"), to: PFN_vkCmdBlitImage2?.self)
        self.vkCmdCopyBufferToImage2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyBufferToImage2"), to: PFN_vkCmdCopyBufferToImage2?.self)
        self.vkCmdCopyImageToBuffer2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyImageToBuffer2"), to: PFN_vkCmdCopyImageToBuffer2?.self)
        self.vkCmdResolveImage2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdResolveImage2"), to: PFN_vkCmdResolveImage2?.self)
        self.vkCmdSetFragmentShadingRateKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetFragmentShadingRateKHR"), to: PFN_vkCmdSetFragmentShadingRateKHR?.self)
        self.vkCmdSetFragmentShadingRateEnumNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetFragmentShadingRateEnumNV"), to: PFN_vkCmdSetFragmentShadingRateEnumNV?.self)
        self.vkGetAccelerationStructureBuildSizesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetAccelerationStructureBuildSizesKHR"), to: PFN_vkGetAccelerationStructureBuildSizesKHR?.self)
        self.vkCmdSetVertexInputEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetVertexInputEXT"), to: PFN_vkCmdSetVertexInputEXT?.self)
        self.vkCmdSetColorWriteEnableEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetColorWriteEnableEXT"), to: PFN_vkCmdSetColorWriteEnableEXT?.self)
        self.vkCmdSetEvent2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetEvent2"), to: PFN_vkCmdSetEvent2?.self)
        self.vkCmdResetEvent2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdResetEvent2"), to: PFN_vkCmdResetEvent2?.self)
        self.vkCmdWaitEvents2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWaitEvents2"), to: PFN_vkCmdWaitEvents2?.self)
        self.vkCmdPipelineBarrier2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPipelineBarrier2"), to: PFN_vkCmdPipelineBarrier2?.self)
        self.vkQueueSubmit2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueSubmit2"), to: PFN_vkQueueSubmit2?.self)
        self.vkCmdWriteTimestamp2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteTimestamp2"), to: PFN_vkCmdWriteTimestamp2?.self)
        self.vkCmdWriteBufferMarker2AMD = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteBufferMarker2AMD"), to: PFN_vkCmdWriteBufferMarker2AMD?.self)
        self.vkGetQueueCheckpointData2NV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetQueueCheckpointData2NV"), to: PFN_vkGetQueueCheckpointData2NV?.self)
        self.vkCopyMemoryToImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCopyMemoryToImage"), to: PFN_vkCopyMemoryToImage?.self)
        self.vkCopyImageToMemory = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCopyImageToMemory"), to: PFN_vkCopyImageToMemory?.self)
        self.vkCopyImageToImage = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCopyImageToImage"), to: PFN_vkCopyImageToImage?.self)
        self.vkTransitionImageLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkTransitionImageLayout"), to: PFN_vkTransitionImageLayout?.self)
        self.vkCreateVideoSessionKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateVideoSessionKHR"), to: PFN_vkCreateVideoSessionKHR?.self)
        self.vkDestroyVideoSessionKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyVideoSessionKHR"), to: PFN_vkDestroyVideoSessionKHR?.self)
        self.vkCreateVideoSessionParametersKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateVideoSessionParametersKHR"), to: PFN_vkCreateVideoSessionParametersKHR?.self)
        self.vkUpdateVideoSessionParametersKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUpdateVideoSessionParametersKHR"), to: PFN_vkUpdateVideoSessionParametersKHR?.self)
        self.vkGetEncodedVideoSessionParametersKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetEncodedVideoSessionParametersKHR"), to: PFN_vkGetEncodedVideoSessionParametersKHR?.self)
        self.vkDestroyVideoSessionParametersKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyVideoSessionParametersKHR"), to: PFN_vkDestroyVideoSessionParametersKHR?.self)
        self.vkGetVideoSessionMemoryRequirementsKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetVideoSessionMemoryRequirementsKHR"), to: PFN_vkGetVideoSessionMemoryRequirementsKHR?.self)
        self.vkBindVideoSessionMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindVideoSessionMemoryKHR"), to: PFN_vkBindVideoSessionMemoryKHR?.self)
        self.vkCmdDecodeVideoKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDecodeVideoKHR"), to: PFN_vkCmdDecodeVideoKHR?.self)
        self.vkCmdBeginVideoCodingKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginVideoCodingKHR"), to: PFN_vkCmdBeginVideoCodingKHR?.self)
        self.vkCmdControlVideoCodingKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdControlVideoCodingKHR"), to: PFN_vkCmdControlVideoCodingKHR?.self)
        self.vkCmdEndVideoCodingKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndVideoCodingKHR"), to: PFN_vkCmdEndVideoCodingKHR?.self)
        self.vkCmdEncodeVideoKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEncodeVideoKHR"), to: PFN_vkCmdEncodeVideoKHR?.self)
        self.vkCmdDecompressMemoryNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDecompressMemoryNV"), to: PFN_vkCmdDecompressMemoryNV?.self)
        self.vkCmdDecompressMemoryIndirectCountNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDecompressMemoryIndirectCountNV"), to: PFN_vkCmdDecompressMemoryIndirectCountNV?.self)
        self.vkGetPartitionedAccelerationStructuresBuildSizesNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPartitionedAccelerationStructuresBuildSizesNV"), to: PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV?.self)
        self.vkCmdBuildPartitionedAccelerationStructuresNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBuildPartitionedAccelerationStructuresNV"), to: PFN_vkCmdBuildPartitionedAccelerationStructuresNV?.self)
        self.vkCmdDecompressMemoryEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDecompressMemoryEXT"), to: PFN_vkCmdDecompressMemoryEXT?.self)
        self.vkCmdDecompressMemoryIndirectCountEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDecompressMemoryIndirectCountEXT"), to: PFN_vkCmdDecompressMemoryIndirectCountEXT?.self)
        self.vkCreateCuModuleNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateCuModuleNVX"), to: PFN_vkCreateCuModuleNVX?.self)
        self.vkCreateCuFunctionNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateCuFunctionNVX"), to: PFN_vkCreateCuFunctionNVX?.self)
        self.vkDestroyCuModuleNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyCuModuleNVX"), to: PFN_vkDestroyCuModuleNVX?.self)
        self.vkDestroyCuFunctionNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyCuFunctionNVX"), to: PFN_vkDestroyCuFunctionNVX?.self)
        self.vkCmdCuLaunchKernelNVX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCuLaunchKernelNVX"), to: PFN_vkCmdCuLaunchKernelNVX?.self)
        self.vkGetDescriptorSetLayoutSizeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDescriptorSetLayoutSizeEXT"), to: PFN_vkGetDescriptorSetLayoutSizeEXT?.self)
        self.vkGetDescriptorSetLayoutBindingOffsetEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDescriptorSetLayoutBindingOffsetEXT"), to: PFN_vkGetDescriptorSetLayoutBindingOffsetEXT?.self)
        self.vkGetDescriptorEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDescriptorEXT"), to: PFN_vkGetDescriptorEXT?.self)
        self.vkCmdBindDescriptorBuffersEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindDescriptorBuffersEXT"), to: PFN_vkCmdBindDescriptorBuffersEXT?.self)
        self.vkCmdSetDescriptorBufferOffsetsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDescriptorBufferOffsetsEXT"), to: PFN_vkCmdSetDescriptorBufferOffsetsEXT?.self)
        self.vkCmdBindDescriptorBufferEmbeddedSamplersEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT"), to: PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT?.self)
        self.vkGetBufferOpaqueCaptureDescriptorDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetBufferOpaqueCaptureDescriptorDataEXT"), to: PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT?.self)
        self.vkGetImageOpaqueCaptureDescriptorDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageOpaqueCaptureDescriptorDataEXT"), to: PFN_vkGetImageOpaqueCaptureDescriptorDataEXT?.self)
        self.vkGetImageViewOpaqueCaptureDescriptorDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageViewOpaqueCaptureDescriptorDataEXT"), to: PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT?.self)
        self.vkGetSamplerOpaqueCaptureDescriptorDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSamplerOpaqueCaptureDescriptorDataEXT"), to: PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT?.self)
        self.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT"), to: PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT?.self)
        self.vkSetDeviceMemoryPriorityEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetDeviceMemoryPriorityEXT"), to: PFN_vkSetDeviceMemoryPriorityEXT?.self)
        self.vkWaitForPresent2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWaitForPresent2KHR"), to: PFN_vkWaitForPresent2KHR?.self)
        self.vkWaitForPresentKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWaitForPresentKHR"), to: PFN_vkWaitForPresentKHR?.self)
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkCreateBufferCollectionFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateBufferCollectionFUCHSIA"), to: PFN_vkCreateBufferCollectionFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkSetBufferCollectionBufferConstraintsFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetBufferCollectionBufferConstraintsFUCHSIA"), to: PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkSetBufferCollectionImageConstraintsFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetBufferCollectionImageConstraintsFUCHSIA"), to: PFN_vkSetBufferCollectionImageConstraintsFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkDestroyBufferCollectionFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyBufferCollectionFUCHSIA"), to: PFN_vkDestroyBufferCollectionFUCHSIA?.self)
        #endif
        #if VK_USE_PLATFORM_FUCHSIA
        self.vkGetBufferCollectionPropertiesFUCHSIA = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetBufferCollectionPropertiesFUCHSIA"), to: PFN_vkGetBufferCollectionPropertiesFUCHSIA?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCreateCudaModuleNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateCudaModuleNV"), to: PFN_vkCreateCudaModuleNV?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkGetCudaModuleCacheNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetCudaModuleCacheNV"), to: PFN_vkGetCudaModuleCacheNV?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCreateCudaFunctionNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateCudaFunctionNV"), to: PFN_vkCreateCudaFunctionNV?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkDestroyCudaModuleNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyCudaModuleNV"), to: PFN_vkDestroyCudaModuleNV?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkDestroyCudaFunctionNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyCudaFunctionNV"), to: PFN_vkDestroyCudaFunctionNV?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCmdCudaLaunchKernelNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCudaLaunchKernelNV"), to: PFN_vkCmdCudaLaunchKernelNV?.self)
        #endif
        self.vkCmdBeginRendering = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginRendering"), to: PFN_vkCmdBeginRendering?.self)
        self.vkCmdEndRendering = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndRendering"), to: PFN_vkCmdEndRendering?.self)
        self.vkCmdEndRendering2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndRendering2KHR"), to: PFN_vkCmdEndRendering2KHR?.self)
        self.vkGetDescriptorSetLayoutHostMappingInfoVALVE = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE"), to: PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE?.self)
        self.vkGetDescriptorSetHostMappingVALVE = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDescriptorSetHostMappingVALVE"), to: PFN_vkGetDescriptorSetHostMappingVALVE?.self)
        self.vkGetShaderModuleIdentifierEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetShaderModuleIdentifierEXT"), to: PFN_vkGetShaderModuleIdentifierEXT?.self)
        self.vkGetShaderModuleCreateInfoIdentifierEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetShaderModuleCreateInfoIdentifierEXT"), to: PFN_vkGetShaderModuleCreateInfoIdentifierEXT?.self)
        self.vkGetImageSubresourceLayout2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageSubresourceLayout2"), to: PFN_vkGetImageSubresourceLayout2?.self)
        self.vkGetPipelinePropertiesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPipelinePropertiesEXT"), to: PFN_vkGetPipelinePropertiesEXT?.self)
        #if VK_USE_PLATFORM_METAL_EXT
        self.vkExportMetalObjectsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkExportMetalObjectsEXT"), to: PFN_vkExportMetalObjectsEXT?.self)
        #endif
        self.vkCmdBindTileMemoryQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindTileMemoryQCOM"), to: PFN_vkCmdBindTileMemoryQCOM?.self)
        self.vkGetFramebufferTilePropertiesQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetFramebufferTilePropertiesQCOM"), to: PFN_vkGetFramebufferTilePropertiesQCOM?.self)
        self.vkGetDynamicRenderingTilePropertiesQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDynamicRenderingTilePropertiesQCOM"), to: PFN_vkGetDynamicRenderingTilePropertiesQCOM?.self)
        self.vkCreateOpticalFlowSessionNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateOpticalFlowSessionNV"), to: PFN_vkCreateOpticalFlowSessionNV?.self)
        self.vkDestroyOpticalFlowSessionNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyOpticalFlowSessionNV"), to: PFN_vkDestroyOpticalFlowSessionNV?.self)
        self.vkBindOpticalFlowSessionImageNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindOpticalFlowSessionImageNV"), to: PFN_vkBindOpticalFlowSessionImageNV?.self)
        self.vkCmdOpticalFlowExecuteNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdOpticalFlowExecuteNV"), to: PFN_vkCmdOpticalFlowExecuteNV?.self)
        self.vkGetDeviceFaultInfoEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceFaultInfoEXT"), to: PFN_vkGetDeviceFaultInfoEXT?.self)
        self.vkGetDeviceFaultReportsKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceFaultReportsKHR"), to: PFN_vkGetDeviceFaultReportsKHR?.self)
        self.vkGetDeviceFaultDebugInfoKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceFaultDebugInfoKHR"), to: PFN_vkGetDeviceFaultDebugInfoKHR?.self)
        self.vkCmdSetDepthBias2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthBias2EXT"), to: PFN_vkCmdSetDepthBias2EXT?.self)
        self.vkReleaseSwapchainImagesKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkReleaseSwapchainImagesKHR"), to: PFN_vkReleaseSwapchainImagesKHR?.self)
        self.vkGetDeviceImageSubresourceLayout = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceImageSubresourceLayout"), to: PFN_vkGetDeviceImageSubresourceLayout?.self)
        self.vkMapMemory2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkMapMemory2"), to: PFN_vkMapMemory2?.self)
        self.vkUnmapMemory2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUnmapMemory2"), to: PFN_vkUnmapMemory2?.self)
        self.vkCreateShadersEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateShadersEXT"), to: PFN_vkCreateShadersEXT?.self)
        self.vkDestroyShaderEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyShaderEXT"), to: PFN_vkDestroyShaderEXT?.self)
        self.vkGetShaderBinaryDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetShaderBinaryDataEXT"), to: PFN_vkGetShaderBinaryDataEXT?.self)
        self.vkCmdBindShadersEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindShadersEXT"), to: PFN_vkCmdBindShadersEXT?.self)
        self.vkSetSwapchainPresentTimingQueueSizeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetSwapchainPresentTimingQueueSizeEXT"), to: PFN_vkSetSwapchainPresentTimingQueueSizeEXT?.self)
        self.vkGetSwapchainTimingPropertiesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSwapchainTimingPropertiesEXT"), to: PFN_vkGetSwapchainTimingPropertiesEXT?.self)
        self.vkGetSwapchainTimeDomainPropertiesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetSwapchainTimeDomainPropertiesEXT"), to: PFN_vkGetSwapchainTimeDomainPropertiesEXT?.self)
        self.vkGetPastPresentationTimingEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetPastPresentationTimingEXT"), to: PFN_vkGetPastPresentationTimingEXT?.self)
        #if VK_USE_PLATFORM_SCREEN_QNX
        self.vkGetScreenBufferPropertiesQNX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetScreenBufferPropertiesQNX"), to: PFN_vkGetScreenBufferPropertiesQNX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkGetExecutionGraphPipelineScratchSizeAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetExecutionGraphPipelineScratchSizeAMDX"), to: PFN_vkGetExecutionGraphPipelineScratchSizeAMDX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkGetExecutionGraphPipelineNodeIndexAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetExecutionGraphPipelineNodeIndexAMDX"), to: PFN_vkGetExecutionGraphPipelineNodeIndexAMDX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCreateExecutionGraphPipelinesAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateExecutionGraphPipelinesAMDX"), to: PFN_vkCreateExecutionGraphPipelinesAMDX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCmdInitializeGraphScratchMemoryAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdInitializeGraphScratchMemoryAMDX"), to: PFN_vkCmdInitializeGraphScratchMemoryAMDX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCmdDispatchGraphAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchGraphAMDX"), to: PFN_vkCmdDispatchGraphAMDX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCmdDispatchGraphIndirectAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchGraphIndirectAMDX"), to: PFN_vkCmdDispatchGraphIndirectAMDX?.self)
        #endif
        #if VK_ENABLE_BETA_EXTENSIONS
        self.vkCmdDispatchGraphIndirectCountAMDX = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchGraphIndirectCountAMDX"), to: PFN_vkCmdDispatchGraphIndirectCountAMDX?.self)
        #endif
        self.vkCmdBindDescriptorSets2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindDescriptorSets2"), to: PFN_vkCmdBindDescriptorSets2?.self)
        self.vkCmdPushConstants2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushConstants2"), to: PFN_vkCmdPushConstants2?.self)
        self.vkCmdPushDescriptorSet2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushDescriptorSet2"), to: PFN_vkCmdPushDescriptorSet2?.self)
        self.vkCmdPushDescriptorSetWithTemplate2 = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushDescriptorSetWithTemplate2"), to: PFN_vkCmdPushDescriptorSetWithTemplate2?.self)
        self.vkCmdSetDescriptorBufferOffsets2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDescriptorBufferOffsets2EXT"), to: PFN_vkCmdSetDescriptorBufferOffsets2EXT?.self)
        self.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT"), to: PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT?.self)
        self.vkSetLatencySleepModeNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetLatencySleepModeNV"), to: PFN_vkSetLatencySleepModeNV?.self)
        self.vkLatencySleepNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkLatencySleepNV"), to: PFN_vkLatencySleepNV?.self)
        self.vkSetLatencyMarkerNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkSetLatencyMarkerNV"), to: PFN_vkSetLatencyMarkerNV?.self)
        self.vkGetLatencyTimingsNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetLatencyTimingsNV"), to: PFN_vkGetLatencyTimingsNV?.self)
        self.vkQueueNotifyOutOfBandNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueNotifyOutOfBandNV"), to: PFN_vkQueueNotifyOutOfBandNV?.self)
        self.vkCmdSetRenderingAttachmentLocations = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRenderingAttachmentLocations"), to: PFN_vkCmdSetRenderingAttachmentLocations?.self)
        self.vkCmdSetRenderingInputAttachmentIndices = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetRenderingInputAttachmentIndices"), to: PFN_vkCmdSetRenderingInputAttachmentIndices?.self)
        self.vkCmdSetDepthClampRangeEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDepthClampRangeEXT"), to: PFN_vkCmdSetDepthClampRangeEXT?.self)
        #if VK_USE_PLATFORM_METAL_EXT
        self.vkGetMemoryMetalHandleEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryMetalHandleEXT"), to: PFN_vkGetMemoryMetalHandleEXT?.self)
        #endif
        #if VK_USE_PLATFORM_METAL_EXT
        self.vkGetMemoryMetalHandlePropertiesEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryMetalHandlePropertiesEXT"), to: PFN_vkGetMemoryMetalHandlePropertiesEXT?.self)
        #endif
        self.vkConvertCooperativeVectorMatrixNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkConvertCooperativeVectorMatrixNV"), to: PFN_vkConvertCooperativeVectorMatrixNV?.self)
        self.vkCmdConvertCooperativeVectorMatrixNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdConvertCooperativeVectorMatrixNV"), to: PFN_vkCmdConvertCooperativeVectorMatrixNV?.self)
        self.vkCmdDispatchTileQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchTileQCOM"), to: PFN_vkCmdDispatchTileQCOM?.self)
        self.vkCmdBeginPerTileExecutionQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginPerTileExecutionQCOM"), to: PFN_vkCmdBeginPerTileExecutionQCOM?.self)
        self.vkCmdEndPerTileExecutionQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndPerTileExecutionQCOM"), to: PFN_vkCmdEndPerTileExecutionQCOM?.self)
        self.vkCreateExternalComputeQueueNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateExternalComputeQueueNV"), to: PFN_vkCreateExternalComputeQueueNV?.self)
        self.vkDestroyExternalComputeQueueNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyExternalComputeQueueNV"), to: PFN_vkDestroyExternalComputeQueueNV?.self)
        self.vkGetExternalComputeQueueDataNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetExternalComputeQueueDataNV"), to: PFN_vkGetExternalComputeQueueDataNV?.self)
        self.vkCreateShaderInstrumentationARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateShaderInstrumentationARM"), to: PFN_vkCreateShaderInstrumentationARM?.self)
        self.vkDestroyShaderInstrumentationARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyShaderInstrumentationARM"), to: PFN_vkDestroyShaderInstrumentationARM?.self)
        self.vkCmdBeginShaderInstrumentationARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginShaderInstrumentationARM"), to: PFN_vkCmdBeginShaderInstrumentationARM?.self)
        self.vkCmdEndShaderInstrumentationARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndShaderInstrumentationARM"), to: PFN_vkCmdEndShaderInstrumentationARM?.self)
        self.vkGetShaderInstrumentationValuesARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetShaderInstrumentationValuesARM"), to: PFN_vkGetShaderInstrumentationValuesARM?.self)
        self.vkClearShaderInstrumentationMetricsARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkClearShaderInstrumentationMetricsARM"), to: PFN_vkClearShaderInstrumentationMetricsARM?.self)
        self.vkCreateTensorARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateTensorARM"), to: PFN_vkCreateTensorARM?.self)
        self.vkDestroyTensorARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyTensorARM"), to: PFN_vkDestroyTensorARM?.self)
        self.vkCreateTensorViewARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateTensorViewARM"), to: PFN_vkCreateTensorViewARM?.self)
        self.vkDestroyTensorViewARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyTensorViewARM"), to: PFN_vkDestroyTensorViewARM?.self)
        self.vkGetTensorMemoryRequirementsARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetTensorMemoryRequirementsARM"), to: PFN_vkGetTensorMemoryRequirementsARM?.self)
        self.vkBindTensorMemoryARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindTensorMemoryARM"), to: PFN_vkBindTensorMemoryARM?.self)
        self.vkGetDeviceTensorMemoryRequirementsARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDeviceTensorMemoryRequirementsARM"), to: PFN_vkGetDeviceTensorMemoryRequirementsARM?.self)
        self.vkCmdCopyTensorARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyTensorARM"), to: PFN_vkCmdCopyTensorARM?.self)
        self.vkGetTensorOpaqueCaptureDescriptorDataARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetTensorOpaqueCaptureDescriptorDataARM"), to: PFN_vkGetTensorOpaqueCaptureDescriptorDataARM?.self)
        self.vkGetTensorViewOpaqueCaptureDescriptorDataARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM"), to: PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM?.self)
        self.vkCreateDataGraphPipelinesARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateDataGraphPipelinesARM"), to: PFN_vkCreateDataGraphPipelinesARM?.self)
        self.vkCreateDataGraphPipelineSessionARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateDataGraphPipelineSessionARM"), to: PFN_vkCreateDataGraphPipelineSessionARM?.self)
        self.vkGetDataGraphPipelineSessionBindPointRequirementsARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM"), to: PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM?.self)
        self.vkGetDataGraphPipelineSessionMemoryRequirementsARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM"), to: PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM?.self)
        self.vkBindDataGraphPipelineSessionMemoryARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkBindDataGraphPipelineSessionMemoryARM"), to: PFN_vkBindDataGraphPipelineSessionMemoryARM?.self)
        self.vkDestroyDataGraphPipelineSessionARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkDestroyDataGraphPipelineSessionARM"), to: PFN_vkDestroyDataGraphPipelineSessionARM?.self)
        self.vkCmdDispatchDataGraphARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchDataGraphARM"), to: PFN_vkCmdDispatchDataGraphARM?.self)
        self.vkGetDataGraphPipelineAvailablePropertiesARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDataGraphPipelineAvailablePropertiesARM"), to: PFN_vkGetDataGraphPipelineAvailablePropertiesARM?.self)
        self.vkGetDataGraphPipelinePropertiesARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetDataGraphPipelinePropertiesARM"), to: PFN_vkGetDataGraphPipelinePropertiesARM?.self)
        #if VK_USE_PLATFORM_OHOS
        self.vkGetNativeBufferPropertiesOHOS = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetNativeBufferPropertiesOHOS"), to: PFN_vkGetNativeBufferPropertiesOHOS?.self)
        #endif
        #if VK_USE_PLATFORM_OHOS
        self.vkGetMemoryNativeBufferOHOS = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetMemoryNativeBufferOHOS"), to: PFN_vkGetMemoryNativeBufferOHOS?.self)
        #endif
        self.vkQueueSetPerfHintQCOM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkQueueSetPerfHintQCOM"), to: PFN_vkQueueSetPerfHintQCOM?.self)
        self.vkCmdSetComputeOccupancyPriorityNV = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetComputeOccupancyPriorityNV"), to: PFN_vkCmdSetComputeOccupancyPriorityNV?.self)
        self.vkWriteSamplerDescriptorsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWriteSamplerDescriptorsEXT"), to: PFN_vkWriteSamplerDescriptorsEXT?.self)
        self.vkWriteResourceDescriptorsEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkWriteResourceDescriptorsEXT"), to: PFN_vkWriteResourceDescriptorsEXT?.self)
        self.vkCmdBindSamplerHeapEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindSamplerHeapEXT"), to: PFN_vkCmdBindSamplerHeapEXT?.self)
        self.vkCmdBindResourceHeapEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindResourceHeapEXT"), to: PFN_vkCmdBindResourceHeapEXT?.self)
        self.vkCmdPushDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdPushDataEXT"), to: PFN_vkCmdPushDataEXT?.self)
        self.vkRegisterCustomBorderColorEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkRegisterCustomBorderColorEXT"), to: PFN_vkRegisterCustomBorderColorEXT?.self)
        self.vkUnregisterCustomBorderColorEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkUnregisterCustomBorderColorEXT"), to: PFN_vkUnregisterCustomBorderColorEXT?.self)
        self.vkGetImageOpaqueCaptureDataEXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetImageOpaqueCaptureDataEXT"), to: PFN_vkGetImageOpaqueCaptureDataEXT?.self)
        self.vkGetTensorOpaqueCaptureDataARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkGetTensorOpaqueCaptureDataARM"), to: PFN_vkGetTensorOpaqueCaptureDataARM?.self)
        self.vkCmdCopyMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryKHR"), to: PFN_vkCmdCopyMemoryKHR?.self)
        self.vkCmdCopyMemoryToImageKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyMemoryToImageKHR"), to: PFN_vkCmdCopyMemoryToImageKHR?.self)
        self.vkCmdCopyImageToMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyImageToMemoryKHR"), to: PFN_vkCmdCopyImageToMemoryKHR?.self)
        self.vkCmdUpdateMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdUpdateMemoryKHR"), to: PFN_vkCmdUpdateMemoryKHR?.self)
        self.vkCmdFillMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdFillMemoryKHR"), to: PFN_vkCmdFillMemoryKHR?.self)
        self.vkCmdCopyQueryPoolResultsToMemoryKHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdCopyQueryPoolResultsToMemoryKHR"), to: PFN_vkCmdCopyQueryPoolResultsToMemoryKHR?.self)
        self.vkCmdBeginConditionalRendering2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginConditionalRendering2EXT"), to: PFN_vkCmdBeginConditionalRendering2EXT?.self)
        self.vkCmdBindTransformFeedbackBuffers2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindTransformFeedbackBuffers2EXT"), to: PFN_vkCmdBindTransformFeedbackBuffers2EXT?.self)
        self.vkCmdBeginTransformFeedback2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBeginTransformFeedback2EXT"), to: PFN_vkCmdBeginTransformFeedback2EXT?.self)
        self.vkCmdEndTransformFeedback2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdEndTransformFeedback2EXT"), to: PFN_vkCmdEndTransformFeedback2EXT?.self)
        self.vkCmdDrawIndirectByteCount2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndirectByteCount2EXT"), to: PFN_vkCmdDrawIndirectByteCount2EXT?.self)
        self.vkCmdWriteMarkerToMemoryAMD = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdWriteMarkerToMemoryAMD"), to: PFN_vkCmdWriteMarkerToMemoryAMD?.self)
        self.vkCmdBindIndexBuffer3KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindIndexBuffer3KHR"), to: PFN_vkCmdBindIndexBuffer3KHR?.self)
        self.vkCmdBindVertexBuffers3KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdBindVertexBuffers3KHR"), to: PFN_vkCmdBindVertexBuffers3KHR?.self)
        self.vkCmdDrawIndirect2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndirect2KHR"), to: PFN_vkCmdDrawIndirect2KHR?.self)
        self.vkCmdDrawIndexedIndirect2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndexedIndirect2KHR"), to: PFN_vkCmdDrawIndexedIndirect2KHR?.self)
        self.vkCmdDrawIndirectCount2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndirectCount2KHR"), to: PFN_vkCmdDrawIndirectCount2KHR?.self)
        self.vkCmdDrawIndexedIndirectCount2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawIndexedIndirectCount2KHR"), to: PFN_vkCmdDrawIndexedIndirectCount2KHR?.self)
        self.vkCmdDrawMeshTasksIndirect2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksIndirect2EXT"), to: PFN_vkCmdDrawMeshTasksIndirect2EXT?.self)
        self.vkCmdDrawMeshTasksIndirectCount2EXT = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDrawMeshTasksIndirectCount2EXT"), to: PFN_vkCmdDrawMeshTasksIndirectCount2EXT?.self)
        self.vkCmdDispatchIndirect2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdDispatchIndirect2KHR"), to: PFN_vkCmdDispatchIndirect2KHR?.self)
        self.vkCreateAccelerationStructure2KHR = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCreateAccelerationStructure2KHR"), to: PFN_vkCreateAccelerationStructure2KHR?.self)
        self.vkCmdSetDispatchParametersARM = unsafeBitCast(vkGetDeviceProcAddr(device, "vkCmdSetDispatchParametersARM"), to: PFN_vkCmdSetDispatchParametersARM?.self)
    }
}

