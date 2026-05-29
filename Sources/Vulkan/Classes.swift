import CVulkan

public class Entry {
    public let loader: Loader
    let dispatchTable: EntryDispatchTable

    public init(loader: Loader) {
        self.loader = loader
        self.dispatchTable = EntryDispatchTable(vkGetInstanceProcAddr: self.loader.vkGetInstanceProcAddr)
    }

    public func createInstance(_ createInfo: (some Chainable<InstanceCreateInfo>)) throws -> Instance {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkInstance!
            try checkResult(
                self.dispatchTable.vkCreateInstance(ptr_createInfo, nil, &out)
            )
            return Instance(handle: out, entry: self)
        }
    }

    public func createInstance(_ createInfo: InstanceCreateInfo) throws -> Instance {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkInstance!
            try checkResult(
                self.dispatchTable.vkCreateInstance(ptr_createInfo, nil, &out)
            )
            return Instance(handle: out, entry: self)
        }
    }

    public func getInstanceProcAddr(instance: Instance? = nil, name: String) -> PFN_vkVoidFunction? {
        name.withCString { cString_name in
            self.loader.vkGetInstanceProcAddr(instance?.handle, cString_name)
        }
    }

    public func getInstanceVersion() throws -> Version {
        var out = UInt32()
        try checkResult(
            self.dispatchTable.vkEnumerateInstanceVersion(&out)
        )
        return Version(rawValue: out)
    }

    public func getInstanceLayerProperties() throws -> Array<LayerProperties> {
        try enumerate { pProperties, pPropertyCount in
            self.dispatchTable.vkEnumerateInstanceLayerProperties(pPropertyCount, pProperties)
        }.map { LayerProperties(cStruct: $0) }
    }

    public func getInstanceExtensionProperties(layerName: String?) throws -> Array<ExtensionProperties> {
        try layerName.withOptionalCString { cString_layerName in
            try enumerate { pProperties, pPropertyCount in
                self.dispatchTable.vkEnumerateInstanceExtensionProperties(cString_layerName, pPropertyCount, pProperties)
            }.map { ExtensionProperties(cStruct: $0) }
        }
    }
}

public class Instance: _HandleContainer {
    let handle: VkInstance?
    public let entry: Entry
    let dispatchTable: InstanceDispatchTable

    public init(handle: VkInstance!, entry: Entry) {
        self.handle = handle
        self.entry = entry
        self.dispatchTable = InstanceDispatchTable(vkGetInstanceProcAddr: self.entry.loader.vkGetInstanceProcAddr, instance: handle)
    }

    public func destroy() -> Void {
        self.dispatchTable.vkDestroyInstance(self.handle, nil)
    }

    public func getPhysicalDevices() throws -> Array<PhysicalDevice> {
        try enumerate { pPhysicalDevices, pPhysicalDeviceCount in
            self.dispatchTable.vkEnumeratePhysicalDevices(self.handle, pPhysicalDeviceCount, pPhysicalDevices)
        }.map { PhysicalDevice(handle: $0, instance: self) }
    }

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func createAndroidSurfaceKHR(_ createInfo: (some Chainable<AndroidSurfaceCreateInfoKHR>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateAndroidSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func createAndroidSurfaceKHR(_ createInfo: AndroidSurfaceCreateInfoKHR) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateAndroidSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func createSurfaceOHOS(_ createInfo: (some Chainable<SurfaceCreateInfoOHOS>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateSurfaceOHOS(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func createSurfaceOHOS(_ createInfo: SurfaceCreateInfoOHOS) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateSurfaceOHOS(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    public func createDisplayPlaneSurfaceKHR(_ createInfo: (some Chainable<DisplaySurfaceCreateInfoKHR>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDisplayPlaneSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }

    public func createDisplayPlaneSurfaceKHR(_ createInfo: DisplaySurfaceCreateInfoKHR) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDisplayPlaneSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }

    #if VK_USE_PLATFORM_VI_NN
    public func createViSurfaceNN(_ createInfo: (some Chainable<ViSurfaceCreateInfoNN>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateViSurfaceNN(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_VI_NN
    public func createViSurfaceNN(_ createInfo: ViSurfaceCreateInfoNN) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateViSurfaceNN(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func createWaylandSurfaceKHR(_ createInfo: (some Chainable<WaylandSurfaceCreateInfoKHR>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWaylandSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func createWaylandSurfaceKHR(_ createInfo: WaylandSurfaceCreateInfoKHR) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWaylandSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func createUbmSurfaceSEC(_ createInfo: (some Chainable<UbmSurfaceCreateInfoSEC>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateUbmSurfaceSEC(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func createUbmSurfaceSEC(_ createInfo: UbmSurfaceCreateInfoSEC) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateUbmSurfaceSEC(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func createWin32SurfaceKHR(_ createInfo: (some Chainable<Win32SurfaceCreateInfoKHR>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWin32SurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func createWin32SurfaceKHR(_ createInfo: Win32SurfaceCreateInfoKHR) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWin32SurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func createXlibSurfaceKHR(_ createInfo: (some Chainable<XlibSurfaceCreateInfoKHR>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXlibSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func createXlibSurfaceKHR(_ createInfo: XlibSurfaceCreateInfoKHR) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXlibSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func createXcbSurfaceKHR(_ createInfo: (some Chainable<XcbSurfaceCreateInfoKHR>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXcbSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func createXcbSurfaceKHR(_ createInfo: XcbSurfaceCreateInfoKHR) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXcbSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func createDirectFBSurfaceEXT(_ createInfo: (some Chainable<DirectFBSurfaceCreateInfoEXT>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDirectFBSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func createDirectFBSurfaceEXT(_ createInfo: DirectFBSurfaceCreateInfoEXT) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDirectFBSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createImagePipeSurfaceFUCHSIA(_ createInfo: (some Chainable<ImagePipeSurfaceCreateInfoFUCHSIA>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateImagePipeSurfaceFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createImagePipeSurfaceFUCHSIA(_ createInfo: ImagePipeSurfaceCreateInfoFUCHSIA) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateImagePipeSurfaceFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_GGP
    public func createStreamDescriptorSurfaceGGP(_ createInfo: (some Chainable<StreamDescriptorSurfaceCreateInfoGGP>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateStreamDescriptorSurfaceGGP(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_GGP
    public func createStreamDescriptorSurfaceGGP(_ createInfo: StreamDescriptorSurfaceCreateInfoGGP) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateStreamDescriptorSurfaceGGP(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func createScreenSurfaceQNX(_ createInfo: (some Chainable<ScreenSurfaceCreateInfoQNX>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateScreenSurfaceQNX(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func createScreenSurfaceQNX(_ createInfo: ScreenSurfaceCreateInfoQNX) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateScreenSurfaceQNX(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    public func createDebugReportCallbackEXT(_ createInfo: (some Chainable<DebugReportCallbackCreateInfoEXT>)) throws -> DebugReportCallbackEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDebugReportCallbackEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugReportCallbackEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugReportCallbackEXT(handle: out, instance: self)
        }
    }

    public func createDebugReportCallbackEXT(_ createInfo: DebugReportCallbackCreateInfoEXT) throws -> DebugReportCallbackEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDebugReportCallbackEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugReportCallbackEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugReportCallbackEXT(handle: out, instance: self)
        }
    }

    public func debugReportMessageEXT(flags: DebugReportFlagsEXT, objectType: DebugReportObjectTypeEXT, object: UInt64, location: Int, messageCode: Int32, layerPrefix: String, message: String) -> Void {
        layerPrefix.withCString { cString_layerPrefix in
            message.withCString { cString_message in
                self.dispatchTable.vkDebugReportMessageEXT(self.handle, flags.rawValue, VkDebugReportObjectTypeEXT(rawValue: VkDebugReportObjectTypeEXT.RawValue(objectType.rawValue)), object, location, messageCode, cString_layerPrefix, cString_message)
            }
        }
    }

    public func getPhysicalDeviceGroups() throws -> Array<PhysicalDeviceGroupProperties> {
        try enumerate { pPhysicalDeviceGroupProperties, pPhysicalDeviceGroupCount in
            self.dispatchTable.vkEnumeratePhysicalDeviceGroups(self.handle, pPhysicalDeviceGroupCount, pPhysicalDeviceGroupProperties)
        }.map { PhysicalDeviceGroupProperties(cStruct: $0, instance: self) }
    }

    #if VK_USE_PLATFORM_IOS_MVK
    public func createIOSSurfaceMVK(_ createInfo: (some Chainable<IOSSurfaceCreateInfoMVK>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateIOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_IOS_MVK
    public func createIOSSurfaceMVK(_ createInfo: IOSSurfaceCreateInfoMVK) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateIOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_MACOS_MVK
    public func createMacOSSurfaceMVK(_ createInfo: (some Chainable<MacOSSurfaceCreateInfoMVK>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMacOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_MACOS_MVK
    public func createMacOSSurfaceMVK(_ createInfo: MacOSSurfaceCreateInfoMVK) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMacOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func createMetalSurfaceEXT(_ createInfo: (some Chainable<MetalSurfaceCreateInfoEXT>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMetalSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func createMetalSurfaceEXT(_ createInfo: MetalSurfaceCreateInfoEXT) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMetalSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    public func createDebugUtilsMessengerEXT(_ createInfo: (some Chainable<DebugUtilsMessengerCreateInfoEXT>)) throws -> DebugUtilsMessengerEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDebugUtilsMessengerEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugUtilsMessengerEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugUtilsMessengerEXT(handle: out, instance: self)
        }
    }

    public func createDebugUtilsMessengerEXT(_ createInfo: DebugUtilsMessengerCreateInfoEXT) throws -> DebugUtilsMessengerEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDebugUtilsMessengerEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugUtilsMessengerEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugUtilsMessengerEXT(handle: out, instance: self)
        }
    }

    public func submitDebugUtilsMessageEXT(messageSeverity: DebugUtilsMessageSeverityFlagsEXT, messageTypes: DebugUtilsMessageTypeFlagsEXT, callbackData: (some Chainable<DebugUtilsMessengerCallbackDataEXT>)) -> Void {
        callbackData.withCStruct { ptr_callbackData in
            self.dispatchTable.vkSubmitDebugUtilsMessageEXT(self.handle, VkDebugUtilsMessageSeverityFlagBitsEXT(rawValue: VkDebugUtilsMessageSeverityFlagBitsEXT.RawValue(messageSeverity.rawValue)), messageTypes.rawValue, ptr_callbackData)
        }
    }

    public func submitDebugUtilsMessageEXT(messageSeverity: DebugUtilsMessageSeverityFlagsEXT, messageTypes: DebugUtilsMessageTypeFlagsEXT, callbackData: DebugUtilsMessengerCallbackDataEXT) -> Void {
        callbackData.withCStruct { ptr_callbackData in
            self.dispatchTable.vkSubmitDebugUtilsMessageEXT(self.handle, VkDebugUtilsMessageSeverityFlagBitsEXT(rawValue: VkDebugUtilsMessageSeverityFlagBitsEXT.RawValue(messageSeverity.rawValue)), messageTypes.rawValue, ptr_callbackData)
        }
    }

    public func createHeadlessSurfaceEXT(_ createInfo: (some Chainable<HeadlessSurfaceCreateInfoEXT>)) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateHeadlessSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }

    public func createHeadlessSurfaceEXT(_ createInfo: HeadlessSurfaceCreateInfoEXT) throws -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateHeadlessSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
}

public class PhysicalDevice: _HandleContainer {
    let handle: VkPhysicalDevice?
    public let instance: Instance

    public init(handle: VkPhysicalDevice!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func getProperties() -> PhysicalDeviceProperties {
        var out = VkPhysicalDeviceProperties()
        self.instance.dispatchTable.vkGetPhysicalDeviceProperties(self.handle, &out)
        return PhysicalDeviceProperties(cStruct: out)
    }

    public func getQueueFamilyProperties() -> Array<QueueFamilyProperties> {
        enumerate { pQueueFamilyProperties, pQueueFamilyPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyProperties(self.handle, pQueueFamilyPropertyCount, pQueueFamilyProperties)
        }.map { QueueFamilyProperties(cStruct: $0) }
    }

    public func getMemoryProperties() -> PhysicalDeviceMemoryProperties {
        var out = VkPhysicalDeviceMemoryProperties()
        self.instance.dispatchTable.vkGetPhysicalDeviceMemoryProperties(self.handle, &out)
        return PhysicalDeviceMemoryProperties(cStruct: out)
    }

    public func getFeatures() -> PhysicalDeviceFeatures {
        var out = VkPhysicalDeviceFeatures()
        self.instance.dispatchTable.vkGetPhysicalDeviceFeatures(self.handle, &out)
        return PhysicalDeviceFeatures(cStruct: out)
    }

    public func getFormatProperties(format: Format) -> FormatProperties {
        var out = VkFormatProperties()
        self.instance.dispatchTable.vkGetPhysicalDeviceFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), &out)
        return FormatProperties(cStruct: out)
    }

    public func getImageFormatProperties(format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags = []) throws -> ImageFormatProperties {
        var out = VkImageFormatProperties()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceImageFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), usage.rawValue, flags.rawValue, &out)
        )
        return ImageFormatProperties(cStruct: out)
    }

    public func createDevice(_ createInfo: (some Chainable<DeviceCreateInfo>)) throws -> Device {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDevice!
            try checkResult(
                self.instance.dispatchTable.vkCreateDevice(self.handle, ptr_createInfo, nil, &out)
            )
            return Device(handle: out, physicalDevice: self)
        }
    }

    public func createDevice(_ createInfo: DeviceCreateInfo) throws -> Device {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDevice!
            try checkResult(
                self.instance.dispatchTable.vkCreateDevice(self.handle, ptr_createInfo, nil, &out)
            )
            return Device(handle: out, physicalDevice: self)
        }
    }

    public func getDeviceLayerProperties() throws -> Array<LayerProperties> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkEnumerateDeviceLayerProperties(self.handle, pPropertyCount, pProperties)
        }.map { LayerProperties(cStruct: $0) }
    }

    public func getDeviceExtensionProperties(layerName: String?) throws -> Array<ExtensionProperties> {
        try layerName.withOptionalCString { cString_layerName in
            try enumerate { pProperties, pPropertyCount in
                self.instance.dispatchTable.vkEnumerateDeviceExtensionProperties(self.handle, cString_layerName, pPropertyCount, pProperties)
            }.map { ExtensionProperties(cStruct: $0) }
        }
    }

    public func getSparseImageFormatProperties(format: Format, type: ImageType, samples: SampleCountFlags, usage: ImageUsageFlags, tiling: ImageTiling) -> Array<SparseImageFormatProperties> {
        enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceSparseImageFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), usage.rawValue, VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), pPropertyCount, pProperties)
        }.map { SparseImageFormatProperties(cStruct: $0) }
    }

    public func getDisplayPropertiesKHR() throws -> Array<DisplayPropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayPropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPropertiesKHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlanePropertiesKHR() throws -> Array<DisplayPlanePropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayPlanePropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPlanePropertiesKHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlaneSupportedDisplaysKHR(planeIndex: UInt32) throws -> Array<DisplayKHR> {
        try enumerate { pDisplays, pDisplayCount in
            self.instance.dispatchTable.vkGetDisplayPlaneSupportedDisplaysKHR(self.handle, planeIndex, pDisplayCount, pDisplays)
        }.map { DisplayKHR(handle: $0, physicalDevice: self) }
    }

    public func getSurfaceSupportKHR(queueFamilyIndex: UInt32, surface: SurfaceKHR) throws -> Bool {
        var out = VkBool32()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceSupportKHR(self.handle, queueFamilyIndex, surface.handle, &out)
        )
        return out == VK_TRUE
    }

    public func getSurfaceCapabilitiesKHR(surface: SurfaceKHR) throws -> SurfaceCapabilitiesKHR {
        var out = VkSurfaceCapabilitiesKHR()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(self.handle, surface.handle, &out)
        )
        return SurfaceCapabilitiesKHR(cStruct: out)
    }

    public func getSurfaceFormatsKHR(surface: SurfaceKHR? = nil) throws -> Array<SurfaceFormatKHR> {
        try enumerate { pSurfaceFormats, pSurfaceFormatCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceFormatsKHR(self.handle, surface?.handle, pSurfaceFormatCount, pSurfaceFormats)
        }.map { SurfaceFormatKHR(cStruct: $0) }
    }

    public func getSurfacePresentModesKHR(surface: SurfaceKHR? = nil) throws -> Array<PresentModeKHR> {
        try enumerate { pPresentModes, pPresentModeCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfacePresentModesKHR(self.handle, surface?.handle, pPresentModeCount, pPresentModes)
        }.map { PresentModeKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
    }

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func getWaylandPresentationSupportKHR(queueFamilyIndex: UInt32, display: OpaquePointer) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceWaylandPresentationSupportKHR(self.handle, queueFamilyIndex, display) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func getUbmPresentationSupportSEC(queueFamilyIndex: UInt32, device: UnsafeMutablePointer<ubm_device>) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceUbmPresentationSupportSEC(self.handle, queueFamilyIndex, device) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getWin32PresentationSupportKHR(queueFamilyIndex: UInt32) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceWin32PresentationSupportKHR(self.handle, queueFamilyIndex) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func getXlibPresentationSupportKHR(queueFamilyIndex: UInt32, dpy: UnsafeMutablePointer<Display>, visualID: VisualID) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceXlibPresentationSupportKHR(self.handle, queueFamilyIndex, dpy, visualID) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func getXcbPresentationSupportKHR(queueFamilyIndex: UInt32, connection: UnsafeMutablePointer<xcb_connection_t>, visual_id: xcb_visualid_t) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceXcbPresentationSupportKHR(self.handle, queueFamilyIndex, connection, visual_id) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func getDirectFBPresentationSupportEXT(queueFamilyIndex: UInt32, dfb: UnsafeMutablePointer<IDirectFB>) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceDirectFBPresentationSupportEXT(self.handle, queueFamilyIndex, dfb) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func getScreenPresentationSupportQNX(queueFamilyIndex: UInt32, window: UnsafeMutablePointer<_screen_window>) -> Bool {
        self.instance.dispatchTable.vkGetPhysicalDeviceScreenPresentationSupportQNX(self.handle, queueFamilyIndex, window) == VK_TRUE
    }
    #endif

    public func getExternalImageFormatPropertiesNV(format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags = [], externalHandleType: ExternalMemoryHandleTypeFlagsNV = []) throws -> ExternalImageFormatPropertiesNV {
        var out = VkExternalImageFormatPropertiesNV()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalImageFormatPropertiesNV(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), usage.rawValue, flags.rawValue, externalHandleType.rawValue, &out)
        )
        return ExternalImageFormatPropertiesNV(cStruct: out)
    }

    public func getFeatures2() -> PhysicalDeviceFeatures2 {
        var out = VkPhysicalDeviceFeatures2()
        self.instance.dispatchTable.vkGetPhysicalDeviceFeatures2(self.handle, &out)
        return PhysicalDeviceFeatures2(cStruct: out)
    }

    public func getProperties2() -> PhysicalDeviceProperties2 {
        var out = VkPhysicalDeviceProperties2()
        self.instance.dispatchTable.vkGetPhysicalDeviceProperties2(self.handle, &out)
        return PhysicalDeviceProperties2(cStruct: out)
    }

    public func getFormatProperties2(format: Format) -> FormatProperties2 {
        var out = VkFormatProperties2()
        self.instance.dispatchTable.vkGetPhysicalDeviceFormatProperties2(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), &out)
        return FormatProperties2(cStruct: out)
    }

    public func getImageFormatProperties2(_ imageFormatInfo: (some Chainable<PhysicalDeviceImageFormatInfo2>)) throws -> ImageFormatProperties2 {
        try imageFormatInfo.withCStruct { ptr_imageFormatInfo in
            var out = VkImageFormatProperties2()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceImageFormatProperties2(self.handle, ptr_imageFormatInfo, &out)
            )
            return ImageFormatProperties2(cStruct: out)
        }
    }

    public func getImageFormatProperties2(_ imageFormatInfo: PhysicalDeviceImageFormatInfo2) throws -> ImageFormatProperties2 {
        try imageFormatInfo.withCStruct { ptr_imageFormatInfo in
            var out = VkImageFormatProperties2()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceImageFormatProperties2(self.handle, ptr_imageFormatInfo, &out)
            )
            return ImageFormatProperties2(cStruct: out)
        }
    }

    public func getQueueFamilyProperties2() -> Array<QueueFamilyProperties2> {
        enumerate { pQueueFamilyProperties, pQueueFamilyPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyProperties2(self.handle, pQueueFamilyPropertyCount, pQueueFamilyProperties)
        }.map { QueueFamilyProperties2(cStruct: $0) }
    }

    public func getMemoryProperties2() -> PhysicalDeviceMemoryProperties2 {
        var out = VkPhysicalDeviceMemoryProperties2()
        self.instance.dispatchTable.vkGetPhysicalDeviceMemoryProperties2(self.handle, &out)
        return PhysicalDeviceMemoryProperties2(cStruct: out)
    }

    public func getSparseImageFormatProperties2(_ formatInfo: (some Chainable<PhysicalDeviceSparseImageFormatInfo2>)) -> Array<SparseImageFormatProperties2> {
        formatInfo.withCStruct { ptr_formatInfo in
            enumerate { pProperties, pPropertyCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSparseImageFormatProperties2(self.handle, ptr_formatInfo, pPropertyCount, pProperties)
            }.map { SparseImageFormatProperties2(cStruct: $0) }
        }
    }

    public func getSparseImageFormatProperties2(_ formatInfo: PhysicalDeviceSparseImageFormatInfo2) -> Array<SparseImageFormatProperties2> {
        formatInfo.withCStruct { ptr_formatInfo in
            enumerate { pProperties, pPropertyCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSparseImageFormatProperties2(self.handle, ptr_formatInfo, pPropertyCount, pProperties)
            }.map { SparseImageFormatProperties2(cStruct: $0) }
        }
    }

    public func getExternalBufferProperties(_ externalBufferInfo: (some Chainable<PhysicalDeviceExternalBufferInfo>)) -> ExternalBufferProperties {
        externalBufferInfo.withCStruct { ptr_externalBufferInfo in
            var out = VkExternalBufferProperties()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalBufferProperties(self.handle, ptr_externalBufferInfo, &out)
            return ExternalBufferProperties(cStruct: out)
        }
    }

    public func getExternalBufferProperties(_ externalBufferInfo: PhysicalDeviceExternalBufferInfo) -> ExternalBufferProperties {
        externalBufferInfo.withCStruct { ptr_externalBufferInfo in
            var out = VkExternalBufferProperties()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalBufferProperties(self.handle, ptr_externalBufferInfo, &out)
            return ExternalBufferProperties(cStruct: out)
        }
    }

    public func getExternalSemaphoreProperties(_ externalSemaphoreInfo: (some Chainable<PhysicalDeviceExternalSemaphoreInfo>)) -> ExternalSemaphoreProperties {
        externalSemaphoreInfo.withCStruct { ptr_externalSemaphoreInfo in
            var out = VkExternalSemaphoreProperties()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalSemaphoreProperties(self.handle, ptr_externalSemaphoreInfo, &out)
            return ExternalSemaphoreProperties(cStruct: out)
        }
    }

    public func getExternalSemaphoreProperties(_ externalSemaphoreInfo: PhysicalDeviceExternalSemaphoreInfo) -> ExternalSemaphoreProperties {
        externalSemaphoreInfo.withCStruct { ptr_externalSemaphoreInfo in
            var out = VkExternalSemaphoreProperties()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalSemaphoreProperties(self.handle, ptr_externalSemaphoreInfo, &out)
            return ExternalSemaphoreProperties(cStruct: out)
        }
    }

    public func getExternalFenceProperties(_ externalFenceInfo: (some Chainable<PhysicalDeviceExternalFenceInfo>)) -> ExternalFenceProperties {
        externalFenceInfo.withCStruct { ptr_externalFenceInfo in
            var out = VkExternalFenceProperties()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalFenceProperties(self.handle, ptr_externalFenceInfo, &out)
            return ExternalFenceProperties(cStruct: out)
        }
    }

    public func getExternalFenceProperties(_ externalFenceInfo: PhysicalDeviceExternalFenceInfo) -> ExternalFenceProperties {
        externalFenceInfo.withCStruct { ptr_externalFenceInfo in
            var out = VkExternalFenceProperties()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalFenceProperties(self.handle, ptr_externalFenceInfo, &out)
            return ExternalFenceProperties(cStruct: out)
        }
    }

    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    public func acquireXlibDisplayEXT(display: DisplayKHR) throws -> Display {
        var out = Display()
        try checkResult(
            self.instance.dispatchTable.vkAcquireXlibDisplayEXT(self.handle, &out, display.handle)
        )
        return out
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    public func getRandROutputDisplayEXT(dpy: UnsafeMutablePointer<Display>, rrOutput: RROutput, display: UnsafeMutablePointer<VkDisplayKHR?>) throws -> Void {
        try checkResult(
            self.instance.dispatchTable.vkGetRandROutputDisplayEXT(self.handle, dpy, rrOutput, display)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getWinrtDisplayNV(deviceRelativeId: UInt32) throws -> DisplayKHR {
        var out: VkDisplayKHR!
        try checkResult(
            self.instance.dispatchTable.vkGetWinrtDisplayNV(self.handle, deviceRelativeId, &out)
        )
        return DisplayKHR(handle: out, physicalDevice: self)
    }
    #endif

    public func getSurfaceCapabilities2EXT(surface: SurfaceKHR) throws -> SurfaceCapabilities2EXT {
        var out = VkSurfaceCapabilities2EXT()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilities2EXT(self.handle, surface.handle, &out)
        )
        return SurfaceCapabilities2EXT(cStruct: out)
    }

    public func getPresentRectanglesKHR(surface: SurfaceKHR) throws -> Array<Rect2D> {
        try enumerate { pRects, pRectCount in
            self.instance.dispatchTable.vkGetPhysicalDevicePresentRectanglesKHR(self.handle, surface.handle, pRectCount, pRects)
        }.map { Rect2D(cStruct: $0) }
    }

    public func getMultisamplePropertiesEXT(samples: SampleCountFlags) -> MultisamplePropertiesEXT {
        var out = VkMultisamplePropertiesEXT()
        self.instance.dispatchTable.vkGetPhysicalDeviceMultisamplePropertiesEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), &out)
        return MultisamplePropertiesEXT(cStruct: out)
    }

    public func getSurfaceCapabilities2KHR(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws -> SurfaceCapabilities2KHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            var out = VkSurfaceCapabilities2KHR()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilities2KHR(self.handle, ptr_surfaceInfo, &out)
            )
            return SurfaceCapabilities2KHR(cStruct: out)
        }
    }

    public func getSurfaceCapabilities2KHR(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR) throws -> SurfaceCapabilities2KHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            var out = VkSurfaceCapabilities2KHR()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilities2KHR(self.handle, ptr_surfaceInfo, &out)
            )
            return SurfaceCapabilities2KHR(cStruct: out)
        }
    }

    public func getSurfaceFormats2KHR(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws -> Array<SurfaceFormat2KHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            try enumerate { pSurfaceFormats, pSurfaceFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceFormats2KHR(self.handle, ptr_surfaceInfo, pSurfaceFormatCount, pSurfaceFormats)
            }.map { SurfaceFormat2KHR(cStruct: $0) }
        }
    }

    public func getSurfaceFormats2KHR(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR) throws -> Array<SurfaceFormat2KHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            try enumerate { pSurfaceFormats, pSurfaceFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceFormats2KHR(self.handle, ptr_surfaceInfo, pSurfaceFormatCount, pSurfaceFormats)
            }.map { SurfaceFormat2KHR(cStruct: $0) }
        }
    }

    public func getDisplayProperties2KHR() throws -> Array<DisplayProperties2KHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayProperties2KHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayProperties2KHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlaneProperties2KHR() throws -> Array<DisplayPlaneProperties2KHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayPlaneProperties2KHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPlaneProperties2KHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlaneCapabilities2KHR(_ displayPlaneInfo: (some Chainable<DisplayPlaneInfo2KHR>)) throws -> DisplayPlaneCapabilities2KHR {
        try displayPlaneInfo.withCStruct { ptr_displayPlaneInfo in
            var out = VkDisplayPlaneCapabilities2KHR()
            try checkResult(
                self.instance.dispatchTable.vkGetDisplayPlaneCapabilities2KHR(self.handle, ptr_displayPlaneInfo, &out)
            )
            return DisplayPlaneCapabilities2KHR(cStruct: out)
        }
    }

    public func getDisplayPlaneCapabilities2KHR(_ displayPlaneInfo: DisplayPlaneInfo2KHR) throws -> DisplayPlaneCapabilities2KHR {
        try displayPlaneInfo.withCStruct { ptr_displayPlaneInfo in
            var out = VkDisplayPlaneCapabilities2KHR()
            try checkResult(
                self.instance.dispatchTable.vkGetDisplayPlaneCapabilities2KHR(self.handle, ptr_displayPlaneInfo, &out)
            )
            return DisplayPlaneCapabilities2KHR(cStruct: out)
        }
    }

    public func getCalibrateableTimeDomainsKHR() throws -> Array<TimeDomainKHR> {
        try enumerate { pTimeDomains, pTimeDomainCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCalibrateableTimeDomainsKHR(self.handle, pTimeDomainCount, pTimeDomains)
        }.map { TimeDomainKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
    }

    public func getCooperativeMatrixPropertiesNV() throws -> Array<CooperativeMatrixPropertiesNV> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixPropertiesNV(cStruct: $0) }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSurfacePresentModes2EXT(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws -> Array<PresentModeKHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            try enumerate { pPresentModes, pPresentModeCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, pPresentModeCount, pPresentModes)
            }.map { PresentModeKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSurfacePresentModes2EXT(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR) throws -> Array<PresentModeKHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            try enumerate { pPresentModes, pPresentModeCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, pPresentModeCount, pPresentModes)
            }.map { PresentModeKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
        }
    }
    #endif

    public func getQueueFamilyPerformanceQueryCountersKHR(queueFamilyIndex: UInt32, counterCount: UnsafeMutablePointer<UInt32>, counters: UnsafeMutablePointer<VkPerformanceCounterKHR>?, counterDescriptions: UnsafeMutablePointer<VkPerformanceCounterDescriptionKHR>?) throws -> Void {
        try checkResult(
            self.instance.dispatchTable.vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(self.handle, queueFamilyIndex, counterCount, counters, counterDescriptions)
        )
    }

    public func getQueueFamilyPerformanceQueryPassesKHR(_ performanceQueryCreateInfo: (some Chainable<QueryPoolPerformanceCreateInfoKHR>)) -> UInt32 {
        performanceQueryCreateInfo.withCStruct { ptr_performanceQueryCreateInfo in
            var out = UInt32()
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(self.handle, ptr_performanceQueryCreateInfo, &out)
            return out
        }
    }

    public func getQueueFamilyPerformanceQueryPassesKHR(_ performanceQueryCreateInfo: QueryPoolPerformanceCreateInfoKHR) -> UInt32 {
        performanceQueryCreateInfo.withCStruct { ptr_performanceQueryCreateInfo in
            var out = UInt32()
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(self.handle, ptr_performanceQueryCreateInfo, &out)
            return out
        }
    }

    public func getSupportedFramebufferMixedSamplesCombinationsNV() throws -> Array<FramebufferMixedSamplesCombinationNV> {
        try enumerate { pCombinations, pCombinationCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(self.handle, pCombinationCount, pCombinations)
        }.map { FramebufferMixedSamplesCombinationNV(cStruct: $0) }
    }

    public func getToolProperties() throws -> Array<PhysicalDeviceToolProperties> {
        try enumerate { pToolProperties, pToolCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceToolProperties(self.handle, pToolCount, pToolProperties)
        }.map { PhysicalDeviceToolProperties(cStruct: $0) }
    }

    public func getFragmentShadingRatesKHR() throws -> Array<PhysicalDeviceFragmentShadingRateKHR> {
        try enumerate { pFragmentShadingRates, pFragmentShadingRateCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceFragmentShadingRatesKHR(self.handle, pFragmentShadingRateCount, pFragmentShadingRates)
        }.map { PhysicalDeviceFragmentShadingRateKHR(cStruct: $0) }
    }

    public func getVideoCapabilitiesKHR(videoProfile: (some Chainable<VideoProfileInfoKHR>)) throws -> VideoCapabilitiesKHR {
        try videoProfile.withCStruct { ptr_videoProfile in
            var out = VkVideoCapabilitiesKHR()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoCapabilitiesKHR(self.handle, ptr_videoProfile, &out)
            )
            return VideoCapabilitiesKHR(cStruct: out)
        }
    }

    public func getVideoCapabilitiesKHR(videoProfile: VideoProfileInfoKHR) throws -> VideoCapabilitiesKHR {
        try videoProfile.withCStruct { ptr_videoProfile in
            var out = VkVideoCapabilitiesKHR()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoCapabilitiesKHR(self.handle, ptr_videoProfile, &out)
            )
            return VideoCapabilitiesKHR(cStruct: out)
        }
    }

    public func getVideoFormatPropertiesKHR(_ videoFormatInfo: (some Chainable<PhysicalDeviceVideoFormatInfoKHR>)) throws -> Array<VideoFormatPropertiesKHR> {
        try videoFormatInfo.withCStruct { ptr_videoFormatInfo in
            try enumerate { pVideoFormatProperties, pVideoFormatPropertyCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoFormatPropertiesKHR(self.handle, ptr_videoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties)
            }.map { VideoFormatPropertiesKHR(cStruct: $0) }
        }
    }

    public func getVideoFormatPropertiesKHR(_ videoFormatInfo: PhysicalDeviceVideoFormatInfoKHR) throws -> Array<VideoFormatPropertiesKHR> {
        try videoFormatInfo.withCStruct { ptr_videoFormatInfo in
            try enumerate { pVideoFormatProperties, pVideoFormatPropertyCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoFormatPropertiesKHR(self.handle, ptr_videoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties)
            }.map { VideoFormatPropertiesKHR(cStruct: $0) }
        }
    }

    public func getVideoEncodeQualityLevelPropertiesKHR(_ qualityLevelInfo: (some Chainable<PhysicalDeviceVideoEncodeQualityLevelInfoKHR>)) throws -> VideoEncodeQualityLevelPropertiesKHR {
        try qualityLevelInfo.withCStruct { ptr_qualityLevelInfo in
            var out = VkVideoEncodeQualityLevelPropertiesKHR()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(self.handle, ptr_qualityLevelInfo, &out)
            )
            return VideoEncodeQualityLevelPropertiesKHR(cStruct: out)
        }
    }

    public func getVideoEncodeQualityLevelPropertiesKHR(_ qualityLevelInfo: PhysicalDeviceVideoEncodeQualityLevelInfoKHR) throws -> VideoEncodeQualityLevelPropertiesKHR {
        try qualityLevelInfo.withCStruct { ptr_qualityLevelInfo in
            var out = VkVideoEncodeQualityLevelPropertiesKHR()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(self.handle, ptr_qualityLevelInfo, &out)
            )
            return VideoEncodeQualityLevelPropertiesKHR(cStruct: out)
        }
    }

    public func acquireDrmDisplayEXT(drmFd: Int32, display: DisplayKHR) throws -> Void {
        try checkResult(
            self.instance.dispatchTable.vkAcquireDrmDisplayEXT(self.handle, drmFd, display.handle)
        )
    }

    public func getDrmDisplayEXT(drmFd: Int32, connectorId: UInt32) throws -> DisplayKHR {
        var out: VkDisplayKHR!
        try checkResult(
            self.instance.dispatchTable.vkGetDrmDisplayEXT(self.handle, drmFd, connectorId, &out)
        )
        return DisplayKHR(handle: out, physicalDevice: self)
    }

    public func getOpticalFlowImageFormatsNV(_ opticalFlowImageFormatInfo: (some Chainable<OpticalFlowImageFormatInfoNV>)) throws -> Array<OpticalFlowImageFormatPropertiesNV> {
        try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo in
            try enumerate { pImageFormatProperties, pFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceOpticalFlowImageFormatsNV(self.handle, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
            }.map { OpticalFlowImageFormatPropertiesNV(cStruct: $0) }
        }
    }

    public func getOpticalFlowImageFormatsNV(_ opticalFlowImageFormatInfo: OpticalFlowImageFormatInfoNV) throws -> Array<OpticalFlowImageFormatPropertiesNV> {
        try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo in
            try enumerate { pImageFormatProperties, pFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceOpticalFlowImageFormatsNV(self.handle, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
            }.map { OpticalFlowImageFormatPropertiesNV(cStruct: $0) }
        }
    }

    public func getCooperativeMatrixPropertiesKHR() throws -> Array<CooperativeMatrixPropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixPropertiesKHR(cStruct: $0) }
    }

    public func getCooperativeMatrixFlexibleDimensionsPropertiesNV() throws -> Array<CooperativeMatrixFlexibleDimensionsPropertiesNV> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixFlexibleDimensionsPropertiesNV(cStruct: $0) }
    }

    public func getCooperativeVectorPropertiesNV() throws -> Array<CooperativeVectorPropertiesNV> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeVectorPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeVectorPropertiesNV(cStruct: $0) }
    }

    public func getShaderInstrumentationMetricsARM() throws -> Array<ShaderInstrumentationMetricDescriptionARM> {
        try enumerate { pDescriptions, pDescriptionCount in
            self.instance.dispatchTable.vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM(self.handle, pDescriptionCount, pDescriptions)
        }.map { ShaderInstrumentationMetricDescriptionARM(cStruct: $0) }
    }

    public func getExternalTensorPropertiesARM(_ externalTensorInfo: (some Chainable<PhysicalDeviceExternalTensorInfoARM>)) -> ExternalTensorPropertiesARM {
        externalTensorInfo.withCStruct { ptr_externalTensorInfo in
            var out = VkExternalTensorPropertiesARM()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalTensorPropertiesARM(self.handle, ptr_externalTensorInfo, &out)
            return ExternalTensorPropertiesARM(cStruct: out)
        }
    }

    public func getExternalTensorPropertiesARM(_ externalTensorInfo: PhysicalDeviceExternalTensorInfoARM) -> ExternalTensorPropertiesARM {
        externalTensorInfo.withCStruct { ptr_externalTensorInfo in
            var out = VkExternalTensorPropertiesARM()
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalTensorPropertiesARM(self.handle, ptr_externalTensorInfo, &out)
            return ExternalTensorPropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyDataGraphPropertiesARM(queueFamilyIndex: UInt32) throws -> Array<QueueFamilyDataGraphPropertiesARM> {
        try enumerate { pQueueFamilyDataGraphProperties, pQueueFamilyDataGraphPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM(self.handle, queueFamilyIndex, pQueueFamilyDataGraphPropertyCount, pQueueFamilyDataGraphProperties)
        }.map { QueueFamilyDataGraphPropertiesARM(cStruct: $0) }
    }

    public func getQueueFamilyDataGraphProcessingEnginePropertiesARM(_ queueFamilyDataGraphProcessingEngineInfo: (some Chainable<PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM>)) -> QueueFamilyDataGraphProcessingEnginePropertiesARM {
        queueFamilyDataGraphProcessingEngineInfo.withCStruct { ptr_queueFamilyDataGraphProcessingEngineInfo in
            var out = VkQueueFamilyDataGraphProcessingEnginePropertiesARM()
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM(self.handle, ptr_queueFamilyDataGraphProcessingEngineInfo, &out)
            return QueueFamilyDataGraphProcessingEnginePropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyDataGraphProcessingEnginePropertiesARM(_ queueFamilyDataGraphProcessingEngineInfo: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM) -> QueueFamilyDataGraphProcessingEnginePropertiesARM {
        queueFamilyDataGraphProcessingEngineInfo.withCStruct { ptr_queueFamilyDataGraphProcessingEngineInfo in
            var out = VkQueueFamilyDataGraphProcessingEnginePropertiesARM()
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM(self.handle, ptr_queueFamilyDataGraphProcessingEngineInfo, &out)
            return QueueFamilyDataGraphProcessingEnginePropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyPerformanceCountersByRegionARM(queueFamilyIndex: UInt32, counterCount: UnsafeMutablePointer<UInt32>, counters: UnsafeMutablePointer<VkPerformanceCounterARM>?, counterDescriptions: UnsafeMutablePointer<VkPerformanceCounterDescriptionARM>?) throws -> Void {
        try checkResult(
            self.instance.dispatchTable.vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM(self.handle, queueFamilyIndex, counterCount, counters, counterDescriptions)
        )
    }

    public func getDescriptorSizeEXT(descriptorType: DescriptorType) -> VkDeviceSize {
        self.instance.dispatchTable.vkGetPhysicalDeviceDescriptorSizeEXT(self.handle, VkDescriptorType(rawValue: VkDescriptorType.RawValue(descriptorType.rawValue)))
    }

    public func getQueueFamilyDataGraphEngineOperationPropertiesARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: (some Chainable<QueueFamilyDataGraphPropertiesARM>)) throws -> VkBaseOutStructure {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties in
            var out = VkBaseOutStructure()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, &out)
            )
            return out
        }
    }

    public func getQueueFamilyDataGraphEngineOperationPropertiesARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: QueueFamilyDataGraphPropertiesARM) throws -> VkBaseOutStructure {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties in
            var out = VkBaseOutStructure()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, &out)
            )
            return out
        }
    }

    public func getQueueFamilyDataGraphOpticalFlowImageFormatsARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: (some Chainable<QueueFamilyDataGraphPropertiesARM>), opticalFlowImageFormatInfo: (some Chainable<DataGraphOpticalFlowImageFormatInfoARM>)) throws -> Array<DataGraphOpticalFlowImageFormatPropertiesARM> {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties in
            try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo in
                try enumerate { pImageFormatProperties, pFormatCount in
                    self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
                }.map { DataGraphOpticalFlowImageFormatPropertiesARM(cStruct: $0) }
            }
        }
    }

    public func getQueueFamilyDataGraphOpticalFlowImageFormatsARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: QueueFamilyDataGraphPropertiesARM, opticalFlowImageFormatInfo: DataGraphOpticalFlowImageFormatInfoARM) throws -> Array<DataGraphOpticalFlowImageFormatPropertiesARM> {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties in
            try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo in
                try enumerate { pImageFormatProperties, pFormatCount in
                    self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
                }.map { DataGraphOpticalFlowImageFormatPropertiesARM(cStruct: $0) }
            }
        }
    }
}

public class Device: _HandleContainer {
    let handle: VkDevice?
    public let physicalDevice: PhysicalDevice
    let dispatchTable: DeviceDispatchTable

    public init(handle: VkDevice!, physicalDevice: PhysicalDevice) {
        self.handle = handle
        self.physicalDevice = physicalDevice
        self.dispatchTable = DeviceDispatchTable(vkGetDeviceProcAddr: self.physicalDevice.instance.dispatchTable.vkGetDeviceProcAddr, device: handle)
    }

    public func getProcAddr(name: String) -> PFN_vkVoidFunction? {
        name.withCString { cString_name in
            self.physicalDevice.instance.dispatchTable.vkGetDeviceProcAddr(self.handle, cString_name)
        }
    }

    public func destroy() -> Void {
        self.dispatchTable.vkDestroyDevice(self.handle, nil)
    }

    public func getQueue(queueFamilyIndex: UInt32, queueIndex: UInt32) -> Queue {
        var out: VkQueue!
        self.dispatchTable.vkGetDeviceQueue(self.handle, queueFamilyIndex, queueIndex, &out)
        return Queue(handle: out, device: self)
    }

    public func waitIdle() throws -> Void {
        try checkResult(
            self.dispatchTable.vkDeviceWaitIdle(self.handle)
        )
    }

    public func allocateMemory(_ allocateInfo: (some Chainable<MemoryAllocateInfo>)) throws -> DeviceMemory {
        try allocateInfo.withCStruct { ptr_allocateInfo in
            var out: VkDeviceMemory!
            try checkResult(
                self.dispatchTable.vkAllocateMemory(self.handle, ptr_allocateInfo, nil, &out)
            )
            return DeviceMemory(handle: out, device: self)
        }
    }

    public func allocateMemory(_ allocateInfo: MemoryAllocateInfo) throws -> DeviceMemory {
        try allocateInfo.withCStruct { ptr_allocateInfo in
            var out: VkDeviceMemory!
            try checkResult(
                self.dispatchTable.vkAllocateMemory(self.handle, ptr_allocateInfo, nil, &out)
            )
            return DeviceMemory(handle: out, device: self)
        }
    }

    public func flushMappedMemoryRanges(memoryRanges: Array<MappedMemoryRange>) throws -> Void {
        try memoryRanges.withCStructBufferPointer { ptr_memoryRanges in
            try checkResult(
                self.dispatchTable.vkFlushMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func invalidateMappedMemoryRanges(memoryRanges: Array<MappedMemoryRange>) throws -> Void {
        try memoryRanges.withCStructBufferPointer { ptr_memoryRanges in
            try checkResult(
                self.dispatchTable.vkInvalidateMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func createFence(_ createInfo: (some Chainable<FenceCreateInfo>)) throws -> Fence {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkCreateFence(self.handle, ptr_createInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func createFence(_ createInfo: FenceCreateInfo) throws -> Fence {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkCreateFence(self.handle, ptr_createInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func resetFences(fences: Array<Fence>) throws -> Void {
        try fences.map{ $0.handle }.withUnsafeBufferPointer { ptr_fences in
            try checkResult(
                self.dispatchTable.vkResetFences(self.handle, UInt32(ptr_fences.count), ptr_fences.baseAddress)
            )
        }
    }

    public func waitForFences(fences: Array<Fence>, waitAll: Bool, timeout: UInt64) throws -> Void {
        try fences.map{ $0.handle }.withUnsafeBufferPointer { ptr_fences in
            try checkResult(
                self.dispatchTable.vkWaitForFences(self.handle, UInt32(ptr_fences.count), ptr_fences.baseAddress, VkBool32(waitAll ? VK_TRUE : VK_FALSE), timeout)
            )
        }
    }

    public func createSemaphore(_ createInfo: (some Chainable<SemaphoreCreateInfo>)) throws -> Semaphore {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSemaphore!
            try checkResult(
                self.dispatchTable.vkCreateSemaphore(self.handle, ptr_createInfo, nil, &out)
            )
            return Semaphore(handle: out, device: self)
        }
    }

    public func createSemaphore(_ createInfo: SemaphoreCreateInfo) throws -> Semaphore {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSemaphore!
            try checkResult(
                self.dispatchTable.vkCreateSemaphore(self.handle, ptr_createInfo, nil, &out)
            )
            return Semaphore(handle: out, device: self)
        }
    }

    public func createEvent(_ createInfo: (some Chainable<EventCreateInfo>)) throws -> Event {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkEvent!
            try checkResult(
                self.dispatchTable.vkCreateEvent(self.handle, ptr_createInfo, nil, &out)
            )
            return Event(handle: out, device: self)
        }
    }

    public func createEvent(_ createInfo: EventCreateInfo) throws -> Event {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkEvent!
            try checkResult(
                self.dispatchTable.vkCreateEvent(self.handle, ptr_createInfo, nil, &out)
            )
            return Event(handle: out, device: self)
        }
    }

    public func createQueryPool(_ createInfo: (some Chainable<QueryPoolCreateInfo>)) throws -> QueryPool {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkQueryPool!
            try checkResult(
                self.dispatchTable.vkCreateQueryPool(self.handle, ptr_createInfo, nil, &out)
            )
            return QueryPool(handle: out, device: self)
        }
    }

    public func createQueryPool(_ createInfo: QueryPoolCreateInfo) throws -> QueryPool {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkQueryPool!
            try checkResult(
                self.dispatchTable.vkCreateQueryPool(self.handle, ptr_createInfo, nil, &out)
            )
            return QueryPool(handle: out, device: self)
        }
    }

    public func createBuffer(_ createInfo: (some Chainable<BufferCreateInfo>)) throws -> Buffer {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkBuffer!
            try checkResult(
                self.dispatchTable.vkCreateBuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Buffer(handle: out, device: self)
        }
    }

    public func createBuffer(_ createInfo: BufferCreateInfo) throws -> Buffer {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkBuffer!
            try checkResult(
                self.dispatchTable.vkCreateBuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Buffer(handle: out, device: self)
        }
    }

    public func createBufferView(_ createInfo: (some Chainable<BufferViewCreateInfo>)) throws -> BufferView {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkBufferView!
            try checkResult(
                self.dispatchTable.vkCreateBufferView(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferView(handle: out, device: self)
        }
    }

    public func createBufferView(_ createInfo: BufferViewCreateInfo) throws -> BufferView {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkBufferView!
            try checkResult(
                self.dispatchTable.vkCreateBufferView(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferView(handle: out, device: self)
        }
    }

    public func createImage(_ createInfo: (some Chainable<ImageCreateInfo>)) throws -> Image {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkImage!
            try checkResult(
                self.dispatchTable.vkCreateImage(self.handle, ptr_createInfo, nil, &out)
            )
            return Image(handle: out, device: self)
        }
    }

    public func createImage(_ createInfo: ImageCreateInfo) throws -> Image {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkImage!
            try checkResult(
                self.dispatchTable.vkCreateImage(self.handle, ptr_createInfo, nil, &out)
            )
            return Image(handle: out, device: self)
        }
    }

    public func createImageView(_ createInfo: (some Chainable<ImageViewCreateInfo>)) throws -> ImageView {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkImageView!
            try checkResult(
                self.dispatchTable.vkCreateImageView(self.handle, ptr_createInfo, nil, &out)
            )
            return ImageView(handle: out, device: self)
        }
    }

    public func createImageView(_ createInfo: ImageViewCreateInfo) throws -> ImageView {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkImageView!
            try checkResult(
                self.dispatchTable.vkCreateImageView(self.handle, ptr_createInfo, nil, &out)
            )
            return ImageView(handle: out, device: self)
        }
    }

    public func createShaderModule(_ createInfo: (some Chainable<ShaderModuleCreateInfo>)) throws -> ShaderModule {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkShaderModule!
            try checkResult(
                self.dispatchTable.vkCreateShaderModule(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderModule(handle: out, device: self)
        }
    }

    public func createShaderModule(_ createInfo: ShaderModuleCreateInfo) throws -> ShaderModule {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkShaderModule!
            try checkResult(
                self.dispatchTable.vkCreateShaderModule(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderModule(handle: out, device: self)
        }
    }

    public func createPipelineCache(_ createInfo: (some Chainable<PipelineCacheCreateInfo>)) throws -> PipelineCache {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkPipelineCache!
            try checkResult(
                self.dispatchTable.vkCreatePipelineCache(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineCache(handle: out, device: self)
        }
    }

    public func createPipelineCache(_ createInfo: PipelineCacheCreateInfo) throws -> PipelineCache {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkPipelineCache!
            try checkResult(
                self.dispatchTable.vkCreatePipelineCache(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineCache(handle: out, device: self)
        }
    }

    public func createPipelineBinariesKHR(_ createInfo: (some Chainable<PipelineBinaryCreateInfoKHR>)) throws -> PipelineBinaryHandlesInfoKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out = VkPipelineBinaryHandlesInfoKHR()
            try checkResult(
                self.dispatchTable.vkCreatePipelineBinariesKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineBinaryHandlesInfoKHR(cStruct: out, device: self)
        }
    }

    public func createPipelineBinariesKHR(_ createInfo: PipelineBinaryCreateInfoKHR) throws -> PipelineBinaryHandlesInfoKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out = VkPipelineBinaryHandlesInfoKHR()
            try checkResult(
                self.dispatchTable.vkCreatePipelineBinariesKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineBinaryHandlesInfoKHR(cStruct: out, device: self)
        }
    }

    public func getPipelineKeyKHR(_ pipelineCreateInfo: (some Chainable<PipelineCreateInfoKHR>)) throws -> PipelineBinaryKeyKHR {
        try pipelineCreateInfo.withCStruct { ptr_pipelineCreateInfo in
            var out = VkPipelineBinaryKeyKHR()
            try checkResult(
                self.dispatchTable.vkGetPipelineKeyKHR(self.handle, ptr_pipelineCreateInfo, &out)
            )
            return PipelineBinaryKeyKHR(cStruct: out)
        }
    }

    public func getPipelineKeyKHR(_ pipelineCreateInfo: PipelineCreateInfoKHR? = nil) throws -> PipelineBinaryKeyKHR {
        try pipelineCreateInfo.withOptionalCStruct { ptr_pipelineCreateInfo in
            var out = VkPipelineBinaryKeyKHR()
            try checkResult(
                self.dispatchTable.vkGetPipelineKeyKHR(self.handle, ptr_pipelineCreateInfo, &out)
            )
            return PipelineBinaryKeyKHR(cStruct: out)
        }
    }

    public func getPipelineBinaryDataKHR(info: (some Chainable<PipelineBinaryDataInfoKHR>), pipelineBinaryKey: UnsafeMutablePointer<VkPipelineBinaryKeyKHR>, pipelineBinaryDataSize: UnsafeMutablePointer<Int>, pipelineBinaryData: UnsafeMutableRawPointer?) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetPipelineBinaryDataKHR(self.handle, ptr_info, pipelineBinaryKey, pipelineBinaryDataSize, pipelineBinaryData)
            )
        }
    }

    public func getPipelineBinaryDataKHR(info: PipelineBinaryDataInfoKHR, pipelineBinaryKey: UnsafeMutablePointer<VkPipelineBinaryKeyKHR>, pipelineBinaryDataSize: UnsafeMutablePointer<Int>, pipelineBinaryData: UnsafeMutableRawPointer?) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetPipelineBinaryDataKHR(self.handle, ptr_info, pipelineBinaryKey, pipelineBinaryDataSize, pipelineBinaryData)
            )
        }
    }

    public func releaseCapturedPipelineDataKHR(info: (some Chainable<ReleaseCapturedPipelineDataInfoKHR>)) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkReleaseCapturedPipelineDataKHR(self.handle, ptr_info, nil)
            )
        }
    }

    public func releaseCapturedPipelineDataKHR(info: ReleaseCapturedPipelineDataInfoKHR) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkReleaseCapturedPipelineDataKHR(self.handle, ptr_info, nil)
            )
        }
    }

    public func createGraphicsPipelines(pipelineCache: PipelineCache? = nil, createInfos: Array<GraphicsPipelineCreateInfo>) throws -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateGraphicsPipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createComputePipelines(pipelineCache: PipelineCache? = nil, createInfos: Array<ComputePipelineCreateInfo>) throws -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateComputePipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createPipelineLayout(_ createInfo: (some Chainable<PipelineLayoutCreateInfo>)) throws -> PipelineLayout {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkPipelineLayout!
            try checkResult(
                self.dispatchTable.vkCreatePipelineLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineLayout(handle: out, device: self)
        }
    }

    public func createPipelineLayout(_ createInfo: PipelineLayoutCreateInfo) throws -> PipelineLayout {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkPipelineLayout!
            try checkResult(
                self.dispatchTable.vkCreatePipelineLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineLayout(handle: out, device: self)
        }
    }

    public func createSampler(_ createInfo: (some Chainable<SamplerCreateInfo>)) throws -> Sampler {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSampler!
            try checkResult(
                self.dispatchTable.vkCreateSampler(self.handle, ptr_createInfo, nil, &out)
            )
            return Sampler(handle: out, device: self)
        }
    }

    public func createSampler(_ createInfo: SamplerCreateInfo) throws -> Sampler {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSampler!
            try checkResult(
                self.dispatchTable.vkCreateSampler(self.handle, ptr_createInfo, nil, &out)
            )
            return Sampler(handle: out, device: self)
        }
    }

    public func createDescriptorSetLayout(_ createInfo: (some Chainable<DescriptorSetLayoutCreateInfo>)) throws -> DescriptorSetLayout {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDescriptorSetLayout!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorSetLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorSetLayout(handle: out, device: self)
        }
    }

    public func createDescriptorSetLayout(_ createInfo: DescriptorSetLayoutCreateInfo) throws -> DescriptorSetLayout {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDescriptorSetLayout!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorSetLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorSetLayout(handle: out, device: self)
        }
    }

    public func createDescriptorPool(_ createInfo: (some Chainable<DescriptorPoolCreateInfo>)) throws -> DescriptorPool {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDescriptorPool!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorPool(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorPool(handle: out, device: self)
        }
    }

    public func createDescriptorPool(_ createInfo: DescriptorPoolCreateInfo) throws -> DescriptorPool {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDescriptorPool!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorPool(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorPool(handle: out, device: self)
        }
    }

    public func allocateDescriptorSets(_ allocateInfo: (some Chainable<DescriptorSetAllocateInfo>)) throws -> Array<DescriptorSet> {
        try allocateInfo.withCStruct { ptr_allocateInfo in
            try Array<VkDescriptorSet?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.descriptorSetCount)) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkAllocateDescriptorSets(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DescriptorSet(handle: $0, descriptorPool: allocateInfo.base.descriptorPool) }
        }
    }

    public func allocateDescriptorSets(_ allocateInfo: DescriptorSetAllocateInfo) throws -> Array<DescriptorSet> {
        try allocateInfo.withCStruct { ptr_allocateInfo in
            try Array<VkDescriptorSet?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.descriptorSetCount)) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkAllocateDescriptorSets(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DescriptorSet(handle: $0, descriptorPool: allocateInfo.base.descriptorPool) }
        }
    }

    public func updateDescriptorSets(descriptorWrites: Array<WriteDescriptorSet> = [], descriptorCopies: Array<CopyDescriptorSet> = []) -> Void {
        descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            descriptorCopies.withCStructBufferPointer { ptr_descriptorCopies in
                self.dispatchTable.vkUpdateDescriptorSets(self.handle, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress, UInt32(ptr_descriptorCopies.count), ptr_descriptorCopies.baseAddress)
            }
        }
    }

    public func createFramebuffer(_ createInfo: (some Chainable<FramebufferCreateInfo>)) throws -> Framebuffer {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkFramebuffer!
            try checkResult(
                self.dispatchTable.vkCreateFramebuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Framebuffer(handle: out, device: self)
        }
    }

    public func createFramebuffer(_ createInfo: FramebufferCreateInfo) throws -> Framebuffer {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkFramebuffer!
            try checkResult(
                self.dispatchTable.vkCreateFramebuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Framebuffer(handle: out, device: self)
        }
    }

    public func createRenderPass(_ createInfo: (some Chainable<RenderPassCreateInfo>)) throws -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func createRenderPass(_ createInfo: RenderPassCreateInfo) throws -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func getRenderingAreaGranularity(_ renderingAreaInfo: (some Chainable<RenderingAreaInfo>)) -> Extent2D {
        renderingAreaInfo.withCStruct { ptr_renderingAreaInfo in
            var out = VkExtent2D()
            self.dispatchTable.vkGetRenderingAreaGranularity(self.handle, ptr_renderingAreaInfo, &out)
            return Extent2D(cStruct: out)
        }
    }

    public func getRenderingAreaGranularity(_ renderingAreaInfo: RenderingAreaInfo) -> Extent2D {
        renderingAreaInfo.withCStruct { ptr_renderingAreaInfo in
            var out = VkExtent2D()
            self.dispatchTable.vkGetRenderingAreaGranularity(self.handle, ptr_renderingAreaInfo, &out)
            return Extent2D(cStruct: out)
        }
    }

    public func createCommandPool(_ createInfo: (some Chainable<CommandPoolCreateInfo>)) throws -> CommandPool {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCommandPool!
            try checkResult(
                self.dispatchTable.vkCreateCommandPool(self.handle, ptr_createInfo, nil, &out)
            )
            return CommandPool(handle: out, device: self)
        }
    }

    public func createCommandPool(_ createInfo: CommandPoolCreateInfo) throws -> CommandPool {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCommandPool!
            try checkResult(
                self.dispatchTable.vkCreateCommandPool(self.handle, ptr_createInfo, nil, &out)
            )
            return CommandPool(handle: out, device: self)
        }
    }

    public func allocateCommandBuffers(_ allocateInfo: (some Chainable<CommandBufferAllocateInfo>)) throws -> Array<CommandBuffer> {
        try allocateInfo.withCStruct { ptr_allocateInfo in
            try Array<VkCommandBuffer?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.commandBufferCount)) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkAllocateCommandBuffers(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { CommandBuffer(handle: $0, commandPool: allocateInfo.base.commandPool) }
        }
    }

    public func allocateCommandBuffers(_ allocateInfo: CommandBufferAllocateInfo) throws -> Array<CommandBuffer> {
        try allocateInfo.withCStruct { ptr_allocateInfo in
            try Array<VkCommandBuffer?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.commandBufferCount)) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkAllocateCommandBuffers(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { CommandBuffer(handle: $0, commandPool: allocateInfo.base.commandPool) }
        }
    }

    public func createSharedSwapchainsKHR(createInfos: Array<SwapchainCreateInfoKHR>) throws -> Array<SwapchainKHR> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkSwapchainKHR?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateSharedSwapchainsKHR(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { SwapchainKHR(handle: $0, device: self) }
        }
    }

    public func createSwapchainKHR(_ createInfo: (some Chainable<SwapchainCreateInfoKHR>)) throws -> SwapchainKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSwapchainKHR!
            try checkResult(
                self.dispatchTable.vkCreateSwapchainKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SwapchainKHR(handle: out, device: self)
        }
    }

    public func createSwapchainKHR(_ createInfo: SwapchainCreateInfoKHR) throws -> SwapchainKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSwapchainKHR!
            try checkResult(
                self.dispatchTable.vkCreateSwapchainKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SwapchainKHR(handle: out, device: self)
        }
    }

    public func debugMarkerSetObjectNameEXT(_ nameInfo: (some Chainable<DebugMarkerObjectNameInfoEXT>)) throws -> Void {
        try nameInfo.withCStruct { ptr_nameInfo in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func debugMarkerSetObjectNameEXT(_ nameInfo: DebugMarkerObjectNameInfoEXT) throws -> Void {
        try nameInfo.withCStruct { ptr_nameInfo in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func debugMarkerSetObjectTagEXT(_ tagInfo: (some Chainable<DebugMarkerObjectTagInfoEXT>)) throws -> Void {
        try tagInfo.withCStruct { ptr_tagInfo in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func debugMarkerSetObjectTagEXT(_ tagInfo: DebugMarkerObjectTagInfoEXT) throws -> Void {
        try tagInfo.withCStruct { ptr_tagInfo in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func getGeneratedCommandsMemoryRequirementsNV(info: (some Chainable<GeneratedCommandsMemoryRequirementsInfoNV>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsNV(info: GeneratedCommandsMemoryRequirementsInfoNV) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func createIndirectCommandsLayoutNV(_ createInfo: (some Chainable<IndirectCommandsLayoutCreateInfoNV>)) throws -> IndirectCommandsLayoutNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkIndirectCommandsLayoutNV!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutNV(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutNV(handle: out, device: self)
        }
    }

    public func createIndirectCommandsLayoutNV(_ createInfo: IndirectCommandsLayoutCreateInfoNV) throws -> IndirectCommandsLayoutNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkIndirectCommandsLayoutNV!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutNV(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutNV(handle: out, device: self)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsEXT(info: (some Chainable<GeneratedCommandsMemoryRequirementsInfoEXT>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsEXT(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsEXT(info: GeneratedCommandsMemoryRequirementsInfoEXT) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsEXT(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func createIndirectCommandsLayoutEXT(_ createInfo: (some Chainable<IndirectCommandsLayoutCreateInfoEXT>)) throws -> IndirectCommandsLayoutEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkIndirectCommandsLayoutEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutEXT(handle: out, device: self)
        }
    }

    public func createIndirectCommandsLayoutEXT(_ createInfo: IndirectCommandsLayoutCreateInfoEXT) throws -> IndirectCommandsLayoutEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkIndirectCommandsLayoutEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutEXT(handle: out, device: self)
        }
    }

    public func createIndirectExecutionSetEXT(_ createInfo: (some Chainable<IndirectExecutionSetCreateInfoEXT>)) throws -> IndirectExecutionSetEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkIndirectExecutionSetEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectExecutionSetEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectExecutionSetEXT(handle: out, device: self)
        }
    }

    public func createIndirectExecutionSetEXT(_ createInfo: IndirectExecutionSetCreateInfoEXT) throws -> IndirectExecutionSetEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkIndirectExecutionSetEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectExecutionSetEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectExecutionSetEXT(handle: out, device: self)
        }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<MemoryGetWin32HandleInfoKHR>)) throws -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetMemoryWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleKHR(_ getWin32HandleInfo: MemoryGetWin32HandleInfoKHR) throws -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetMemoryWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandlePropertiesKHR(handleType: ExternalMemoryHandleTypeFlags, handle: HANDLE) throws -> MemoryWin32HandlePropertiesKHR {
        var out = VkMemoryWin32HandlePropertiesKHR()
        try checkResult(
            self.dispatchTable.vkGetMemoryWin32HandlePropertiesKHR(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), handle, &out)
        )
        return MemoryWin32HandlePropertiesKHR(cStruct: out)
    }
    #endif

    public func getMemoryFdKHR(_ getFdInfo: (some Chainable<MemoryGetFdInfoKHR>)) throws -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetMemoryFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getMemoryFdKHR(_ getFdInfo: MemoryGetFdInfoKHR) throws -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetMemoryFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getMemoryFdPropertiesKHR(handleType: ExternalMemoryHandleTypeFlags, fd: Int32) throws -> MemoryFdPropertiesKHR {
        var out = VkMemoryFdPropertiesKHR()
        try checkResult(
            self.dispatchTable.vkGetMemoryFdPropertiesKHR(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), fd, &out)
        )
        return MemoryFdPropertiesKHR(cStruct: out)
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandleFUCHSIA(_ getZirconHandleInfo: (some Chainable<MemoryGetZirconHandleInfoFUCHSIA>)) throws -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetMemoryZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandleFUCHSIA(_ getZirconHandleInfo: MemoryGetZirconHandleInfoFUCHSIA) throws -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetMemoryZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandlePropertiesFUCHSIA(handleType: ExternalMemoryHandleTypeFlags, zirconHandle: zx_handle_t) throws -> MemoryZirconHandlePropertiesFUCHSIA {
        var out = VkMemoryZirconHandlePropertiesFUCHSIA()
        try checkResult(
            self.dispatchTable.vkGetMemoryZirconHandlePropertiesFUCHSIA(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), zirconHandle, &out)
        )
        return MemoryZirconHandlePropertiesFUCHSIA(cStruct: out)
    }
    #endif

    public func getMemoryRemoteAddressNV(_ memoryGetRemoteAddressInfo: (some Chainable<MemoryGetRemoteAddressInfoNV>)) throws -> VkRemoteAddressNV {
        try memoryGetRemoteAddressInfo.withCStruct { ptr_memoryGetRemoteAddressInfo in
            var out: VkRemoteAddressNV!
            try checkResult(
                self.dispatchTable.vkGetMemoryRemoteAddressNV(self.handle, ptr_memoryGetRemoteAddressInfo, &out)
            )
            return out
        }
    }

    public func getMemoryRemoteAddressNV(_ memoryGetRemoteAddressInfo: MemoryGetRemoteAddressInfoNV) throws -> VkRemoteAddressNV {
        try memoryGetRemoteAddressInfo.withCStruct { ptr_memoryGetRemoteAddressInfo in
            var out: VkRemoteAddressNV!
            try checkResult(
                self.dispatchTable.vkGetMemoryRemoteAddressNV(self.handle, ptr_memoryGetRemoteAddressInfo, &out)
            )
            return out
        }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSemaphoreWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<SemaphoreGetWin32HandleInfoKHR>)) throws -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetSemaphoreWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSemaphoreWin32HandleKHR(_ getWin32HandleInfo: SemaphoreGetWin32HandleInfoKHR) throws -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetSemaphoreWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importSemaphoreWin32HandleKHR(_ importSemaphoreWin32HandleInfo: (some Chainable<ImportSemaphoreWin32HandleInfoKHR>)) throws -> Void {
        try importSemaphoreWin32HandleInfo.withCStruct { ptr_importSemaphoreWin32HandleInfo in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreWin32HandleKHR(self.handle, ptr_importSemaphoreWin32HandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importSemaphoreWin32HandleKHR(_ importSemaphoreWin32HandleInfo: ImportSemaphoreWin32HandleInfoKHR) throws -> Void {
        try importSemaphoreWin32HandleInfo.withCStruct { ptr_importSemaphoreWin32HandleInfo in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreWin32HandleKHR(self.handle, ptr_importSemaphoreWin32HandleInfo)
            )
        }
    }
    #endif

    public func getSemaphoreFdKHR(_ getFdInfo: (some Chainable<SemaphoreGetFdInfoKHR>)) throws -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getSemaphoreFdKHR(_ getFdInfo: SemaphoreGetFdInfoKHR) throws -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func importSemaphoreFdKHR(_ importSemaphoreFdInfo: (some Chainable<ImportSemaphoreFdInfoKHR>)) throws -> Void {
        try importSemaphoreFdInfo.withCStruct { ptr_importSemaphoreFdInfo in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreFdKHR(self.handle, ptr_importSemaphoreFdInfo)
            )
        }
    }

    public func importSemaphoreFdKHR(_ importSemaphoreFdInfo: ImportSemaphoreFdInfoKHR) throws -> Void {
        try importSemaphoreFdInfo.withCStruct { ptr_importSemaphoreFdInfo in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreFdKHR(self.handle, ptr_importSemaphoreFdInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func getSemaphoreZirconHandleFUCHSIA(_ getZirconHandleInfo: (some Chainable<SemaphoreGetZirconHandleInfoFUCHSIA>)) throws -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getSemaphoreZirconHandleFUCHSIA(_ getZirconHandleInfo: SemaphoreGetZirconHandleInfoFUCHSIA) throws -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func importSemaphoreZirconHandleFUCHSIA(_ importSemaphoreZirconHandleInfo: (some Chainable<ImportSemaphoreZirconHandleInfoFUCHSIA>)) throws -> Void {
        try importSemaphoreZirconHandleInfo.withCStruct { ptr_importSemaphoreZirconHandleInfo in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreZirconHandleFUCHSIA(self.handle, ptr_importSemaphoreZirconHandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func importSemaphoreZirconHandleFUCHSIA(_ importSemaphoreZirconHandleInfo: ImportSemaphoreZirconHandleInfoFUCHSIA) throws -> Void {
        try importSemaphoreZirconHandleInfo.withCStruct { ptr_importSemaphoreZirconHandleInfo in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreZirconHandleFUCHSIA(self.handle, ptr_importSemaphoreZirconHandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getFenceWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<FenceGetWin32HandleInfoKHR>)) throws -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetFenceWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getFenceWin32HandleKHR(_ getWin32HandleInfo: FenceGetWin32HandleInfoKHR) throws -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetFenceWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importFenceWin32HandleKHR(_ importFenceWin32HandleInfo: (some Chainable<ImportFenceWin32HandleInfoKHR>)) throws -> Void {
        try importFenceWin32HandleInfo.withCStruct { ptr_importFenceWin32HandleInfo in
            try checkResult(
                self.dispatchTable.vkImportFenceWin32HandleKHR(self.handle, ptr_importFenceWin32HandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importFenceWin32HandleKHR(_ importFenceWin32HandleInfo: ImportFenceWin32HandleInfoKHR) throws -> Void {
        try importFenceWin32HandleInfo.withCStruct { ptr_importFenceWin32HandleInfo in
            try checkResult(
                self.dispatchTable.vkImportFenceWin32HandleKHR(self.handle, ptr_importFenceWin32HandleInfo)
            )
        }
    }
    #endif

    public func getFenceFdKHR(_ getFdInfo: (some Chainable<FenceGetFdInfoKHR>)) throws -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetFenceFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getFenceFdKHR(_ getFdInfo: FenceGetFdInfoKHR) throws -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetFenceFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func importFenceFdKHR(_ importFenceFdInfo: (some Chainable<ImportFenceFdInfoKHR>)) throws -> Void {
        try importFenceFdInfo.withCStruct { ptr_importFenceFdInfo in
            try checkResult(
                self.dispatchTable.vkImportFenceFdKHR(self.handle, ptr_importFenceFdInfo)
            )
        }
    }

    public func importFenceFdKHR(_ importFenceFdInfo: ImportFenceFdInfoKHR) throws -> Void {
        try importFenceFdInfo.withCStruct { ptr_importFenceFdInfo in
            try checkResult(
                self.dispatchTable.vkImportFenceFdKHR(self.handle, ptr_importFenceFdInfo)
            )
        }
    }

    public func displayPowerControlEXT(display: DisplayKHR, displayPowerInfo: (some Chainable<DisplayPowerInfoEXT>)) throws -> Void {
        try displayPowerInfo.withCStruct { ptr_displayPowerInfo in
            try checkResult(
                self.dispatchTable.vkDisplayPowerControlEXT(self.handle, display.handle, ptr_displayPowerInfo)
            )
        }
    }

    public func displayPowerControlEXT(display: DisplayKHR, displayPowerInfo: DisplayPowerInfoEXT) throws -> Void {
        try displayPowerInfo.withCStruct { ptr_displayPowerInfo in
            try checkResult(
                self.dispatchTable.vkDisplayPowerControlEXT(self.handle, display.handle, ptr_displayPowerInfo)
            )
        }
    }

    public func registerEventEXT(_ deviceEventInfo: (some Chainable<DeviceEventInfoEXT>)) throws -> Fence {
        try deviceEventInfo.withCStruct { ptr_deviceEventInfo in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDeviceEventEXT(self.handle, ptr_deviceEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func registerEventEXT(_ deviceEventInfo: DeviceEventInfoEXT) throws -> Fence {
        try deviceEventInfo.withCStruct { ptr_deviceEventInfo in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDeviceEventEXT(self.handle, ptr_deviceEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func registerDisplayEventEXT(display: DisplayKHR, displayEventInfo: (some Chainable<DisplayEventInfoEXT>)) throws -> Fence {
        try displayEventInfo.withCStruct { ptr_displayEventInfo in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDisplayEventEXT(self.handle, display.handle, ptr_displayEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func registerDisplayEventEXT(display: DisplayKHR, displayEventInfo: DisplayEventInfoEXT) throws -> Fence {
        try displayEventInfo.withCStruct { ptr_displayEventInfo in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDisplayEventEXT(self.handle, display.handle, ptr_displayEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func getGroupPeerMemoryFeatures(heapIndex: UInt32, localDeviceIndex: UInt32, remoteDeviceIndex: UInt32) -> PeerMemoryFeatureFlags {
        var out = VkPeerMemoryFeatureFlags()
        self.dispatchTable.vkGetDeviceGroupPeerMemoryFeatures(self.handle, heapIndex, localDeviceIndex, remoteDeviceIndex, &out)
        return PeerMemoryFeatureFlags(rawValue: out)
    }

    public func bindBufferMemory2(bindInfos: Array<BindBufferMemoryInfo>) throws -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos in
            try checkResult(
                self.dispatchTable.vkBindBufferMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindImageMemory2(bindInfos: Array<BindImageMemoryInfo>) throws -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos in
            try checkResult(
                self.dispatchTable.vkBindImageMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getGroupPresentCapabilitiesKHR() throws -> DeviceGroupPresentCapabilitiesKHR {
        var out = VkDeviceGroupPresentCapabilitiesKHR()
        try checkResult(
            self.dispatchTable.vkGetDeviceGroupPresentCapabilitiesKHR(self.handle, &out)
        )
        return DeviceGroupPresentCapabilitiesKHR(cStruct: out)
    }

    public func getGroupSurfacePresentModesKHR(surface: SurfaceKHR) throws -> DeviceGroupPresentModeFlagsKHR {
        var out = VkDeviceGroupPresentModeFlagsKHR()
        try checkResult(
            self.dispatchTable.vkGetDeviceGroupSurfacePresentModesKHR(self.handle, surface.handle, &out)
        )
        return DeviceGroupPresentModeFlagsKHR(rawValue: out)
    }

    public func acquireNextImage2KHR(_ acquireInfo: (some Chainable<AcquireNextImageInfoKHR>)) throws -> UInt32 {
        try acquireInfo.withCStruct { ptr_acquireInfo in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkAcquireNextImage2KHR(self.handle, ptr_acquireInfo, &out)
            )
            return out
        }
    }

    public func acquireNextImage2KHR(_ acquireInfo: AcquireNextImageInfoKHR) throws -> UInt32 {
        try acquireInfo.withCStruct { ptr_acquireInfo in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkAcquireNextImage2KHR(self.handle, ptr_acquireInfo, &out)
            )
            return out
        }
    }

    public func createDescriptorUpdateTemplate(_ createInfo: (some Chainable<DescriptorUpdateTemplateCreateInfo>)) throws -> DescriptorUpdateTemplate {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDescriptorUpdateTemplate!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorUpdateTemplate(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorUpdateTemplate(handle: out, device: self)
        }
    }

    public func createDescriptorUpdateTemplate(_ createInfo: DescriptorUpdateTemplateCreateInfo) throws -> DescriptorUpdateTemplate {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDescriptorUpdateTemplate!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorUpdateTemplate(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorUpdateTemplate(handle: out, device: self)
        }
    }

    public func setHdrMetadataEXT(swapchains: Array<SwapchainKHR>, metadata: Array<HdrMetadataEXT>) -> Void {
        swapchains.map{ $0.handle }.withUnsafeBufferPointer { ptr_swapchains in
            metadata.withCStructBufferPointer { ptr_metadata in
                self.dispatchTable.vkSetHdrMetadataEXT(self.handle, UInt32(ptr_swapchains.count), ptr_swapchains.baseAddress, ptr_metadata.baseAddress)
            }
        }
    }

    public func getBufferMemoryRequirements2(info: (some Chainable<BufferMemoryRequirementsInfo2>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetBufferMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getBufferMemoryRequirements2(info: BufferMemoryRequirementsInfo2) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetBufferMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements2(info: (some Chainable<ImageMemoryRequirementsInfo2>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetImageMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements2(info: ImageMemoryRequirementsInfo2) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetImageMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageSparseMemoryRequirements2(info: (some Chainable<ImageSparseMemoryRequirementsInfo2>)) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetImageSparseMemoryRequirements2(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getImageSparseMemoryRequirements2(info: ImageSparseMemoryRequirementsInfo2) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetImageSparseMemoryRequirements2(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getBufferMemoryRequirements(info: (some Chainable<DeviceBufferMemoryRequirements>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDeviceBufferMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getBufferMemoryRequirements(info: DeviceBufferMemoryRequirements) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDeviceBufferMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements(info: (some Chainable<DeviceImageMemoryRequirements>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDeviceImageMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements(info: DeviceImageMemoryRequirements) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDeviceImageMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageSparseMemoryRequirements(info: (some Chainable<DeviceImageMemoryRequirements>)) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetDeviceImageSparseMemoryRequirements(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getImageSparseMemoryRequirements(info: DeviceImageMemoryRequirements) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetDeviceImageSparseMemoryRequirements(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func createSamplerYcbcrConversion(_ createInfo: (some Chainable<SamplerYcbcrConversionCreateInfo>)) throws -> SamplerYcbcrConversion {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSamplerYcbcrConversion!
            try checkResult(
                self.dispatchTable.vkCreateSamplerYcbcrConversion(self.handle, ptr_createInfo, nil, &out)
            )
            return SamplerYcbcrConversion(handle: out, device: self)
        }
    }

    public func createSamplerYcbcrConversion(_ createInfo: SamplerYcbcrConversionCreateInfo) throws -> SamplerYcbcrConversion {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkSamplerYcbcrConversion!
            try checkResult(
                self.dispatchTable.vkCreateSamplerYcbcrConversion(self.handle, ptr_createInfo, nil, &out)
            )
            return SamplerYcbcrConversion(handle: out, device: self)
        }
    }

    public func getQueue2(_ queueInfo: (some Chainable<DeviceQueueInfo2>)) -> Queue {
        queueInfo.withCStruct { ptr_queueInfo in
            var out: VkQueue!
            self.dispatchTable.vkGetDeviceQueue2(self.handle, ptr_queueInfo, &out)
            return Queue(handle: out, device: self)
        }
    }

    public func getQueue2(_ queueInfo: DeviceQueueInfo2) -> Queue {
        queueInfo.withCStruct { ptr_queueInfo in
            var out: VkQueue!
            self.dispatchTable.vkGetDeviceQueue2(self.handle, ptr_queueInfo, &out)
            return Queue(handle: out, device: self)
        }
    }

    public func createValidationCacheEXT(_ createInfo: (some Chainable<ValidationCacheCreateInfoEXT>)) throws -> ValidationCacheEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkValidationCacheEXT!
            try checkResult(
                self.dispatchTable.vkCreateValidationCacheEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return ValidationCacheEXT(handle: out, device: self)
        }
    }

    public func createValidationCacheEXT(_ createInfo: ValidationCacheCreateInfoEXT) throws -> ValidationCacheEXT {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkValidationCacheEXT!
            try checkResult(
                self.dispatchTable.vkCreateValidationCacheEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return ValidationCacheEXT(handle: out, device: self)
        }
    }

    public func getDescriptorSetLayoutSupport(_ createInfo: (some Chainable<DescriptorSetLayoutCreateInfo>)) -> DescriptorSetLayoutSupport {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkDescriptorSetLayoutSupport()
            self.dispatchTable.vkGetDescriptorSetLayoutSupport(self.handle, ptr_createInfo, &out)
            return DescriptorSetLayoutSupport(cStruct: out)
        }
    }

    public func getDescriptorSetLayoutSupport(_ createInfo: DescriptorSetLayoutCreateInfo) -> DescriptorSetLayoutSupport {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkDescriptorSetLayoutSupport()
            self.dispatchTable.vkGetDescriptorSetLayoutSupport(self.handle, ptr_createInfo, &out)
            return DescriptorSetLayoutSupport(cStruct: out)
        }
    }

    public func getCalibratedTimestampsKHR(timestampInfos: Array<CalibratedTimestampInfoKHR>, timestamps: UnsafeMutablePointer<UInt64>, maxDeviation: UnsafeMutablePointer<UInt64>) throws -> Void {
        try timestampInfos.withCStructBufferPointer { ptr_timestampInfos in
            try checkResult(
                self.dispatchTable.vkGetCalibratedTimestampsKHR(self.handle, UInt32(ptr_timestampInfos.count), ptr_timestampInfos.baseAddress, timestamps, maxDeviation)
            )
        }
    }

    public func setDebugUtilsObjectNameEXT(_ nameInfo: (some Chainable<DebugUtilsObjectNameInfoEXT>)) throws -> Void {
        try nameInfo.withCStruct { ptr_nameInfo in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func setDebugUtilsObjectNameEXT(_ nameInfo: DebugUtilsObjectNameInfoEXT) throws -> Void {
        try nameInfo.withCStruct { ptr_nameInfo in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func setDebugUtilsObjectTagEXT(_ tagInfo: (some Chainable<DebugUtilsObjectTagInfoEXT>)) throws -> Void {
        try tagInfo.withCStruct { ptr_tagInfo in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func setDebugUtilsObjectTagEXT(_ tagInfo: DebugUtilsObjectTagInfoEXT) throws -> Void {
        try tagInfo.withCStruct { ptr_tagInfo in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func getMemoryHostPointerPropertiesEXT(handleType: ExternalMemoryHandleTypeFlags, hostPointer: UnsafeRawPointer) throws -> MemoryHostPointerPropertiesEXT {
        var out = VkMemoryHostPointerPropertiesEXT()
        try checkResult(
            self.dispatchTable.vkGetMemoryHostPointerPropertiesEXT(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), hostPointer, &out)
        )
        return MemoryHostPointerPropertiesEXT(cStruct: out)
    }

    public func createRenderPass2(_ createInfo: (some Chainable<RenderPassCreateInfo2>)) throws -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass2(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func createRenderPass2(_ createInfo: RenderPassCreateInfo2) throws -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass2(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func waitSemaphores(_ waitInfo: (some Chainable<SemaphoreWaitInfo>), timeout: UInt64) throws -> Void {
        try waitInfo.withCStruct { ptr_waitInfo in
            try checkResult(
                self.dispatchTable.vkWaitSemaphores(self.handle, ptr_waitInfo, timeout)
            )
        }
    }

    public func waitSemaphores(_ waitInfo: SemaphoreWaitInfo, timeout: UInt64) throws -> Void {
        try waitInfo.withCStruct { ptr_waitInfo in
            try checkResult(
                self.dispatchTable.vkWaitSemaphores(self.handle, ptr_waitInfo, timeout)
            )
        }
    }

    public func signalSemaphore(_ signalInfo: (some Chainable<SemaphoreSignalInfo>)) throws -> Void {
        try signalInfo.withCStruct { ptr_signalInfo in
            try checkResult(
                self.dispatchTable.vkSignalSemaphore(self.handle, ptr_signalInfo)
            )
        }
    }

    public func signalSemaphore(_ signalInfo: SemaphoreSignalInfo) throws -> Void {
        try signalInfo.withCStruct { ptr_signalInfo in
            try checkResult(
                self.dispatchTable.vkSignalSemaphore(self.handle, ptr_signalInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getAndroidHardwareBufferPropertiesANDROID(buffer: UnsafePointer<AHardwareBuffer>) throws -> AndroidHardwareBufferPropertiesANDROID {
        var out = VkAndroidHardwareBufferPropertiesANDROID()
        try checkResult(
            self.dispatchTable.vkGetAndroidHardwareBufferPropertiesANDROID(self.handle, buffer, &out)
        )
        return AndroidHardwareBufferPropertiesANDROID(cStruct: out)
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getMemoryAndroidHardwareBufferANDROID(info: (some Chainable<MemoryGetAndroidHardwareBufferInfoANDROID>)) throws -> UnsafeMutablePointer<AHardwareBuffer> {
        try info.withCStruct { ptr_info in
            var out: UnsafeMutablePointer<AHardwareBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryAndroidHardwareBufferANDROID(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getMemoryAndroidHardwareBufferANDROID(info: MemoryGetAndroidHardwareBufferInfoANDROID) throws -> UnsafeMutablePointer<AHardwareBuffer> {
        try info.withCStruct { ptr_info in
            var out: UnsafeMutablePointer<AHardwareBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryAndroidHardwareBufferANDROID(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    public func createAccelerationStructureNV(_ createInfo: (some Chainable<AccelerationStructureCreateInfoNV>)) throws -> AccelerationStructureNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkAccelerationStructureNV!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureNV(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureNV(handle: out, device: self)
        }
    }

    public func createAccelerationStructureNV(_ createInfo: AccelerationStructureCreateInfoNV) throws -> AccelerationStructureNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkAccelerationStructureNV!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureNV(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureNV(handle: out, device: self)
        }
    }

    public func getAccelerationStructureMemoryRequirementsNV(info: (some Chainable<AccelerationStructureMemoryRequirementsInfoNV>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetAccelerationStructureMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getAccelerationStructureMemoryRequirementsNV(info: AccelerationStructureMemoryRequirementsInfoNV) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetAccelerationStructureMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindAccelerationStructureMemoryNV(bindInfos: Array<BindAccelerationStructureMemoryInfoNV>) throws -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos in
            try checkResult(
                self.dispatchTable.vkBindAccelerationStructureMemoryNV(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func copyAccelerationStructureKHR(deferredOperation: DeferredOperationKHR? = nil, info: (some Chainable<CopyAccelerationStructureInfoKHR>)) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureKHR(deferredOperation: DeferredOperationKHR? = nil, info: CopyAccelerationStructureInfoKHR) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureToMemoryKHR(deferredOperation: DeferredOperationKHR? = nil, info: (some Chainable<CopyAccelerationStructureToMemoryInfoKHR>)) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureToMemoryKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureToMemoryKHR(deferredOperation: DeferredOperationKHR? = nil, info: CopyAccelerationStructureToMemoryInfoKHR) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureToMemoryKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToAccelerationStructureKHR(deferredOperation: DeferredOperationKHR? = nil, info: (some Chainable<CopyMemoryToAccelerationStructureInfoKHR>)) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToAccelerationStructureKHR(deferredOperation: DeferredOperationKHR? = nil, info: CopyMemoryToAccelerationStructureInfoKHR) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func writeAccelerationStructuresPropertiesKHR(accelerationStructures: Array<AccelerationStructureKHR>, queryType: QueryType, dataSize: Int, data: UnsafeMutableRawPointer, stride: Int) throws -> Void {
        try accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            try checkResult(
                self.dispatchTable.vkWriteAccelerationStructuresPropertiesKHR(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), dataSize, data, stride)
            )
        }
    }

    public func createRayTracingPipelinesNV(pipelineCache: PipelineCache? = nil, createInfos: Array<RayTracingPipelineCreateInfoNV>) throws -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateRayTracingPipelinesNV(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createRayTracingPipelinesKHR(deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil, createInfos: Array<RayTracingPipelineCreateInfoKHR>) throws -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateRayTracingPipelinesKHR(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func getClusterAccelerationStructureBuildSizesNV(info: (some Chainable<ClusterAccelerationStructureInputInfoNV>)) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            self.dispatchTable.vkGetClusterAccelerationStructureBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getClusterAccelerationStructureBuildSizesNV(info: ClusterAccelerationStructureInputInfoNV) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            self.dispatchTable.vkGetClusterAccelerationStructureBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getAccelerationStructureCompatibilityKHR(_ versionInfo: (some Chainable<AccelerationStructureVersionInfoKHR>)) -> AccelerationStructureCompatibilityKHR {
        versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            self.dispatchTable.vkGetDeviceAccelerationStructureCompatibilityKHR(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: unsafeBitCast(out, to: UInt32.self))!
        }
    }

    public func getAccelerationStructureCompatibilityKHR(_ versionInfo: AccelerationStructureVersionInfoKHR) -> AccelerationStructureCompatibilityKHR {
        versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            self.dispatchTable.vkGetDeviceAccelerationStructureCompatibilityKHR(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: unsafeBitCast(out, to: UInt32.self))!
        }
    }

    public func getImageViewHandleNVX(info: (some Chainable<ImageViewHandleInfoNVX>)) -> UInt32 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandleNVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandleNVX(info: ImageViewHandleInfoNVX) -> UInt32 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandleNVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandle64NVX(info: (some Chainable<ImageViewHandleInfoNVX>)) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandle64NVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandle64NVX(info: ImageViewHandleInfoNVX) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandle64NVX(self.handle, ptr_info)
        }
    }

    public func getCombinedImageSamplerIndexNVX(imageViewIndex: UInt64, samplerIndex: UInt64) -> UInt64 {
        self.dispatchTable.vkGetDeviceCombinedImageSamplerIndexNVX(self.handle, imageViewIndex, samplerIndex)
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getGroupSurfacePresentModes2EXT(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws -> DeviceGroupPresentModeFlagsKHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            var out = VkDeviceGroupPresentModeFlagsKHR()
            try checkResult(
                self.dispatchTable.vkGetDeviceGroupSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, &out)
            )
            return DeviceGroupPresentModeFlagsKHR(rawValue: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getGroupSurfacePresentModes2EXT(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR) throws -> DeviceGroupPresentModeFlagsKHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo in
            var out = VkDeviceGroupPresentModeFlagsKHR()
            try checkResult(
                self.dispatchTable.vkGetDeviceGroupSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, &out)
            )
            return DeviceGroupPresentModeFlagsKHR(rawValue: out)
        }
    }
    #endif

    public func acquireProfilingLockKHR(info: (some Chainable<AcquireProfilingLockInfoKHR>)) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkAcquireProfilingLockKHR(self.handle, ptr_info)
            )
        }
    }

    public func acquireProfilingLockKHR(info: AcquireProfilingLockInfoKHR) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkAcquireProfilingLockKHR(self.handle, ptr_info)
            )
        }
    }

    public func releaseProfilingLockKHR() -> Void {
        self.dispatchTable.vkReleaseProfilingLockKHR(self.handle)
    }

    public func getBufferOpaqueCaptureAddress(info: (some Chainable<BufferDeviceAddressInfo>)) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getBufferOpaqueCaptureAddress(info: BufferDeviceAddressInfo) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getBufferAddress(info: (some Chainable<BufferDeviceAddressInfo>)) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferDeviceAddress(self.handle, ptr_info)
        }
    }

    public func getBufferAddress(info: BufferDeviceAddressInfo) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferDeviceAddress(self.handle, ptr_info)
        }
    }

    public func initializePerformanceApiINTEL(_ initializeInfo: (some Chainable<InitializePerformanceApiInfoINTEL>)) throws -> Void {
        try initializeInfo.withCStruct { ptr_initializeInfo in
            try checkResult(
                self.dispatchTable.vkInitializePerformanceApiINTEL(self.handle, ptr_initializeInfo)
            )
        }
    }

    public func initializePerformanceApiINTEL(_ initializeInfo: InitializePerformanceApiInfoINTEL) throws -> Void {
        try initializeInfo.withCStruct { ptr_initializeInfo in
            try checkResult(
                self.dispatchTable.vkInitializePerformanceApiINTEL(self.handle, ptr_initializeInfo)
            )
        }
    }

    public func uninitializePerformanceApiINTEL() -> Void {
        self.dispatchTable.vkUninitializePerformanceApiINTEL(self.handle)
    }

    public func acquirePerformanceConfigurationINTEL(_ acquireInfo: (some Chainable<PerformanceConfigurationAcquireInfoINTEL>)) throws -> PerformanceConfigurationINTEL {
        try acquireInfo.withCStruct { ptr_acquireInfo in
            var out: VkPerformanceConfigurationINTEL!
            try checkResult(
                self.dispatchTable.vkAcquirePerformanceConfigurationINTEL(self.handle, ptr_acquireInfo, &out)
            )
            return PerformanceConfigurationINTEL(handle: out, device: self)
        }
    }

    public func acquirePerformanceConfigurationINTEL(_ acquireInfo: PerformanceConfigurationAcquireInfoINTEL) throws -> PerformanceConfigurationINTEL {
        try acquireInfo.withCStruct { ptr_acquireInfo in
            var out: VkPerformanceConfigurationINTEL!
            try checkResult(
                self.dispatchTable.vkAcquirePerformanceConfigurationINTEL(self.handle, ptr_acquireInfo, &out)
            )
            return PerformanceConfigurationINTEL(handle: out, device: self)
        }
    }

    public func releasePerformanceConfigurationINTEL(configuration: PerformanceConfigurationINTEL? = nil) throws -> Void {
        try checkResult(
            self.dispatchTable.vkReleasePerformanceConfigurationINTEL(self.handle, configuration?.handle)
        )
    }

    public func getPerformanceParameterINTEL(parameter: PerformanceParameterTypeINTEL) throws -> PerformanceValueINTEL {
        var out = VkPerformanceValueINTEL()
        try checkResult(
            self.dispatchTable.vkGetPerformanceParameterINTEL(self.handle, VkPerformanceParameterTypeINTEL(rawValue: VkPerformanceParameterTypeINTEL.RawValue(parameter.rawValue)), &out)
        )
        return PerformanceValueINTEL(cStruct: out)
    }

    public func getMemoryOpaqueCaptureAddress(info: (some Chainable<DeviceMemoryOpaqueCaptureAddressInfo>)) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetDeviceMemoryOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getMemoryOpaqueCaptureAddress(info: DeviceMemoryOpaqueCaptureAddressInfo) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetDeviceMemoryOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getPipelineExecutablePropertiesKHR(_ pipelineInfo: (some Chainable<PipelineInfoKHR>)) throws -> Array<PipelineExecutablePropertiesKHR> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            try enumerate { pProperties, pExecutableCount in
                self.dispatchTable.vkGetPipelineExecutablePropertiesKHR(self.handle, ptr_pipelineInfo, pExecutableCount, pProperties)
            }.map { PipelineExecutablePropertiesKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutablePropertiesKHR(_ pipelineInfo: PipelineInfoKHR) throws -> Array<PipelineExecutablePropertiesKHR> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            try enumerate { pProperties, pExecutableCount in
                self.dispatchTable.vkGetPipelineExecutablePropertiesKHR(self.handle, ptr_pipelineInfo, pExecutableCount, pProperties)
            }.map { PipelineExecutablePropertiesKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableStatisticsKHR(_ executableInfo: (some Chainable<PipelineExecutableInfoKHR>)) throws -> Array<PipelineExecutableStatisticKHR> {
        try executableInfo.withCStruct { ptr_executableInfo in
            try enumerate { pStatistics, pStatisticCount in
                self.dispatchTable.vkGetPipelineExecutableStatisticsKHR(self.handle, ptr_executableInfo, pStatisticCount, pStatistics)
            }.map { PipelineExecutableStatisticKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableStatisticsKHR(_ executableInfo: PipelineExecutableInfoKHR) throws -> Array<PipelineExecutableStatisticKHR> {
        try executableInfo.withCStruct { ptr_executableInfo in
            try enumerate { pStatistics, pStatisticCount in
                self.dispatchTable.vkGetPipelineExecutableStatisticsKHR(self.handle, ptr_executableInfo, pStatisticCount, pStatistics)
            }.map { PipelineExecutableStatisticKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableInternalRepresentationsKHR(_ executableInfo: (some Chainable<PipelineExecutableInfoKHR>)) throws -> Array<PipelineExecutableInternalRepresentationKHR> {
        try executableInfo.withCStruct { ptr_executableInfo in
            try enumerate { pInternalRepresentations, pInternalRepresentationCount in
                self.dispatchTable.vkGetPipelineExecutableInternalRepresentationsKHR(self.handle, ptr_executableInfo, pInternalRepresentationCount, pInternalRepresentations)
            }.map { PipelineExecutableInternalRepresentationKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableInternalRepresentationsKHR(_ executableInfo: PipelineExecutableInfoKHR) throws -> Array<PipelineExecutableInternalRepresentationKHR> {
        try executableInfo.withCStruct { ptr_executableInfo in
            try enumerate { pInternalRepresentations, pInternalRepresentationCount in
                self.dispatchTable.vkGetPipelineExecutableInternalRepresentationsKHR(self.handle, ptr_executableInfo, pInternalRepresentationCount, pInternalRepresentations)
            }.map { PipelineExecutableInternalRepresentationKHR(cStruct: $0) }
        }
    }

    public func createAccelerationStructureKHR(_ createInfo: (some Chainable<AccelerationStructureCreateInfoKHR>)) throws -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }

    public func createAccelerationStructureKHR(_ createInfo: AccelerationStructureCreateInfoKHR) throws -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }

    public func buildAccelerationStructuresKHR(deferredOperation: DeferredOperationKHR? = nil, infos: Array<AccelerationStructureBuildGeometryInfoKHR>, buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>) throws -> Void {
        try infos.withCStructBufferPointer { ptr_infos in
            try checkResult(
                self.dispatchTable.vkBuildAccelerationStructuresKHR(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
            )
        }
    }

    public func getAccelerationStructureAddressKHR(info: (some Chainable<AccelerationStructureDeviceAddressInfoKHR>)) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetAccelerationStructureDeviceAddressKHR(self.handle, ptr_info)
        }
    }

    public func getAccelerationStructureAddressKHR(info: AccelerationStructureDeviceAddressInfoKHR) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetAccelerationStructureDeviceAddressKHR(self.handle, ptr_info)
        }
    }

    public func createDeferredOperationKHR() throws -> DeferredOperationKHR {
        var out: VkDeferredOperationKHR!
        try checkResult(
            self.dispatchTable.vkCreateDeferredOperationKHR(self.handle, nil, &out)
        )
        return DeferredOperationKHR(handle: out, device: self)
    }

    public func getPipelineIndirectMemoryRequirementsNV(_ createInfo: (some Chainable<ComputePipelineCreateInfo>)) -> MemoryRequirements2 {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetPipelineIndirectMemoryRequirementsNV(self.handle, ptr_createInfo, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getPipelineIndirectMemoryRequirementsNV(_ createInfo: ComputePipelineCreateInfo) -> MemoryRequirements2 {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetPipelineIndirectMemoryRequirementsNV(self.handle, ptr_createInfo, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getPipelineIndirectAddressNV(info: (some Chainable<PipelineIndirectDeviceAddressInfoNV>)) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetPipelineIndirectDeviceAddressNV(self.handle, ptr_info)
        }
    }

    public func getPipelineIndirectAddressNV(info: PipelineIndirectDeviceAddressInfoNV) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetPipelineIndirectDeviceAddressNV(self.handle, ptr_info)
        }
    }

    public func antiLagUpdateAMD(data: (some Chainable<AntiLagDataAMD>)) -> Void {
        data.withCStruct { ptr_data in
            self.dispatchTable.vkAntiLagUpdateAMD(self.handle, ptr_data)
        }
    }

    public func antiLagUpdateAMD(data: AntiLagDataAMD) -> Void {
        data.withCStruct { ptr_data in
            self.dispatchTable.vkAntiLagUpdateAMD(self.handle, ptr_data)
        }
    }

    public func createPrivateDataSlot(_ createInfo: (some Chainable<PrivateDataSlotCreateInfo>)) throws -> PrivateDataSlot {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkPrivateDataSlot!
            try checkResult(
                self.dispatchTable.vkCreatePrivateDataSlot(self.handle, ptr_createInfo, nil, &out)
            )
            return PrivateDataSlot(handle: out, device: self)
        }
    }

    public func createPrivateDataSlot(_ createInfo: PrivateDataSlotCreateInfo) throws -> PrivateDataSlot {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkPrivateDataSlot!
            try checkResult(
                self.dispatchTable.vkCreatePrivateDataSlot(self.handle, ptr_createInfo, nil, &out)
            )
            return PrivateDataSlot(handle: out, device: self)
        }
    }

    public func setPrivateData(objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot, data: UInt64) throws -> Void {
        try checkResult(
            self.dispatchTable.vkSetPrivateData(self.handle, VkObjectType(rawValue: VkObjectType.RawValue(objectType.rawValue)), objectHandle, privateDataSlot.handle, data)
        )
    }

    public func getPrivateData(objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot) -> UInt64 {
        var out = UInt64()
        self.dispatchTable.vkGetPrivateData(self.handle, VkObjectType(rawValue: VkObjectType.RawValue(objectType.rawValue)), objectHandle, privateDataSlot.handle, &out)
        return out
    }

    public func getAccelerationStructureBuildSizesKHR(buildType: AccelerationStructureBuildTypeKHR, buildInfo: (some Chainable<AccelerationStructureBuildGeometryInfoKHR>), maxPrimitiveCounts: Array<UInt32>?) -> AccelerationStructureBuildSizesInfoKHR {
        buildInfo.withCStruct { ptr_buildInfo in
            maxPrimitiveCounts.withOptionalUnsafeBufferPointer { ptr_maxPrimitiveCounts in
                var out = VkAccelerationStructureBuildSizesInfoKHR()
                self.dispatchTable.vkGetAccelerationStructureBuildSizesKHR(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, ptr_maxPrimitiveCounts.baseAddress, &out)
                return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
            }
        }
    }

    public func getAccelerationStructureBuildSizesKHR(buildType: AccelerationStructureBuildTypeKHR, buildInfo: AccelerationStructureBuildGeometryInfoKHR, maxPrimitiveCounts: Array<UInt32>?) -> AccelerationStructureBuildSizesInfoKHR {
        buildInfo.withCStruct { ptr_buildInfo in
            maxPrimitiveCounts.withOptionalUnsafeBufferPointer { ptr_maxPrimitiveCounts in
                var out = VkAccelerationStructureBuildSizesInfoKHR()
                self.dispatchTable.vkGetAccelerationStructureBuildSizesKHR(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, ptr_maxPrimitiveCounts.baseAddress, &out)
                return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
            }
        }
    }

    public func copyMemoryToImage(_ copyMemoryToImageInfo: (some Chainable<CopyMemoryToImageInfo>)) throws -> Void {
        try copyMemoryToImageInfo.withCStruct { ptr_copyMemoryToImageInfo in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToImage(self.handle, ptr_copyMemoryToImageInfo)
            )
        }
    }

    public func copyMemoryToImage(_ copyMemoryToImageInfo: CopyMemoryToImageInfo) throws -> Void {
        try copyMemoryToImageInfo.withCStruct { ptr_copyMemoryToImageInfo in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToImage(self.handle, ptr_copyMemoryToImageInfo)
            )
        }
    }

    public func copyImageToMemory(_ copyImageToMemoryInfo: (some Chainable<CopyImageToMemoryInfo>)) throws -> Void {
        try copyImageToMemoryInfo.withCStruct { ptr_copyImageToMemoryInfo in
            try checkResult(
                self.dispatchTable.vkCopyImageToMemory(self.handle, ptr_copyImageToMemoryInfo)
            )
        }
    }

    public func copyImageToMemory(_ copyImageToMemoryInfo: CopyImageToMemoryInfo) throws -> Void {
        try copyImageToMemoryInfo.withCStruct { ptr_copyImageToMemoryInfo in
            try checkResult(
                self.dispatchTable.vkCopyImageToMemory(self.handle, ptr_copyImageToMemoryInfo)
            )
        }
    }

    public func copyImageToImage(_ copyImageToImageInfo: (some Chainable<CopyImageToImageInfo>)) throws -> Void {
        try copyImageToImageInfo.withCStruct { ptr_copyImageToImageInfo in
            try checkResult(
                self.dispatchTable.vkCopyImageToImage(self.handle, ptr_copyImageToImageInfo)
            )
        }
    }

    public func copyImageToImage(_ copyImageToImageInfo: CopyImageToImageInfo) throws -> Void {
        try copyImageToImageInfo.withCStruct { ptr_copyImageToImageInfo in
            try checkResult(
                self.dispatchTable.vkCopyImageToImage(self.handle, ptr_copyImageToImageInfo)
            )
        }
    }

    public func transitionImageLayout(transitions: Array<HostImageLayoutTransitionInfo>) throws -> Void {
        try transitions.withCStructBufferPointer { ptr_transitions in
            try checkResult(
                self.dispatchTable.vkTransitionImageLayout(self.handle, UInt32(ptr_transitions.count), ptr_transitions.baseAddress)
            )
        }
    }

    public func createVideoSessionKHR(_ createInfo: (some Chainable<VideoSessionCreateInfoKHR>)) throws -> VideoSessionKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkVideoSessionKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionKHR(handle: out, device: self)
        }
    }

    public func createVideoSessionKHR(_ createInfo: VideoSessionCreateInfoKHR) throws -> VideoSessionKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkVideoSessionKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionKHR(handle: out, device: self)
        }
    }

    public func createVideoSessionParametersKHR(_ createInfo: (some Chainable<VideoSessionParametersCreateInfoKHR>)) throws -> VideoSessionParametersKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkVideoSessionParametersKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionParametersKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionParametersKHR(handle: out, device: self)
        }
    }

    public func createVideoSessionParametersKHR(_ createInfo: VideoSessionParametersCreateInfoKHR) throws -> VideoSessionParametersKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkVideoSessionParametersKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionParametersKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionParametersKHR(handle: out, device: self)
        }
    }

    public func getEncodedVideoSessionParametersKHR(_ videoSessionParametersInfo: (some Chainable<VideoEncodeSessionParametersGetInfoKHR>), feedbackInfo: UnsafeMutablePointer<VkVideoEncodeSessionParametersFeedbackInfoKHR>? = nil, dataSize: UnsafeMutablePointer<Int>, data: UnsafeMutableRawPointer?) throws -> Void {
        try videoSessionParametersInfo.withCStruct { ptr_videoSessionParametersInfo in
            try checkResult(
                self.dispatchTable.vkGetEncodedVideoSessionParametersKHR(self.handle, ptr_videoSessionParametersInfo, feedbackInfo, dataSize, data)
            )
        }
    }

    public func getEncodedVideoSessionParametersKHR(_ videoSessionParametersInfo: VideoEncodeSessionParametersGetInfoKHR, feedbackInfo: UnsafeMutablePointer<VkVideoEncodeSessionParametersFeedbackInfoKHR>? = nil, dataSize: UnsafeMutablePointer<Int>, data: UnsafeMutableRawPointer?) throws -> Void {
        try videoSessionParametersInfo.withCStruct { ptr_videoSessionParametersInfo in
            try checkResult(
                self.dispatchTable.vkGetEncodedVideoSessionParametersKHR(self.handle, ptr_videoSessionParametersInfo, feedbackInfo, dataSize, data)
            )
        }
    }

    public func getPartitionedAccelerationStructuresBuildSizesNV(info: (some Chainable<PartitionedAccelerationStructureInstancesInputNV>)) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            self.dispatchTable.vkGetPartitionedAccelerationStructuresBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getPartitionedAccelerationStructuresBuildSizesNV(info: PartitionedAccelerationStructureInstancesInputNV) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            self.dispatchTable.vkGetPartitionedAccelerationStructuresBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func createCuModuleNVX(_ createInfo: (some Chainable<CuModuleCreateInfoNVX>)) throws -> CuModuleNVX {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCuModuleNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuModuleNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuModuleNVX(handle: out, device: self)
        }
    }

    public func createCuModuleNVX(_ createInfo: CuModuleCreateInfoNVX) throws -> CuModuleNVX {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCuModuleNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuModuleNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuModuleNVX(handle: out, device: self)
        }
    }

    public func createCuFunctionNVX(_ createInfo: (some Chainable<CuFunctionCreateInfoNVX>)) throws -> CuFunctionNVX {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCuFunctionNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuFunctionNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuFunctionNVX(handle: out, device: self)
        }
    }

    public func createCuFunctionNVX(_ createInfo: CuFunctionCreateInfoNVX) throws -> CuFunctionNVX {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCuFunctionNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuFunctionNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuFunctionNVX(handle: out, device: self)
        }
    }

    public func getDescriptorEXT(_ descriptorInfo: (some Chainable<DescriptorGetInfoEXT>), dataSize: Int, descriptor: UnsafeMutableRawPointer) -> Void {
        descriptorInfo.withCStruct { ptr_descriptorInfo in
            self.dispatchTable.vkGetDescriptorEXT(self.handle, ptr_descriptorInfo, dataSize, descriptor)
        }
    }

    public func getDescriptorEXT(_ descriptorInfo: DescriptorGetInfoEXT, dataSize: Int, descriptor: UnsafeMutableRawPointer) -> Void {
        descriptorInfo.withCStruct { ptr_descriptorInfo in
            self.dispatchTable.vkGetDescriptorEXT(self.handle, ptr_descriptorInfo, dataSize, descriptor)
        }
    }

    public func getBufferOpaqueCaptureDescriptorDataEXT(info: (some Chainable<BufferCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetBufferOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getBufferOpaqueCaptureDescriptorDataEXT(info: BufferCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetBufferOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageOpaqueCaptureDescriptorDataEXT(info: (some Chainable<ImageCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetImageOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageOpaqueCaptureDescriptorDataEXT(info: ImageCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetImageOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageViewOpaqueCaptureDescriptorDataEXT(info: (some Chainable<ImageViewCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetImageViewOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageViewOpaqueCaptureDescriptorDataEXT(info: ImageViewCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetImageViewOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getSamplerOpaqueCaptureDescriptorDataEXT(info: (some Chainable<SamplerCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetSamplerOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getSamplerOpaqueCaptureDescriptorDataEXT(info: SamplerCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetSamplerOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getAccelerationStructureOpaqueCaptureDescriptorDataEXT(info: (some Chainable<AccelerationStructureCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getAccelerationStructureOpaqueCaptureDescriptorDataEXT(info: AccelerationStructureCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func createBufferCollectionFUCHSIA(_ createInfo: (some Chainable<BufferCollectionCreateInfoFUCHSIA>)) throws -> BufferCollectionFUCHSIA {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkBufferCollectionFUCHSIA!
            try checkResult(
                self.dispatchTable.vkCreateBufferCollectionFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferCollectionFUCHSIA(handle: out, device: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createBufferCollectionFUCHSIA(_ createInfo: BufferCollectionCreateInfoFUCHSIA) throws -> BufferCollectionFUCHSIA {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkBufferCollectionFUCHSIA!
            try checkResult(
                self.dispatchTable.vkCreateBufferCollectionFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferCollectionFUCHSIA(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaModuleNV(_ createInfo: (some Chainable<CudaModuleCreateInfoNV>)) throws -> CudaModuleNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCudaModuleNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaModuleNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaModuleNV(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaModuleNV(_ createInfo: CudaModuleCreateInfoNV) throws -> CudaModuleNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCudaModuleNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaModuleNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaModuleNV(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaFunctionNV(_ createInfo: (some Chainable<CudaFunctionCreateInfoNV>)) throws -> CudaFunctionNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCudaFunctionNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaFunctionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaFunctionNV(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaFunctionNV(_ createInfo: CudaFunctionCreateInfoNV) throws -> CudaFunctionNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkCudaFunctionNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaFunctionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaFunctionNV(handle: out, device: self)
        }
    }
    #endif

    public func getDescriptorSetLayoutHostMappingInfoVALVE(bindingReference: (some Chainable<DescriptorSetBindingReferenceVALVE>)) -> DescriptorSetLayoutHostMappingInfoVALVE {
        bindingReference.withCStruct { ptr_bindingReference in
            var out = VkDescriptorSetLayoutHostMappingInfoVALVE()
            self.dispatchTable.vkGetDescriptorSetLayoutHostMappingInfoVALVE(self.handle, ptr_bindingReference, &out)
            return DescriptorSetLayoutHostMappingInfoVALVE(cStruct: out)
        }
    }

    public func getDescriptorSetLayoutHostMappingInfoVALVE(bindingReference: DescriptorSetBindingReferenceVALVE) -> DescriptorSetLayoutHostMappingInfoVALVE {
        bindingReference.withCStruct { ptr_bindingReference in
            var out = VkDescriptorSetLayoutHostMappingInfoVALVE()
            self.dispatchTable.vkGetDescriptorSetLayoutHostMappingInfoVALVE(self.handle, ptr_bindingReference, &out)
            return DescriptorSetLayoutHostMappingInfoVALVE(cStruct: out)
        }
    }

    public func getShaderModuleCreateInfoIdentifierEXT(_ createInfo: (some Chainable<ShaderModuleCreateInfo>)) -> ShaderModuleIdentifierEXT {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkShaderModuleIdentifierEXT()
            self.dispatchTable.vkGetShaderModuleCreateInfoIdentifierEXT(self.handle, ptr_createInfo, &out)
            return ShaderModuleIdentifierEXT(cStruct: out)
        }
    }

    public func getShaderModuleCreateInfoIdentifierEXT(_ createInfo: ShaderModuleCreateInfo) -> ShaderModuleIdentifierEXT {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkShaderModuleIdentifierEXT()
            self.dispatchTable.vkGetShaderModuleCreateInfoIdentifierEXT(self.handle, ptr_createInfo, &out)
            return ShaderModuleIdentifierEXT(cStruct: out)
        }
    }

    public func getPipelinePropertiesEXT(_ pipelineInfo: (some Chainable<PipelineInfoKHR>)) throws -> VkBaseOutStructure {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            var out = VkBaseOutStructure()
            try checkResult(
                self.dispatchTable.vkGetPipelinePropertiesEXT(self.handle, ptr_pipelineInfo, &out)
            )
            return out
        }
    }

    public func getPipelinePropertiesEXT(_ pipelineInfo: PipelineInfoKHR) throws -> VkBaseOutStructure {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            var out = VkBaseOutStructure()
            try checkResult(
                self.dispatchTable.vkGetPipelinePropertiesEXT(self.handle, ptr_pipelineInfo, &out)
            )
            return out
        }
    }

    #if VK_USE_PLATFORM_METAL_EXT
    public func exportMetalObjectsEXT() -> ExportMetalObjectsInfoEXT {
        var out = VkExportMetalObjectsInfoEXT()
        self.dispatchTable.vkExportMetalObjectsEXT(self.handle, &out)
        return ExportMetalObjectsInfoEXT(cStruct: out)
    }
    #endif

    public func getDynamicRenderingTilePropertiesQCOM(_ renderingInfo: (some Chainable<RenderingInfo>)) throws -> TilePropertiesQCOM {
        try renderingInfo.withCStruct { ptr_renderingInfo in
            var out = VkTilePropertiesQCOM()
            try checkResult(
                self.dispatchTable.vkGetDynamicRenderingTilePropertiesQCOM(self.handle, ptr_renderingInfo, &out)
            )
            return TilePropertiesQCOM(cStruct: out)
        }
    }

    public func getDynamicRenderingTilePropertiesQCOM(_ renderingInfo: RenderingInfo) throws -> TilePropertiesQCOM {
        try renderingInfo.withCStruct { ptr_renderingInfo in
            var out = VkTilePropertiesQCOM()
            try checkResult(
                self.dispatchTable.vkGetDynamicRenderingTilePropertiesQCOM(self.handle, ptr_renderingInfo, &out)
            )
            return TilePropertiesQCOM(cStruct: out)
        }
    }

    public func createOpticalFlowSessionNV(_ createInfo: (some Chainable<OpticalFlowSessionCreateInfoNV>)) throws -> OpticalFlowSessionNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkOpticalFlowSessionNV!
            try checkResult(
                self.dispatchTable.vkCreateOpticalFlowSessionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return OpticalFlowSessionNV(handle: out, device: self)
        }
    }

    public func createOpticalFlowSessionNV(_ createInfo: OpticalFlowSessionCreateInfoNV) throws -> OpticalFlowSessionNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkOpticalFlowSessionNV!
            try checkResult(
                self.dispatchTable.vkCreateOpticalFlowSessionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return OpticalFlowSessionNV(handle: out, device: self)
        }
    }

    public func getFaultInfoEXT(faultCounts: UnsafeMutablePointer<VkDeviceFaultCountsEXT>, faultInfo: UnsafeMutablePointer<VkDeviceFaultInfoEXT>? = nil) throws -> Void {
        try checkResult(
            self.dispatchTable.vkGetDeviceFaultInfoEXT(self.handle, faultCounts, faultInfo)
        )
    }

    public func getFaultReportsKHR(timeout: UInt64) throws -> Array<DeviceFaultInfoKHR> {
        try enumerate { pFaultInfo, pFaultCounts in
            self.dispatchTable.vkGetDeviceFaultReportsKHR(self.handle, timeout, pFaultCounts, pFaultInfo)
        }.map { DeviceFaultInfoKHR(cStruct: $0) }
    }

    public func getFaultDebugInfoKHR() throws -> DeviceFaultDebugInfoKHR {
        var out = VkDeviceFaultDebugInfoKHR()
        try checkResult(
            self.dispatchTable.vkGetDeviceFaultDebugInfoKHR(self.handle, &out)
        )
        return DeviceFaultDebugInfoKHR(cStruct: out)
    }

    public func releaseSwapchainImagesKHR(_ releaseInfo: (some Chainable<ReleaseSwapchainImagesInfoKHR>)) throws -> Void {
        try releaseInfo.withCStruct { ptr_releaseInfo in
            try checkResult(
                self.dispatchTable.vkReleaseSwapchainImagesKHR(self.handle, ptr_releaseInfo)
            )
        }
    }

    public func releaseSwapchainImagesKHR(_ releaseInfo: ReleaseSwapchainImagesInfoKHR) throws -> Void {
        try releaseInfo.withCStruct { ptr_releaseInfo in
            try checkResult(
                self.dispatchTable.vkReleaseSwapchainImagesKHR(self.handle, ptr_releaseInfo)
            )
        }
    }

    public func getImageSubresourceLayout(info: (some Chainable<DeviceImageSubresourceInfo>)) -> SubresourceLayout2 {
        info.withCStruct { ptr_info in
            var out = VkSubresourceLayout2()
            self.dispatchTable.vkGetDeviceImageSubresourceLayout(self.handle, ptr_info, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getImageSubresourceLayout(info: DeviceImageSubresourceInfo) -> SubresourceLayout2 {
        info.withCStruct { ptr_info in
            var out = VkSubresourceLayout2()
            self.dispatchTable.vkGetDeviceImageSubresourceLayout(self.handle, ptr_info, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func mapMemory2(_ memoryMapInfo: (some Chainable<MemoryMapInfo>)) throws -> UnsafeMutableRawPointer {
        try memoryMapInfo.withCStruct { ptr_memoryMapInfo in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkMapMemory2(self.handle, ptr_memoryMapInfo, &out)
            )
            return out
        }
    }

    public func mapMemory2(_ memoryMapInfo: MemoryMapInfo) throws -> UnsafeMutableRawPointer {
        try memoryMapInfo.withCStruct { ptr_memoryMapInfo in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkMapMemory2(self.handle, ptr_memoryMapInfo, &out)
            )
            return out
        }
    }

    public func unmapMemory2(_ memoryUnmapInfo: (some Chainable<MemoryUnmapInfo>)) throws -> Void {
        try memoryUnmapInfo.withCStruct { ptr_memoryUnmapInfo in
            try checkResult(
                self.dispatchTable.vkUnmapMemory2(self.handle, ptr_memoryUnmapInfo)
            )
        }
    }

    public func unmapMemory2(_ memoryUnmapInfo: MemoryUnmapInfo) throws -> Void {
        try memoryUnmapInfo.withCStruct { ptr_memoryUnmapInfo in
            try checkResult(
                self.dispatchTable.vkUnmapMemory2(self.handle, ptr_memoryUnmapInfo)
            )
        }
    }

    public func createShadersEXT(createInfos: Array<ShaderCreateInfoEXT>) throws -> Array<ShaderEXT> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkShaderEXT?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateShadersEXT(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { ShaderEXT(handle: $0, device: self) }
        }
    }

    public func getPastPresentationTimingEXT(_ pastPresentationTimingInfo: (some Chainable<PastPresentationTimingInfoEXT>)) throws -> PastPresentationTimingPropertiesEXT {
        try pastPresentationTimingInfo.withCStruct { ptr_pastPresentationTimingInfo in
            var out = VkPastPresentationTimingPropertiesEXT()
            try checkResult(
                self.dispatchTable.vkGetPastPresentationTimingEXT(self.handle, ptr_pastPresentationTimingInfo, &out)
            )
            return PastPresentationTimingPropertiesEXT(cStruct: out)
        }
    }

    public func getPastPresentationTimingEXT(_ pastPresentationTimingInfo: PastPresentationTimingInfoEXT) throws -> PastPresentationTimingPropertiesEXT {
        try pastPresentationTimingInfo.withCStruct { ptr_pastPresentationTimingInfo in
            var out = VkPastPresentationTimingPropertiesEXT()
            try checkResult(
                self.dispatchTable.vkGetPastPresentationTimingEXT(self.handle, ptr_pastPresentationTimingInfo, &out)
            )
            return PastPresentationTimingPropertiesEXT(cStruct: out)
        }
    }

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func getScreenBufferPropertiesQNX(buffer: UnsafePointer<_screen_buffer>) throws -> ScreenBufferPropertiesQNX {
        var out = VkScreenBufferPropertiesQNX()
        try checkResult(
            self.dispatchTable.vkGetScreenBufferPropertiesQNX(self.handle, buffer, &out)
        )
        return ScreenBufferPropertiesQNX(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createExecutionGraphPipelinesAMDX(pipelineCache: PipelineCache? = nil, createInfos: Array<ExecutionGraphPipelineCreateInfoAMDX>) throws -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateExecutionGraphPipelinesAMDX(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandleEXT(_ getMetalHandleInfo: (some Chainable<MemoryGetMetalHandleInfoEXT>)) throws -> UnsafeMutableRawPointer {
        try getMetalHandleInfo.withCStruct { ptr_getMetalHandleInfo in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkGetMemoryMetalHandleEXT(self.handle, ptr_getMetalHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandleEXT(_ getMetalHandleInfo: MemoryGetMetalHandleInfoEXT) throws -> UnsafeMutableRawPointer {
        try getMetalHandleInfo.withCStruct { ptr_getMetalHandleInfo in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkGetMemoryMetalHandleEXT(self.handle, ptr_getMetalHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandlePropertiesEXT(handleType: ExternalMemoryHandleTypeFlags, handle: UnsafeRawPointer) throws -> MemoryMetalHandlePropertiesEXT {
        var out = VkMemoryMetalHandlePropertiesEXT()
        try checkResult(
            self.dispatchTable.vkGetMemoryMetalHandlePropertiesEXT(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), handle, &out)
        )
        return MemoryMetalHandlePropertiesEXT(cStruct: out)
    }
    #endif

    public func convertCooperativeVectorMatrixNV(info: (some Chainable<ConvertCooperativeVectorMatrixInfoNV>)) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkConvertCooperativeVectorMatrixNV(self.handle, ptr_info)
            )
        }
    }

    public func convertCooperativeVectorMatrixNV(info: ConvertCooperativeVectorMatrixInfoNV) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkConvertCooperativeVectorMatrixNV(self.handle, ptr_info)
            )
        }
    }

    public func createExternalComputeQueueNV(_ createInfo: (some Chainable<ExternalComputeQueueCreateInfoNV>)) throws -> ExternalComputeQueueNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkExternalComputeQueueNV!
            try checkResult(
                self.dispatchTable.vkCreateExternalComputeQueueNV(self.handle, ptr_createInfo, nil, &out)
            )
            return ExternalComputeQueueNV(handle: out, device: self)
        }
    }

    public func createExternalComputeQueueNV(_ createInfo: ExternalComputeQueueCreateInfoNV) throws -> ExternalComputeQueueNV {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkExternalComputeQueueNV!
            try checkResult(
                self.dispatchTable.vkCreateExternalComputeQueueNV(self.handle, ptr_createInfo, nil, &out)
            )
            return ExternalComputeQueueNV(handle: out, device: self)
        }
    }

    public func createShaderInstrumentationARM(_ createInfo: (some Chainable<ShaderInstrumentationCreateInfoARM>)) throws -> ShaderInstrumentationARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkShaderInstrumentationARM!
            try checkResult(
                self.dispatchTable.vkCreateShaderInstrumentationARM(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderInstrumentationARM(handle: out, device: self)
        }
    }

    public func createShaderInstrumentationARM(_ createInfo: ShaderInstrumentationCreateInfoARM) throws -> ShaderInstrumentationARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkShaderInstrumentationARM!
            try checkResult(
                self.dispatchTable.vkCreateShaderInstrumentationARM(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderInstrumentationARM(handle: out, device: self)
        }
    }

    public func createTensorARM(_ createInfo: (some Chainable<TensorCreateInfoARM>)) throws -> TensorARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkTensorARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorARM(handle: out, device: self)
        }
    }

    public func createTensorARM(_ createInfo: TensorCreateInfoARM) throws -> TensorARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkTensorARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorARM(handle: out, device: self)
        }
    }

    public func createTensorViewARM(_ createInfo: (some Chainable<TensorViewCreateInfoARM>)) throws -> TensorViewARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkTensorViewARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorViewARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorViewARM(handle: out, device: self)
        }
    }

    public func createTensorViewARM(_ createInfo: TensorViewCreateInfoARM) throws -> TensorViewARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkTensorViewARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorViewARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorViewARM(handle: out, device: self)
        }
    }

    public func getTensorMemoryRequirementsARM(info: (some Chainable<TensorMemoryRequirementsInfoARM>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorMemoryRequirementsARM(info: TensorMemoryRequirementsInfoARM) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindTensorMemoryARM(bindInfos: Array<BindTensorMemoryInfoARM>) throws -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos in
            try checkResult(
                self.dispatchTable.vkBindTensorMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getTensorMemoryRequirementsARM(info: (some Chainable<DeviceTensorMemoryRequirementsARM>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDeviceTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorMemoryRequirementsARM(info: DeviceTensorMemoryRequirementsARM) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDeviceTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorOpaqueCaptureDescriptorDataARM(info: (some Chainable<TensorCaptureDescriptorDataInfoARM>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetTensorOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorOpaqueCaptureDescriptorDataARM(info: TensorCaptureDescriptorDataInfoARM, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetTensorOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorViewOpaqueCaptureDescriptorDataARM(info: (some Chainable<TensorViewCaptureDescriptorDataInfoARM>), data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetTensorViewOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorViewOpaqueCaptureDescriptorDataARM(info: TensorViewCaptureDescriptorDataInfoARM, data: UnsafeMutableRawPointer) throws -> Void {
        try info.withCStruct { ptr_info in
            try checkResult(
                self.dispatchTable.vkGetTensorViewOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func createDataGraphPipelinesARM(deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil, createInfos: Array<DataGraphPipelineCreateInfoARM>) throws -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkCreateDataGraphPipelinesARM(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createDataGraphPipelineSessionARM(_ createInfo: (some Chainable<DataGraphPipelineSessionCreateInfoARM>)) throws -> DataGraphPipelineSessionARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDataGraphPipelineSessionARM!
            try checkResult(
                self.dispatchTable.vkCreateDataGraphPipelineSessionARM(self.handle, ptr_createInfo, nil, &out)
            )
            return DataGraphPipelineSessionARM(handle: out, device: self)
        }
    }

    public func createDataGraphPipelineSessionARM(_ createInfo: DataGraphPipelineSessionCreateInfoARM) throws -> DataGraphPipelineSessionARM {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDataGraphPipelineSessionARM!
            try checkResult(
                self.dispatchTable.vkCreateDataGraphPipelineSessionARM(self.handle, ptr_createInfo, nil, &out)
            )
            return DataGraphPipelineSessionARM(handle: out, device: self)
        }
    }

    public func getDataGraphPipelineSessionBindPointRequirementsARM(info: (some Chainable<DataGraphPipelineSessionBindPointRequirementsInfoARM>)) throws -> Array<DataGraphPipelineSessionBindPointRequirementARM> {
        try info.withCStruct { ptr_info in
            try enumerate { pBindPointRequirements, pBindPointRequirementCount in
                self.dispatchTable.vkGetDataGraphPipelineSessionBindPointRequirementsARM(self.handle, ptr_info, pBindPointRequirementCount, pBindPointRequirements)
            }.map { DataGraphPipelineSessionBindPointRequirementARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelineSessionBindPointRequirementsARM(info: DataGraphPipelineSessionBindPointRequirementsInfoARM) throws -> Array<DataGraphPipelineSessionBindPointRequirementARM> {
        try info.withCStruct { ptr_info in
            try enumerate { pBindPointRequirements, pBindPointRequirementCount in
                self.dispatchTable.vkGetDataGraphPipelineSessionBindPointRequirementsARM(self.handle, ptr_info, pBindPointRequirementCount, pBindPointRequirements)
            }.map { DataGraphPipelineSessionBindPointRequirementARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelineSessionMemoryRequirementsARM(info: (some Chainable<DataGraphPipelineSessionMemoryRequirementsInfoARM>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDataGraphPipelineSessionMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getDataGraphPipelineSessionMemoryRequirementsARM(info: DataGraphPipelineSessionMemoryRequirementsInfoARM) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            self.dispatchTable.vkGetDataGraphPipelineSessionMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindDataGraphPipelineSessionMemoryARM(bindInfos: Array<BindDataGraphPipelineSessionMemoryInfoARM>) throws -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos in
            try checkResult(
                self.dispatchTable.vkBindDataGraphPipelineSessionMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getDataGraphPipelineAvailablePropertiesARM(_ pipelineInfo: (some Chainable<DataGraphPipelineInfoARM>)) throws -> Array<DataGraphPipelinePropertyARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            try enumerate { pProperties, pPropertiesCount in
                self.dispatchTable.vkGetDataGraphPipelineAvailablePropertiesARM(self.handle, ptr_pipelineInfo, pPropertiesCount, pProperties)
            }.map { DataGraphPipelinePropertyARM(rawValue: unsafeBitCast($0, to: UInt32.self))! }
        }
    }

    public func getDataGraphPipelineAvailablePropertiesARM(_ pipelineInfo: DataGraphPipelineInfoARM) throws -> Array<DataGraphPipelinePropertyARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            try enumerate { pProperties, pPropertiesCount in
                self.dispatchTable.vkGetDataGraphPipelineAvailablePropertiesARM(self.handle, ptr_pipelineInfo, pPropertiesCount, pProperties)
            }.map { DataGraphPipelinePropertyARM(rawValue: unsafeBitCast($0, to: UInt32.self))! }
        }
    }

    public func getDataGraphPipelinePropertiesARM(_ pipelineInfo: (some Chainable<DataGraphPipelineInfoARM>), propertiesCount: UInt32) throws -> Array<DataGraphPipelinePropertyQueryResultARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            try Array<VkDataGraphPipelinePropertyQueryResultARM>(unsafeUninitializedCapacity: Int(propertiesCount)) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkGetDataGraphPipelinePropertiesARM(self.handle, ptr_pipelineInfo, propertiesCount, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DataGraphPipelinePropertyQueryResultARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelinePropertiesARM(_ pipelineInfo: DataGraphPipelineInfoARM, propertiesCount: UInt32) throws -> Array<DataGraphPipelinePropertyQueryResultARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo in
            try Array<VkDataGraphPipelinePropertyQueryResultARM>(unsafeUninitializedCapacity: Int(propertiesCount)) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkGetDataGraphPipelinePropertiesARM(self.handle, ptr_pipelineInfo, propertiesCount, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DataGraphPipelinePropertyQueryResultARM(cStruct: $0) }
        }
    }

    #if VK_USE_PLATFORM_OHOS
    public func getNativeBufferPropertiesOHOS(buffer: UnsafePointer<OH_NativeBuffer>) throws -> NativeBufferPropertiesOHOS {
        var out = VkNativeBufferPropertiesOHOS()
        try checkResult(
            self.dispatchTable.vkGetNativeBufferPropertiesOHOS(self.handle, buffer, &out)
        )
        return NativeBufferPropertiesOHOS(cStruct: out)
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func getMemoryNativeBufferOHOS(info: (some Chainable<MemoryGetNativeBufferInfoOHOS>)) throws -> UnsafeMutablePointer<OH_NativeBuffer> {
        try info.withCStruct { ptr_info in
            var out: UnsafeMutablePointer<OH_NativeBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryNativeBufferOHOS(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func getMemoryNativeBufferOHOS(info: MemoryGetNativeBufferInfoOHOS) throws -> UnsafeMutablePointer<OH_NativeBuffer> {
        try info.withCStruct { ptr_info in
            var out: UnsafeMutablePointer<OH_NativeBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryNativeBufferOHOS(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    public func writeSamplerDescriptorsEXT(samplers: Array<SamplerCreateInfo>, descriptors: Array<HostAddressRangeEXT>) throws -> Void {
        try samplers.withCStructBufferPointer { ptr_samplers in
            try descriptors.withCStructBufferPointer { ptr_descriptors in
                try checkResult(
                    self.dispatchTable.vkWriteSamplerDescriptorsEXT(self.handle, UInt32(ptr_samplers.count), ptr_samplers.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeResourceDescriptorsEXT(resources: Array<ResourceDescriptorInfoEXT>, descriptors: Array<HostAddressRangeEXT>) throws -> Void {
        try resources.withCStructBufferPointer { ptr_resources in
            try descriptors.withCStructBufferPointer { ptr_descriptors in
                try checkResult(
                    self.dispatchTable.vkWriteResourceDescriptorsEXT(self.handle, UInt32(ptr_resources.count), ptr_resources.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func registerCustomBorderColorEXT(borderColor: (some Chainable<SamplerCustomBorderColorCreateInfoEXT>), requestIndex: Bool) throws -> UInt32 {
        try borderColor.withCStruct { ptr_borderColor in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkRegisterCustomBorderColorEXT(self.handle, ptr_borderColor, VkBool32(requestIndex ? VK_TRUE : VK_FALSE), &out)
            )
            return out
        }
    }

    public func registerCustomBorderColorEXT(borderColor: SamplerCustomBorderColorCreateInfoEXT, requestIndex: Bool) throws -> UInt32 {
        try borderColor.withCStruct { ptr_borderColor in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkRegisterCustomBorderColorEXT(self.handle, ptr_borderColor, VkBool32(requestIndex ? VK_TRUE : VK_FALSE), &out)
            )
            return out
        }
    }

    public func unregisterCustomBorderColorEXT(index: UInt32) -> Void {
        self.dispatchTable.vkUnregisterCustomBorderColorEXT(self.handle, index)
    }

    public func getImageOpaqueCaptureDataEXT(images: Array<Image>) throws -> Array<HostAddressRangeEXT> {
        try images.map{ $0.handle }.withUnsafeBufferPointer { ptr_images in
            try Array<VkHostAddressRangeEXT>(unsafeUninitializedCapacity: Int(UInt32(ptr_images.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkGetImageOpaqueCaptureDataEXT(self.handle, UInt32(ptr_images.count), ptr_images.baseAddress, out.baseAddress)
                )
                initializedCount = out.count
            }.map { HostAddressRangeEXT(cStruct: $0) }
        }
    }

    public func getTensorOpaqueCaptureDataARM(tensors: Array<TensorARM>) throws -> Array<HostAddressRangeEXT> {
        try tensors.map{ $0.handle }.withUnsafeBufferPointer { ptr_tensors in
            try Array<VkHostAddressRangeEXT>(unsafeUninitializedCapacity: Int(UInt32(ptr_tensors.count))) { out, initializedCount in
                try checkResult(
                    self.dispatchTable.vkGetTensorOpaqueCaptureDataARM(self.handle, UInt32(ptr_tensors.count), ptr_tensors.baseAddress, out.baseAddress)
                )
                initializedCount = out.count
            }.map { HostAddressRangeEXT(cStruct: $0) }
        }
    }

    public func createAccelerationStructure2KHR(_ createInfo: (some Chainable<AccelerationStructureCreateInfo2KHR>)) throws -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructure2KHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }

    public func createAccelerationStructure2KHR(_ createInfo: AccelerationStructureCreateInfo2KHR) throws -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructure2KHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }
}

public class Queue: _HandleContainer {
    let handle: VkQueue?
    public let device: Device

    public init(handle: VkQueue!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func submit(submits: Array<SubmitInfo> = [], fence: Fence? = nil) throws -> Void {
        try submits.withCStructBufferPointer { ptr_submits in
            try checkResult(
                self.device.dispatchTable.vkQueueSubmit(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func waitIdle() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkQueueWaitIdle(self.handle)
        )
    }

    public func bindSparse(_ bindInfo: Array<BindSparseInfo> = [], fence: Fence? = nil) throws -> Void {
        try bindInfo.withCStructBufferPointer { ptr_bindInfo in
            try checkResult(
                self.device.dispatchTable.vkQueueBindSparse(self.handle, UInt32(ptr_bindInfo.count), ptr_bindInfo.baseAddress, fence?.handle)
            )
        }
    }

    public func presentKHR(_ presentInfo: (some Chainable<PresentInfoKHR>)) throws -> Void {
        try presentInfo.withCStruct { ptr_presentInfo in
            try checkResult(
                self.device.dispatchTable.vkQueuePresentKHR(self.handle, ptr_presentInfo)
            )
        }
    }

    public func presentKHR(_ presentInfo: PresentInfoKHR) throws -> Void {
        try presentInfo.withCStruct { ptr_presentInfo in
            try checkResult(
                self.device.dispatchTable.vkQueuePresentKHR(self.handle, ptr_presentInfo)
            )
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.device.dispatchTable.vkQueueBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.device.dispatchTable.vkQueueBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func endDebugUtilsLabelEXT() -> Void {
        self.device.dispatchTable.vkQueueEndDebugUtilsLabelEXT(self.handle)
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.device.dispatchTable.vkQueueInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.device.dispatchTable.vkQueueInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func getCheckpointDataNV() -> Array<CheckpointDataNV> {
        enumerate { pCheckpointData, pCheckpointDataCount in
            self.device.dispatchTable.vkGetQueueCheckpointDataNV(self.handle, pCheckpointDataCount, pCheckpointData)
        }.map { CheckpointDataNV(cStruct: $0) }
    }

    public func setPerformanceConfigurationINTEL(configuration: PerformanceConfigurationINTEL) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkQueueSetPerformanceConfigurationINTEL(self.handle, configuration.handle)
        )
    }

    public func submit2(submits: Array<SubmitInfo2> = [], fence: Fence? = nil) throws -> Void {
        try submits.withCStructBufferPointer { ptr_submits in
            try checkResult(
                self.device.dispatchTable.vkQueueSubmit2(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func getCheckpointData2NV() -> Array<CheckpointData2NV> {
        enumerate { pCheckpointData, pCheckpointDataCount in
            self.device.dispatchTable.vkGetQueueCheckpointData2NV(self.handle, pCheckpointDataCount, pCheckpointData)
        }.map { CheckpointData2NV(cStruct: $0) }
    }

    public func notifyOutOfBandNV(_ queueTypeInfo: (some Chainable<OutOfBandQueueTypeInfoNV>)) -> Void {
        queueTypeInfo.withCStruct { ptr_queueTypeInfo in
            self.device.dispatchTable.vkQueueNotifyOutOfBandNV(self.handle, ptr_queueTypeInfo)
        }
    }

    public func notifyOutOfBandNV(_ queueTypeInfo: OutOfBandQueueTypeInfoNV) -> Void {
        queueTypeInfo.withCStruct { ptr_queueTypeInfo in
            self.device.dispatchTable.vkQueueNotifyOutOfBandNV(self.handle, ptr_queueTypeInfo)
        }
    }

    public func setPerfHintQCOM(_ perfHintInfo: (some Chainable<PerfHintInfoQCOM>)) throws -> Void {
        try perfHintInfo.withCStruct { ptr_perfHintInfo in
            try checkResult(
                self.device.dispatchTable.vkQueueSetPerfHintQCOM(self.handle, ptr_perfHintInfo)
            )
        }
    }

    public func setPerfHintQCOM(_ perfHintInfo: PerfHintInfoQCOM) throws -> Void {
        try perfHintInfo.withCStruct { ptr_perfHintInfo in
            try checkResult(
                self.device.dispatchTable.vkQueueSetPerfHintQCOM(self.handle, ptr_perfHintInfo)
            )
        }
    }
}

public class CommandPool: _HandleContainer {
    let handle: VkCommandPool?
    public let device: Device

    public init(handle: VkCommandPool!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyCommandPool(self.device.handle, self.handle, nil)
    }

    public func reset(flags: CommandPoolResetFlags = []) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkResetCommandPool(self.device.handle, self.handle, flags.rawValue)
        )
    }

    public func freeCommandBuffers(commandBuffers: Array<CommandBuffer>) -> Void {
        commandBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_commandBuffers in
            self.device.dispatchTable.vkFreeCommandBuffers(self.device.handle, self.handle, UInt32(ptr_commandBuffers.count), ptr_commandBuffers.baseAddress)
        }
    }

    public func trim(flags: CommandPoolTrimFlags = []) -> Void {
        self.device.dispatchTable.vkTrimCommandPool(self.device.handle, self.handle, flags.rawValue)
    }
}

public class CommandBuffer: _HandleContainer {
    let handle: VkCommandBuffer?
    public let commandPool: CommandPool

    public init(handle: VkCommandBuffer!, commandPool: CommandPool) {
        self.handle = handle
        self.commandPool = commandPool
    }

    public func begin(_ beginInfo: (some Chainable<CommandBufferBeginInfo>)) throws -> Void {
        try beginInfo.withCStruct { ptr_beginInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkBeginCommandBuffer(self.handle, ptr_beginInfo)
            )
        }
    }

    public func begin(_ beginInfo: CommandBufferBeginInfo) throws -> Void {
        try beginInfo.withCStruct { ptr_beginInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkBeginCommandBuffer(self.handle, ptr_beginInfo)
            )
        }
    }

    public func end() throws -> Void {
        try checkResult(
            self.commandPool.device.dispatchTable.vkEndCommandBuffer(self.handle)
        )
    }

    public func reset(flags: CommandBufferResetFlags = []) throws -> Void {
        try checkResult(
            self.commandPool.device.dispatchTable.vkResetCommandBuffer(self.handle, flags.rawValue)
        )
    }

    public func cmdBindPipeline(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindPipeline(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle)
    }

    public func cmdSetPrimitiveRestartIndexEXT(primitiveRestartIndex: UInt32 = 0) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPrimitiveRestartIndexEXT(self.handle, primitiveRestartIndex)
    }

    public func cmdSetAttachmentFeedbackLoopEnableEXT(aspectMask: ImageAspectFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetAttachmentFeedbackLoopEnableEXT(self.handle, aspectMask.rawValue)
    }

    public func cmdSetViewport(firstViewport: UInt32, viewports: Array<Viewport>) -> Void {
        viewports.withCStructBufferPointer { ptr_viewports in
            self.commandPool.device.dispatchTable.vkCmdSetViewport(self.handle, firstViewport, UInt32(ptr_viewports.count), ptr_viewports.baseAddress)
        }
    }

    public func cmdSetScissor(firstScissor: UInt32, scissors: Array<Rect2D>) -> Void {
        scissors.withCStructBufferPointer { ptr_scissors in
            self.commandPool.device.dispatchTable.vkCmdSetScissor(self.handle, firstScissor, UInt32(ptr_scissors.count), ptr_scissors.baseAddress)
        }
    }

    public func cmdSetLineWidth(lineWidth: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineWidth(self.handle, lineWidth)
    }

    public func cmdSetDepthBias(depthBiasConstantFactor: Float, depthBiasClamp: Float, depthBiasSlopeFactor: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBias(self.handle, depthBiasConstantFactor, depthBiasClamp, depthBiasSlopeFactor)
    }

    public func cmdSetBlendConstants(blendConstants: (Float, Float, Float, Float)) -> Void {
        withUnsafeBytes(of: blendConstants) { ptr_blendConstants in
            self.commandPool.device.dispatchTable.vkCmdSetBlendConstants(self.handle, ptr_blendConstants.bindMemory(to: Float.self).baseAddress)
        }
    }

    public func cmdSetDepthBounds(minDepthBounds: Float, maxDepthBounds: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBounds(self.handle, minDepthBounds, maxDepthBounds)
    }

    public func cmdSetStencilCompareMask(faceMask: StencilFaceFlags, compareMask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilCompareMask(self.handle, faceMask.rawValue, compareMask)
    }

    public func cmdSetStencilWriteMask(faceMask: StencilFaceFlags, writeMask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilWriteMask(self.handle, faceMask.rawValue, writeMask)
    }

    public func cmdSetStencilReference(faceMask: StencilFaceFlags, reference: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilReference(self.handle, faceMask.rawValue, reference)
    }

    public func cmdBindDescriptorSets(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, descriptorSets: Array<DescriptorSet?>, dynamicOffsets: Array<UInt32> = []) -> Void {
        descriptorSets.map{ $0?.handle }.withUnsafeBufferPointer { ptr_descriptorSets in
            dynamicOffsets.withUnsafeBufferPointer { ptr_dynamicOffsets in
                self.commandPool.device.dispatchTable.vkCmdBindDescriptorSets(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, firstSet, UInt32(ptr_descriptorSets.count), ptr_descriptorSets.baseAddress, UInt32(ptr_dynamicOffsets.count), ptr_dynamicOffsets.baseAddress)
            }
        }
    }

    public func cmdBindIndexBuffer(buffer: Buffer? = nil, offset: VkDeviceSize, indexType: IndexType) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer(self.handle, buffer?.handle, offset, VkIndexType(rawValue: VkIndexType.RawValue(indexType.rawValue)))
    }

    public func cmdBindVertexBuffers(firstBinding: UInt32, buffers: Array<Buffer?>, offsets: Array<VkDeviceSize>) -> Void {
        buffers.map{ $0?.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                self.commandPool.device.dispatchTable.vkCmdBindVertexBuffers(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress, ptr_offsets.baseAddress)
            }
        }
    }

    public func cmdDraw(vertexCount: UInt32, instanceCount: UInt32, firstVertex: UInt32, firstInstance: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDraw(self.handle, vertexCount, instanceCount, firstVertex, firstInstance)
    }

    public func cmdDrawIndexed(indexCount: UInt32, instanceCount: UInt32, firstIndex: UInt32, vertexOffset: Int32, firstInstance: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndexed(self.handle, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance)
    }

    public func cmdDrawMultiEXT(_ vertexInfo: Array<MultiDrawInfoEXT> = [], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32) -> Void {
        vertexInfo.withCStructBufferPointer { ptr_vertexInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawMultiEXT(self.handle, UInt32(ptr_vertexInfo.count), ptr_vertexInfo.baseAddress, instanceCount, firstInstance, stride)
        }
    }

    public func cmdDrawMultiIndexedEXT(_ indexInfo: Array<MultiDrawIndexedInfoEXT> = [], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32, vertexOffset: UnsafePointer<Int32>? = nil) -> Void {
        indexInfo.withCStructBufferPointer { ptr_indexInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawMultiIndexedEXT(self.handle, UInt32(ptr_indexInfo.count), ptr_indexInfo.baseAddress, instanceCount, firstInstance, stride, vertexOffset)
        }
    }

    public func cmdDrawIndirect(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndirect(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func cmdDrawIndexedIndirect(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirect(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func cmdDispatch(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatch(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func cmdDispatchIndirect(buffer: Buffer, offset: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatchIndirect(self.handle, buffer.handle, offset)
    }

    public func cmdSubpassShadingHUAWEI() -> Void {
        self.commandPool.device.dispatchTable.vkCmdSubpassShadingHUAWEI(self.handle)
    }

    public func cmdDrawClusterHUAWEI(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawClusterHUAWEI(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func cmdDrawClusterIndirectHUAWEI(buffer: Buffer, offset: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawClusterIndirectHUAWEI(self.handle, buffer.handle, offset)
    }

    public func cmdUpdatePipelineIndirectBufferNV(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) -> Void {
        self.commandPool.device.dispatchTable.vkCmdUpdatePipelineIndirectBufferNV(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle)
    }

    public func cmdCopyBuffer(srcBuffer: Buffer, dstBuffer: Buffer, regions: Array<BufferCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyBuffer(self.handle, srcBuffer.handle, dstBuffer.handle, UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func cmdCopyImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func cmdBlitImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageBlit>, filter: Filter) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdBlitImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress, VkFilter(rawValue: VkFilter.RawValue(filter.rawValue)))
        }
    }

    public func cmdCopyBufferToImage(srcBuffer: Buffer, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<BufferImageCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyBufferToImage(self.handle, srcBuffer.handle, dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func cmdCopyImageToBuffer(srcImage: Image, srcImageLayout: ImageLayout, dstBuffer: Buffer, regions: Array<BufferImageCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToBuffer(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstBuffer.handle, UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func cmdCopyMemoryIndirectNV(copyBufferAddress: VkDeviceAddress, copyCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyMemoryIndirectNV(self.handle, copyBufferAddress, copyCount, stride)
    }

    public func cmdCopyMemoryIndirectKHR(_ copyMemoryIndirectInfo: (some Chainable<CopyMemoryIndirectInfoKHR>)) -> Void {
        copyMemoryIndirectInfo.withCStruct { ptr_copyMemoryIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryIndirectKHR(self.handle, ptr_copyMemoryIndirectInfo)
        }
    }

    public func cmdCopyMemoryIndirectKHR(_ copyMemoryIndirectInfo: CopyMemoryIndirectInfoKHR) -> Void {
        copyMemoryIndirectInfo.withCStruct { ptr_copyMemoryIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryIndirectKHR(self.handle, ptr_copyMemoryIndirectInfo)
        }
    }

    public func cmdCopyMemoryToImageIndirectNV(copyBufferAddress: VkDeviceAddress, stride: UInt32, dstImage: Image, dstImageLayout: ImageLayout, imageSubresources: Array<ImageSubresourceLayers>) -> Void {
        imageSubresources.withCStructBufferPointer { ptr_imageSubresources in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageIndirectNV(self.handle, copyBufferAddress, UInt32(ptr_imageSubresources.count), stride, dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), ptr_imageSubresources.baseAddress)
        }
    }

    public func cmdCopyMemoryToImageIndirectKHR(_ copyMemoryToImageIndirectInfo: (some Chainable<CopyMemoryToImageIndirectInfoKHR>)) -> Void {
        copyMemoryToImageIndirectInfo.withCStruct { ptr_copyMemoryToImageIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageIndirectKHR(self.handle, ptr_copyMemoryToImageIndirectInfo)
        }
    }

    public func cmdCopyMemoryToImageIndirectKHR(_ copyMemoryToImageIndirectInfo: CopyMemoryToImageIndirectInfoKHR) -> Void {
        copyMemoryToImageIndirectInfo.withCStruct { ptr_copyMemoryToImageIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageIndirectKHR(self.handle, ptr_copyMemoryToImageIndirectInfo)
        }
    }

    public func cmdUpdateBuffer(dstBuffer: Buffer, dstOffset: VkDeviceSize, dataSize: VkDeviceSize, data: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdUpdateBuffer(self.handle, dstBuffer.handle, dstOffset, dataSize, data)
    }

    public func cmdFillBuffer(dstBuffer: Buffer, dstOffset: VkDeviceSize, size: VkDeviceSize, data: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdFillBuffer(self.handle, dstBuffer.handle, dstOffset, size, data)
    }

    public func cmdClearColorImage(image: Image, imageLayout: ImageLayout, color: UnsafePointer<VkClearColorValue>, ranges: Array<ImageSubresourceRange>) -> Void {
        ranges.withCStructBufferPointer { ptr_ranges in
            self.commandPool.device.dispatchTable.vkCmdClearColorImage(self.handle, image.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)), color, UInt32(ptr_ranges.count), ptr_ranges.baseAddress)
        }
    }

    public func cmdClearDepthStencilImage(image: Image, imageLayout: ImageLayout, depthStencil: ClearDepthStencilValue, ranges: Array<ImageSubresourceRange>) -> Void {
        depthStencil.withCStruct { ptr_depthStencil in
            ranges.withCStructBufferPointer { ptr_ranges in
                self.commandPool.device.dispatchTable.vkCmdClearDepthStencilImage(self.handle, image.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)), ptr_depthStencil, UInt32(ptr_ranges.count), ptr_ranges.baseAddress)
            }
        }
    }

    public func cmdClearAttachments(attachments: Array<ClearAttachment>, rects: Array<ClearRect>) -> Void {
        attachments.withCStructBufferPointer { ptr_attachments in
            rects.withCStructBufferPointer { ptr_rects in
                self.commandPool.device.dispatchTable.vkCmdClearAttachments(self.handle, UInt32(ptr_attachments.count), ptr_attachments.baseAddress, UInt32(ptr_rects.count), ptr_rects.baseAddress)
            }
        }
    }

    public func cmdResolveImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageResolve>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdResolveImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func cmdSetEvent(event: Event, stageMask: PipelineStageFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetEvent(self.handle, event.handle, stageMask.rawValue)
    }

    public func cmdResetEvent(event: Event, stageMask: PipelineStageFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdResetEvent(self.handle, event.handle, stageMask.rawValue)
    }

    public func cmdWaitEvents(events: Array<Event>, srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], memoryBarriers: Array<MemoryBarrier> = [], bufferMemoryBarriers: Array<BufferMemoryBarrier> = [], imageMemoryBarriers: Array<ImageMemoryBarrier> = []) -> Void {
        events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
                bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                    imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                        self.commandPool.device.dispatchTable.vkCmdWaitEvents(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress, srcStageMask.rawValue, dstStageMask.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                    }
                }
            }
        }
    }

    public func cmdPipelineBarrier(srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], dependencyFlags: DependencyFlags = [], memoryBarriers: Array<MemoryBarrier> = [], bufferMemoryBarriers: Array<BufferMemoryBarrier> = [], imageMemoryBarriers: Array<ImageMemoryBarrier> = []) -> Void {
        memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
            bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                    self.commandPool.device.dispatchTable.vkCmdPipelineBarrier(self.handle, srcStageMask.rawValue, dstStageMask.rawValue, dependencyFlags.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                }
            }
        }
    }

    public func cmdBeginQuery(queryPool: QueryPool, query: UInt32, flags: QueryControlFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBeginQuery(self.handle, queryPool.handle, query, flags.rawValue)
    }

    public func cmdEndQuery(queryPool: QueryPool, query: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndQuery(self.handle, queryPool.handle, query)
    }

    public func cmdBeginConditionalRenderingEXT(conditionalRenderingBegin: (some Chainable<ConditionalRenderingBeginInfoEXT>)) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRenderingEXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func cmdBeginConditionalRenderingEXT(conditionalRenderingBegin: ConditionalRenderingBeginInfoEXT) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRenderingEXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func cmdEndConditionalRenderingEXT() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndConditionalRenderingEXT(self.handle)
    }

    public func cmdBeginCustomResolveEXT(_ beginCustomResolveInfo: (some Chainable<BeginCustomResolveInfoEXT>)) -> Void {
        beginCustomResolveInfo.withCStruct { ptr_beginCustomResolveInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginCustomResolveEXT(self.handle, ptr_beginCustomResolveInfo)
        }
    }

    public func cmdBeginCustomResolveEXT(_ beginCustomResolveInfo: BeginCustomResolveInfoEXT? = nil) -> Void {
        beginCustomResolveInfo.withOptionalCStruct { ptr_beginCustomResolveInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginCustomResolveEXT(self.handle, ptr_beginCustomResolveInfo)
        }
    }

    public func cmdResetQueryPool(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdResetQueryPool(self.handle, queryPool.handle, firstQuery, queryCount)
    }

    public func cmdWriteTimestamp(pipelineStage: PipelineStageFlags, queryPool: QueryPool, query: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteTimestamp(self.handle, VkPipelineStageFlagBits(rawValue: VkPipelineStageFlagBits.RawValue(pipelineStage.rawValue)), queryPool.handle, query)
    }

    public func cmdCopyQueryPoolResults(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dstBuffer: Buffer, dstOffset: VkDeviceSize, stride: VkDeviceSize, flags: QueryResultFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyQueryPoolResults(self.handle, queryPool.handle, firstQuery, queryCount, dstBuffer.handle, dstOffset, stride, flags.rawValue)
    }

    public func cmdPushConstants(layout: PipelineLayout, stageFlags: ShaderStageFlags, offset: UInt32, size: UInt32, values: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdPushConstants(self.handle, layout.handle, stageFlags.rawValue, offset, size, values)
    }

    public func cmdBeginRenderPass(renderPassBegin: (some Chainable<RenderPassBeginInfo>), contents: SubpassContents) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginRenderPass(self.handle, ptr_renderPassBegin, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
        }
    }

    public func cmdBeginRenderPass(renderPassBegin: RenderPassBeginInfo, contents: SubpassContents) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginRenderPass(self.handle, ptr_renderPassBegin, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
        }
    }

    public func cmdNextSubpass(contents: SubpassContents) -> Void {
        self.commandPool.device.dispatchTable.vkCmdNextSubpass(self.handle, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
    }

    public func cmdEndRenderPass() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndRenderPass(self.handle)
    }

    public func cmdExecuteCommands(commandBuffers: Array<CommandBuffer>) -> Void {
        commandBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_commandBuffers in
            self.commandPool.device.dispatchTable.vkCmdExecuteCommands(self.handle, UInt32(ptr_commandBuffers.count), ptr_commandBuffers.baseAddress)
        }
    }

    public func cmdDebugMarkerBeginEXT(_ markerInfo: (some Chainable<DebugMarkerMarkerInfoEXT>)) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerBeginEXT(self.handle, ptr_markerInfo)
        }
    }

    public func cmdDebugMarkerBeginEXT(_ markerInfo: DebugMarkerMarkerInfoEXT) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerBeginEXT(self.handle, ptr_markerInfo)
        }
    }

    public func cmdDebugMarkerEndEXT() -> Void {
        self.commandPool.device.dispatchTable.vkCmdDebugMarkerEndEXT(self.handle)
    }

    public func cmdDebugMarkerInsertEXT(_ markerInfo: (some Chainable<DebugMarkerMarkerInfoEXT>)) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerInsertEXT(self.handle, ptr_markerInfo)
        }
    }

    public func cmdDebugMarkerInsertEXT(_ markerInfo: DebugMarkerMarkerInfoEXT) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerInsertEXT(self.handle, ptr_markerInfo)
        }
    }

    public func cmdExecuteGeneratedCommandsNV(isPreprocessed: Bool, generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoNV>)) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsNV(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func cmdExecuteGeneratedCommandsNV(isPreprocessed: Bool, generatedCommandsInfo: GeneratedCommandsInfoNV) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsNV(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func cmdPreprocessGeneratedCommandsNV(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoNV>)) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsNV(self.handle, ptr_generatedCommandsInfo)
        }
    }

    public func cmdPreprocessGeneratedCommandsNV(_ generatedCommandsInfo: GeneratedCommandsInfoNV) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsNV(self.handle, ptr_generatedCommandsInfo)
        }
    }

    public func cmdBindPipelineShaderGroupNV(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline, groupIndex: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindPipelineShaderGroupNV(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle, groupIndex)
    }

    public func cmdExecuteGeneratedCommandsEXT(isPreprocessed: Bool, generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoEXT>)) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsEXT(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func cmdExecuteGeneratedCommandsEXT(isPreprocessed: Bool, generatedCommandsInfo: GeneratedCommandsInfoEXT) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsEXT(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func cmdPreprocessGeneratedCommandsEXT(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoEXT>), stateCommandBuffer: CommandBuffer) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsEXT(self.handle, ptr_generatedCommandsInfo, stateCommandBuffer.handle)
        }
    }

    public func cmdPreprocessGeneratedCommandsEXT(_ generatedCommandsInfo: GeneratedCommandsInfoEXT, stateCommandBuffer: CommandBuffer) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsEXT(self.handle, ptr_generatedCommandsInfo, stateCommandBuffer.handle)
        }
    }

    public func cmdPushDescriptorSet(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32, descriptorWrites: Array<WriteDescriptorSet>) -> Void {
        descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress)
        }
    }

    public func cmdSetDeviceMask(deviceMask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDeviceMask(self.handle, deviceMask)
    }

    public func cmdDispatchBase(baseGroupX: UInt32, baseGroupY: UInt32, baseGroupZ: UInt32, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatchBase(self.handle, baseGroupX, baseGroupY, baseGroupZ, groupCountX, groupCountY, groupCountZ)
    }

    public func cmdPushDescriptorSetWithTemplate(descriptorUpdateTemplate: DescriptorUpdateTemplate, layout: PipelineLayout, set: UInt32, data: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdPushDescriptorSetWithTemplate(self.handle, descriptorUpdateTemplate.handle, layout.handle, set, data)
    }

    public func cmdSetViewportWScalingNV(firstViewport: UInt32, viewportWScalings: Array<ViewportWScalingNV>) -> Void {
        viewportWScalings.withCStructBufferPointer { ptr_viewportWScalings in
            self.commandPool.device.dispatchTable.vkCmdSetViewportWScalingNV(self.handle, firstViewport, UInt32(ptr_viewportWScalings.count), ptr_viewportWScalings.baseAddress)
        }
    }

    public func cmdSetDiscardRectangleEXT(firstDiscardRectangle: UInt32, discardRectangles: Array<Rect2D>) -> Void {
        discardRectangles.withCStructBufferPointer { ptr_discardRectangles in
            self.commandPool.device.dispatchTable.vkCmdSetDiscardRectangleEXT(self.handle, firstDiscardRectangle, UInt32(ptr_discardRectangles.count), ptr_discardRectangles.baseAddress)
        }
    }

    public func cmdSetDiscardRectangleEnableEXT(discardRectangleEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDiscardRectangleEnableEXT(self.handle, VkBool32(discardRectangleEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetDiscardRectangleModeEXT(discardRectangleMode: DiscardRectangleModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDiscardRectangleModeEXT(self.handle, VkDiscardRectangleModeEXT(rawValue: VkDiscardRectangleModeEXT.RawValue(discardRectangleMode.rawValue)))
    }

    public func cmdSetSampleLocationsEXT(_ sampleLocationsInfo: (some Chainable<SampleLocationsInfoEXT>)) -> Void {
        sampleLocationsInfo.withCStruct { ptr_sampleLocationsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetSampleLocationsEXT(self.handle, ptr_sampleLocationsInfo)
        }
    }

    public func cmdSetSampleLocationsEXT(_ sampleLocationsInfo: SampleLocationsInfoEXT) -> Void {
        sampleLocationsInfo.withCStruct { ptr_sampleLocationsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetSampleLocationsEXT(self.handle, ptr_sampleLocationsInfo)
        }
    }

    public func cmdBeginDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func cmdBeginDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func cmdEndDebugUtilsLabelEXT() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndDebugUtilsLabelEXT(self.handle)
    }

    public func cmdInsertDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func cmdInsertDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func cmdWriteBufferMarkerAMD(pipelineStage: PipelineStageFlags, dstBuffer: Buffer, dstOffset: VkDeviceSize, marker: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteBufferMarkerAMD(self.handle, VkPipelineStageFlagBits(rawValue: VkPipelineStageFlagBits.RawValue(pipelineStage.rawValue)), dstBuffer.handle, dstOffset, marker)
    }

    public func cmdBeginRenderPass2(renderPassBegin: (some Chainable<RenderPassBeginInfo>), subpassBeginInfo: (some Chainable<SubpassBeginInfo>)) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
                self.commandPool.device.dispatchTable.vkCmdBeginRenderPass2(self.handle, ptr_renderPassBegin, ptr_subpassBeginInfo)
            }
        }
    }

    public func cmdBeginRenderPass2(renderPassBegin: RenderPassBeginInfo, subpassBeginInfo: SubpassBeginInfo) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
                self.commandPool.device.dispatchTable.vkCmdBeginRenderPass2(self.handle, ptr_renderPassBegin, ptr_subpassBeginInfo)
            }
        }
    }

    public func cmdNextSubpass2(_ subpassBeginInfo: (some Chainable<SubpassBeginInfo>), subpassEndInfo: (some Chainable<SubpassEndInfo>)) -> Void {
        subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
            subpassEndInfo.withCStruct { ptr_subpassEndInfo in
                self.commandPool.device.dispatchTable.vkCmdNextSubpass2(self.handle, ptr_subpassBeginInfo, ptr_subpassEndInfo)
            }
        }
    }

    public func cmdNextSubpass2(_ subpassBeginInfo: SubpassBeginInfo, subpassEndInfo: SubpassEndInfo) -> Void {
        subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
            subpassEndInfo.withCStruct { ptr_subpassEndInfo in
                self.commandPool.device.dispatchTable.vkCmdNextSubpass2(self.handle, ptr_subpassBeginInfo, ptr_subpassEndInfo)
            }
        }
    }

    public func cmdEndRenderPass2(_ subpassEndInfo: (some Chainable<SubpassEndInfo>)) -> Void {
        subpassEndInfo.withCStruct { ptr_subpassEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRenderPass2(self.handle, ptr_subpassEndInfo)
        }
    }

    public func cmdEndRenderPass2(_ subpassEndInfo: SubpassEndInfo) -> Void {
        subpassEndInfo.withCStruct { ptr_subpassEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRenderPass2(self.handle, ptr_subpassEndInfo)
        }
    }

    public func cmdDrawIndirectCount(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndirectCount(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func cmdDrawIndexedIndirectCount(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirectCount(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func cmdSetCheckpointNV(checkpointMarker: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCheckpointNV(self.handle, checkpointMarker)
    }

    public func cmdBindTransformFeedbackBuffersEXT(firstBinding: UInt32, buffers: Array<Buffer>, offsets: Array<VkDeviceSize>, sizes: Array<VkDeviceSize>?) -> Void {
        buffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                sizes.withOptionalUnsafeBufferPointer { ptr_sizes in
                    self.commandPool.device.dispatchTable.vkCmdBindTransformFeedbackBuffersEXT(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress, ptr_offsets.baseAddress, ptr_sizes.baseAddress)
                }
            }
        }
    }

    public func cmdBeginTransformFeedbackEXT(firstCounterBuffer: UInt32, counterBuffers: Array<Buffer> = [], counterBufferOffsets: Array<VkDeviceSize>? = []) -> Void {
        counterBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_counterBuffers in
            counterBufferOffsets.withOptionalUnsafeBufferPointer { ptr_counterBufferOffsets in
                self.commandPool.device.dispatchTable.vkCmdBeginTransformFeedbackEXT(self.handle, firstCounterBuffer, UInt32(ptr_counterBuffers.count), ptr_counterBuffers.baseAddress, ptr_counterBufferOffsets.baseAddress)
            }
        }
    }

    public func cmdEndTransformFeedbackEXT(firstCounterBuffer: UInt32, counterBuffers: Array<Buffer> = [], counterBufferOffsets: Array<VkDeviceSize>? = []) -> Void {
        counterBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_counterBuffers in
            counterBufferOffsets.withOptionalUnsafeBufferPointer { ptr_counterBufferOffsets in
                self.commandPool.device.dispatchTable.vkCmdEndTransformFeedbackEXT(self.handle, firstCounterBuffer, UInt32(ptr_counterBuffers.count), ptr_counterBuffers.baseAddress, ptr_counterBufferOffsets.baseAddress)
            }
        }
    }

    public func cmdBeginQueryIndexedEXT(queryPool: QueryPool, query: UInt32, flags: QueryControlFlags = [], index: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBeginQueryIndexedEXT(self.handle, queryPool.handle, query, flags.rawValue, index)
    }

    public func cmdEndQueryIndexedEXT(queryPool: QueryPool, query: UInt32, index: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndQueryIndexedEXT(self.handle, queryPool.handle, query, index)
    }

    public func cmdDrawIndirectByteCountEXT(instanceCount: UInt32, firstInstance: UInt32, counterBuffer: Buffer, counterBufferOffset: VkDeviceSize, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndirectByteCountEXT(self.handle, instanceCount, firstInstance, counterBuffer.handle, counterBufferOffset, counterOffset, vertexStride)
    }

    public func cmdSetExclusiveScissorNV(firstExclusiveScissor: UInt32, exclusiveScissors: Array<Rect2D>) -> Void {
        exclusiveScissors.withCStructBufferPointer { ptr_exclusiveScissors in
            self.commandPool.device.dispatchTable.vkCmdSetExclusiveScissorNV(self.handle, firstExclusiveScissor, UInt32(ptr_exclusiveScissors.count), ptr_exclusiveScissors.baseAddress)
        }
    }

    public func cmdSetExclusiveScissorEnableNV(firstExclusiveScissor: UInt32, exclusiveScissorEnables: Array<Bool>) -> Void {
        exclusiveScissorEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_exclusiveScissorEnables in
            self.commandPool.device.dispatchTable.vkCmdSetExclusiveScissorEnableNV(self.handle, firstExclusiveScissor, UInt32(ptr_exclusiveScissorEnables.count), ptr_exclusiveScissorEnables.baseAddress)
        }
    }

    public func cmdBindShadingRateImageNV(imageView: ImageView? = nil, imageLayout: ImageLayout) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindShadingRateImageNV(self.handle, imageView?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)))
    }

    public func cmdSetViewportShadingRatePaletteNV(firstViewport: UInt32, shadingRatePalettes: Array<ShadingRatePaletteNV>) -> Void {
        shadingRatePalettes.withCStructBufferPointer { ptr_shadingRatePalettes in
            self.commandPool.device.dispatchTable.vkCmdSetViewportShadingRatePaletteNV(self.handle, firstViewport, UInt32(ptr_shadingRatePalettes.count), ptr_shadingRatePalettes.baseAddress)
        }
    }

    public func cmdSetCoarseSampleOrderNV(sampleOrderType: CoarseSampleOrderTypeNV, customSampleOrders: Array<CoarseSampleOrderCustomNV> = []) -> Void {
        customSampleOrders.withCStructBufferPointer { ptr_customSampleOrders in
            self.commandPool.device.dispatchTable.vkCmdSetCoarseSampleOrderNV(self.handle, VkCoarseSampleOrderTypeNV(rawValue: VkCoarseSampleOrderTypeNV.RawValue(sampleOrderType.rawValue)), UInt32(ptr_customSampleOrders.count), ptr_customSampleOrders.baseAddress)
        }
    }

    public func cmdDrawMeshTasksNV(taskCount: UInt32, firstTask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksNV(self.handle, taskCount, firstTask)
    }

    public func cmdDrawMeshTasksIndirectNV(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectNV(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func cmdDrawMeshTasksIndirectCountNV(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCountNV(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func cmdDrawMeshTasksEXT(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksEXT(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func cmdDrawMeshTasksIndirectEXT(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectEXT(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func cmdDrawMeshTasksIndirectCountEXT(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCountEXT(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func cmdBindInvocationMaskHUAWEI(imageView: ImageView? = nil, imageLayout: ImageLayout) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindInvocationMaskHUAWEI(self.handle, imageView?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)))
    }

    public func cmdCopyAccelerationStructureNV(dst: AccelerationStructureNV, src: AccelerationStructureNV, mode: CopyAccelerationStructureModeKHR) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureNV(self.handle, dst.handle, src.handle, VkCopyAccelerationStructureModeKHR(rawValue: VkCopyAccelerationStructureModeKHR.RawValue(mode.rawValue)))
    }

    public func cmdCopyAccelerationStructureKHR(info: (some Chainable<CopyAccelerationStructureInfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func cmdCopyAccelerationStructureKHR(info: CopyAccelerationStructureInfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func cmdCopyAccelerationStructureToMemoryKHR(info: (some Chainable<CopyAccelerationStructureToMemoryInfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureToMemoryKHR(self.handle, ptr_info)
        }
    }

    public func cmdCopyAccelerationStructureToMemoryKHR(info: CopyAccelerationStructureToMemoryInfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureToMemoryKHR(self.handle, ptr_info)
        }
    }

    public func cmdCopyMemoryToAccelerationStructureKHR(info: (some Chainable<CopyMemoryToAccelerationStructureInfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func cmdCopyMemoryToAccelerationStructureKHR(info: CopyMemoryToAccelerationStructureInfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func cmdWriteAccelerationStructuresPropertiesKHR(accelerationStructures: Array<AccelerationStructureKHR>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            self.commandPool.device.dispatchTable.vkCmdWriteAccelerationStructuresPropertiesKHR(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func cmdWriteAccelerationStructuresPropertiesNV(accelerationStructures: Array<AccelerationStructureNV>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            self.commandPool.device.dispatchTable.vkCmdWriteAccelerationStructuresPropertiesNV(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func cmdBuildAccelerationStructureNV(info: (some Chainable<AccelerationStructureInfoNV>), instanceData: Buffer? = nil, instanceOffset: VkDeviceSize, update: Bool, dst: AccelerationStructureNV, src: AccelerationStructureNV? = nil, scratch: Buffer, scratchOffset: VkDeviceSize) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructureNV(self.handle, ptr_info, instanceData?.handle, instanceOffset, VkBool32(update ? VK_TRUE : VK_FALSE), dst.handle, src?.handle, scratch.handle, scratchOffset)
        }
    }

    public func cmdBuildAccelerationStructureNV(info: AccelerationStructureInfoNV, instanceData: Buffer? = nil, instanceOffset: VkDeviceSize, update: Bool, dst: AccelerationStructureNV, src: AccelerationStructureNV? = nil, scratch: Buffer, scratchOffset: VkDeviceSize) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructureNV(self.handle, ptr_info, instanceData?.handle, instanceOffset, VkBool32(update ? VK_TRUE : VK_FALSE), dst.handle, src?.handle, scratch.handle, scratchOffset)
        }
    }

    public func cmdTraceRaysKHR(raygenShaderBindingTable: StridedDeviceAddressRegionKHR, missShaderBindingTable: StridedDeviceAddressRegionKHR, hitShaderBindingTable: StridedDeviceAddressRegionKHR, callableShaderBindingTable: StridedDeviceAddressRegionKHR, width: UInt32, height: UInt32, depth: UInt32) -> Void {
        raygenShaderBindingTable.withCStruct { ptr_raygenShaderBindingTable in
            missShaderBindingTable.withCStruct { ptr_missShaderBindingTable in
                hitShaderBindingTable.withCStruct { ptr_hitShaderBindingTable in
                    callableShaderBindingTable.withCStruct { ptr_callableShaderBindingTable in
                        self.commandPool.device.dispatchTable.vkCmdTraceRaysKHR(self.handle, ptr_raygenShaderBindingTable, ptr_missShaderBindingTable, ptr_hitShaderBindingTable, ptr_callableShaderBindingTable, width, height, depth)
                    }
                }
            }
        }
    }

    public func cmdTraceRaysNV(raygenShaderBindingTableBuffer: Buffer, raygenShaderBindingOffset: VkDeviceSize, missShaderBindingTableBuffer: Buffer? = nil, missShaderBindingOffset: VkDeviceSize, missShaderBindingStride: VkDeviceSize, hitShaderBindingTableBuffer: Buffer? = nil, hitShaderBindingOffset: VkDeviceSize, hitShaderBindingStride: VkDeviceSize, callableShaderBindingTableBuffer: Buffer? = nil, callableShaderBindingOffset: VkDeviceSize, callableShaderBindingStride: VkDeviceSize, width: UInt32, height: UInt32, depth: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdTraceRaysNV(self.handle, raygenShaderBindingTableBuffer.handle, raygenShaderBindingOffset, missShaderBindingTableBuffer?.handle, missShaderBindingOffset, missShaderBindingStride, hitShaderBindingTableBuffer?.handle, hitShaderBindingOffset, hitShaderBindingStride, callableShaderBindingTableBuffer?.handle, callableShaderBindingOffset, callableShaderBindingStride, width, height, depth)
    }

    public func cmdTraceRaysIndirectKHR(raygenShaderBindingTable: StridedDeviceAddressRegionKHR, missShaderBindingTable: StridedDeviceAddressRegionKHR, hitShaderBindingTable: StridedDeviceAddressRegionKHR, callableShaderBindingTable: StridedDeviceAddressRegionKHR, indirectDeviceAddress: VkDeviceAddress) -> Void {
        raygenShaderBindingTable.withCStruct { ptr_raygenShaderBindingTable in
            missShaderBindingTable.withCStruct { ptr_missShaderBindingTable in
                hitShaderBindingTable.withCStruct { ptr_hitShaderBindingTable in
                    callableShaderBindingTable.withCStruct { ptr_callableShaderBindingTable in
                        self.commandPool.device.dispatchTable.vkCmdTraceRaysIndirectKHR(self.handle, ptr_raygenShaderBindingTable, ptr_missShaderBindingTable, ptr_hitShaderBindingTable, ptr_callableShaderBindingTable, indirectDeviceAddress)
                    }
                }
            }
        }
    }

    public func cmdTraceRaysIndirect2KHR(indirectDeviceAddress: VkDeviceAddress) -> Void {
        self.commandPool.device.dispatchTable.vkCmdTraceRaysIndirect2KHR(self.handle, indirectDeviceAddress)
    }

    public func cmdBuildClusterAccelerationStructureIndirectNV(commandInfos: (some Chainable<ClusterAccelerationStructureCommandsInfoNV>)) -> Void {
        commandInfos.withCStruct { ptr_commandInfos in
            self.commandPool.device.dispatchTable.vkCmdBuildClusterAccelerationStructureIndirectNV(self.handle, ptr_commandInfos)
        }
    }

    public func cmdBuildClusterAccelerationStructureIndirectNV(commandInfos: ClusterAccelerationStructureCommandsInfoNV) -> Void {
        commandInfos.withCStruct { ptr_commandInfos in
            self.commandPool.device.dispatchTable.vkCmdBuildClusterAccelerationStructureIndirectNV(self.handle, ptr_commandInfos)
        }
    }

    public func cmdSetRayTracingPipelineStackSizeKHR(pipelineStackSize: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRayTracingPipelineStackSizeKHR(self.handle, pipelineStackSize)
    }

    public func cmdSetPerformanceMarkerINTEL(_ markerInfo: (some Chainable<PerformanceMarkerInfoINTEL>)) throws -> Void {
        try markerInfo.withCStruct { ptr_markerInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func cmdSetPerformanceMarkerINTEL(_ markerInfo: PerformanceMarkerInfoINTEL) throws -> Void {
        try markerInfo.withCStruct { ptr_markerInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func cmdSetPerformanceStreamMarkerINTEL(_ markerInfo: (some Chainable<PerformanceStreamMarkerInfoINTEL>)) throws -> Void {
        try markerInfo.withCStruct { ptr_markerInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceStreamMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func cmdSetPerformanceStreamMarkerINTEL(_ markerInfo: PerformanceStreamMarkerInfoINTEL) throws -> Void {
        try markerInfo.withCStruct { ptr_markerInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceStreamMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func cmdSetPerformanceOverrideINTEL(_ overrideInfo: (some Chainable<PerformanceOverrideInfoINTEL>)) throws -> Void {
        try overrideInfo.withCStruct { ptr_overrideInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceOverrideINTEL(self.handle, ptr_overrideInfo)
            )
        }
    }

    public func cmdSetPerformanceOverrideINTEL(_ overrideInfo: PerformanceOverrideInfoINTEL) throws -> Void {
        try overrideInfo.withCStruct { ptr_overrideInfo in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceOverrideINTEL(self.handle, ptr_overrideInfo)
            )
        }
    }

    public func cmdSetLineStipple(lineStippleFactor: UInt32, lineStipplePattern: UInt16) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineStipple(self.handle, lineStippleFactor, lineStipplePattern)
    }

    public func cmdBuildAccelerationStructuresKHR(infos: Array<AccelerationStructureBuildGeometryInfoKHR>, buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructuresKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
        }
    }

    public func cmdBuildAccelerationStructuresIndirectKHR(infos: Array<AccelerationStructureBuildGeometryInfoKHR>, indirectDeviceAddresses: Array<VkDeviceAddress>, indirectStrides: Array<UInt32>, maxPrimitiveCounts: UnsafePointer<UnsafePointer<UInt32>?>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            indirectDeviceAddresses.withUnsafeBufferPointer { ptr_indirectDeviceAddresses in
                indirectStrides.withUnsafeBufferPointer { ptr_indirectStrides in
                    self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructuresIndirectKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, ptr_indirectDeviceAddresses.baseAddress, ptr_indirectStrides.baseAddress, maxPrimitiveCounts)
                }
            }
        }
    }

    public func cmdSetCullMode(cullMode: CullModeFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCullMode(self.handle, cullMode.rawValue)
    }

    public func cmdSetFrontFace(frontFace: FrontFace) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetFrontFace(self.handle, VkFrontFace(rawValue: VkFrontFace.RawValue(frontFace.rawValue)))
    }

    public func cmdSetPrimitiveTopology(primitiveTopology: PrimitiveTopology) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPrimitiveTopology(self.handle, VkPrimitiveTopology(rawValue: VkPrimitiveTopology.RawValue(primitiveTopology.rawValue)))
    }

    public func cmdSetViewportWithCount(viewports: Array<Viewport>) -> Void {
        viewports.withCStructBufferPointer { ptr_viewports in
            self.commandPool.device.dispatchTable.vkCmdSetViewportWithCount(self.handle, UInt32(ptr_viewports.count), ptr_viewports.baseAddress)
        }
    }

    public func cmdSetScissorWithCount(scissors: Array<Rect2D>) -> Void {
        scissors.withCStructBufferPointer { ptr_scissors in
            self.commandPool.device.dispatchTable.vkCmdSetScissorWithCount(self.handle, UInt32(ptr_scissors.count), ptr_scissors.baseAddress)
        }
    }

    public func cmdBindIndexBuffer2(buffer: Buffer? = nil, offset: VkDeviceSize, size: VkDeviceSize, indexType: IndexType) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer2(self.handle, buffer?.handle, offset, size, VkIndexType(rawValue: VkIndexType.RawValue(indexType.rawValue)))
    }

    public func cmdBindVertexBuffers2(firstBinding: UInt32, buffers: Array<Buffer?>, offsets: Array<VkDeviceSize>, sizes: Array<VkDeviceSize>?, strides: Array<VkDeviceSize>?) -> Void {
        buffers.map{ $0?.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                sizes.withOptionalUnsafeBufferPointer { ptr_sizes in
                    strides.withOptionalUnsafeBufferPointer { ptr_strides in
                        self.commandPool.device.dispatchTable.vkCmdBindVertexBuffers2(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress, ptr_offsets.baseAddress, ptr_sizes.baseAddress, ptr_strides.baseAddress)
                    }
                }
            }
        }
    }

    public func cmdSetDepthTestEnable(depthTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthTestEnable(self.handle, VkBool32(depthTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetDepthWriteEnable(depthWriteEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthWriteEnable(self.handle, VkBool32(depthWriteEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetDepthCompareOp(depthCompareOp: CompareOp) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthCompareOp(self.handle, VkCompareOp(rawValue: VkCompareOp.RawValue(depthCompareOp.rawValue)))
    }

    public func cmdSetDepthBoundsTestEnable(depthBoundsTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBoundsTestEnable(self.handle, VkBool32(depthBoundsTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetStencilTestEnable(stencilTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilTestEnable(self.handle, VkBool32(stencilTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetStencilOp(faceMask: StencilFaceFlags, failOp: StencilOp, passOp: StencilOp, depthFailOp: StencilOp, compareOp: CompareOp) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilOp(self.handle, faceMask.rawValue, VkStencilOp(rawValue: VkStencilOp.RawValue(failOp.rawValue)), VkStencilOp(rawValue: VkStencilOp.RawValue(passOp.rawValue)), VkStencilOp(rawValue: VkStencilOp.RawValue(depthFailOp.rawValue)), VkCompareOp(rawValue: VkCompareOp.RawValue(compareOp.rawValue)))
    }

    public func cmdSetPatchControlPointsEXT(patchControlPoints: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPatchControlPointsEXT(self.handle, patchControlPoints)
    }

    public func cmdSetRasterizerDiscardEnable(rasterizerDiscardEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRasterizerDiscardEnable(self.handle, VkBool32(rasterizerDiscardEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetDepthBiasEnable(depthBiasEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBiasEnable(self.handle, VkBool32(depthBiasEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetLogicOpEXT(logicOp: LogicOp) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLogicOpEXT(self.handle, VkLogicOp(rawValue: VkLogicOp.RawValue(logicOp.rawValue)))
    }

    public func cmdSetPrimitiveRestartEnable(primitiveRestartEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPrimitiveRestartEnable(self.handle, VkBool32(primitiveRestartEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetTessellationDomainOriginEXT(domainOrigin: TessellationDomainOrigin) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetTessellationDomainOriginEXT(self.handle, VkTessellationDomainOrigin(rawValue: VkTessellationDomainOrigin.RawValue(domainOrigin.rawValue)))
    }

    public func cmdSetDepthClampEnableEXT(depthClampEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthClampEnableEXT(self.handle, VkBool32(depthClampEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetPolygonModeEXT(polygonMode: PolygonMode) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPolygonModeEXT(self.handle, VkPolygonMode(rawValue: VkPolygonMode.RawValue(polygonMode.rawValue)))
    }

    public func cmdSetRasterizationSamplesEXT(rasterizationSamples: SampleCountFlags) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRasterizationSamplesEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(rasterizationSamples.rawValue)))
    }

    public func cmdSetSampleMaskEXT(samples: SampleCountFlags, sampleMask: UnsafePointer<VkSampleMask>?) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetSampleMaskEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), sampleMask)
    }

    public func cmdSetAlphaToCoverageEnableEXT(alphaToCoverageEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetAlphaToCoverageEnableEXT(self.handle, VkBool32(alphaToCoverageEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetAlphaToOneEnableEXT(alphaToOneEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetAlphaToOneEnableEXT(self.handle, VkBool32(alphaToOneEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetLogicOpEnableEXT(logicOpEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLogicOpEnableEXT(self.handle, VkBool32(logicOpEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetColorBlendEnableEXT(firstAttachment: UInt32, colorBlendEnables: Array<Bool>) -> Void {
        colorBlendEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_colorBlendEnables in
            self.commandPool.device.dispatchTable.vkCmdSetColorBlendEnableEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendEnables.count), ptr_colorBlendEnables.baseAddress)
        }
    }

    public func cmdSetColorBlendEquationEXT(firstAttachment: UInt32, colorBlendEquations: Array<ColorBlendEquationEXT>) -> Void {
        colorBlendEquations.withCStructBufferPointer { ptr_colorBlendEquations in
            self.commandPool.device.dispatchTable.vkCmdSetColorBlendEquationEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendEquations.count), ptr_colorBlendEquations.baseAddress)
        }
    }

    public func cmdSetColorWriteMaskEXT(firstAttachment: UInt32, colorWriteMasks: Array<ColorComponentFlags>) -> Void {
        colorWriteMasks.map{ $0.rawValue }.withUnsafeBufferPointer { ptr_colorWriteMasks in
            self.commandPool.device.dispatchTable.vkCmdSetColorWriteMaskEXT(self.handle, firstAttachment, UInt32(ptr_colorWriteMasks.count), ptr_colorWriteMasks.baseAddress)
        }
    }

    public func cmdSetRasterizationStreamEXT(rasterizationStream: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRasterizationStreamEXT(self.handle, rasterizationStream)
    }

    public func cmdSetConservativeRasterizationModeEXT(conservativeRasterizationMode: ConservativeRasterizationModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetConservativeRasterizationModeEXT(self.handle, VkConservativeRasterizationModeEXT(rawValue: VkConservativeRasterizationModeEXT.RawValue(conservativeRasterizationMode.rawValue)))
    }

    public func cmdSetExtraPrimitiveOverestimationSizeEXT(extraPrimitiveOverestimationSize: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetExtraPrimitiveOverestimationSizeEXT(self.handle, extraPrimitiveOverestimationSize)
    }

    public func cmdSetDepthClipEnableEXT(depthClipEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthClipEnableEXT(self.handle, VkBool32(depthClipEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetSampleLocationsEnableEXT(sampleLocationsEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetSampleLocationsEnableEXT(self.handle, VkBool32(sampleLocationsEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetColorBlendAdvancedEXT(firstAttachment: UInt32, colorBlendAdvanced: Array<ColorBlendAdvancedEXT>) -> Void {
        colorBlendAdvanced.withCStructBufferPointer { ptr_colorBlendAdvanced in
            self.commandPool.device.dispatchTable.vkCmdSetColorBlendAdvancedEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendAdvanced.count), ptr_colorBlendAdvanced.baseAddress)
        }
    }

    public func cmdSetProvokingVertexModeEXT(provokingVertexMode: ProvokingVertexModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetProvokingVertexModeEXT(self.handle, VkProvokingVertexModeEXT(rawValue: VkProvokingVertexModeEXT.RawValue(provokingVertexMode.rawValue)))
    }

    public func cmdSetLineRasterizationModeEXT(lineRasterizationMode: VkLineRasterizationModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineRasterizationModeEXT(self.handle, lineRasterizationMode)
    }

    public func cmdSetLineStippleEnableEXT(stippledLineEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineStippleEnableEXT(self.handle, VkBool32(stippledLineEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetDepthClipNegativeOneToOneEXT(negativeOneToOne: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthClipNegativeOneToOneEXT(self.handle, VkBool32(negativeOneToOne ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetViewportWScalingEnableNV(viewportWScalingEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetViewportWScalingEnableNV(self.handle, VkBool32(viewportWScalingEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetViewportSwizzleNV(firstViewport: UInt32, viewportSwizzles: Array<ViewportSwizzleNV>) -> Void {
        viewportSwizzles.withCStructBufferPointer { ptr_viewportSwizzles in
            self.commandPool.device.dispatchTable.vkCmdSetViewportSwizzleNV(self.handle, firstViewport, UInt32(ptr_viewportSwizzles.count), ptr_viewportSwizzles.baseAddress)
        }
    }

    public func cmdSetCoverageToColorEnableNV(coverageToColorEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageToColorEnableNV(self.handle, VkBool32(coverageToColorEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetCoverageToColorLocationNV(coverageToColorLocation: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageToColorLocationNV(self.handle, coverageToColorLocation)
    }

    public func cmdSetCoverageModulationModeNV(coverageModulationMode: CoverageModulationModeNV) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageModulationModeNV(self.handle, VkCoverageModulationModeNV(rawValue: VkCoverageModulationModeNV.RawValue(coverageModulationMode.rawValue)))
    }

    public func cmdSetCoverageModulationTableEnableNV(coverageModulationTableEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageModulationTableEnableNV(self.handle, VkBool32(coverageModulationTableEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetCoverageModulationTableNV(coverageModulationTable: Array<Float>) -> Void {
        coverageModulationTable.withUnsafeBufferPointer { ptr_coverageModulationTable in
            self.commandPool.device.dispatchTable.vkCmdSetCoverageModulationTableNV(self.handle, UInt32(ptr_coverageModulationTable.count), ptr_coverageModulationTable.baseAddress)
        }
    }

    public func cmdSetShadingRateImageEnableNV(shadingRateImageEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetShadingRateImageEnableNV(self.handle, VkBool32(shadingRateImageEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdSetCoverageReductionModeNV(coverageReductionMode: CoverageReductionModeNV) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageReductionModeNV(self.handle, VkCoverageReductionModeNV(rawValue: VkCoverageReductionModeNV.RawValue(coverageReductionMode.rawValue)))
    }

    public func cmdSetRepresentativeFragmentTestEnableNV(representativeFragmentTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRepresentativeFragmentTestEnableNV(self.handle, VkBool32(representativeFragmentTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func cmdCopyBuffer2(_ copyBufferInfo: (some Chainable<CopyBufferInfo2>)) -> Void {
        copyBufferInfo.withCStruct { ptr_copyBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBuffer2(self.handle, ptr_copyBufferInfo)
        }
    }

    public func cmdCopyBuffer2(_ copyBufferInfo: CopyBufferInfo2) -> Void {
        copyBufferInfo.withCStruct { ptr_copyBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBuffer2(self.handle, ptr_copyBufferInfo)
        }
    }

    public func cmdCopyImage2(_ copyImageInfo: (some Chainable<CopyImageInfo2>)) -> Void {
        copyImageInfo.withCStruct { ptr_copyImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImage2(self.handle, ptr_copyImageInfo)
        }
    }

    public func cmdCopyImage2(_ copyImageInfo: CopyImageInfo2) -> Void {
        copyImageInfo.withCStruct { ptr_copyImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImage2(self.handle, ptr_copyImageInfo)
        }
    }

    public func cmdBlitImage2(_ blitImageInfo: (some Chainable<BlitImageInfo2>)) -> Void {
        blitImageInfo.withCStruct { ptr_blitImageInfo in
            self.commandPool.device.dispatchTable.vkCmdBlitImage2(self.handle, ptr_blitImageInfo)
        }
    }

    public func cmdBlitImage2(_ blitImageInfo: BlitImageInfo2) -> Void {
        blitImageInfo.withCStruct { ptr_blitImageInfo in
            self.commandPool.device.dispatchTable.vkCmdBlitImage2(self.handle, ptr_blitImageInfo)
        }
    }

    public func cmdCopyBufferToImage2(_ copyBufferToImageInfo: (some Chainable<CopyBufferToImageInfo2>)) -> Void {
        copyBufferToImageInfo.withCStruct { ptr_copyBufferToImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBufferToImage2(self.handle, ptr_copyBufferToImageInfo)
        }
    }

    public func cmdCopyBufferToImage2(_ copyBufferToImageInfo: CopyBufferToImageInfo2) -> Void {
        copyBufferToImageInfo.withCStruct { ptr_copyBufferToImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBufferToImage2(self.handle, ptr_copyBufferToImageInfo)
        }
    }

    public func cmdCopyImageToBuffer2(_ copyImageToBufferInfo: (some Chainable<CopyImageToBufferInfo2>)) -> Void {
        copyImageToBufferInfo.withCStruct { ptr_copyImageToBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToBuffer2(self.handle, ptr_copyImageToBufferInfo)
        }
    }

    public func cmdCopyImageToBuffer2(_ copyImageToBufferInfo: CopyImageToBufferInfo2) -> Void {
        copyImageToBufferInfo.withCStruct { ptr_copyImageToBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToBuffer2(self.handle, ptr_copyImageToBufferInfo)
        }
    }

    public func cmdResolveImage2(_ resolveImageInfo: (some Chainable<ResolveImageInfo2>)) -> Void {
        resolveImageInfo.withCStruct { ptr_resolveImageInfo in
            self.commandPool.device.dispatchTable.vkCmdResolveImage2(self.handle, ptr_resolveImageInfo)
        }
    }

    public func cmdResolveImage2(_ resolveImageInfo: ResolveImageInfo2) -> Void {
        resolveImageInfo.withCStruct { ptr_resolveImageInfo in
            self.commandPool.device.dispatchTable.vkCmdResolveImage2(self.handle, ptr_resolveImageInfo)
        }
    }

    public func cmdSetFragmentShadingRateKHR(fragmentSize: Extent2D, combinerOps: (VkFragmentShadingRateCombinerOpKHR, VkFragmentShadingRateCombinerOpKHR)) -> Void {
        fragmentSize.withCStruct { ptr_fragmentSize in
            withUnsafeBytes(of: combinerOps) { ptr_combinerOps in
                self.commandPool.device.dispatchTable.vkCmdSetFragmentShadingRateKHR(self.handle, ptr_fragmentSize, ptr_combinerOps.bindMemory(to: VkFragmentShadingRateCombinerOpKHR.self).baseAddress)
            }
        }
    }

    public func cmdSetFragmentShadingRateEnumNV(shadingRate: FragmentShadingRateNV, combinerOps: (VkFragmentShadingRateCombinerOpKHR, VkFragmentShadingRateCombinerOpKHR)) -> Void {
        withUnsafeBytes(of: combinerOps) { ptr_combinerOps in
            self.commandPool.device.dispatchTable.vkCmdSetFragmentShadingRateEnumNV(self.handle, VkFragmentShadingRateNV(rawValue: VkFragmentShadingRateNV.RawValue(shadingRate.rawValue)), ptr_combinerOps.bindMemory(to: VkFragmentShadingRateCombinerOpKHR.self).baseAddress)
        }
    }

    public func cmdSetVertexInputEXT(vertexBindingDescriptions: Array<VertexInputBindingDescription2EXT> = [], vertexAttributeDescriptions: Array<VertexInputAttributeDescription2EXT> = []) -> Void {
        vertexBindingDescriptions.withCStructBufferPointer { ptr_vertexBindingDescriptions in
            vertexAttributeDescriptions.withCStructBufferPointer { ptr_vertexAttributeDescriptions in
                self.commandPool.device.dispatchTable.vkCmdSetVertexInputEXT(self.handle, UInt32(ptr_vertexBindingDescriptions.count), ptr_vertexBindingDescriptions.baseAddress, UInt32(ptr_vertexAttributeDescriptions.count), ptr_vertexAttributeDescriptions.baseAddress)
            }
        }
    }

    public func cmdSetColorWriteEnableEXT(colorWriteEnables: Array<Bool>) -> Void {
        colorWriteEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_colorWriteEnables in
            self.commandPool.device.dispatchTable.vkCmdSetColorWriteEnableEXT(self.handle, UInt32(ptr_colorWriteEnables.count), ptr_colorWriteEnables.baseAddress)
        }
    }

    public func cmdSetEvent2(event: Event, dependencyInfo: (some Chainable<DependencyInfo>)) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdSetEvent2(self.handle, event.handle, ptr_dependencyInfo)
        }
    }

    public func cmdSetEvent2(event: Event, dependencyInfo: DependencyInfo) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdSetEvent2(self.handle, event.handle, ptr_dependencyInfo)
        }
    }

    public func cmdResetEvent2(event: Event, stageMask: PipelineStageFlags2 = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdResetEvent2(self.handle, event.handle, stageMask.rawValue)
    }

    public func cmdWaitEvents2(events: Array<Event>, dependencyInfos: Array<DependencyInfo>) -> Void {
        events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            dependencyInfos.withCStructBufferPointer { ptr_dependencyInfos in
                self.commandPool.device.dispatchTable.vkCmdWaitEvents2(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress, ptr_dependencyInfos.baseAddress)
            }
        }
    }

    public func cmdPipelineBarrier2(_ dependencyInfo: (some Chainable<DependencyInfo>)) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdPipelineBarrier2(self.handle, ptr_dependencyInfo)
        }
    }

    public func cmdPipelineBarrier2(_ dependencyInfo: DependencyInfo) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdPipelineBarrier2(self.handle, ptr_dependencyInfo)
        }
    }

    public func cmdWriteTimestamp2(stage: PipelineStageFlags2 = [], queryPool: QueryPool, query: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteTimestamp2(self.handle, stage.rawValue, queryPool.handle, query)
    }

    public func cmdWriteBufferMarker2AMD(stage: PipelineStageFlags2 = [], dstBuffer: Buffer, dstOffset: VkDeviceSize, marker: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteBufferMarker2AMD(self.handle, stage.rawValue, dstBuffer.handle, dstOffset, marker)
    }

    public func cmdDecodeVideoKHR(_ decodeInfo: (some Chainable<VideoDecodeInfoKHR>)) -> Void {
        decodeInfo.withCStruct { ptr_decodeInfo in
            self.commandPool.device.dispatchTable.vkCmdDecodeVideoKHR(self.handle, ptr_decodeInfo)
        }
    }

    public func cmdDecodeVideoKHR(_ decodeInfo: VideoDecodeInfoKHR) -> Void {
        decodeInfo.withCStruct { ptr_decodeInfo in
            self.commandPool.device.dispatchTable.vkCmdDecodeVideoKHR(self.handle, ptr_decodeInfo)
        }
    }

    public func cmdBeginVideoCodingKHR(_ beginInfo: (some Chainable<VideoBeginCodingInfoKHR>)) -> Void {
        beginInfo.withCStruct { ptr_beginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginVideoCodingKHR(self.handle, ptr_beginInfo)
        }
    }

    public func cmdBeginVideoCodingKHR(_ beginInfo: VideoBeginCodingInfoKHR) -> Void {
        beginInfo.withCStruct { ptr_beginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginVideoCodingKHR(self.handle, ptr_beginInfo)
        }
    }

    public func cmdControlVideoCodingKHR(_ codingControlInfo: (some Chainable<VideoCodingControlInfoKHR>)) -> Void {
        codingControlInfo.withCStruct { ptr_codingControlInfo in
            self.commandPool.device.dispatchTable.vkCmdControlVideoCodingKHR(self.handle, ptr_codingControlInfo)
        }
    }

    public func cmdControlVideoCodingKHR(_ codingControlInfo: VideoCodingControlInfoKHR) -> Void {
        codingControlInfo.withCStruct { ptr_codingControlInfo in
            self.commandPool.device.dispatchTable.vkCmdControlVideoCodingKHR(self.handle, ptr_codingControlInfo)
        }
    }

    public func cmdEndVideoCodingKHR(_ endCodingInfo: (some Chainable<VideoEndCodingInfoKHR>)) -> Void {
        endCodingInfo.withCStruct { ptr_endCodingInfo in
            self.commandPool.device.dispatchTable.vkCmdEndVideoCodingKHR(self.handle, ptr_endCodingInfo)
        }
    }

    public func cmdEndVideoCodingKHR(_ endCodingInfo: VideoEndCodingInfoKHR) -> Void {
        endCodingInfo.withCStruct { ptr_endCodingInfo in
            self.commandPool.device.dispatchTable.vkCmdEndVideoCodingKHR(self.handle, ptr_endCodingInfo)
        }
    }

    public func cmdEncodeVideoKHR(_ encodeInfo: (some Chainable<VideoEncodeInfoKHR>)) -> Void {
        encodeInfo.withCStruct { ptr_encodeInfo in
            self.commandPool.device.dispatchTable.vkCmdEncodeVideoKHR(self.handle, ptr_encodeInfo)
        }
    }

    public func cmdEncodeVideoKHR(_ encodeInfo: VideoEncodeInfoKHR) -> Void {
        encodeInfo.withCStruct { ptr_encodeInfo in
            self.commandPool.device.dispatchTable.vkCmdEncodeVideoKHR(self.handle, ptr_encodeInfo)
        }
    }

    public func cmdDecompressMemoryNV(decompressMemoryRegions: Array<DecompressMemoryRegionNV>) -> Void {
        decompressMemoryRegions.withCStructBufferPointer { ptr_decompressMemoryRegions in
            self.commandPool.device.dispatchTable.vkCmdDecompressMemoryNV(self.handle, UInt32(ptr_decompressMemoryRegions.count), ptr_decompressMemoryRegions.baseAddress)
        }
    }

    public func cmdDecompressMemoryIndirectCountNV(indirectCommandsAddress: VkDeviceAddress, indirectCommandsCountAddress: VkDeviceAddress, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDecompressMemoryIndirectCountNV(self.handle, indirectCommandsAddress, indirectCommandsCountAddress, stride)
    }

    public func cmdBuildPartitionedAccelerationStructuresNV(_ buildInfo: (some Chainable<BuildPartitionedAccelerationStructureInfoNV>)) -> Void {
        buildInfo.withCStruct { ptr_buildInfo in
            self.commandPool.device.dispatchTable.vkCmdBuildPartitionedAccelerationStructuresNV(self.handle, ptr_buildInfo)
        }
    }

    public func cmdBuildPartitionedAccelerationStructuresNV(_ buildInfo: BuildPartitionedAccelerationStructureInfoNV) -> Void {
        buildInfo.withCStruct { ptr_buildInfo in
            self.commandPool.device.dispatchTable.vkCmdBuildPartitionedAccelerationStructuresNV(self.handle, ptr_buildInfo)
        }
    }

    public func cmdDecompressMemoryEXT(decompressMemoryInfoEXT: (some Chainable<DecompressMemoryInfoEXT>)) -> Void {
        decompressMemoryInfoEXT.withCStruct { ptr_decompressMemoryInfoEXT in
            self.commandPool.device.dispatchTable.vkCmdDecompressMemoryEXT(self.handle, ptr_decompressMemoryInfoEXT)
        }
    }

    public func cmdDecompressMemoryEXT(decompressMemoryInfoEXT: DecompressMemoryInfoEXT) -> Void {
        decompressMemoryInfoEXT.withCStruct { ptr_decompressMemoryInfoEXT in
            self.commandPool.device.dispatchTable.vkCmdDecompressMemoryEXT(self.handle, ptr_decompressMemoryInfoEXT)
        }
    }

    public func cmdDecompressMemoryIndirectCountEXT(decompressionMethod: MemoryDecompressionMethodFlagsEXT, indirectCommandsAddress: VkDeviceAddress, indirectCommandsCountAddress: VkDeviceAddress, maxDecompressionCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDecompressMemoryIndirectCountEXT(self.handle, decompressionMethod.rawValue, indirectCommandsAddress, indirectCommandsCountAddress, maxDecompressionCount, stride)
    }

    public func cmdCuLaunchKernelNVX(_ launchInfo: (some Chainable<CuLaunchInfoNVX>)) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCuLaunchKernelNVX(self.handle, ptr_launchInfo)
        }
    }

    public func cmdCuLaunchKernelNVX(_ launchInfo: CuLaunchInfoNVX) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCuLaunchKernelNVX(self.handle, ptr_launchInfo)
        }
    }

    public func cmdBindDescriptorBuffersEXT(bindingInfos: Array<DescriptorBufferBindingInfoEXT>) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBuffersEXT(self.handle, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func cmdSetDescriptorBufferOffsetsEXT(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, bufferIndices: Array<UInt32>, offsets: Array<VkDeviceSize>) -> Void {
        bufferIndices.withUnsafeBufferPointer { ptr_bufferIndices in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                self.commandPool.device.dispatchTable.vkCmdSetDescriptorBufferOffsetsEXT(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, firstSet, UInt32(ptr_bufferIndices.count), ptr_bufferIndices.baseAddress, ptr_offsets.baseAddress)
            }
        }
    }

    public func cmdBindDescriptorBufferEmbeddedSamplersEXT(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindDescriptorBufferEmbeddedSamplersEXT(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set)
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cmdCudaLaunchKernelNV(_ launchInfo: (some Chainable<CudaLaunchInfoNV>)) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCudaLaunchKernelNV(self.handle, ptr_launchInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cmdCudaLaunchKernelNV(_ launchInfo: CudaLaunchInfoNV) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCudaLaunchKernelNV(self.handle, ptr_launchInfo)
        }
    }
    #endif

    public func cmdBeginRendering(_ renderingInfo: (some Chainable<RenderingInfo>)) -> Void {
        renderingInfo.withCStruct { ptr_renderingInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginRendering(self.handle, ptr_renderingInfo)
        }
    }

    public func cmdBeginRendering(_ renderingInfo: RenderingInfo) -> Void {
        renderingInfo.withCStruct { ptr_renderingInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginRendering(self.handle, ptr_renderingInfo)
        }
    }

    public func cmdEndRendering() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndRendering(self.handle)
    }

    public func cmdEndRendering2KHR(_ renderingEndInfo: (some Chainable<RenderingEndInfoKHR>)) -> Void {
        renderingEndInfo.withCStruct { ptr_renderingEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRendering2KHR(self.handle, ptr_renderingEndInfo)
        }
    }

    public func cmdEndRendering2KHR(_ renderingEndInfo: RenderingEndInfoKHR? = nil) -> Void {
        renderingEndInfo.withOptionalCStruct { ptr_renderingEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRendering2KHR(self.handle, ptr_renderingEndInfo)
        }
    }

    public func cmdBindTileMemoryQCOM(_ tileMemoryBindInfo: (some Chainable<TileMemoryBindInfoQCOM>)) -> Void {
        tileMemoryBindInfo.withCStruct { ptr_tileMemoryBindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindTileMemoryQCOM(self.handle, ptr_tileMemoryBindInfo)
        }
    }

    public func cmdBindTileMemoryQCOM(_ tileMemoryBindInfo: TileMemoryBindInfoQCOM? = nil) -> Void {
        tileMemoryBindInfo.withOptionalCStruct { ptr_tileMemoryBindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindTileMemoryQCOM(self.handle, ptr_tileMemoryBindInfo)
        }
    }

    public func cmdOpticalFlowExecuteNV(session: OpticalFlowSessionNV, executeInfo: (some Chainable<OpticalFlowExecuteInfoNV>)) -> Void {
        executeInfo.withCStruct { ptr_executeInfo in
            self.commandPool.device.dispatchTable.vkCmdOpticalFlowExecuteNV(self.handle, session.handle, ptr_executeInfo)
        }
    }

    public func cmdOpticalFlowExecuteNV(session: OpticalFlowSessionNV, executeInfo: OpticalFlowExecuteInfoNV) -> Void {
        executeInfo.withCStruct { ptr_executeInfo in
            self.commandPool.device.dispatchTable.vkCmdOpticalFlowExecuteNV(self.handle, session.handle, ptr_executeInfo)
        }
    }

    public func cmdSetDepthBias2EXT(_ depthBiasInfo: (some Chainable<DepthBiasInfoEXT>)) -> Void {
        depthBiasInfo.withCStruct { ptr_depthBiasInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDepthBias2EXT(self.handle, ptr_depthBiasInfo)
        }
    }

    public func cmdSetDepthBias2EXT(_ depthBiasInfo: DepthBiasInfoEXT) -> Void {
        depthBiasInfo.withCStruct { ptr_depthBiasInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDepthBias2EXT(self.handle, ptr_depthBiasInfo)
        }
    }

    public func cmdBindShadersEXT(stages: Array<ShaderStageFlags>, shaders: Array<ShaderEXT?>?) -> Void {
        stages.map{ VkShaderStageFlagBits(rawValue: VkShaderStageFlagBits.RawValue($0.rawValue)) }.withUnsafeBufferPointer { ptr_stages in
            (shaders?.map{ $0?.handle }).withOptionalUnsafeBufferPointer { ptr_shaders in
                self.commandPool.device.dispatchTable.vkCmdBindShadersEXT(self.handle, UInt32(ptr_stages.count), ptr_stages.baseAddress, ptr_shaders.baseAddress)
            }
        }
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cmdInitializeGraphScratchMemoryAMDX(executionGraph: Pipeline, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdInitializeGraphScratchMemoryAMDX(self.handle, executionGraph.handle, scratch, scratchSize)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cmdDispatchGraphAMDX(scratch: VkDeviceAddress, scratchSize: VkDeviceSize, countInfo: DispatchGraphCountInfoAMDX) -> Void {
        countInfo.withCStruct { ptr_countInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchGraphAMDX(self.handle, scratch, scratchSize, ptr_countInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cmdDispatchGraphIndirectAMDX(scratch: VkDeviceAddress, scratchSize: VkDeviceSize, countInfo: DispatchGraphCountInfoAMDX) -> Void {
        countInfo.withCStruct { ptr_countInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchGraphIndirectAMDX(self.handle, scratch, scratchSize, ptr_countInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cmdDispatchGraphIndirectCountAMDX(scratch: VkDeviceAddress, scratchSize: VkDeviceSize, countInfo: VkDeviceAddress) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatchGraphIndirectCountAMDX(self.handle, scratch, scratchSize, countInfo)
    }
    #endif

    public func cmdBindDescriptorSets2(_ bindDescriptorSetsInfo: (some Chainable<BindDescriptorSetsInfo>)) -> Void {
        bindDescriptorSetsInfo.withCStruct { ptr_bindDescriptorSetsInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorSets2(self.handle, ptr_bindDescriptorSetsInfo)
        }
    }

    public func cmdBindDescriptorSets2(_ bindDescriptorSetsInfo: BindDescriptorSetsInfo) -> Void {
        bindDescriptorSetsInfo.withCStruct { ptr_bindDescriptorSetsInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorSets2(self.handle, ptr_bindDescriptorSetsInfo)
        }
    }

    public func cmdPushConstants2(_ pushConstantsInfo: (some Chainable<PushConstantsInfo>)) -> Void {
        pushConstantsInfo.withCStruct { ptr_pushConstantsInfo in
            self.commandPool.device.dispatchTable.vkCmdPushConstants2(self.handle, ptr_pushConstantsInfo)
        }
    }

    public func cmdPushConstants2(_ pushConstantsInfo: PushConstantsInfo) -> Void {
        pushConstantsInfo.withCStruct { ptr_pushConstantsInfo in
            self.commandPool.device.dispatchTable.vkCmdPushConstants2(self.handle, ptr_pushConstantsInfo)
        }
    }

    public func cmdPushDescriptorSet2(_ pushDescriptorSetInfo: (some Chainable<PushDescriptorSetInfo>)) -> Void {
        pushDescriptorSetInfo.withCStruct { ptr_pushDescriptorSetInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet2(self.handle, ptr_pushDescriptorSetInfo)
        }
    }

    public func cmdPushDescriptorSet2(_ pushDescriptorSetInfo: PushDescriptorSetInfo) -> Void {
        pushDescriptorSetInfo.withCStruct { ptr_pushDescriptorSetInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet2(self.handle, ptr_pushDescriptorSetInfo)
        }
    }

    public func cmdPushDescriptorSetWithTemplate2(_ pushDescriptorSetWithTemplateInfo: (some Chainable<PushDescriptorSetWithTemplateInfo>)) -> Void {
        pushDescriptorSetWithTemplateInfo.withCStruct { ptr_pushDescriptorSetWithTemplateInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSetWithTemplate2(self.handle, ptr_pushDescriptorSetWithTemplateInfo)
        }
    }

    public func cmdPushDescriptorSetWithTemplate2(_ pushDescriptorSetWithTemplateInfo: PushDescriptorSetWithTemplateInfo) -> Void {
        pushDescriptorSetWithTemplateInfo.withCStruct { ptr_pushDescriptorSetWithTemplateInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSetWithTemplate2(self.handle, ptr_pushDescriptorSetWithTemplateInfo)
        }
    }

    public func cmdSetDescriptorBufferOffsets2EXT(_ setDescriptorBufferOffsetsInfo: (some Chainable<SetDescriptorBufferOffsetsInfoEXT>)) -> Void {
        setDescriptorBufferOffsetsInfo.withCStruct { ptr_setDescriptorBufferOffsetsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDescriptorBufferOffsets2EXT(self.handle, ptr_setDescriptorBufferOffsetsInfo)
        }
    }

    public func cmdSetDescriptorBufferOffsets2EXT(_ setDescriptorBufferOffsetsInfo: SetDescriptorBufferOffsetsInfoEXT) -> Void {
        setDescriptorBufferOffsetsInfo.withCStruct { ptr_setDescriptorBufferOffsetsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDescriptorBufferOffsets2EXT(self.handle, ptr_setDescriptorBufferOffsetsInfo)
        }
    }

    public func cmdBindDescriptorBufferEmbeddedSamplers2EXT(_ bindDescriptorBufferEmbeddedSamplersInfo: (some Chainable<BindDescriptorBufferEmbeddedSamplersInfoEXT>)) -> Void {
        bindDescriptorBufferEmbeddedSamplersInfo.withCStruct { ptr_bindDescriptorBufferEmbeddedSamplersInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(self.handle, ptr_bindDescriptorBufferEmbeddedSamplersInfo)
        }
    }

    public func cmdBindDescriptorBufferEmbeddedSamplers2EXT(_ bindDescriptorBufferEmbeddedSamplersInfo: BindDescriptorBufferEmbeddedSamplersInfoEXT) -> Void {
        bindDescriptorBufferEmbeddedSamplersInfo.withCStruct { ptr_bindDescriptorBufferEmbeddedSamplersInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(self.handle, ptr_bindDescriptorBufferEmbeddedSamplersInfo)
        }
    }

    public func cmdSetRenderingAttachmentLocations(_ locationInfo: (some Chainable<RenderingAttachmentLocationInfo>)) -> Void {
        locationInfo.withCStruct { ptr_locationInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingAttachmentLocations(self.handle, ptr_locationInfo)
        }
    }

    public func cmdSetRenderingAttachmentLocations(_ locationInfo: RenderingAttachmentLocationInfo) -> Void {
        locationInfo.withCStruct { ptr_locationInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingAttachmentLocations(self.handle, ptr_locationInfo)
        }
    }

    public func cmdSetRenderingInputAttachmentIndices(_ inputAttachmentIndexInfo: (some Chainable<RenderingInputAttachmentIndexInfo>)) -> Void {
        inputAttachmentIndexInfo.withCStruct { ptr_inputAttachmentIndexInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingInputAttachmentIndices(self.handle, ptr_inputAttachmentIndexInfo)
        }
    }

    public func cmdSetRenderingInputAttachmentIndices(_ inputAttachmentIndexInfo: RenderingInputAttachmentIndexInfo) -> Void {
        inputAttachmentIndexInfo.withCStruct { ptr_inputAttachmentIndexInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingInputAttachmentIndices(self.handle, ptr_inputAttachmentIndexInfo)
        }
    }

    public func cmdSetDepthClampRangeEXT(depthClampMode: DepthClampModeEXT, depthClampRange: DepthClampRangeEXT? = nil) -> Void {
        depthClampRange.withOptionalCStruct { ptr_depthClampRange in
            self.commandPool.device.dispatchTable.vkCmdSetDepthClampRangeEXT(self.handle, VkDepthClampModeEXT(rawValue: VkDepthClampModeEXT.RawValue(depthClampMode.rawValue)), ptr_depthClampRange)
        }
    }

    public func cmdConvertCooperativeVectorMatrixNV(infos: Array<ConvertCooperativeVectorMatrixInfoNV>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdConvertCooperativeVectorMatrixNV(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func cmdDispatchTileQCOM(_ dispatchTileInfo: (some Chainable<DispatchTileInfoQCOM>)) -> Void {
        dispatchTileInfo.withCStruct { ptr_dispatchTileInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchTileQCOM(self.handle, ptr_dispatchTileInfo)
        }
    }

    public func cmdDispatchTileQCOM(_ dispatchTileInfo: DispatchTileInfoQCOM) -> Void {
        dispatchTileInfo.withCStruct { ptr_dispatchTileInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchTileQCOM(self.handle, ptr_dispatchTileInfo)
        }
    }

    public func cmdBeginPerTileExecutionQCOM(_ perTileBeginInfo: (some Chainable<PerTileBeginInfoQCOM>)) -> Void {
        perTileBeginInfo.withCStruct { ptr_perTileBeginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginPerTileExecutionQCOM(self.handle, ptr_perTileBeginInfo)
        }
    }

    public func cmdBeginPerTileExecutionQCOM(_ perTileBeginInfo: PerTileBeginInfoQCOM) -> Void {
        perTileBeginInfo.withCStruct { ptr_perTileBeginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginPerTileExecutionQCOM(self.handle, ptr_perTileBeginInfo)
        }
    }

    public func cmdEndPerTileExecutionQCOM(_ perTileEndInfo: (some Chainable<PerTileEndInfoQCOM>)) -> Void {
        perTileEndInfo.withCStruct { ptr_perTileEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndPerTileExecutionQCOM(self.handle, ptr_perTileEndInfo)
        }
    }

    public func cmdEndPerTileExecutionQCOM(_ perTileEndInfo: PerTileEndInfoQCOM) -> Void {
        perTileEndInfo.withCStruct { ptr_perTileEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndPerTileExecutionQCOM(self.handle, ptr_perTileEndInfo)
        }
    }

    public func cmdBeginShaderInstrumentationARM(instrumentation: ShaderInstrumentationARM) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBeginShaderInstrumentationARM(self.handle, instrumentation.handle)
    }

    public func cmdEndShaderInstrumentationARM() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndShaderInstrumentationARM(self.handle)
    }

    public func cmdCopyTensorARM(_ copyTensorInfo: (some Chainable<CopyTensorInfoARM>)) -> Void {
        copyTensorInfo.withCStruct { ptr_copyTensorInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyTensorARM(self.handle, ptr_copyTensorInfo)
        }
    }

    public func cmdCopyTensorARM(_ copyTensorInfo: CopyTensorInfoARM) -> Void {
        copyTensorInfo.withCStruct { ptr_copyTensorInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyTensorARM(self.handle, ptr_copyTensorInfo)
        }
    }

    public func cmdDispatchDataGraphARM(session: DataGraphPipelineSessionARM, info: (some Chainable<DataGraphPipelineDispatchInfoARM>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchDataGraphARM(self.handle, session.handle, ptr_info)
        }
    }

    public func cmdDispatchDataGraphARM(session: DataGraphPipelineSessionARM, info: DataGraphPipelineDispatchInfoARM? = nil) -> Void {
        info.withOptionalCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchDataGraphARM(self.handle, session.handle, ptr_info)
        }
    }

    public func cmdSetComputeOccupancyPriorityNV(parameters: (some Chainable<ComputeOccupancyPriorityParametersNV>)) -> Void {
        parameters.withCStruct { ptr_parameters in
            self.commandPool.device.dispatchTable.vkCmdSetComputeOccupancyPriorityNV(self.handle, ptr_parameters)
        }
    }

    public func cmdSetComputeOccupancyPriorityNV(parameters: ComputeOccupancyPriorityParametersNV) -> Void {
        parameters.withCStruct { ptr_parameters in
            self.commandPool.device.dispatchTable.vkCmdSetComputeOccupancyPriorityNV(self.handle, ptr_parameters)
        }
    }

    public func cmdBindSamplerHeapEXT(_ bindInfo: (some Chainable<BindHeapInfoEXT>)) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindSamplerHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func cmdBindSamplerHeapEXT(_ bindInfo: BindHeapInfoEXT) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindSamplerHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func cmdBindResourceHeapEXT(_ bindInfo: (some Chainable<BindHeapInfoEXT>)) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindResourceHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func cmdBindResourceHeapEXT(_ bindInfo: BindHeapInfoEXT) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindResourceHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func cmdPushDataEXT(_ pushDataInfo: (some Chainable<PushDataInfoEXT>)) -> Void {
        pushDataInfo.withCStruct { ptr_pushDataInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDataEXT(self.handle, ptr_pushDataInfo)
        }
    }

    public func cmdPushDataEXT(_ pushDataInfo: PushDataInfoEXT) -> Void {
        pushDataInfo.withCStruct { ptr_pushDataInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDataEXT(self.handle, ptr_pushDataInfo)
        }
    }

    public func cmdCopyMemoryKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryInfoKHR>)) -> Void {
        copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func cmdCopyMemoryKHR(_ copyMemoryInfo: CopyDeviceMemoryInfoKHR? = nil) -> Void {
        copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func cmdCopyMemoryToImageKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryImageInfoKHR>)) -> Void {
        copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func cmdCopyMemoryToImageKHR(_ copyMemoryInfo: CopyDeviceMemoryImageInfoKHR? = nil) -> Void {
        copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func cmdCopyImageToMemoryKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryImageInfoKHR>)) -> Void {
        copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func cmdCopyImageToMemoryKHR(_ copyMemoryInfo: CopyDeviceMemoryImageInfoKHR? = nil) -> Void {
        copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func cmdUpdateMemoryKHR(dstRange: DeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], dataSize: VkDeviceSize, data: UnsafeRawPointer) -> Void {
        dstRange.withCStruct { ptr_dstRange in
            self.commandPool.device.dispatchTable.vkCmdUpdateMemoryKHR(self.handle, ptr_dstRange, dstFlags.rawValue, dataSize, data)
        }
    }

    public func cmdFillMemoryKHR(dstRange: DeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], data: UInt32) -> Void {
        dstRange.withCStruct { ptr_dstRange in
            self.commandPool.device.dispatchTable.vkCmdFillMemoryKHR(self.handle, ptr_dstRange, dstFlags.rawValue, data)
        }
    }

    public func cmdCopyQueryPoolResultsToMemoryKHR(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dstRange: StridedDeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], queryResultFlags: QueryResultFlags = []) -> Void {
        dstRange.withCStruct { ptr_dstRange in
            self.commandPool.device.dispatchTable.vkCmdCopyQueryPoolResultsToMemoryKHR(self.handle, queryPool.handle, firstQuery, queryCount, ptr_dstRange, dstFlags.rawValue, queryResultFlags.rawValue)
        }
    }

    public func cmdBeginConditionalRendering2EXT(conditionalRenderingBegin: (some Chainable<ConditionalRenderingBeginInfo2EXT>)) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRendering2EXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func cmdBeginConditionalRendering2EXT(conditionalRenderingBegin: ConditionalRenderingBeginInfo2EXT) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRendering2EXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func cmdBindTransformFeedbackBuffers2EXT(firstBinding: UInt32, bindingInfos: Array<BindTransformFeedbackBuffer2InfoEXT>?) -> Void {
        bindingInfos.withOptionalCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindTransformFeedbackBuffers2EXT(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func cmdBeginTransformFeedback2EXT(firstCounterRange: UInt32, counterInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = []) -> Void {
        counterInfos.withOptionalCStructBufferPointer { ptr_counterInfos in
            self.commandPool.device.dispatchTable.vkCmdBeginTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func cmdEndTransformFeedback2EXT(firstCounterRange: UInt32, counterInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = []) -> Void {
        counterInfos.withOptionalCStructBufferPointer { ptr_counterInfos in
            self.commandPool.device.dispatchTable.vkCmdEndTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func cmdDrawIndirectByteCount2EXT(instanceCount: UInt32, firstInstance: UInt32, counterInfo: (some Chainable<BindTransformFeedbackBuffer2InfoEXT>), counterOffset: UInt32, vertexStride: UInt32) -> Void {
        counterInfo.withCStruct { ptr_counterInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectByteCount2EXT(self.handle, instanceCount, firstInstance, ptr_counterInfo, counterOffset, vertexStride)
        }
    }

    public func cmdDrawIndirectByteCount2EXT(instanceCount: UInt32, firstInstance: UInt32, counterInfo: BindTransformFeedbackBuffer2InfoEXT, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        counterInfo.withCStruct { ptr_counterInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectByteCount2EXT(self.handle, instanceCount, firstInstance, ptr_counterInfo, counterOffset, vertexStride)
        }
    }

    public func cmdWriteMarkerToMemoryAMD(info: (some Chainable<MemoryMarkerInfoAMD>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdWriteMarkerToMemoryAMD(self.handle, ptr_info)
        }
    }

    public func cmdWriteMarkerToMemoryAMD(info: MemoryMarkerInfoAMD) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdWriteMarkerToMemoryAMD(self.handle, ptr_info)
        }
    }

    public func cmdBindIndexBuffer3KHR(info: (some Chainable<BindIndexBuffer3InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer3KHR(self.handle, ptr_info)
        }
    }

    public func cmdBindIndexBuffer3KHR(info: BindIndexBuffer3InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer3KHR(self.handle, ptr_info)
        }
    }

    public func cmdBindVertexBuffers3KHR(firstBinding: UInt32, bindingInfos: Array<BindVertexBuffer3InfoKHR>) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindVertexBuffers3KHR(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func cmdDrawIndirect2KHR(info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndirect2KHR(info: DrawIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndexedIndirect2KHR(info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndexedIndirect2KHR(info: DrawIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndirectCount2KHR(info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndirectCount2KHR(info: DrawIndirectCount2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndexedIndirectCount2KHR(info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawIndexedIndirectCount2KHR(info: DrawIndirectCount2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDrawMeshTasksIndirect2EXT(info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirect2EXT(self.handle, ptr_info)
        }
    }

    public func cmdDrawMeshTasksIndirect2EXT(info: DrawIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirect2EXT(self.handle, ptr_info)
        }
    }

    public func cmdDrawMeshTasksIndirectCount2EXT(info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCount2EXT(self.handle, ptr_info)
        }
    }

    public func cmdDrawMeshTasksIndirectCount2EXT(info: DrawIndirectCount2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCount2EXT(self.handle, ptr_info)
        }
    }

    public func cmdDispatchIndirect2KHR(info: (some Chainable<DispatchIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func cmdDispatchIndirect2KHR(info: DispatchIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func cmdSetDispatchParametersARM(dispatchParameters: (some Chainable<DispatchParametersARM>)) -> Void {
        dispatchParameters.withCStruct { ptr_dispatchParameters in
            self.commandPool.device.dispatchTable.vkCmdSetDispatchParametersARM(self.handle, ptr_dispatchParameters)
        }
    }

    public func cmdSetDispatchParametersARM(dispatchParameters: DispatchParametersARM) -> Void {
        dispatchParameters.withCStruct { ptr_dispatchParameters in
            self.commandPool.device.dispatchTable.vkCmdSetDispatchParametersARM(self.handle, ptr_dispatchParameters)
        }
    }
}

public class DeviceMemory: _HandleContainer {
    let handle: VkDeviceMemory?
    public let device: Device

    public init(handle: VkDeviceMemory!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func freeMemory() -> Void {
        self.device.dispatchTable.vkFreeMemory(self.device.handle, self.handle, nil)
    }

    public func mapMemory(offset: VkDeviceSize, size: VkDeviceSize, flags: MemoryMapFlags = []) throws -> UnsafeMutableRawPointer {
        var out: UnsafeMutableRawPointer!
        try checkResult(
            self.device.dispatchTable.vkMapMemory(self.device.handle, self.handle, offset, size, flags.rawValue, &out)
        )
        return out
    }

    public func unmapMemory() -> Void {
        self.device.dispatchTable.vkUnmapMemory(self.device.handle, self.handle)
    }

    public func getCommitment() -> VkDeviceSize {
        var out = VkDeviceSize()
        self.device.dispatchTable.vkGetDeviceMemoryCommitment(self.device.handle, self.handle, &out)
        return out
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleNV(handleType: ExternalMemoryHandleTypeFlagsNV) throws -> HANDLE {
        var out: HANDLE!
        try checkResult(
            self.device.dispatchTable.vkGetMemoryWin32HandleNV(self.device.handle, self.handle, handleType.rawValue, &out)
        )
        return out
    }
    #endif

    public func setPriorityEXT(priority: Float) -> Void {
        self.device.dispatchTable.vkSetDeviceMemoryPriorityEXT(self.device.handle, self.handle, priority)
    }
}

public class Buffer: _HandleContainer {
    let handle: VkBuffer?
    public let device: Device

    public init(handle: VkBuffer!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func getMemoryRequirements() -> MemoryRequirements {
        var out = VkMemoryRequirements()
        self.device.dispatchTable.vkGetBufferMemoryRequirements(self.device.handle, self.handle, &out)
        return MemoryRequirements(cStruct: out)
    }

    public func bindMemory(memory: DeviceMemory, memoryOffset: VkDeviceSize) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkBindBufferMemory(self.device.handle, self.handle, memory.handle, memoryOffset)
        )
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyBuffer(self.device.handle, self.handle, nil)
    }
}

public class BufferView: _HandleContainer {
    let handle: VkBufferView?
    public let device: Device

    public init(handle: VkBufferView!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyBufferView(self.device.handle, self.handle, nil)
    }
}

public class Image: _HandleContainer {
    let handle: VkImage?
    public let device: Device

    public init(handle: VkImage!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func getMemoryRequirements() -> MemoryRequirements {
        var out = VkMemoryRequirements()
        self.device.dispatchTable.vkGetImageMemoryRequirements(self.device.handle, self.handle, &out)
        return MemoryRequirements(cStruct: out)
    }

    public func bindMemory(memory: DeviceMemory, memoryOffset: VkDeviceSize) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkBindImageMemory(self.device.handle, self.handle, memory.handle, memoryOffset)
        )
    }

    public func getSparseMemoryRequirements() -> Array<SparseImageMemoryRequirements> {
        enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
            self.device.dispatchTable.vkGetImageSparseMemoryRequirements(self.device.handle, self.handle, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
        }.map { SparseImageMemoryRequirements(cStruct: $0) }
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyImage(self.device.handle, self.handle, nil)
    }

    public func getSubresourceLayout(subresource: ImageSubresource) -> SubresourceLayout {
        subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout()
            self.device.dispatchTable.vkGetImageSubresourceLayout(self.device.handle, self.handle, ptr_subresource, &out)
            return SubresourceLayout(cStruct: out)
        }
    }

    public func getDrmFormatModifierPropertiesEXT() throws -> ImageDrmFormatModifierPropertiesEXT {
        var out = VkImageDrmFormatModifierPropertiesEXT()
        try checkResult(
            self.device.dispatchTable.vkGetImageDrmFormatModifierPropertiesEXT(self.device.handle, self.handle, &out)
        )
        return ImageDrmFormatModifierPropertiesEXT(cStruct: out)
    }

    public func getSubresourceLayout2(subresource: (some Chainable<ImageSubresource2>)) -> SubresourceLayout2 {
        subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout2()
            self.device.dispatchTable.vkGetImageSubresourceLayout2(self.device.handle, self.handle, ptr_subresource, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getSubresourceLayout2(subresource: ImageSubresource2) -> SubresourceLayout2 {
        subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout2()
            self.device.dispatchTable.vkGetImageSubresourceLayout2(self.device.handle, self.handle, ptr_subresource, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }
}

public class ImageView: _HandleContainer {
    let handle: VkImageView?
    public let device: Device

    public init(handle: VkImageView!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyImageView(self.device.handle, self.handle, nil)
    }

    public func getAddressNVX() throws -> ImageViewAddressPropertiesNVX {
        var out = VkImageViewAddressPropertiesNVX()
        try checkResult(
            self.device.dispatchTable.vkGetImageViewAddressNVX(self.device.handle, self.handle, &out)
        )
        return ImageViewAddressPropertiesNVX(cStruct: out)
    }
}

public class ShaderModule: _HandleContainer {
    let handle: VkShaderModule?
    public let device: Device

    public init(handle: VkShaderModule!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyShaderModule(self.device.handle, self.handle, nil)
    }

    public func getIdentifierEXT() -> ShaderModuleIdentifierEXT {
        var out = VkShaderModuleIdentifierEXT()
        self.device.dispatchTable.vkGetShaderModuleIdentifierEXT(self.device.handle, self.handle, &out)
        return ShaderModuleIdentifierEXT(cStruct: out)
    }
}

public class Pipeline: _HandleContainer {
    let handle: VkPipeline?
    public let device: Device

    public init(handle: VkPipeline!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPipeline(self.device.handle, self.handle, nil)
    }

    public func getShaderInfoAMD(shaderStage: ShaderStageFlags, infoType: ShaderInfoTypeAMD, info: UnsafeMutableRawPointer?) throws -> Int {
        var out = Int()
        try checkResult(
            self.device.dispatchTable.vkGetShaderInfoAMD(self.device.handle, self.handle, VkShaderStageFlagBits(rawValue: VkShaderStageFlagBits.RawValue(shaderStage.rawValue)), VkShaderInfoTypeAMD(rawValue: VkShaderInfoTypeAMD.RawValue(infoType.rawValue)), &out, info)
        )
        return out
    }

    public func compileDeferredNV(shader: UInt32) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkCompileDeferredNV(self.device.handle, self.handle, shader)
        )
    }

    public func getRayTracingShaderGroupHandlesKHR(firstGroup: UInt32, groupCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetRayTracingShaderGroupHandlesKHR(self.device.handle, self.handle, firstGroup, groupCount, dataSize, data)
        )
    }

    public func getRayTracingCaptureReplayShaderGroupHandlesKHR(firstGroup: UInt32, groupCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(self.device.handle, self.handle, firstGroup, groupCount, dataSize, data)
        )
    }

    public func getRayTracingShaderGroupStackSizeKHR(group: UInt32, groupShader: ShaderGroupShaderKHR) -> VkDeviceSize {
        self.device.dispatchTable.vkGetRayTracingShaderGroupStackSizeKHR(self.device.handle, self.handle, group, VkShaderGroupShaderKHR(rawValue: VkShaderGroupShaderKHR.RawValue(groupShader.rawValue)))
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphScratchSizeAMDX() throws -> ExecutionGraphPipelineScratchSizeAMDX {
        var out = VkExecutionGraphPipelineScratchSizeAMDX()
        try checkResult(
            self.device.dispatchTable.vkGetExecutionGraphPipelineScratchSizeAMDX(self.device.handle, self.handle, &out)
        )
        return ExecutionGraphPipelineScratchSizeAMDX(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphNodeIndexAMDX(_ nodeInfo: (some Chainable<PipelineShaderStageNodeCreateInfoAMDX>)) throws -> UInt32 {
        try nodeInfo.withCStruct { ptr_nodeInfo in
            var out = UInt32()
            try checkResult(
                self.device.dispatchTable.vkGetExecutionGraphPipelineNodeIndexAMDX(self.device.handle, self.handle, ptr_nodeInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphNodeIndexAMDX(_ nodeInfo: PipelineShaderStageNodeCreateInfoAMDX) throws -> UInt32 {
        try nodeInfo.withCStruct { ptr_nodeInfo in
            var out = UInt32()
            try checkResult(
                self.device.dispatchTable.vkGetExecutionGraphPipelineNodeIndexAMDX(self.device.handle, self.handle, ptr_nodeInfo, &out)
            )
            return out
        }
    }
    #endif
}

public class PipelineLayout: _HandleContainer {
    let handle: VkPipelineLayout?
    public let device: Device

    public init(handle: VkPipelineLayout!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPipelineLayout(self.device.handle, self.handle, nil)
    }
}

public class Sampler: _HandleContainer {
    let handle: VkSampler?
    public let device: Device

    public init(handle: VkSampler!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroySampler(self.device.handle, self.handle, nil)
    }
}

public class DescriptorPool: _HandleContainer {
    let handle: VkDescriptorPool?
    public let device: Device

    public init(handle: VkDescriptorPool!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyDescriptorPool(self.device.handle, self.handle, nil)
    }

    public func reset(flags: DescriptorPoolResetFlags = []) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkResetDescriptorPool(self.device.handle, self.handle, flags.rawValue)
        )
    }

    public func freeDescriptorSets(descriptorSets: Array<DescriptorSet>) throws -> Void {
        try descriptorSets.map{ $0.handle }.withUnsafeBufferPointer { ptr_descriptorSets in
            try checkResult(
                self.device.dispatchTable.vkFreeDescriptorSets(self.device.handle, self.handle, UInt32(ptr_descriptorSets.count), ptr_descriptorSets.baseAddress)
            )
        }
    }
}

public class DescriptorSet: _HandleContainer {
    let handle: VkDescriptorSet?
    public let descriptorPool: DescriptorPool

    public init(handle: VkDescriptorSet!, descriptorPool: DescriptorPool) {
        self.handle = handle
        self.descriptorPool = descriptorPool
    }

    public func updateWithTemplate(descriptorUpdateTemplate: DescriptorUpdateTemplate, data: UnsafeRawPointer) -> Void {
        self.descriptorPool.device.dispatchTable.vkUpdateDescriptorSetWithTemplate(self.descriptorPool.device.handle, self.handle, descriptorUpdateTemplate.handle, data)
    }

    public func getHostMappingVALVE() -> UnsafeMutableRawPointer {
        var out: UnsafeMutableRawPointer!
        self.descriptorPool.device.dispatchTable.vkGetDescriptorSetHostMappingVALVE(self.descriptorPool.device.handle, self.handle, &out)
        return out
    }
}

public class DescriptorSetLayout: _HandleContainer {
    let handle: VkDescriptorSetLayout?
    public let device: Device

    public init(handle: VkDescriptorSetLayout!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyDescriptorSetLayout(self.device.handle, self.handle, nil)
    }

    public func getSizeEXT() -> VkDeviceSize {
        var out = VkDeviceSize()
        self.device.dispatchTable.vkGetDescriptorSetLayoutSizeEXT(self.device.handle, self.handle, &out)
        return out
    }

    public func getBindingOffsetEXT(binding: UInt32) -> VkDeviceSize {
        var out = VkDeviceSize()
        self.device.dispatchTable.vkGetDescriptorSetLayoutBindingOffsetEXT(self.device.handle, self.handle, binding, &out)
        return out
    }
}

public class Fence: _HandleContainer {
    let handle: VkFence?
    public let device: Device

    public init(handle: VkFence!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyFence(self.device.handle, self.handle, nil)
    }

    public func getStatus() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetFenceStatus(self.device.handle, self.handle)
        )
    }
}

public class Semaphore: _HandleContainer {
    let handle: VkSemaphore?
    public let device: Device

    public init(handle: VkSemaphore!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroySemaphore(self.device.handle, self.handle, nil)
    }

    public func getCounterValue() throws -> UInt64 {
        var out = UInt64()
        try checkResult(
            self.device.dispatchTable.vkGetSemaphoreCounterValue(self.device.handle, self.handle, &out)
        )
        return out
    }
}

public class Event: _HandleContainer {
    let handle: VkEvent?
    public let device: Device

    public init(handle: VkEvent!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyEvent(self.device.handle, self.handle, nil)
    }

    public func getStatus() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetEventStatus(self.device.handle, self.handle)
        )
    }

    public func set() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkSetEvent(self.device.handle, self.handle)
        )
    }

    public func reset() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkResetEvent(self.device.handle, self.handle)
        )
    }
}

public class QueryPool: _HandleContainer {
    let handle: VkQueryPool?
    public let device: Device

    public init(handle: VkQueryPool!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyQueryPool(self.device.handle, self.handle, nil)
    }

    public func getResults(firstQuery: UInt32, queryCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer, stride: VkDeviceSize, flags: QueryResultFlags = []) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetQueryPoolResults(self.device.handle, self.handle, firstQuery, queryCount, dataSize, data, stride, flags.rawValue)
        )
    }

    public func reset(firstQuery: UInt32, queryCount: UInt32) -> Void {
        self.device.dispatchTable.vkResetQueryPool(self.device.handle, self.handle, firstQuery, queryCount)
    }
}

public class Framebuffer: _HandleContainer {
    let handle: VkFramebuffer?
    public let device: Device

    public init(handle: VkFramebuffer!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyFramebuffer(self.device.handle, self.handle, nil)
    }

    public func getTilePropertiesQCOM() throws -> Array<TilePropertiesQCOM> {
        try enumerate { pProperties, pPropertiesCount in
            self.device.dispatchTable.vkGetFramebufferTilePropertiesQCOM(self.device.handle, self.handle, pPropertiesCount, pProperties)
        }.map { TilePropertiesQCOM(cStruct: $0) }
    }
}

public class RenderPass: _HandleContainer {
    let handle: VkRenderPass?
    public let device: Device

    public init(handle: VkRenderPass!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI() throws -> Extent2D {
        var out = VkExtent2D()
        try checkResult(
            self.device.dispatchTable.vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI(self.device.handle, self.handle, &out)
        )
        return Extent2D(cStruct: out)
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyRenderPass(self.device.handle, self.handle, nil)
    }

    public func getRenderAreaGranularity() -> Extent2D {
        var out = VkExtent2D()
        self.device.dispatchTable.vkGetRenderAreaGranularity(self.device.handle, self.handle, &out)
        return Extent2D(cStruct: out)
    }
}

public class PipelineCache: _HandleContainer {
    let handle: VkPipelineCache?
    public let device: Device

    public init(handle: VkPipelineCache!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPipelineCache(self.device.handle, self.handle, nil)
    }

    public func getData(data: UnsafeMutableRawPointer?) throws -> Int {
        var out = Int()
        try checkResult(
            self.device.dispatchTable.vkGetPipelineCacheData(self.device.handle, self.handle, &out, data)
        )
        return out
    }

    public func mergePipelineCaches(srcCaches: Array<PipelineCache>) throws -> Void {
        try srcCaches.map{ $0.handle }.withUnsafeBufferPointer { ptr_srcCaches in
            try checkResult(
                self.device.dispatchTable.vkMergePipelineCaches(self.device.handle, self.handle, UInt32(ptr_srcCaches.count), ptr_srcCaches.baseAddress)
            )
        }
    }
}

public class PipelineBinaryKHR: _HandleContainer {
    let handle: VkPipelineBinaryKHR?
    public let device: Device

    public init(handle: VkPipelineBinaryKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyPipelineBinaryKHR(self.device.handle, self.handle, nil)
    }
}

public class IndirectCommandsLayoutNV: _HandleContainer {
    let handle: VkIndirectCommandsLayoutNV?
    public let device: Device

    public init(handle: VkIndirectCommandsLayoutNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyIndirectCommandsLayoutNV(self.device.handle, self.handle, nil)
    }
}

public class IndirectCommandsLayoutEXT: _HandleContainer {
    let handle: VkIndirectCommandsLayoutEXT?
    public let device: Device

    public init(handle: VkIndirectCommandsLayoutEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyIndirectCommandsLayoutEXT(self.device.handle, self.handle, nil)
    }
}

public class IndirectExecutionSetEXT: _HandleContainer {
    let handle: VkIndirectExecutionSetEXT?
    public let device: Device

    public init(handle: VkIndirectExecutionSetEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyIndirectExecutionSetEXT(self.device.handle, self.handle, nil)
    }

    public func updatePipelineEXT(executionSetWrites: Array<WriteIndirectExecutionSetPipelineEXT>) -> Void {
        executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            self.device.dispatchTable.vkUpdateIndirectExecutionSetPipelineEXT(self.device.handle, self.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updateShaderEXT(executionSetWrites: Array<WriteIndirectExecutionSetShaderEXT>) -> Void {
        executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            self.device.dispatchTable.vkUpdateIndirectExecutionSetShaderEXT(self.device.handle, self.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }
}

public class DescriptorUpdateTemplate: _HandleContainer {
    let handle: VkDescriptorUpdateTemplate?
    public let device: Device

    public init(handle: VkDescriptorUpdateTemplate!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyDescriptorUpdateTemplate(self.device.handle, self.handle, nil)
    }
}

public class SamplerYcbcrConversion: _HandleContainer {
    let handle: VkSamplerYcbcrConversion?
    public let device: Device

    public init(handle: VkSamplerYcbcrConversion!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroySamplerYcbcrConversion(self.device.handle, self.handle, nil)
    }
}

public class ValidationCacheEXT: _HandleContainer {
    let handle: VkValidationCacheEXT?
    public let device: Device

    public init(handle: VkValidationCacheEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyValidationCacheEXT(self.device.handle, self.handle, nil)
    }

    public func getDataEXT(data: UnsafeMutableRawPointer?) throws -> Int {
        var out = Int()
        try checkResult(
            self.device.dispatchTable.vkGetValidationCacheDataEXT(self.device.handle, self.handle, &out, data)
        )
        return out
    }

    public func mergeValidationCachesEXT(srcCaches: Array<ValidationCacheEXT>) throws -> Void {
        try srcCaches.map{ $0.handle }.withUnsafeBufferPointer { ptr_srcCaches in
            try checkResult(
                self.device.dispatchTable.vkMergeValidationCachesEXT(self.device.handle, self.handle, UInt32(ptr_srcCaches.count), ptr_srcCaches.baseAddress)
            )
        }
    }
}

public class AccelerationStructureKHR: _HandleContainer {
    let handle: VkAccelerationStructureKHR?
    public let device: Device

    public init(handle: VkAccelerationStructureKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyAccelerationStructureKHR(self.device.handle, self.handle, nil)
    }
}

public class AccelerationStructureNV: _HandleContainer {
    let handle: VkAccelerationStructureNV?
    public let device: Device

    public init(handle: VkAccelerationStructureNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyAccelerationStructureNV(self.device.handle, self.handle, nil)
    }

    public func getHandleNV(dataSize: Int, data: UnsafeMutableRawPointer) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetAccelerationStructureHandleNV(self.device.handle, self.handle, dataSize, data)
        )
    }
}

public class PerformanceConfigurationINTEL: _HandleContainer {
    let handle: VkPerformanceConfigurationINTEL?
    public let device: Device

    public init(handle: VkPerformanceConfigurationINTEL!, device: Device) {
        self.handle = handle
        self.device = device
    }
}

#if VK_USE_PLATFORM_FUCHSIA
public class BufferCollectionFUCHSIA: _HandleContainer {
    let handle: VkBufferCollectionFUCHSIA?
    public let device: Device

    public init(handle: VkBufferCollectionFUCHSIA!, device: Device) {
        self.handle = handle
        self.device = device
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferConstraintsFUCHSIA(_ bufferConstraintsInfo: (some Chainable<BufferConstraintsInfoFUCHSIA>)) throws -> Void {
        try bufferConstraintsInfo.withCStruct { ptr_bufferConstraintsInfo in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionBufferConstraintsFUCHSIA(self.device.handle, self.handle, ptr_bufferConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferConstraintsFUCHSIA(_ bufferConstraintsInfo: BufferConstraintsInfoFUCHSIA) throws -> Void {
        try bufferConstraintsInfo.withCStruct { ptr_bufferConstraintsInfo in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionBufferConstraintsFUCHSIA(self.device.handle, self.handle, ptr_bufferConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setImageConstraintsFUCHSIA(_ imageConstraintsInfo: (some Chainable<ImageConstraintsInfoFUCHSIA>)) throws -> Void {
        try imageConstraintsInfo.withCStruct { ptr_imageConstraintsInfo in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionImageConstraintsFUCHSIA(self.device.handle, self.handle, ptr_imageConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setImageConstraintsFUCHSIA(_ imageConstraintsInfo: ImageConstraintsInfoFUCHSIA) throws -> Void {
        try imageConstraintsInfo.withCStruct { ptr_imageConstraintsInfo in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionImageConstraintsFUCHSIA(self.device.handle, self.handle, ptr_imageConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func destroyFUCHSIA() -> Void {
        self.device.dispatchTable.vkDestroyBufferCollectionFUCHSIA(self.device.handle, self.handle, nil)
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getPropertiesFUCHSIA() throws -> BufferCollectionPropertiesFUCHSIA {
        var out = VkBufferCollectionPropertiesFUCHSIA()
        try checkResult(
            self.device.dispatchTable.vkGetBufferCollectionPropertiesFUCHSIA(self.device.handle, self.handle, &out)
        )
        return BufferCollectionPropertiesFUCHSIA(cStruct: out)
    }
    #endif
}
#endif

public class DeferredOperationKHR: _HandleContainer {
    let handle: VkDeferredOperationKHR?
    public let device: Device

    public init(handle: VkDeferredOperationKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyDeferredOperationKHR(self.device.handle, self.handle, nil)
    }

    public func getMaxConcurrencyKHR() -> UInt32 {
        self.device.dispatchTable.vkGetDeferredOperationMaxConcurrencyKHR(self.device.handle, self.handle)
    }

    public func getResultKHR() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetDeferredOperationResultKHR(self.device.handle, self.handle)
        )
    }

    public func joinKHR() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkDeferredOperationJoinKHR(self.device.handle, self.handle)
        )
    }
}

public class PrivateDataSlot: _HandleContainer {
    let handle: VkPrivateDataSlot?
    public let device: Device

    public init(handle: VkPrivateDataSlot!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPrivateDataSlot(self.device.handle, self.handle, nil)
    }
}

public class CuModuleNVX: _HandleContainer {
    let handle: VkCuModuleNVX?
    public let device: Device

    public init(handle: VkCuModuleNVX!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNVX() -> Void {
        self.device.dispatchTable.vkDestroyCuModuleNVX(self.device.handle, self.handle, nil)
    }
}

public class CuFunctionNVX: _HandleContainer {
    let handle: VkCuFunctionNVX?
    public let device: Device

    public init(handle: VkCuFunctionNVX!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNVX() -> Void {
        self.device.dispatchTable.vkDestroyCuFunctionNVX(self.device.handle, self.handle, nil)
    }
}

public class OpticalFlowSessionNV: _HandleContainer {
    let handle: VkOpticalFlowSessionNV?
    public let device: Device

    public init(handle: VkOpticalFlowSessionNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyOpticalFlowSessionNV(self.device.handle, self.handle, nil)
    }

    public func bindImageNV(bindingPoint: OpticalFlowSessionBindingPointNV, view: ImageView? = nil, layout: ImageLayout) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkBindOpticalFlowSessionImageNV(self.device.handle, self.handle, VkOpticalFlowSessionBindingPointNV(rawValue: VkOpticalFlowSessionBindingPointNV.RawValue(bindingPoint.rawValue)), view?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(layout.rawValue)))
        )
    }
}

public class ShaderEXT: _HandleContainer {
    let handle: VkShaderEXT?
    public let device: Device

    public init(handle: VkShaderEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyShaderEXT(self.device.handle, self.handle, nil)
    }

    public func getBinaryDataEXT(data: UnsafeMutableRawPointer?) throws -> Int {
        var out = Int()
        try checkResult(
            self.device.dispatchTable.vkGetShaderBinaryDataEXT(self.device.handle, self.handle, &out, data)
        )
        return out
    }
}

public class TensorARM: _HandleContainer {
    let handle: VkTensorARM?
    public let device: Device

    public init(handle: VkTensorARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyTensorARM(self.device.handle, self.handle, nil)
    }
}

public class TensorViewARM: _HandleContainer {
    let handle: VkTensorViewARM?
    public let device: Device

    public init(handle: VkTensorViewARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyTensorViewARM(self.device.handle, self.handle, nil)
    }
}

public class DataGraphPipelineSessionARM: _HandleContainer {
    let handle: VkDataGraphPipelineSessionARM?
    public let device: Device

    public init(handle: VkDataGraphPipelineSessionARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyDataGraphPipelineSessionARM(self.device.handle, self.handle, nil)
    }
}

public class ShaderInstrumentationARM: _HandleContainer {
    let handle: VkShaderInstrumentationARM?
    public let device: Device

    public init(handle: VkShaderInstrumentationARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyShaderInstrumentationARM(self.device.handle, self.handle, nil)
    }

    public func getValuesARM(metricValues: UnsafeMutableRawPointer, flags: ShaderInstrumentationValuesFlagsARM = []) throws -> UInt32 {
        var out = UInt32()
        try checkResult(
            self.device.dispatchTable.vkGetShaderInstrumentationValuesARM(self.device.handle, self.handle, &out, metricValues, flags.rawValue)
        )
        return out
    }

    public func clearMetricsARM() -> Void {
        self.device.dispatchTable.vkClearShaderInstrumentationMetricsARM(self.device.handle, self.handle)
    }
}

public class DisplayKHR: _HandleContainer {
    let handle: VkDisplayKHR?
    public let physicalDevice: PhysicalDevice

    public init(handle: VkDisplayKHR!, physicalDevice: PhysicalDevice) {
        self.handle = handle
        self.physicalDevice = physicalDevice
    }

    public func getModePropertiesKHR() throws -> Array<DisplayModePropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.physicalDevice.instance.dispatchTable.vkGetDisplayModePropertiesKHR(self.physicalDevice.handle, self.handle, pPropertyCount, pProperties)
        }.map { DisplayModePropertiesKHR(cStruct: $0, display: self) }
    }

    public func createModeKHR(_ createInfo: (some Chainable<DisplayModeCreateInfoKHR>)) throws -> DisplayModeKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDisplayModeKHR!
            try checkResult(
                self.physicalDevice.instance.dispatchTable.vkCreateDisplayModeKHR(self.physicalDevice.handle, self.handle, ptr_createInfo, nil, &out)
            )
            return DisplayModeKHR(handle: out, display: self)
        }
    }

    public func createModeKHR(_ createInfo: DisplayModeCreateInfoKHR) throws -> DisplayModeKHR {
        try createInfo.withCStruct { ptr_createInfo in
            var out: VkDisplayModeKHR!
            try checkResult(
                self.physicalDevice.instance.dispatchTable.vkCreateDisplayModeKHR(self.physicalDevice.handle, self.handle, ptr_createInfo, nil, &out)
            )
            return DisplayModeKHR(handle: out, display: self)
        }
    }

    public func releaseEXT() throws -> Void {
        try checkResult(
            self.physicalDevice.instance.dispatchTable.vkReleaseDisplayEXT(self.physicalDevice.handle, self.handle)
        )
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func acquireWinrtNV() throws -> Void {
        try checkResult(
            self.physicalDevice.instance.dispatchTable.vkAcquireWinrtDisplayNV(self.physicalDevice.handle, self.handle)
        )
    }
    #endif

    public func getModeProperties2KHR() throws -> Array<DisplayModeProperties2KHR> {
        try enumerate { pProperties, pPropertyCount in
            self.physicalDevice.instance.dispatchTable.vkGetDisplayModeProperties2KHR(self.physicalDevice.handle, self.handle, pPropertyCount, pProperties)
        }.map { DisplayModeProperties2KHR(cStruct: $0, display: self) }
    }
}

public class DisplayModeKHR: _HandleContainer {
    let handle: VkDisplayModeKHR?
    public let display: DisplayKHR

    public init(handle: VkDisplayModeKHR!, display: DisplayKHR) {
        self.handle = handle
        self.display = display
    }

    public func getDisplayPlaneCapabilitiesKHR(planeIndex: UInt32) throws -> DisplayPlaneCapabilitiesKHR {
        var out = VkDisplayPlaneCapabilitiesKHR()
        try checkResult(
            self.display.physicalDevice.instance.dispatchTable.vkGetDisplayPlaneCapabilitiesKHR(self.display.physicalDevice.handle, self.handle, planeIndex, &out)
        )
        return DisplayPlaneCapabilitiesKHR(cStruct: out)
    }
}

public class SurfaceKHR: _HandleContainer {
    let handle: VkSurfaceKHR?
    public let instance: Instance

    public init(handle: VkSurfaceKHR!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func destroyKHR() -> Void {
        self.instance.dispatchTable.vkDestroySurfaceKHR(self.instance.handle, self.handle, nil)
    }
}

public class SwapchainKHR: _HandleContainer {
    let handle: VkSwapchainKHR?
    public let device: Device

    public init(handle: VkSwapchainKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroySwapchainKHR(self.device.handle, self.handle, nil)
    }

    public func getImagesKHR() throws -> Array<Image> {
        try enumerate { pSwapchainImages, pSwapchainImageCount in
            self.device.dispatchTable.vkGetSwapchainImagesKHR(self.device.handle, self.handle, pSwapchainImageCount, pSwapchainImages)
        }.map { Image(handle: $0, device: self.device) }
    }

    public func acquireNextImageKHR(timeout: UInt64, semaphore: Semaphore? = nil, fence: Fence? = nil) throws -> UInt32 {
        var out = UInt32()
        try checkResult(
            self.device.dispatchTable.vkAcquireNextImageKHR(self.device.handle, self.handle, timeout, semaphore?.handle, fence?.handle, &out)
        )
        return out
    }

    public func getCounterEXT(counter: SurfaceCounterFlagsEXT) throws -> UInt64 {
        var out = UInt64()
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainCounterEXT(self.device.handle, self.handle, VkSurfaceCounterFlagBitsEXT(rawValue: VkSurfaceCounterFlagBitsEXT.RawValue(counter.rawValue)), &out)
        )
        return out
    }

    public func getStatusKHR() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainStatusKHR(self.device.handle, self.handle)
        )
    }

    public func getRefreshCycleDurationGOOGLE() throws -> RefreshCycleDurationGOOGLE {
        var out = VkRefreshCycleDurationGOOGLE()
        try checkResult(
            self.device.dispatchTable.vkGetRefreshCycleDurationGOOGLE(self.device.handle, self.handle, &out)
        )
        return RefreshCycleDurationGOOGLE(cStruct: out)
    }

    public func getPastPresentationTimingGOOGLE() throws -> Array<PastPresentationTimingGOOGLE> {
        try enumerate { pPresentationTimings, pPresentationTimingCount in
            self.device.dispatchTable.vkGetPastPresentationTimingGOOGLE(self.device.handle, self.handle, pPresentationTimingCount, pPresentationTimings)
        }.map { PastPresentationTimingGOOGLE(cStruct: $0) }
    }

    public func setLocalDimmingAMD(localDimmingEnable: Bool) -> Void {
        self.device.dispatchTable.vkSetLocalDimmingAMD(self.device.handle, self.handle, VkBool32(localDimmingEnable ? VK_TRUE : VK_FALSE))
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func acquireFullScreenExclusiveModeEXT() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkAcquireFullScreenExclusiveModeEXT(self.device.handle, self.handle)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func releaseFullScreenExclusiveModeEXT() throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkReleaseFullScreenExclusiveModeEXT(self.device.handle, self.handle)
        )
    }
    #endif

    public func waitForPresent2KHR(_ presentWait2Info: (some Chainable<PresentWait2InfoKHR>)) throws -> Void {
        try presentWait2Info.withCStruct { ptr_presentWait2Info in
            try checkResult(
                self.device.dispatchTable.vkWaitForPresent2KHR(self.device.handle, self.handle, ptr_presentWait2Info)
            )
        }
    }

    public func waitForPresent2KHR(_ presentWait2Info: PresentWait2InfoKHR) throws -> Void {
        try presentWait2Info.withCStruct { ptr_presentWait2Info in
            try checkResult(
                self.device.dispatchTable.vkWaitForPresent2KHR(self.device.handle, self.handle, ptr_presentWait2Info)
            )
        }
    }

    public func waitForPresentKHR(presentId: UInt64, timeout: UInt64) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkWaitForPresentKHR(self.device.handle, self.handle, presentId, timeout)
        )
    }

    public func setPresentTimingQueueSizeEXT(size: UInt32) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkSetSwapchainPresentTimingQueueSizeEXT(self.device.handle, self.handle, size)
        )
    }

    public func getTimingPropertiesEXT(swapchainTimingProperties: UnsafeMutablePointer<VkSwapchainTimingPropertiesEXT>, swapchainTimingPropertiesCounter: UnsafeMutablePointer<UInt64>? = nil) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainTimingPropertiesEXT(self.device.handle, self.handle, swapchainTimingProperties, swapchainTimingPropertiesCounter)
        )
    }

    public func getTimeDomainPropertiesEXT(swapchainTimeDomainProperties: UnsafeMutablePointer<VkSwapchainTimeDomainPropertiesEXT>, timeDomainsCounter: UnsafeMutablePointer<UInt64>? = nil) throws -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainTimeDomainPropertiesEXT(self.device.handle, self.handle, swapchainTimeDomainProperties, timeDomainsCounter)
        )
    }

    public func setLatencySleepModeNV(_ sleepModeInfo: (some Chainable<LatencySleepModeInfoNV>)) throws -> Void {
        try sleepModeInfo.withCStruct { ptr_sleepModeInfo in
            try checkResult(
                self.device.dispatchTable.vkSetLatencySleepModeNV(self.device.handle, self.handle, ptr_sleepModeInfo)
            )
        }
    }

    public func setLatencySleepModeNV(_ sleepModeInfo: LatencySleepModeInfoNV) throws -> Void {
        try sleepModeInfo.withCStruct { ptr_sleepModeInfo in
            try checkResult(
                self.device.dispatchTable.vkSetLatencySleepModeNV(self.device.handle, self.handle, ptr_sleepModeInfo)
            )
        }
    }

    public func latencySleepNV(_ sleepInfo: (some Chainable<LatencySleepInfoNV>)) throws -> Void {
        try sleepInfo.withCStruct { ptr_sleepInfo in
            try checkResult(
                self.device.dispatchTable.vkLatencySleepNV(self.device.handle, self.handle, ptr_sleepInfo)
            )
        }
    }

    public func latencySleepNV(_ sleepInfo: LatencySleepInfoNV) throws -> Void {
        try sleepInfo.withCStruct { ptr_sleepInfo in
            try checkResult(
                self.device.dispatchTable.vkLatencySleepNV(self.device.handle, self.handle, ptr_sleepInfo)
            )
        }
    }

    public func setLatencyMarkerNV(_ latencyMarkerInfo: (some Chainable<SetLatencyMarkerInfoNV>)) -> Void {
        latencyMarkerInfo.withCStruct { ptr_latencyMarkerInfo in
            self.device.dispatchTable.vkSetLatencyMarkerNV(self.device.handle, self.handle, ptr_latencyMarkerInfo)
        }
    }

    public func setLatencyMarkerNV(_ latencyMarkerInfo: SetLatencyMarkerInfoNV) -> Void {
        latencyMarkerInfo.withCStruct { ptr_latencyMarkerInfo in
            self.device.dispatchTable.vkSetLatencyMarkerNV(self.device.handle, self.handle, ptr_latencyMarkerInfo)
        }
    }

    public func getLatencyTimingsNV() -> GetLatencyMarkerInfoNV {
        var out = VkGetLatencyMarkerInfoNV()
        self.device.dispatchTable.vkGetLatencyTimingsNV(self.device.handle, self.handle, &out)
        return GetLatencyMarkerInfoNV(cStruct: out)
    }
}

public class DebugReportCallbackEXT: _HandleContainer {
    let handle: VkDebugReportCallbackEXT?
    public let instance: Instance

    public init(handle: VkDebugReportCallbackEXT!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func destroyEXT() -> Void {
        self.instance.dispatchTable.vkDestroyDebugReportCallbackEXT(self.instance.handle, self.handle, nil)
    }
}

public class DebugUtilsMessengerEXT: _HandleContainer {
    let handle: VkDebugUtilsMessengerEXT?
    public let instance: Instance

    public init(handle: VkDebugUtilsMessengerEXT!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func destroyEXT() -> Void {
        self.instance.dispatchTable.vkDestroyDebugUtilsMessengerEXT(self.instance.handle, self.handle, nil)
    }
}

public class VideoSessionKHR: _HandleContainer {
    let handle: VkVideoSessionKHR?
    public let device: Device

    public init(handle: VkVideoSessionKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyVideoSessionKHR(self.device.handle, self.handle, nil)
    }

    public func getMemoryRequirementsKHR() throws -> Array<VideoSessionMemoryRequirementsKHR> {
        try enumerate { pMemoryRequirements, pMemoryRequirementsCount in
            self.device.dispatchTable.vkGetVideoSessionMemoryRequirementsKHR(self.device.handle, self.handle, pMemoryRequirementsCount, pMemoryRequirements)
        }.map { VideoSessionMemoryRequirementsKHR(cStruct: $0) }
    }

    public func bindMemoryKHR(bindSessionMemoryInfos: Array<BindVideoSessionMemoryInfoKHR>) throws -> Void {
        try bindSessionMemoryInfos.withCStructBufferPointer { ptr_bindSessionMemoryInfos in
            try checkResult(
                self.device.dispatchTable.vkBindVideoSessionMemoryKHR(self.device.handle, self.handle, UInt32(ptr_bindSessionMemoryInfos.count), ptr_bindSessionMemoryInfos.baseAddress)
            )
        }
    }
}

public class VideoSessionParametersKHR: _HandleContainer {
    let handle: VkVideoSessionParametersKHR?
    public let device: Device

    public init(handle: VkVideoSessionParametersKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func updateKHR(_ updateInfo: (some Chainable<VideoSessionParametersUpdateInfoKHR>)) throws -> Void {
        try updateInfo.withCStruct { ptr_updateInfo in
            try checkResult(
                self.device.dispatchTable.vkUpdateVideoSessionParametersKHR(self.device.handle, self.handle, ptr_updateInfo)
            )
        }
    }

    public func updateKHR(_ updateInfo: VideoSessionParametersUpdateInfoKHR) throws -> Void {
        try updateInfo.withCStruct { ptr_updateInfo in
            try checkResult(
                self.device.dispatchTable.vkUpdateVideoSessionParametersKHR(self.device.handle, self.handle, ptr_updateInfo)
            )
        }
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyVideoSessionParametersKHR(self.device.handle, self.handle, nil)
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
public class CudaModuleNV: _HandleContainer {
    let handle: VkCudaModuleNV?
    public let device: Device

    public init(handle: VkCudaModuleNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getCacheNV(cacheData: UnsafeMutableRawPointer?) throws -> Int {
        var out = Int()
        try checkResult(
            self.device.dispatchTable.vkGetCudaModuleCacheNV(self.device.handle, self.handle, &out, cacheData)
        )
        return out
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyCudaModuleNV(self.device.handle, self.handle, nil)
    }
    #endif
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
public class CudaFunctionNV: _HandleContainer {
    let handle: VkCudaFunctionNV?
    public let device: Device

    public init(handle: VkCudaFunctionNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyCudaFunctionNV(self.device.handle, self.handle, nil)
    }
    #endif
}
#endif

public class ExternalComputeQueueNV: _HandleContainer {
    let handle: VkExternalComputeQueueNV?
    public let device: Device

    public init(handle: VkExternalComputeQueueNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyExternalComputeQueueNV(self.device.handle, self.handle, nil)
    }

    public func getDataNV(data: UnsafeMutableRawPointer) -> ExternalComputeQueueDataParamsNV {
        var out = VkExternalComputeQueueDataParamsNV()
        self.device.dispatchTable.vkGetExternalComputeQueueDataNV(self.handle, &out, data)
        return ExternalComputeQueueDataParamsNV(cStruct: out)
    }
}

