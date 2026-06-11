import CVulkan

public final class Entry {
    public let loader: Loader
    public let dispatchTable: EntryDispatchTable

    public init(loader: Loader) {
        self.loader = loader
        self.dispatchTable = EntryDispatchTable(vkGetInstanceProcAddr: self.loader.vkGetInstanceProcAddr)
    }

    public func createInstance(_ createInfo: (some Chainable<InstanceCreateInfo>)) throws(Result) -> Instance {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkInstance!
            try checkResult(
                self.dispatchTable.vkCreateInstance(ptr_createInfo, nil, &out)
            )
            return Instance(handle: out, entry: self)
        }
    }

    public func createInstance(_ createInfo: InstanceCreateInfo = InstanceCreateInfo()) throws(Result) -> Instance {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkInstance!
            try checkResult(
                self.dispatchTable.vkCreateInstance(ptr_createInfo, nil, &out)
            )
            return Instance(handle: out, entry: self)
        }
    }

    public func getInstanceProcAddr(instance: Instance? = nil, name: String) -> PFN_vkVoidFunction? {
        name._withCString { cString_name in
            self.loader.vkGetInstanceProcAddr(instance?.handle, cString_name)
        }
    }

    public func getInstanceVersion() throws(Result) -> Version {
        var out = UInt32()
        try checkResult(
            self.dispatchTable.vkEnumerateInstanceVersion(&out)
        )
        return Version(rawValue: out)
    }

    public func getInstanceLayerProperties() throws(Result) -> Array<LayerProperties> {
        try enumerate { pProperties, pPropertyCount in
            self.dispatchTable.vkEnumerateInstanceLayerProperties(pPropertyCount, pProperties)
        }.map { LayerProperties(cStruct: $0) }
    }

    public func getInstanceExtensionProperties(layerName: String? = nil) throws(Result) -> Array<ExtensionProperties> {
        try layerName.withOptionalCString { cString_layerName throws(Result) in
            try enumerate { pProperties, pPropertyCount in
                self.dispatchTable.vkEnumerateInstanceExtensionProperties(cString_layerName, pPropertyCount, pProperties)
            }.map { ExtensionProperties(cStruct: $0) }
        }
    }
}

public final class Instance: _HandleContainer {
    public let handle: VkInstance?
    public let entry: Entry
    public let dispatchTable: InstanceDispatchTable

    public init(handle: VkInstance!, entry: Entry) {
        self.handle = handle
        self.entry = entry
        self.dispatchTable = InstanceDispatchTable(vkGetInstanceProcAddr: self.entry.loader.vkGetInstanceProcAddr, instance: handle)
    }

    public func destroy() -> Void {
        self.dispatchTable.vkDestroyInstance(self.handle, nil)
    }

    public func getPhysicalDevices() throws(Result) -> Array<PhysicalDevice> {
        try enumerate { pPhysicalDevices, pPhysicalDeviceCount in
            self.dispatchTable.vkEnumeratePhysicalDevices(self.handle, pPhysicalDeviceCount, pPhysicalDevices)
        }.map { PhysicalDevice(handle: $0, instance: self) }
    }

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func createAndroidSurfaceKHR(_ createInfo: (some Chainable<AndroidSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateAndroidSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func createAndroidSurfaceKHR(_ createInfo: AndroidSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateAndroidSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func createSurfaceOHOS(_ createInfo: (some Chainable<SurfaceCreateInfoOHOS>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateSurfaceOHOS(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func createSurfaceOHOS(_ createInfo: SurfaceCreateInfoOHOS) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateSurfaceOHOS(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    public func createDisplayPlaneSurfaceKHR(_ createInfo: (some Chainable<DisplaySurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDisplayPlaneSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }

    public func createDisplayPlaneSurfaceKHR(_ createInfo: DisplaySurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDisplayPlaneSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }

    #if VK_USE_PLATFORM_VI_NN
    public func createViSurfaceNN(_ createInfo: (some Chainable<ViSurfaceCreateInfoNN>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateViSurfaceNN(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_VI_NN
    public func createViSurfaceNN(_ createInfo: ViSurfaceCreateInfoNN) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateViSurfaceNN(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func createWaylandSurfaceKHR(_ createInfo: (some Chainable<WaylandSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWaylandSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func createWaylandSurfaceKHR(_ createInfo: WaylandSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWaylandSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func createUbmSurfaceSEC(_ createInfo: (some Chainable<UbmSurfaceCreateInfoSEC>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateUbmSurfaceSEC(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func createUbmSurfaceSEC(_ createInfo: UbmSurfaceCreateInfoSEC) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateUbmSurfaceSEC(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func createWin32SurfaceKHR(_ createInfo: (some Chainable<Win32SurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWin32SurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func createWin32SurfaceKHR(_ createInfo: Win32SurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateWin32SurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func createXlibSurfaceKHR(_ createInfo: (some Chainable<XlibSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXlibSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func createXlibSurfaceKHR(_ createInfo: XlibSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXlibSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func createXcbSurfaceKHR(_ createInfo: (some Chainable<XcbSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXcbSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func createXcbSurfaceKHR(_ createInfo: XcbSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateXcbSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func createDirectFBSurfaceEXT(_ createInfo: (some Chainable<DirectFBSurfaceCreateInfoEXT>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDirectFBSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func createDirectFBSurfaceEXT(_ createInfo: DirectFBSurfaceCreateInfoEXT) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateDirectFBSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createImagePipeSurfaceFUCHSIA(_ createInfo: (some Chainable<ImagePipeSurfaceCreateInfoFUCHSIA>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateImagePipeSurfaceFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createImagePipeSurfaceFUCHSIA(_ createInfo: ImagePipeSurfaceCreateInfoFUCHSIA) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateImagePipeSurfaceFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_GGP
    public func createStreamDescriptorSurfaceGGP(_ createInfo: (some Chainable<StreamDescriptorSurfaceCreateInfoGGP>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateStreamDescriptorSurfaceGGP(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_GGP
    public func createStreamDescriptorSurfaceGGP(_ createInfo: StreamDescriptorSurfaceCreateInfoGGP) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateStreamDescriptorSurfaceGGP(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func createScreenSurfaceQNX(_ createInfo: (some Chainable<ScreenSurfaceCreateInfoQNX>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateScreenSurfaceQNX(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func createScreenSurfaceQNX(_ createInfo: ScreenSurfaceCreateInfoQNX) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateScreenSurfaceQNX(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    public func createDebugReportCallbackEXT(_ createInfo: (some Chainable<DebugReportCallbackCreateInfoEXT>)) throws(Result) -> DebugReportCallbackEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugReportCallbackEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugReportCallbackEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugReportCallbackEXT(handle: out, instance: self)
        }
    }

    public func createDebugReportCallbackEXT(_ createInfo: DebugReportCallbackCreateInfoEXT) throws(Result) -> DebugReportCallbackEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugReportCallbackEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugReportCallbackEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugReportCallbackEXT(handle: out, instance: self)
        }
    }

    public func debugReportMessageEXT(flags: DebugReportFlagsEXT, objectType: DebugReportObjectTypeEXT, object: UInt64, location: Int, messageCode: Int32, layerPrefix: String, message: String) -> Void {
        layerPrefix._withCString { cString_layerPrefix in
            message._withCString { cString_message in
                self.dispatchTable.vkDebugReportMessageEXT(self.handle, flags.rawValue, VkDebugReportObjectTypeEXT(rawValue: VkDebugReportObjectTypeEXT.RawValue(objectType.rawValue)), object, location, messageCode, cString_layerPrefix, cString_message)
            }
        }
    }

    public func getPhysicalDeviceGroups() throws(Result) -> Array<PhysicalDeviceGroupProperties> {
        try enumerate { pPhysicalDeviceGroupProperties, pPhysicalDeviceGroupCount in
            self.dispatchTable.vkEnumeratePhysicalDeviceGroups(self.handle, pPhysicalDeviceGroupCount, pPhysicalDeviceGroupProperties)
        }.map { PhysicalDeviceGroupProperties(cStruct: $0, instance: self) }
    }

    #if VK_USE_PLATFORM_IOS_MVK
    public func createIOSSurfaceMVK(_ createInfo: (some Chainable<IOSSurfaceCreateInfoMVK>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateIOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_IOS_MVK
    public func createIOSSurfaceMVK(_ createInfo: IOSSurfaceCreateInfoMVK) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateIOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_MACOS_MVK
    public func createMacOSSurfaceMVK(_ createInfo: (some Chainable<MacOSSurfaceCreateInfoMVK>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMacOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_MACOS_MVK
    public func createMacOSSurfaceMVK(_ createInfo: MacOSSurfaceCreateInfoMVK) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMacOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func createMetalSurfaceEXT(_ createInfo: (some Chainable<MetalSurfaceCreateInfoEXT>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMetalSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func createMetalSurfaceEXT(_ createInfo: MetalSurfaceCreateInfoEXT) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateMetalSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
    #endif

    public func createDebugUtilsMessengerEXT(_ createInfo: (some Chainable<DebugUtilsMessengerCreateInfoEXT>)) throws(Result) -> DebugUtilsMessengerEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugUtilsMessengerEXT!
            try checkResult(
                self.dispatchTable.vkCreateDebugUtilsMessengerEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugUtilsMessengerEXT(handle: out, instance: self)
        }
    }

    public func createDebugUtilsMessengerEXT(_ createInfo: DebugUtilsMessengerCreateInfoEXT) throws(Result) -> DebugUtilsMessengerEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
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

    public func createHeadlessSurfaceEXT(_ createInfo: (some Chainable<HeadlessSurfaceCreateInfoEXT>)) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateHeadlessSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }

    public func createHeadlessSurfaceEXT(_ createInfo: HeadlessSurfaceCreateInfoEXT = HeadlessSurfaceCreateInfoEXT()) throws(Result) -> SurfaceKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                self.dispatchTable.vkCreateHeadlessSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out, instance: self)
        }
    }
}

public final class PhysicalDevice: _HandleContainer {
    public let handle: VkPhysicalDevice?
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

    public func getImageFormatProperties(format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags = []) throws(Result) -> ImageFormatProperties {
        var out = VkImageFormatProperties()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceImageFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), usage.rawValue, flags.rawValue, &out)
        )
        return ImageFormatProperties(cStruct: out)
    }

    public func createDevice(_ createInfo: (some Chainable<DeviceCreateInfo>)) throws(Result) -> Device {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDevice!
            try checkResult(
                self.instance.dispatchTable.vkCreateDevice(self.handle, ptr_createInfo, nil, &out)
            )
            return Device(handle: out, physicalDevice: self)
        }
    }

    public func createDevice(_ createInfo: DeviceCreateInfo = DeviceCreateInfo()) throws(Result) -> Device {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDevice!
            try checkResult(
                self.instance.dispatchTable.vkCreateDevice(self.handle, ptr_createInfo, nil, &out)
            )
            return Device(handle: out, physicalDevice: self)
        }
    }

    public func getDeviceLayerProperties() throws(Result) -> Array<LayerProperties> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkEnumerateDeviceLayerProperties(self.handle, pPropertyCount, pProperties)
        }.map { LayerProperties(cStruct: $0) }
    }

    public func getDeviceExtensionProperties(layerName: String? = nil) throws(Result) -> Array<ExtensionProperties> {
        try layerName.withOptionalCString { cString_layerName throws(Result) in
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

    public func getDisplayPropertiesKHR() throws(Result) -> Array<DisplayPropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayPropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPropertiesKHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlanePropertiesKHR() throws(Result) -> Array<DisplayPlanePropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayPlanePropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPlanePropertiesKHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlaneSupportedDisplaysKHR(planeIndex: UInt32) throws(Result) -> Array<DisplayKHR> {
        try enumerate { pDisplays, pDisplayCount in
            self.instance.dispatchTable.vkGetDisplayPlaneSupportedDisplaysKHR(self.handle, planeIndex, pDisplayCount, pDisplays)
        }.map { DisplayKHR(handle: $0, physicalDevice: self) }
    }

    public func getSurfaceSupportKHR(queueFamilyIndex: UInt32, surface: SurfaceKHR) throws(Result) -> Bool {
        var out = VkBool32()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceSupportKHR(self.handle, queueFamilyIndex, surface.handle, &out)
        )
        return out == VK_TRUE
    }

    public func getSurfaceCapabilitiesKHR(surface: SurfaceKHR) throws(Result) -> SurfaceCapabilitiesKHR {
        var out = VkSurfaceCapabilitiesKHR()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(self.handle, surface.handle, &out)
        )
        return SurfaceCapabilitiesKHR(cStruct: out)
    }

    public func getSurfaceFormatsKHR(surface: SurfaceKHR? = nil) throws(Result) -> Array<SurfaceFormatKHR> {
        try enumerate { pSurfaceFormats, pSurfaceFormatCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceFormatsKHR(self.handle, surface?.handle, pSurfaceFormatCount, pSurfaceFormats)
        }.map { SurfaceFormatKHR(cStruct: $0) }
    }

    public func getSurfacePresentModesKHR(surface: SurfaceKHR? = nil) throws(Result) -> Array<PresentModeKHR> {
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

    public func getExternalImageFormatPropertiesNV(format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags = [], externalHandleType: ExternalMemoryHandleTypeFlagsNV = []) throws(Result) -> ExternalImageFormatPropertiesNV {
        var out = VkExternalImageFormatPropertiesNV()
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalImageFormatPropertiesNV(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), usage.rawValue, flags.rawValue, externalHandleType.rawValue, &out)
        )
        return ExternalImageFormatPropertiesNV(cStruct: out)
    }

    public func getFeatures2() -> PhysicalDeviceFeatures2 {
        var out = VkPhysicalDeviceFeatures2()
        out.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2
        self.instance.dispatchTable.vkGetPhysicalDeviceFeatures2(self.handle, &out)
        return PhysicalDeviceFeatures2(cStruct: out)
    }

    public func getProperties2() -> PhysicalDeviceProperties2 {
        var out = VkPhysicalDeviceProperties2()
        out.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2
        self.instance.dispatchTable.vkGetPhysicalDeviceProperties2(self.handle, &out)
        return PhysicalDeviceProperties2(cStruct: out)
    }

    public func getFormatProperties2(format: Format) -> FormatProperties2 {
        var out = VkFormatProperties2()
        out.sType = VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2
        self.instance.dispatchTable.vkGetPhysicalDeviceFormatProperties2(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), &out)
        return FormatProperties2(cStruct: out)
    }

    public func getImageFormatProperties2(_ imageFormatInfo: (some Chainable<PhysicalDeviceImageFormatInfo2>)) throws(Result) -> ImageFormatProperties2 {
        try imageFormatInfo.withCStruct { ptr_imageFormatInfo throws(Result) in
            var out = VkImageFormatProperties2()
            out.sType = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceImageFormatProperties2(self.handle, ptr_imageFormatInfo, &out)
            )
            return ImageFormatProperties2(cStruct: out)
        }
    }

    public func getImageFormatProperties2(_ imageFormatInfo: PhysicalDeviceImageFormatInfo2) throws(Result) -> ImageFormatProperties2 {
        try imageFormatInfo.withCStruct { ptr_imageFormatInfo throws(Result) in
            var out = VkImageFormatProperties2()
            out.sType = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
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
        out.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2
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
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalBufferProperties(self.handle, ptr_externalBufferInfo, &out)
            return ExternalBufferProperties(cStruct: out)
        }
    }

    public func getExternalBufferProperties(_ externalBufferInfo: PhysicalDeviceExternalBufferInfo) -> ExternalBufferProperties {
        externalBufferInfo.withCStruct { ptr_externalBufferInfo in
            var out = VkExternalBufferProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalBufferProperties(self.handle, ptr_externalBufferInfo, &out)
            return ExternalBufferProperties(cStruct: out)
        }
    }

    public func getExternalSemaphoreProperties(_ externalSemaphoreInfo: (some Chainable<PhysicalDeviceExternalSemaphoreInfo>)) -> ExternalSemaphoreProperties {
        externalSemaphoreInfo.withCStruct { ptr_externalSemaphoreInfo in
            var out = VkExternalSemaphoreProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalSemaphoreProperties(self.handle, ptr_externalSemaphoreInfo, &out)
            return ExternalSemaphoreProperties(cStruct: out)
        }
    }

    public func getExternalSemaphoreProperties(_ externalSemaphoreInfo: PhysicalDeviceExternalSemaphoreInfo) -> ExternalSemaphoreProperties {
        externalSemaphoreInfo.withCStruct { ptr_externalSemaphoreInfo in
            var out = VkExternalSemaphoreProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalSemaphoreProperties(self.handle, ptr_externalSemaphoreInfo, &out)
            return ExternalSemaphoreProperties(cStruct: out)
        }
    }

    public func getExternalFenceProperties(_ externalFenceInfo: (some Chainable<PhysicalDeviceExternalFenceInfo>)) -> ExternalFenceProperties {
        externalFenceInfo.withCStruct { ptr_externalFenceInfo in
            var out = VkExternalFenceProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalFenceProperties(self.handle, ptr_externalFenceInfo, &out)
            return ExternalFenceProperties(cStruct: out)
        }
    }

    public func getExternalFenceProperties(_ externalFenceInfo: PhysicalDeviceExternalFenceInfo) -> ExternalFenceProperties {
        externalFenceInfo.withCStruct { ptr_externalFenceInfo in
            var out = VkExternalFenceProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalFenceProperties(self.handle, ptr_externalFenceInfo, &out)
            return ExternalFenceProperties(cStruct: out)
        }
    }

    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    public func acquireXlibDisplayEXT(display: DisplayKHR) throws(Result) -> Display {
        var out = Display()
        try checkResult(
            self.instance.dispatchTable.vkAcquireXlibDisplayEXT(self.handle, &out, display.handle)
        )
        return out
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    public func getRandROutputDisplayEXT(dpy: UnsafeMutablePointer<Display>, rrOutput: RROutput, display: UnsafeMutablePointer<VkDisplayKHR?>) throws(Result) -> Void {
        try checkResult(
            self.instance.dispatchTable.vkGetRandROutputDisplayEXT(self.handle, dpy, rrOutput, display)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getWinrtDisplayNV(deviceRelativeId: UInt32) throws(Result) -> DisplayKHR {
        var out: VkDisplayKHR!
        try checkResult(
            self.instance.dispatchTable.vkGetWinrtDisplayNV(self.handle, deviceRelativeId, &out)
        )
        return DisplayKHR(handle: out, physicalDevice: self)
    }
    #endif

    public func getSurfaceCapabilities2EXT(surface: SurfaceKHR) throws(Result) -> SurfaceCapabilities2EXT {
        var out = VkSurfaceCapabilities2EXT()
        out.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT
        try checkResult(
            self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilities2EXT(self.handle, surface.handle, &out)
        )
        return SurfaceCapabilities2EXT(cStruct: out)
    }

    public func getPresentRectanglesKHR(surface: SurfaceKHR) throws(Result) -> Array<Rect2D> {
        try enumerate { pRects, pRectCount in
            self.instance.dispatchTable.vkGetPhysicalDevicePresentRectanglesKHR(self.handle, surface.handle, pRectCount, pRects)
        }.map { Rect2D(cStruct: $0) }
    }

    public func getMultisamplePropertiesEXT(samples: SampleCountFlags) -> MultisamplePropertiesEXT {
        var out = VkMultisamplePropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT
        self.instance.dispatchTable.vkGetPhysicalDeviceMultisamplePropertiesEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), &out)
        return MultisamplePropertiesEXT(cStruct: out)
    }

    public func getSurfaceCapabilities2KHR(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> SurfaceCapabilities2KHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkSurfaceCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilities2KHR(self.handle, ptr_surfaceInfo, &out)
            )
            return SurfaceCapabilities2KHR(cStruct: out)
        }
    }

    public func getSurfaceCapabilities2KHR(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> SurfaceCapabilities2KHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkSurfaceCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceCapabilities2KHR(self.handle, ptr_surfaceInfo, &out)
            )
            return SurfaceCapabilities2KHR(cStruct: out)
        }
    }

    public func getSurfaceFormats2KHR(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> Array<SurfaceFormat2KHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pSurfaceFormats, pSurfaceFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceFormats2KHR(self.handle, ptr_surfaceInfo, pSurfaceFormatCount, pSurfaceFormats)
            }.map { SurfaceFormat2KHR(cStruct: $0) }
        }
    }

    public func getSurfaceFormats2KHR(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> Array<SurfaceFormat2KHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pSurfaceFormats, pSurfaceFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfaceFormats2KHR(self.handle, ptr_surfaceInfo, pSurfaceFormatCount, pSurfaceFormats)
            }.map { SurfaceFormat2KHR(cStruct: $0) }
        }
    }

    public func getDisplayProperties2KHR() throws(Result) -> Array<DisplayProperties2KHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayProperties2KHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayProperties2KHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlaneProperties2KHR() throws(Result) -> Array<DisplayPlaneProperties2KHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceDisplayPlaneProperties2KHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPlaneProperties2KHR(cStruct: $0, physicalDevice: self) }
    }

    public func getDisplayPlaneCapabilities2KHR(_ displayPlaneInfo: (some Chainable<DisplayPlaneInfo2KHR>)) throws(Result) -> DisplayPlaneCapabilities2KHR {
        try displayPlaneInfo.withCStruct { ptr_displayPlaneInfo throws(Result) in
            var out = VkDisplayPlaneCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetDisplayPlaneCapabilities2KHR(self.handle, ptr_displayPlaneInfo, &out)
            )
            return DisplayPlaneCapabilities2KHR(cStruct: out)
        }
    }

    public func getDisplayPlaneCapabilities2KHR(_ displayPlaneInfo: DisplayPlaneInfo2KHR) throws(Result) -> DisplayPlaneCapabilities2KHR {
        try displayPlaneInfo.withCStruct { ptr_displayPlaneInfo throws(Result) in
            var out = VkDisplayPlaneCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetDisplayPlaneCapabilities2KHR(self.handle, ptr_displayPlaneInfo, &out)
            )
            return DisplayPlaneCapabilities2KHR(cStruct: out)
        }
    }

    public func getCalibrateableTimeDomainsKHR() throws(Result) -> Array<TimeDomainKHR> {
        try enumerate { pTimeDomains, pTimeDomainCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCalibrateableTimeDomainsKHR(self.handle, pTimeDomainCount, pTimeDomains)
        }.map { TimeDomainKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
    }

    public func getCooperativeMatrixPropertiesNV() throws(Result) -> Array<CooperativeMatrixPropertiesNV> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixPropertiesNV(cStruct: $0) }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSurfacePresentModes2EXT(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> Array<PresentModeKHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pPresentModes, pPresentModeCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, pPresentModeCount, pPresentModes)
            }.map { PresentModeKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSurfacePresentModes2EXT(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> Array<PresentModeKHR> {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pPresentModes, pPresentModeCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, pPresentModeCount, pPresentModes)
            }.map { PresentModeKHR(rawValue: unsafeBitCast($0, to: UInt32.self))! }
        }
    }
    #endif

    public func getQueueFamilyPerformanceQueryCountersKHR(queueFamilyIndex: UInt32, counterCount: UnsafeMutablePointer<UInt32>, counters: UnsafeMutablePointer<VkPerformanceCounterKHR>? = nil, counterDescriptions: UnsafeMutablePointer<VkPerformanceCounterDescriptionKHR>? = nil) throws(Result) -> Void {
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

    public func getSupportedFramebufferMixedSamplesCombinationsNV() throws(Result) -> Array<FramebufferMixedSamplesCombinationNV> {
        try enumerate { pCombinations, pCombinationCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(self.handle, pCombinationCount, pCombinations)
        }.map { FramebufferMixedSamplesCombinationNV(cStruct: $0) }
    }

    public func getToolProperties() throws(Result) -> Array<PhysicalDeviceToolProperties> {
        try enumerate { pToolProperties, pToolCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceToolProperties(self.handle, pToolCount, pToolProperties)
        }.map { PhysicalDeviceToolProperties(cStruct: $0) }
    }

    public func getFragmentShadingRatesKHR() throws(Result) -> Array<PhysicalDeviceFragmentShadingRateKHR> {
        try enumerate { pFragmentShadingRates, pFragmentShadingRateCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceFragmentShadingRatesKHR(self.handle, pFragmentShadingRateCount, pFragmentShadingRates)
        }.map { PhysicalDeviceFragmentShadingRateKHR(cStruct: $0) }
    }

    public func getVideoCapabilitiesKHR(videoProfile: (some Chainable<VideoProfileInfoKHR>)) throws(Result) -> VideoCapabilitiesKHR {
        try videoProfile.withCStruct { ptr_videoProfile throws(Result) in
            var out = VkVideoCapabilitiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoCapabilitiesKHR(self.handle, ptr_videoProfile, &out)
            )
            return VideoCapabilitiesKHR(cStruct: out)
        }
    }

    public func getVideoCapabilitiesKHR(videoProfile: VideoProfileInfoKHR) throws(Result) -> VideoCapabilitiesKHR {
        try videoProfile.withCStruct { ptr_videoProfile throws(Result) in
            var out = VkVideoCapabilitiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoCapabilitiesKHR(self.handle, ptr_videoProfile, &out)
            )
            return VideoCapabilitiesKHR(cStruct: out)
        }
    }

    public func getVideoFormatPropertiesKHR(_ videoFormatInfo: (some Chainable<PhysicalDeviceVideoFormatInfoKHR>)) throws(Result) -> Array<VideoFormatPropertiesKHR> {
        try videoFormatInfo.withCStruct { ptr_videoFormatInfo throws(Result) in
            try enumerate { pVideoFormatProperties, pVideoFormatPropertyCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoFormatPropertiesKHR(self.handle, ptr_videoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties)
            }.map { VideoFormatPropertiesKHR(cStruct: $0) }
        }
    }

    public func getVideoFormatPropertiesKHR(_ videoFormatInfo: PhysicalDeviceVideoFormatInfoKHR) throws(Result) -> Array<VideoFormatPropertiesKHR> {
        try videoFormatInfo.withCStruct { ptr_videoFormatInfo throws(Result) in
            try enumerate { pVideoFormatProperties, pVideoFormatPropertyCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoFormatPropertiesKHR(self.handle, ptr_videoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties)
            }.map { VideoFormatPropertiesKHR(cStruct: $0) }
        }
    }

    public func getVideoEncodeQualityLevelPropertiesKHR(_ qualityLevelInfo: (some Chainable<PhysicalDeviceVideoEncodeQualityLevelInfoKHR>)) throws(Result) -> VideoEncodeQualityLevelPropertiesKHR {
        try qualityLevelInfo.withCStruct { ptr_qualityLevelInfo throws(Result) in
            var out = VkVideoEncodeQualityLevelPropertiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(self.handle, ptr_qualityLevelInfo, &out)
            )
            return VideoEncodeQualityLevelPropertiesKHR(cStruct: out)
        }
    }

    public func getVideoEncodeQualityLevelPropertiesKHR(_ qualityLevelInfo: PhysicalDeviceVideoEncodeQualityLevelInfoKHR) throws(Result) -> VideoEncodeQualityLevelPropertiesKHR {
        try qualityLevelInfo.withCStruct { ptr_qualityLevelInfo throws(Result) in
            var out = VkVideoEncodeQualityLevelPropertiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(self.handle, ptr_qualityLevelInfo, &out)
            )
            return VideoEncodeQualityLevelPropertiesKHR(cStruct: out)
        }
    }

    public func acquireDrmDisplayEXT(drmFd: Int32, display: DisplayKHR) throws(Result) -> Void {
        try checkResult(
            self.instance.dispatchTable.vkAcquireDrmDisplayEXT(self.handle, drmFd, display.handle)
        )
    }

    public func getDrmDisplayEXT(drmFd: Int32, connectorId: UInt32) throws(Result) -> DisplayKHR {
        var out: VkDisplayKHR!
        try checkResult(
            self.instance.dispatchTable.vkGetDrmDisplayEXT(self.handle, drmFd, connectorId, &out)
        )
        return DisplayKHR(handle: out, physicalDevice: self)
    }

    public func getOpticalFlowImageFormatsNV(_ opticalFlowImageFormatInfo: (some Chainable<OpticalFlowImageFormatInfoNV>)) throws(Result) -> Array<OpticalFlowImageFormatPropertiesNV> {
        try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
            try enumerate { pImageFormatProperties, pFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceOpticalFlowImageFormatsNV(self.handle, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
            }.map { OpticalFlowImageFormatPropertiesNV(cStruct: $0) }
        }
    }

    public func getOpticalFlowImageFormatsNV(_ opticalFlowImageFormatInfo: OpticalFlowImageFormatInfoNV) throws(Result) -> Array<OpticalFlowImageFormatPropertiesNV> {
        try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
            try enumerate { pImageFormatProperties, pFormatCount in
                self.instance.dispatchTable.vkGetPhysicalDeviceOpticalFlowImageFormatsNV(self.handle, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
            }.map { OpticalFlowImageFormatPropertiesNV(cStruct: $0) }
        }
    }

    public func getCooperativeMatrixPropertiesKHR() throws(Result) -> Array<CooperativeMatrixPropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixPropertiesKHR(cStruct: $0) }
    }

    public func getCooperativeMatrixFlexibleDimensionsPropertiesNV() throws(Result) -> Array<CooperativeMatrixFlexibleDimensionsPropertiesNV> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixFlexibleDimensionsPropertiesNV(cStruct: $0) }
    }

    public func getCooperativeVectorPropertiesNV() throws(Result) -> Array<CooperativeVectorPropertiesNV> {
        try enumerate { pProperties, pPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceCooperativeVectorPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeVectorPropertiesNV(cStruct: $0) }
    }

    public func getShaderInstrumentationMetricsARM() throws(Result) -> Array<ShaderInstrumentationMetricDescriptionARM> {
        try enumerate { pDescriptions, pDescriptionCount in
            self.instance.dispatchTable.vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM(self.handle, pDescriptionCount, pDescriptions)
        }.map { ShaderInstrumentationMetricDescriptionARM(cStruct: $0) }
    }

    public func getExternalTensorPropertiesARM(_ externalTensorInfo: (some Chainable<PhysicalDeviceExternalTensorInfoARM>)) -> ExternalTensorPropertiesARM {
        externalTensorInfo.withCStruct { ptr_externalTensorInfo in
            var out = VkExternalTensorPropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalTensorPropertiesARM(self.handle, ptr_externalTensorInfo, &out)
            return ExternalTensorPropertiesARM(cStruct: out)
        }
    }

    public func getExternalTensorPropertiesARM(_ externalTensorInfo: PhysicalDeviceExternalTensorInfoARM) -> ExternalTensorPropertiesARM {
        externalTensorInfo.withCStruct { ptr_externalTensorInfo in
            var out = VkExternalTensorPropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM
            self.instance.dispatchTable.vkGetPhysicalDeviceExternalTensorPropertiesARM(self.handle, ptr_externalTensorInfo, &out)
            return ExternalTensorPropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyDataGraphPropertiesARM(queueFamilyIndex: UInt32) throws(Result) -> Array<QueueFamilyDataGraphPropertiesARM> {
        try enumerate { pQueueFamilyDataGraphProperties, pQueueFamilyDataGraphPropertyCount in
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM(self.handle, queueFamilyIndex, pQueueFamilyDataGraphPropertyCount, pQueueFamilyDataGraphProperties)
        }.map { QueueFamilyDataGraphPropertiesARM(cStruct: $0) }
    }

    public func getQueueFamilyDataGraphProcessingEnginePropertiesARM(_ queueFamilyDataGraphProcessingEngineInfo: (some Chainable<PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM>)) -> QueueFamilyDataGraphProcessingEnginePropertiesARM {
        queueFamilyDataGraphProcessingEngineInfo.withCStruct { ptr_queueFamilyDataGraphProcessingEngineInfo in
            var out = VkQueueFamilyDataGraphProcessingEnginePropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM(self.handle, ptr_queueFamilyDataGraphProcessingEngineInfo, &out)
            return QueueFamilyDataGraphProcessingEnginePropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyDataGraphProcessingEnginePropertiesARM(_ queueFamilyDataGraphProcessingEngineInfo: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM) -> QueueFamilyDataGraphProcessingEnginePropertiesARM {
        queueFamilyDataGraphProcessingEngineInfo.withCStruct { ptr_queueFamilyDataGraphProcessingEngineInfo in
            var out = VkQueueFamilyDataGraphProcessingEnginePropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM
            self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM(self.handle, ptr_queueFamilyDataGraphProcessingEngineInfo, &out)
            return QueueFamilyDataGraphProcessingEnginePropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyPerformanceCountersByRegionARM(queueFamilyIndex: UInt32, counterCount: UnsafeMutablePointer<UInt32>, counters: UnsafeMutablePointer<VkPerformanceCounterARM>? = nil, counterDescriptions: UnsafeMutablePointer<VkPerformanceCounterDescriptionARM>? = nil) throws(Result) -> Void {
        try checkResult(
            self.instance.dispatchTable.vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM(self.handle, queueFamilyIndex, counterCount, counters, counterDescriptions)
        )
    }

    public func getDescriptorSizeEXT(descriptorType: DescriptorType) -> VkDeviceSize {
        self.instance.dispatchTable.vkGetPhysicalDeviceDescriptorSizeEXT(self.handle, VkDescriptorType(rawValue: VkDescriptorType.RawValue(descriptorType.rawValue)))
    }

    public func getQueueFamilyDataGraphEngineOperationPropertiesARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: (some Chainable<QueueFamilyDataGraphPropertiesARM>)) throws(Result) -> VkBaseOutStructure {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, &out)
            )
            return out
        }
    }

    public func getQueueFamilyDataGraphEngineOperationPropertiesARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: QueueFamilyDataGraphPropertiesARM) throws(Result) -> VkBaseOutStructure {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, &out)
            )
            return out
        }
    }

    public func getQueueFamilyDataGraphOpticalFlowImageFormatsARM(_ opticalFlowImageFormatInfo: (some Chainable<DataGraphOpticalFlowImageFormatInfoARM>), queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: (some Chainable<QueueFamilyDataGraphPropertiesARM>)) throws(Result) -> Array<DataGraphOpticalFlowImageFormatPropertiesARM> {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
                try enumerate { pImageFormatProperties, pFormatCount in
                    self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
                }.map { DataGraphOpticalFlowImageFormatPropertiesARM(cStruct: $0) }
            }
        }
    }

    public func getQueueFamilyDataGraphOpticalFlowImageFormatsARM(_ opticalFlowImageFormatInfo: DataGraphOpticalFlowImageFormatInfoARM, queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: QueueFamilyDataGraphPropertiesARM) throws(Result) -> Array<DataGraphOpticalFlowImageFormatPropertiesARM> {
        try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
                try enumerate { pImageFormatProperties, pFormatCount in
                    self.instance.dispatchTable.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
                }.map { DataGraphOpticalFlowImageFormatPropertiesARM(cStruct: $0) }
            }
        }
    }
}

public final class Queue: _HandleContainer {
    public let handle: VkQueue?
    public let device: Device

    public init(handle: VkQueue!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func submit(submits: (AnyChainableArray<SubmitInfo>), fence: Fence? = nil) throws(Result) -> Void {
        try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueSubmit(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func submit(submits: Array<SubmitInfo> = [], fence: Fence? = nil) throws(Result) -> Void {
        try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueSubmit(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func waitIdle() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkQueueWaitIdle(self.handle)
        )
    }

    public func bindSparse(_ bindInfo: (AnyChainableArray<BindSparseInfo>), fence: Fence? = nil) throws(Result) -> Void {
        try bindInfo.withCStructBufferPointer { ptr_bindInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueBindSparse(self.handle, UInt32(ptr_bindInfo.count), ptr_bindInfo.baseAddress, fence?.handle)
            )
        }
    }

    public func bindSparse(_ bindInfo: Array<BindSparseInfo> = [], fence: Fence? = nil) throws(Result) -> Void {
        try bindInfo.withCStructBufferPointer { ptr_bindInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueBindSparse(self.handle, UInt32(ptr_bindInfo.count), ptr_bindInfo.baseAddress, fence?.handle)
            )
        }
    }

    public func presentKHR(_ presentInfo: (some Chainable<PresentInfoKHR>)) throws(Result) -> Void {
        try presentInfo.withCStruct { ptr_presentInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueuePresentKHR(self.handle, ptr_presentInfo)
            )
        }
    }

    public func presentKHR(_ presentInfo: PresentInfoKHR) throws(Result) -> Void {
        try presentInfo.withCStruct { ptr_presentInfo throws(Result) in
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

    public func setPerformanceConfigurationINTEL(configuration: PerformanceConfigurationINTEL) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkQueueSetPerformanceConfigurationINTEL(self.handle, configuration.handle)
        )
    }

    public func submit2(submits: (AnyChainableArray<SubmitInfo2>), fence: Fence? = nil) throws(Result) -> Void {
        try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueSubmit2(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func submit2(submits: Array<SubmitInfo2> = [], fence: Fence? = nil) throws(Result) -> Void {
        try submits.withCStructBufferPointer { ptr_submits throws(Result) in
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

    public func setPerfHintQCOM(_ perfHintInfo: (some Chainable<PerfHintInfoQCOM>)) throws(Result) -> Void {
        try perfHintInfo.withCStruct { ptr_perfHintInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueSetPerfHintQCOM(self.handle, ptr_perfHintInfo)
            )
        }
    }

    public func setPerfHintQCOM(_ perfHintInfo: PerfHintInfoQCOM) throws(Result) -> Void {
        try perfHintInfo.withCStruct { ptr_perfHintInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkQueueSetPerfHintQCOM(self.handle, ptr_perfHintInfo)
            )
        }
    }
}

public final class CommandPool: _HandleContainer {
    public let handle: VkCommandPool?
    public let device: Device

    public init(handle: VkCommandPool!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyCommandPool(self.device.handle, self.handle, nil)
    }

    public func reset(flags: CommandPoolResetFlags = []) throws(Result) -> Void {
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

public final class DeviceMemory: _HandleContainer {
    public let handle: VkDeviceMemory?
    public let device: Device

    public init(handle: VkDeviceMemory!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func freeMemory() -> Void {
        self.device.dispatchTable.vkFreeMemory(self.device.handle, self.handle, nil)
    }

    public func mapMemory(offset: VkDeviceSize, size: VkDeviceSize, flags: MemoryMapFlags = []) throws(Result) -> UnsafeMutableRawPointer {
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
    public func getMemoryWin32HandleNV(handleType: ExternalMemoryHandleTypeFlagsNV) throws(Result) -> HANDLE {
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

public final class Buffer: _HandleContainer {
    public let handle: VkBuffer?
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

    public func bindMemory(memory: DeviceMemory, memoryOffset: VkDeviceSize) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkBindBufferMemory(self.device.handle, self.handle, memory.handle, memoryOffset)
        )
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyBuffer(self.device.handle, self.handle, nil)
    }
}

public final class BufferView: _HandleContainer {
    public let handle: VkBufferView?
    public let device: Device

    public init(handle: VkBufferView!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyBufferView(self.device.handle, self.handle, nil)
    }
}

public final class Image: _HandleContainer {
    public let handle: VkImage?
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

    public func bindMemory(memory: DeviceMemory, memoryOffset: VkDeviceSize) throws(Result) -> Void {
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

    public func getDrmFormatModifierPropertiesEXT() throws(Result) -> ImageDrmFormatModifierPropertiesEXT {
        var out = VkImageDrmFormatModifierPropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT
        try checkResult(
            self.device.dispatchTable.vkGetImageDrmFormatModifierPropertiesEXT(self.device.handle, self.handle, &out)
        )
        return ImageDrmFormatModifierPropertiesEXT(cStruct: out)
    }

    public func getSubresourceLayout2(subresource: (some Chainable<ImageSubresource2>)) -> SubresourceLayout2 {
        subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            self.device.dispatchTable.vkGetImageSubresourceLayout2(self.device.handle, self.handle, ptr_subresource, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getSubresourceLayout2(subresource: ImageSubresource2) -> SubresourceLayout2 {
        subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            self.device.dispatchTable.vkGetImageSubresourceLayout2(self.device.handle, self.handle, ptr_subresource, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }
}

public final class ImageView: _HandleContainer {
    public let handle: VkImageView?
    public let device: Device

    public init(handle: VkImageView!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyImageView(self.device.handle, self.handle, nil)
    }

    public func getAddressNVX() throws(Result) -> ImageViewAddressPropertiesNVX {
        var out = VkImageViewAddressPropertiesNVX()
        out.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX
        try checkResult(
            self.device.dispatchTable.vkGetImageViewAddressNVX(self.device.handle, self.handle, &out)
        )
        return ImageViewAddressPropertiesNVX(cStruct: out)
    }
}

public final class ShaderModule: _HandleContainer {
    public let handle: VkShaderModule?
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
        out.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT
        self.device.dispatchTable.vkGetShaderModuleIdentifierEXT(self.device.handle, self.handle, &out)
        return ShaderModuleIdentifierEXT(cStruct: out)
    }
}

public final class Pipeline: _HandleContainer {
    public let handle: VkPipeline?
    public let device: Device

    public init(handle: VkPipeline!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPipeline(self.device.handle, self.handle, nil)
    }

    public func getShaderInfoAMD(infoType: ShaderInfoTypeAMD, shaderStage: ShaderStageFlags) throws(Result) -> Array<UInt8> {
        try enumerateBytes { pInfo, pInfoSize in
            self.device.dispatchTable.vkGetShaderInfoAMD(self.device.handle, self.handle, VkShaderStageFlagBits(rawValue: VkShaderStageFlagBits.RawValue(shaderStage.rawValue)), VkShaderInfoTypeAMD(rawValue: VkShaderInfoTypeAMD.RawValue(infoType.rawValue)), pInfoSize, pInfo)
        }
    }

    public func compileDeferredNV(shader: UInt32) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkCompileDeferredNV(self.device.handle, self.handle, shader)
        )
    }

    public func getRayTracingShaderGroupHandlesKHR(firstGroup: UInt32, groupCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetRayTracingShaderGroupHandlesKHR(self.device.handle, self.handle, firstGroup, groupCount, dataSize, data)
        )
    }

    public func getRayTracingCaptureReplayShaderGroupHandlesKHR(firstGroup: UInt32, groupCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(self.device.handle, self.handle, firstGroup, groupCount, dataSize, data)
        )
    }

    public func getRayTracingShaderGroupStackSizeKHR(group: UInt32, groupShader: ShaderGroupShaderKHR) -> VkDeviceSize {
        self.device.dispatchTable.vkGetRayTracingShaderGroupStackSizeKHR(self.device.handle, self.handle, group, VkShaderGroupShaderKHR(rawValue: VkShaderGroupShaderKHR.RawValue(groupShader.rawValue)))
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphScratchSizeAMDX() throws(Result) -> ExecutionGraphPipelineScratchSizeAMDX {
        var out = VkExecutionGraphPipelineScratchSizeAMDX()
        out.sType = VK_STRUCTURE_TYPE_EXECUTION_GRAPH_PIPELINE_SCRATCH_SIZE_AMDX
        try checkResult(
            self.device.dispatchTable.vkGetExecutionGraphPipelineScratchSizeAMDX(self.device.handle, self.handle, &out)
        )
        return ExecutionGraphPipelineScratchSizeAMDX(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphNodeIndexAMDX(_ nodeInfo: (some Chainable<PipelineShaderStageNodeCreateInfoAMDX>)) throws(Result) -> UInt32 {
        try nodeInfo.withCStruct { ptr_nodeInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                self.device.dispatchTable.vkGetExecutionGraphPipelineNodeIndexAMDX(self.device.handle, self.handle, ptr_nodeInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphNodeIndexAMDX(_ nodeInfo: PipelineShaderStageNodeCreateInfoAMDX) throws(Result) -> UInt32 {
        try nodeInfo.withCStruct { ptr_nodeInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                self.device.dispatchTable.vkGetExecutionGraphPipelineNodeIndexAMDX(self.device.handle, self.handle, ptr_nodeInfo, &out)
            )
            return out
        }
    }
    #endif
}

public final class PipelineLayout: _HandleContainer {
    public let handle: VkPipelineLayout?
    public let device: Device

    public init(handle: VkPipelineLayout!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPipelineLayout(self.device.handle, self.handle, nil)
    }
}

public final class Sampler: _HandleContainer {
    public let handle: VkSampler?
    public let device: Device

    public init(handle: VkSampler!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroySampler(self.device.handle, self.handle, nil)
    }
}

public final class DescriptorPool: _HandleContainer {
    public let handle: VkDescriptorPool?
    public let device: Device

    public init(handle: VkDescriptorPool!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyDescriptorPool(self.device.handle, self.handle, nil)
    }

    public func reset(flags: DescriptorPoolResetFlags = []) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkResetDescriptorPool(self.device.handle, self.handle, flags.rawValue)
        )
    }

    public func freeDescriptorSets(descriptorSets: Array<DescriptorSet>) throws(Result) -> Void {
        try descriptorSets.map{ $0.handle }.withUnsafeBufferPointer { ptr_descriptorSets throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkFreeDescriptorSets(self.device.handle, self.handle, UInt32(ptr_descriptorSets.count), ptr_descriptorSets.baseAddress)
            )
        }
    }
}

public final class DescriptorSet: _HandleContainer {
    public let handle: VkDescriptorSet?
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

public final class DescriptorSetLayout: _HandleContainer {
    public let handle: VkDescriptorSetLayout?
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

public final class Fence: _HandleContainer {
    public let handle: VkFence?
    public let device: Device

    public init(handle: VkFence!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyFence(self.device.handle, self.handle, nil)
    }

    public func getStatus() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetFenceStatus(self.device.handle, self.handle)
        )
    }
}

public final class Semaphore: _HandleContainer {
    public let handle: VkSemaphore?
    public let device: Device

    public init(handle: VkSemaphore!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroySemaphore(self.device.handle, self.handle, nil)
    }

    public func getCounterValue() throws(Result) -> UInt64 {
        var out = UInt64()
        try checkResult(
            self.device.dispatchTable.vkGetSemaphoreCounterValue(self.device.handle, self.handle, &out)
        )
        return out
    }
}

public final class Event: _HandleContainer {
    public let handle: VkEvent?
    public let device: Device

    public init(handle: VkEvent!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyEvent(self.device.handle, self.handle, nil)
    }

    public func getStatus() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetEventStatus(self.device.handle, self.handle)
        )
    }

    public func set() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkSetEvent(self.device.handle, self.handle)
        )
    }

    public func reset() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkResetEvent(self.device.handle, self.handle)
        )
    }
}

public final class QueryPool: _HandleContainer {
    public let handle: VkQueryPool?
    public let device: Device

    public init(handle: VkQueryPool!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyQueryPool(self.device.handle, self.handle, nil)
    }

    public func getResults(firstQuery: UInt32, queryCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer, stride: VkDeviceSize, flags: QueryResultFlags = []) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetQueryPoolResults(self.device.handle, self.handle, firstQuery, queryCount, dataSize, data, stride, flags.rawValue)
        )
    }

    public func reset(firstQuery: UInt32, queryCount: UInt32) -> Void {
        self.device.dispatchTable.vkResetQueryPool(self.device.handle, self.handle, firstQuery, queryCount)
    }
}

public final class Framebuffer: _HandleContainer {
    public let handle: VkFramebuffer?
    public let device: Device

    public init(handle: VkFramebuffer!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyFramebuffer(self.device.handle, self.handle, nil)
    }

    public func getTilePropertiesQCOM() throws(Result) -> Array<TilePropertiesQCOM> {
        try enumerate { pProperties, pPropertiesCount in
            self.device.dispatchTable.vkGetFramebufferTilePropertiesQCOM(self.device.handle, self.handle, pPropertiesCount, pProperties)
        }.map { TilePropertiesQCOM(cStruct: $0) }
    }
}

public final class RenderPass: _HandleContainer {
    public let handle: VkRenderPass?
    public let device: Device

    public init(handle: VkRenderPass!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI() throws(Result) -> Extent2D {
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

public final class PipelineCache: _HandleContainer {
    public let handle: VkPipelineCache?
    public let device: Device

    public init(handle: VkPipelineCache!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPipelineCache(self.device.handle, self.handle, nil)
    }

    public func getData() throws(Result) -> Array<UInt8> {
        try enumerateBytes { pData, pDataSize in
            self.device.dispatchTable.vkGetPipelineCacheData(self.device.handle, self.handle, pDataSize, pData)
        }
    }

    public func mergePipelineCaches(srcCaches: Array<PipelineCache>) throws(Result) -> Void {
        try srcCaches.map{ $0.handle }.withUnsafeBufferPointer { ptr_srcCaches throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkMergePipelineCaches(self.device.handle, self.handle, UInt32(ptr_srcCaches.count), ptr_srcCaches.baseAddress)
            )
        }
    }
}

public final class PipelineBinaryKHR: _HandleContainer {
    public let handle: VkPipelineBinaryKHR?
    public let device: Device

    public init(handle: VkPipelineBinaryKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyPipelineBinaryKHR(self.device.handle, self.handle, nil)
    }
}

public final class IndirectCommandsLayoutNV: _HandleContainer {
    public let handle: VkIndirectCommandsLayoutNV?
    public let device: Device

    public init(handle: VkIndirectCommandsLayoutNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyIndirectCommandsLayoutNV(self.device.handle, self.handle, nil)
    }
}

public final class IndirectCommandsLayoutEXT: _HandleContainer {
    public let handle: VkIndirectCommandsLayoutEXT?
    public let device: Device

    public init(handle: VkIndirectCommandsLayoutEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyIndirectCommandsLayoutEXT(self.device.handle, self.handle, nil)
    }
}

public final class IndirectExecutionSetEXT: _HandleContainer {
    public let handle: VkIndirectExecutionSetEXT?
    public let device: Device

    public init(handle: VkIndirectExecutionSetEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyIndirectExecutionSetEXT(self.device.handle, self.handle, nil)
    }

    public func updatePipelineEXT(executionSetWrites: (AnyChainableArray<WriteIndirectExecutionSetPipelineEXT>)) -> Void {
        executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            self.device.dispatchTable.vkUpdateIndirectExecutionSetPipelineEXT(self.device.handle, self.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updatePipelineEXT(executionSetWrites: Array<WriteIndirectExecutionSetPipelineEXT>) -> Void {
        executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            self.device.dispatchTable.vkUpdateIndirectExecutionSetPipelineEXT(self.device.handle, self.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updateShaderEXT(executionSetWrites: (AnyChainableArray<WriteIndirectExecutionSetShaderEXT>)) -> Void {
        executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            self.device.dispatchTable.vkUpdateIndirectExecutionSetShaderEXT(self.device.handle, self.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updateShaderEXT(executionSetWrites: Array<WriteIndirectExecutionSetShaderEXT>) -> Void {
        executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            self.device.dispatchTable.vkUpdateIndirectExecutionSetShaderEXT(self.device.handle, self.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }
}

public final class DescriptorUpdateTemplate: _HandleContainer {
    public let handle: VkDescriptorUpdateTemplate?
    public let device: Device

    public init(handle: VkDescriptorUpdateTemplate!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyDescriptorUpdateTemplate(self.device.handle, self.handle, nil)
    }
}

public final class SamplerYcbcrConversion: _HandleContainer {
    public let handle: VkSamplerYcbcrConversion?
    public let device: Device

    public init(handle: VkSamplerYcbcrConversion!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroySamplerYcbcrConversion(self.device.handle, self.handle, nil)
    }
}

public final class ValidationCacheEXT: _HandleContainer {
    public let handle: VkValidationCacheEXT?
    public let device: Device

    public init(handle: VkValidationCacheEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyValidationCacheEXT(self.device.handle, self.handle, nil)
    }

    public func getDataEXT() throws(Result) -> Array<UInt8> {
        try enumerateBytes { pData, pDataSize in
            self.device.dispatchTable.vkGetValidationCacheDataEXT(self.device.handle, self.handle, pDataSize, pData)
        }
    }

    public func mergeValidationCachesEXT(srcCaches: Array<ValidationCacheEXT>) throws(Result) -> Void {
        try srcCaches.map{ $0.handle }.withUnsafeBufferPointer { ptr_srcCaches throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkMergeValidationCachesEXT(self.device.handle, self.handle, UInt32(ptr_srcCaches.count), ptr_srcCaches.baseAddress)
            )
        }
    }
}

public final class AccelerationStructureKHR: _HandleContainer {
    public let handle: VkAccelerationStructureKHR?
    public let device: Device

    public init(handle: VkAccelerationStructureKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyAccelerationStructureKHR(self.device.handle, self.handle, nil)
    }
}

public final class AccelerationStructureNV: _HandleContainer {
    public let handle: VkAccelerationStructureNV?
    public let device: Device

    public init(handle: VkAccelerationStructureNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyAccelerationStructureNV(self.device.handle, self.handle, nil)
    }

    public func getHandleNV(dataSize: Int, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetAccelerationStructureHandleNV(self.device.handle, self.handle, dataSize, data)
        )
    }
}

public final class PerformanceConfigurationINTEL: _HandleContainer {
    public let handle: VkPerformanceConfigurationINTEL?
    public let device: Device

    public init(handle: VkPerformanceConfigurationINTEL!, device: Device) {
        self.handle = handle
        self.device = device
    }
}

#if VK_USE_PLATFORM_FUCHSIA
public final class BufferCollectionFUCHSIA: _HandleContainer {
    public let handle: VkBufferCollectionFUCHSIA?
    public let device: Device

    public init(handle: VkBufferCollectionFUCHSIA!, device: Device) {
        self.handle = handle
        self.device = device
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferConstraintsFUCHSIA(_ bufferConstraintsInfo: (some Chainable<BufferConstraintsInfoFUCHSIA>)) throws(Result) -> Void {
        try bufferConstraintsInfo.withCStruct { ptr_bufferConstraintsInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionBufferConstraintsFUCHSIA(self.device.handle, self.handle, ptr_bufferConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferConstraintsFUCHSIA(_ bufferConstraintsInfo: BufferConstraintsInfoFUCHSIA) throws(Result) -> Void {
        try bufferConstraintsInfo.withCStruct { ptr_bufferConstraintsInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionBufferConstraintsFUCHSIA(self.device.handle, self.handle, ptr_bufferConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setImageConstraintsFUCHSIA(_ imageConstraintsInfo: (some Chainable<ImageConstraintsInfoFUCHSIA>)) throws(Result) -> Void {
        try imageConstraintsInfo.withCStruct { ptr_imageConstraintsInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkSetBufferCollectionImageConstraintsFUCHSIA(self.device.handle, self.handle, ptr_imageConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setImageConstraintsFUCHSIA(_ imageConstraintsInfo: ImageConstraintsInfoFUCHSIA) throws(Result) -> Void {
        try imageConstraintsInfo.withCStruct { ptr_imageConstraintsInfo throws(Result) in
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
    public func getPropertiesFUCHSIA() throws(Result) -> BufferCollectionPropertiesFUCHSIA {
        var out = VkBufferCollectionPropertiesFUCHSIA()
        out.sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA
        try checkResult(
            self.device.dispatchTable.vkGetBufferCollectionPropertiesFUCHSIA(self.device.handle, self.handle, &out)
        )
        return BufferCollectionPropertiesFUCHSIA(cStruct: out)
    }
    #endif
}
#endif

public final class DeferredOperationKHR: _HandleContainer {
    public let handle: VkDeferredOperationKHR?
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

    public func getResultKHR() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetDeferredOperationResultKHR(self.device.handle, self.handle)
        )
    }

    public func joinKHR() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkDeferredOperationJoinKHR(self.device.handle, self.handle)
        )
    }
}

public final class PrivateDataSlot: _HandleContainer {
    public let handle: VkPrivateDataSlot?
    public let device: Device

    public init(handle: VkPrivateDataSlot!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroy() -> Void {
        self.device.dispatchTable.vkDestroyPrivateDataSlot(self.device.handle, self.handle, nil)
    }
}

public final class CuModuleNVX: _HandleContainer {
    public let handle: VkCuModuleNVX?
    public let device: Device

    public init(handle: VkCuModuleNVX!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNVX() -> Void {
        self.device.dispatchTable.vkDestroyCuModuleNVX(self.device.handle, self.handle, nil)
    }
}

public final class CuFunctionNVX: _HandleContainer {
    public let handle: VkCuFunctionNVX?
    public let device: Device

    public init(handle: VkCuFunctionNVX!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNVX() -> Void {
        self.device.dispatchTable.vkDestroyCuFunctionNVX(self.device.handle, self.handle, nil)
    }
}

public final class OpticalFlowSessionNV: _HandleContainer {
    public let handle: VkOpticalFlowSessionNV?
    public let device: Device

    public init(handle: VkOpticalFlowSessionNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyNV() -> Void {
        self.device.dispatchTable.vkDestroyOpticalFlowSessionNV(self.device.handle, self.handle, nil)
    }

    public func bindImageNV(bindingPoint: OpticalFlowSessionBindingPointNV, view: ImageView? = nil, layout: ImageLayout) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkBindOpticalFlowSessionImageNV(self.device.handle, self.handle, VkOpticalFlowSessionBindingPointNV(rawValue: VkOpticalFlowSessionBindingPointNV.RawValue(bindingPoint.rawValue)), view?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(layout.rawValue)))
        )
    }
}

public final class MicromapEXT: _HandleContainer {
    public let handle: VkMicromapEXT?
    public let device: Device

    public init(handle: VkMicromapEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyMicromapEXT(self.device.handle, self.handle, nil)
    }
}

public final class ShaderEXT: _HandleContainer {
    public let handle: VkShaderEXT?
    public let device: Device

    public init(handle: VkShaderEXT!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyEXT() -> Void {
        self.device.dispatchTable.vkDestroyShaderEXT(self.device.handle, self.handle, nil)
    }

    public func getBinaryDataEXT() throws(Result) -> Array<UInt8> {
        try enumerateBytes { pData, pDataSize in
            self.device.dispatchTable.vkGetShaderBinaryDataEXT(self.device.handle, self.handle, pDataSize, pData)
        }
    }
}

public final class TensorARM: _HandleContainer {
    public let handle: VkTensorARM?
    public let device: Device

    public init(handle: VkTensorARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyTensorARM(self.device.handle, self.handle, nil)
    }
}

public final class TensorViewARM: _HandleContainer {
    public let handle: VkTensorViewARM?
    public let device: Device

    public init(handle: VkTensorViewARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyTensorViewARM(self.device.handle, self.handle, nil)
    }
}

public final class DataGraphPipelineSessionARM: _HandleContainer {
    public let handle: VkDataGraphPipelineSessionARM?
    public let device: Device

    public init(handle: VkDataGraphPipelineSessionARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyDataGraphPipelineSessionARM(self.device.handle, self.handle, nil)
    }
}

public final class ShaderInstrumentationARM: _HandleContainer {
    public let handle: VkShaderInstrumentationARM?
    public let device: Device

    public init(handle: VkShaderInstrumentationARM!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyARM() -> Void {
        self.device.dispatchTable.vkDestroyShaderInstrumentationARM(self.device.handle, self.handle, nil)
    }

    public func getValuesARM(metricValues: UnsafeMutableRawPointer, flags: ShaderInstrumentationValuesFlagsARM = []) throws(Result) -> UInt32 {
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

public final class GpaSessionAMD: _HandleContainer {
    public let handle: VkGpaSessionAMD?
    public let device: Device

    public init(handle: VkGpaSessionAMD!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyAMD() -> Void {
        self.device.dispatchTable.vkDestroyGpaSessionAMD(self.device.handle, self.handle, nil)
    }

    public func getStatusAMD() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetGpaSessionStatusAMD(self.device.handle, self.handle)
        )
    }

    public func getResultsAMD(sampleID: UInt32) throws(Result) -> Array<UInt8> {
        try enumerateBytes { pData, pSizeInBytes in
            self.device.dispatchTable.vkGetGpaSessionResultsAMD(self.device.handle, self.handle, sampleID, pSizeInBytes, pData)
        }
    }

    public func resetAMD() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkResetGpaSessionAMD(self.device.handle, self.handle)
        )
    }
}

public final class DisplayKHR: _HandleContainer {
    public let handle: VkDisplayKHR?
    public let physicalDevice: PhysicalDevice

    public init(handle: VkDisplayKHR!, physicalDevice: PhysicalDevice) {
        self.handle = handle
        self.physicalDevice = physicalDevice
    }

    public func getModePropertiesKHR() throws(Result) -> Array<DisplayModePropertiesKHR> {
        try enumerate { pProperties, pPropertyCount in
            self.physicalDevice.instance.dispatchTable.vkGetDisplayModePropertiesKHR(self.physicalDevice.handle, self.handle, pPropertyCount, pProperties)
        }.map { DisplayModePropertiesKHR(cStruct: $0, display: self) }
    }

    public func createModeKHR(_ createInfo: (some Chainable<DisplayModeCreateInfoKHR>)) throws(Result) -> DisplayModeKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDisplayModeKHR!
            try checkResult(
                self.physicalDevice.instance.dispatchTable.vkCreateDisplayModeKHR(self.physicalDevice.handle, self.handle, ptr_createInfo, nil, &out)
            )
            return DisplayModeKHR(handle: out, display: self)
        }
    }

    public func createModeKHR(_ createInfo: DisplayModeCreateInfoKHR) throws(Result) -> DisplayModeKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDisplayModeKHR!
            try checkResult(
                self.physicalDevice.instance.dispatchTable.vkCreateDisplayModeKHR(self.physicalDevice.handle, self.handle, ptr_createInfo, nil, &out)
            )
            return DisplayModeKHR(handle: out, display: self)
        }
    }

    public func releaseEXT() throws(Result) -> Void {
        try checkResult(
            self.physicalDevice.instance.dispatchTable.vkReleaseDisplayEXT(self.physicalDevice.handle, self.handle)
        )
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func acquireWinrtNV() throws(Result) -> Void {
        try checkResult(
            self.physicalDevice.instance.dispatchTable.vkAcquireWinrtDisplayNV(self.physicalDevice.handle, self.handle)
        )
    }
    #endif

    public func getModeProperties2KHR() throws(Result) -> Array<DisplayModeProperties2KHR> {
        try enumerate { pProperties, pPropertyCount in
            self.physicalDevice.instance.dispatchTable.vkGetDisplayModeProperties2KHR(self.physicalDevice.handle, self.handle, pPropertyCount, pProperties)
        }.map { DisplayModeProperties2KHR(cStruct: $0, display: self) }
    }
}

public final class DisplayModeKHR: _HandleContainer {
    public let handle: VkDisplayModeKHR?
    public let display: DisplayKHR

    public init(handle: VkDisplayModeKHR!, display: DisplayKHR) {
        self.handle = handle
        self.display = display
    }

    public func getDisplayPlaneCapabilitiesKHR(planeIndex: UInt32) throws(Result) -> DisplayPlaneCapabilitiesKHR {
        var out = VkDisplayPlaneCapabilitiesKHR()
        try checkResult(
            self.display.physicalDevice.instance.dispatchTable.vkGetDisplayPlaneCapabilitiesKHR(self.display.physicalDevice.handle, self.handle, planeIndex, &out)
        )
        return DisplayPlaneCapabilitiesKHR(cStruct: out)
    }
}

public final class SurfaceKHR: _HandleContainer {
    public let handle: VkSurfaceKHR?
    public let instance: Instance

    public init(handle: VkSurfaceKHR!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func destroyKHR() -> Void {
        self.instance.dispatchTable.vkDestroySurfaceKHR(self.instance.handle, self.handle, nil)
    }
}

public final class SwapchainKHR: _HandleContainer {
    public let handle: VkSwapchainKHR?
    public let device: Device

    public init(handle: VkSwapchainKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroySwapchainKHR(self.device.handle, self.handle, nil)
    }

    public func getImagesKHR() throws(Result) -> Array<Image> {
        try enumerate { pSwapchainImages, pSwapchainImageCount in
            self.device.dispatchTable.vkGetSwapchainImagesKHR(self.device.handle, self.handle, pSwapchainImageCount, pSwapchainImages)
        }.map { Image(handle: $0, device: self.device) }
    }

    public func acquireNextImageKHR(timeout: UInt64, semaphore: Semaphore? = nil, fence: Fence? = nil) throws(Result) -> UInt32 {
        var out = UInt32()
        try checkResult(
            self.device.dispatchTable.vkAcquireNextImageKHR(self.device.handle, self.handle, timeout, semaphore?.handle, fence?.handle, &out)
        )
        return out
    }

    public func getCounterEXT(counter: SurfaceCounterFlagsEXT) throws(Result) -> UInt64 {
        var out = UInt64()
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainCounterEXT(self.device.handle, self.handle, VkSurfaceCounterFlagBitsEXT(rawValue: VkSurfaceCounterFlagBitsEXT.RawValue(counter.rawValue)), &out)
        )
        return out
    }

    public func getStatusKHR() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainStatusKHR(self.device.handle, self.handle)
        )
    }

    public func getRefreshCycleDurationGOOGLE() throws(Result) -> RefreshCycleDurationGOOGLE {
        var out = VkRefreshCycleDurationGOOGLE()
        try checkResult(
            self.device.dispatchTable.vkGetRefreshCycleDurationGOOGLE(self.device.handle, self.handle, &out)
        )
        return RefreshCycleDurationGOOGLE(cStruct: out)
    }

    public func getPastPresentationTimingGOOGLE() throws(Result) -> Array<PastPresentationTimingGOOGLE> {
        try enumerate { pPresentationTimings, pPresentationTimingCount in
            self.device.dispatchTable.vkGetPastPresentationTimingGOOGLE(self.device.handle, self.handle, pPresentationTimingCount, pPresentationTimings)
        }.map { PastPresentationTimingGOOGLE(cStruct: $0) }
    }

    public func setLocalDimmingAMD(localDimmingEnable: Bool) -> Void {
        self.device.dispatchTable.vkSetLocalDimmingAMD(self.device.handle, self.handle, VkBool32(localDimmingEnable ? VK_TRUE : VK_FALSE))
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func acquireFullScreenExclusiveModeEXT() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkAcquireFullScreenExclusiveModeEXT(self.device.handle, self.handle)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func releaseFullScreenExclusiveModeEXT() throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkReleaseFullScreenExclusiveModeEXT(self.device.handle, self.handle)
        )
    }
    #endif

    public func waitForPresent2KHR(_ presentWait2Info: (some Chainable<PresentWait2InfoKHR>)) throws(Result) -> Void {
        try presentWait2Info.withCStruct { ptr_presentWait2Info throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkWaitForPresent2KHR(self.device.handle, self.handle, ptr_presentWait2Info)
            )
        }
    }

    public func waitForPresent2KHR(_ presentWait2Info: PresentWait2InfoKHR) throws(Result) -> Void {
        try presentWait2Info.withCStruct { ptr_presentWait2Info throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkWaitForPresent2KHR(self.device.handle, self.handle, ptr_presentWait2Info)
            )
        }
    }

    public func waitForPresentKHR(presentId: UInt64, timeout: UInt64) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkWaitForPresentKHR(self.device.handle, self.handle, presentId, timeout)
        )
    }

    public func setPresentTimingQueueSizeEXT(size: UInt32) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkSetSwapchainPresentTimingQueueSizeEXT(self.device.handle, self.handle, size)
        )
    }

    public func getTimingPropertiesEXT(swapchainTimingProperties: UnsafeMutablePointer<VkSwapchainTimingPropertiesEXT>, swapchainTimingPropertiesCounter: UnsafeMutablePointer<UInt64>? = nil) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainTimingPropertiesEXT(self.device.handle, self.handle, swapchainTimingProperties, swapchainTimingPropertiesCounter)
        )
    }

    public func getTimeDomainPropertiesEXT(swapchainTimeDomainProperties: UnsafeMutablePointer<VkSwapchainTimeDomainPropertiesEXT>, timeDomainsCounter: UnsafeMutablePointer<UInt64>? = nil) throws(Result) -> Void {
        try checkResult(
            self.device.dispatchTable.vkGetSwapchainTimeDomainPropertiesEXT(self.device.handle, self.handle, swapchainTimeDomainProperties, timeDomainsCounter)
        )
    }

    public func setLatencySleepModeNV(_ sleepModeInfo: (some Chainable<LatencySleepModeInfoNV>)) throws(Result) -> Void {
        try sleepModeInfo.withCStruct { ptr_sleepModeInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkSetLatencySleepModeNV(self.device.handle, self.handle, ptr_sleepModeInfo)
            )
        }
    }

    public func setLatencySleepModeNV(_ sleepModeInfo: LatencySleepModeInfoNV) throws(Result) -> Void {
        try sleepModeInfo.withCStruct { ptr_sleepModeInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkSetLatencySleepModeNV(self.device.handle, self.handle, ptr_sleepModeInfo)
            )
        }
    }

    public func latencySleepNV(_ sleepInfo: (some Chainable<LatencySleepInfoNV>)) throws(Result) -> Void {
        try sleepInfo.withCStruct { ptr_sleepInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkLatencySleepNV(self.device.handle, self.handle, ptr_sleepInfo)
            )
        }
    }

    public func latencySleepNV(_ sleepInfo: LatencySleepInfoNV) throws(Result) -> Void {
        try sleepInfo.withCStruct { ptr_sleepInfo throws(Result) in
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
        out.sType = VK_STRUCTURE_TYPE_GET_LATENCY_MARKER_INFO_NV
        self.device.dispatchTable.vkGetLatencyTimingsNV(self.device.handle, self.handle, &out)
        return GetLatencyMarkerInfoNV(cStruct: out)
    }
}

public final class DebugReportCallbackEXT: _HandleContainer {
    public let handle: VkDebugReportCallbackEXT?
    public let instance: Instance

    public init(handle: VkDebugReportCallbackEXT!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func destroyEXT() -> Void {
        self.instance.dispatchTable.vkDestroyDebugReportCallbackEXT(self.instance.handle, self.handle, nil)
    }
}

public final class DebugUtilsMessengerEXT: _HandleContainer {
    public let handle: VkDebugUtilsMessengerEXT?
    public let instance: Instance

    public init(handle: VkDebugUtilsMessengerEXT!, instance: Instance) {
        self.handle = handle
        self.instance = instance
    }

    public func destroyEXT() -> Void {
        self.instance.dispatchTable.vkDestroyDebugUtilsMessengerEXT(self.instance.handle, self.handle, nil)
    }
}

public final class VideoSessionKHR: _HandleContainer {
    public let handle: VkVideoSessionKHR?
    public let device: Device

    public init(handle: VkVideoSessionKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func destroyKHR() -> Void {
        self.device.dispatchTable.vkDestroyVideoSessionKHR(self.device.handle, self.handle, nil)
    }

    public func getMemoryRequirementsKHR() throws(Result) -> Array<VideoSessionMemoryRequirementsKHR> {
        try enumerate { pMemoryRequirements, pMemoryRequirementsCount in
            self.device.dispatchTable.vkGetVideoSessionMemoryRequirementsKHR(self.device.handle, self.handle, pMemoryRequirementsCount, pMemoryRequirements)
        }.map { VideoSessionMemoryRequirementsKHR(cStruct: $0) }
    }

    public func bindMemoryKHR(_ bindSessionMemoryInfos: (AnyChainableArray<BindVideoSessionMemoryInfoKHR>)) throws(Result) -> Void {
        try bindSessionMemoryInfos.withCStructBufferPointer { ptr_bindSessionMemoryInfos throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkBindVideoSessionMemoryKHR(self.device.handle, self.handle, UInt32(ptr_bindSessionMemoryInfos.count), ptr_bindSessionMemoryInfos.baseAddress)
            )
        }
    }

    public func bindMemoryKHR(_ bindSessionMemoryInfos: Array<BindVideoSessionMemoryInfoKHR>) throws(Result) -> Void {
        try bindSessionMemoryInfos.withCStructBufferPointer { ptr_bindSessionMemoryInfos throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkBindVideoSessionMemoryKHR(self.device.handle, self.handle, UInt32(ptr_bindSessionMemoryInfos.count), ptr_bindSessionMemoryInfos.baseAddress)
            )
        }
    }
}

public final class VideoSessionParametersKHR: _HandleContainer {
    public let handle: VkVideoSessionParametersKHR?
    public let device: Device

    public init(handle: VkVideoSessionParametersKHR!, device: Device) {
        self.handle = handle
        self.device = device
    }

    public func updateKHR(_ updateInfo: (some Chainable<VideoSessionParametersUpdateInfoKHR>)) throws(Result) -> Void {
        try updateInfo.withCStruct { ptr_updateInfo throws(Result) in
            try checkResult(
                self.device.dispatchTable.vkUpdateVideoSessionParametersKHR(self.device.handle, self.handle, ptr_updateInfo)
            )
        }
    }

    public func updateKHR(_ updateInfo: VideoSessionParametersUpdateInfoKHR) throws(Result) -> Void {
        try updateInfo.withCStruct { ptr_updateInfo throws(Result) in
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
public final class CudaModuleNV: _HandleContainer {
    public let handle: VkCudaModuleNV?
    public let device: Device

    public init(handle: VkCudaModuleNV!, device: Device) {
        self.handle = handle
        self.device = device
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getCacheNV() throws(Result) -> Array<UInt8> {
        try enumerateBytes { pCacheData, pCacheSize in
            self.device.dispatchTable.vkGetCudaModuleCacheNV(self.device.handle, self.handle, pCacheSize, pCacheData)
        }
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
public final class CudaFunctionNV: _HandleContainer {
    public let handle: VkCudaFunctionNV?
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

public final class ExternalComputeQueueNV: _HandleContainer {
    public let handle: VkExternalComputeQueueNV?
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
        out.sType = VK_STRUCTURE_TYPE_EXTERNAL_COMPUTE_QUEUE_DATA_PARAMS_NV
        self.device.dispatchTable.vkGetExternalComputeQueueDataNV(self.handle, &out, data)
        return ExternalComputeQueueDataParamsNV(cStruct: out)
    }
}

