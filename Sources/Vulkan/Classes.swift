@preconcurrency import CVulkan

public struct Entry: @unchecked Sendable {
    public let table: UnsafePointer<EntryDispatchTable>

    public init(loader: any Loader) {
        let table = UnsafeMutablePointer<EntryDispatchTable>.allocate(capacity: 1)
        table.initialize(to: EntryDispatchTable(loader: loader))
        self.table = UnsafePointer(table)
    }

    public func destroy() {
        UnsafeMutablePointer(mutating: self.table).deallocate()
    }

    public func createInstance(_ createInfo: (some Chainable<InstanceCreateInfo>)) throws(Result) -> Instance {
        let vkCreateInstance = self.table.pointee.vkCreateInstance!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkInstance!
            try checkResult(
                vkCreateInstance(ptr_createInfo, nil, &out)
            )
            let table = UnsafeMutablePointer<InstanceDispatchTable>.allocate(capacity: 1)
            table.initialize(to: InstanceDispatchTable(vkGetInstanceProcAddr: self.table.pointee.vkGetInstanceProcAddr, instance: out))
            return Instance(handle: out, table: UnsafePointer(table))
        }
    }

    public func createInstance(_ createInfo: InstanceCreateInfo = InstanceCreateInfo()) throws(Result) -> Instance {
        let vkCreateInstance = self.table.pointee.vkCreateInstance!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkInstance!
            try checkResult(
                vkCreateInstance(ptr_createInfo, nil, &out)
            )
            let table = UnsafeMutablePointer<InstanceDispatchTable>.allocate(capacity: 1)
            table.initialize(to: InstanceDispatchTable(vkGetInstanceProcAddr: self.table.pointee.vkGetInstanceProcAddr, instance: out))
            return Instance(handle: out, table: UnsafePointer(table))
        }
    }

    public func getInstanceProcAddr(instance: Instance? = nil, name: String) -> PFN_vkVoidFunction? {
        let vkGetInstanceProcAddr = self.table.pointee.vkGetInstanceProcAddr
        return name._withCString { cString_name in
            vkGetInstanceProcAddr(instance?.handle, cString_name)
        }
    }

    public func getInstanceVersion() throws(Result) -> Version {
        let vkEnumerateInstanceVersion = self.table.pointee.vkEnumerateInstanceVersion!
        var out = UInt32()
        try checkResult(
            vkEnumerateInstanceVersion(&out)
        )
        return Version(rawValue: out)
    }

    public func getInstanceLayerProperties() throws(Result) -> Array<LayerProperties> {
        let vkEnumerateInstanceLayerProperties = self.table.pointee.vkEnumerateInstanceLayerProperties!
        return try enumerate { pProperties, pPropertyCount in
            vkEnumerateInstanceLayerProperties(pPropertyCount, pProperties)
        }.map { LayerProperties(cStruct: $0) }
    }

    public func getInstanceExtensionProperties(layerName: String? = nil) throws(Result) -> Array<ExtensionProperties> {
        let vkEnumerateInstanceExtensionProperties = self.table.pointee.vkEnumerateInstanceExtensionProperties!
        return try layerName.withOptionalCString { cString_layerName throws(Result) in
            try enumerate { pProperties, pPropertyCount in
                vkEnumerateInstanceExtensionProperties(cString_layerName, pPropertyCount, pProperties)
            }.map { ExtensionProperties(cStruct: $0) }
        }
    }
}

public struct Instance: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .instance
    public let handle: VkInstance
    public let table: UnsafePointer<InstanceDispatchTable>

    public init(handle: VkInstance!, table: UnsafePointer<InstanceDispatchTable>) {
        self.handle = handle
        self.table = table
    }

    public func destroy() -> Void {
        let vkDestroyInstance = self.table.pointee.vkDestroyInstance!
        vkDestroyInstance(self.handle, nil)
        UnsafeMutablePointer(mutating: self.table).deallocate()
    }

    public func getPhysicalDevices() throws(Result) -> Array<PhysicalDevice> {
        let vkEnumeratePhysicalDevices = self.table.pointee.vkEnumeratePhysicalDevices!
        return try enumerate { pPhysicalDevices, pPhysicalDeviceCount in
            vkEnumeratePhysicalDevices(self.handle, pPhysicalDeviceCount, pPhysicalDevices)
        }.map { PhysicalDevice(handle: $0, table: self.table) }
    }

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func createAndroidSurfaceKHR(_ createInfo: (some Chainable<AndroidSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        let vkCreateAndroidSurfaceKHR = self.table.pointee.vkCreateAndroidSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateAndroidSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func createAndroidSurfaceKHR(_ createInfo: AndroidSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        let vkCreateAndroidSurfaceKHR = self.table.pointee.vkCreateAndroidSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateAndroidSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func createSurfaceOHOS(_ createInfo: (some Chainable<SurfaceCreateInfoOHOS>)) throws(Result) -> SurfaceKHR {
        let vkCreateSurfaceOHOS = self.table.pointee.vkCreateSurfaceOHOS!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateSurfaceOHOS(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func createSurfaceOHOS(_ createInfo: SurfaceCreateInfoOHOS) throws(Result) -> SurfaceKHR {
        let vkCreateSurfaceOHOS = self.table.pointee.vkCreateSurfaceOHOS!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateSurfaceOHOS(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    public func createDisplayPlaneSurfaceKHR(_ createInfo: (some Chainable<DisplaySurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        let vkCreateDisplayPlaneSurfaceKHR = self.table.pointee.vkCreateDisplayPlaneSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateDisplayPlaneSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }

    public func createDisplayPlaneSurfaceKHR(_ createInfo: DisplaySurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        let vkCreateDisplayPlaneSurfaceKHR = self.table.pointee.vkCreateDisplayPlaneSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateDisplayPlaneSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }

    public func destroySurfaceKHR(surface: SurfaceKHR? = nil) -> Void {
        let vkDestroySurfaceKHR = self.table.pointee.vkDestroySurfaceKHR!
        vkDestroySurfaceKHR(self.handle, surface?.handle, nil)
    }

    #if VK_USE_PLATFORM_VI_NN
    public func createViSurfaceNN(_ createInfo: (some Chainable<ViSurfaceCreateInfoNN>)) throws(Result) -> SurfaceKHR {
        let vkCreateViSurfaceNN = self.table.pointee.vkCreateViSurfaceNN!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateViSurfaceNN(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_VI_NN
    public func createViSurfaceNN(_ createInfo: ViSurfaceCreateInfoNN) throws(Result) -> SurfaceKHR {
        let vkCreateViSurfaceNN = self.table.pointee.vkCreateViSurfaceNN!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateViSurfaceNN(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func createWaylandSurfaceKHR(_ createInfo: (some Chainable<WaylandSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        let vkCreateWaylandSurfaceKHR = self.table.pointee.vkCreateWaylandSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateWaylandSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func createWaylandSurfaceKHR(_ createInfo: WaylandSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        let vkCreateWaylandSurfaceKHR = self.table.pointee.vkCreateWaylandSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateWaylandSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func createUbmSurfaceSEC(_ createInfo: (some Chainable<UbmSurfaceCreateInfoSEC>)) throws(Result) -> SurfaceKHR {
        let vkCreateUbmSurfaceSEC = self.table.pointee.vkCreateUbmSurfaceSEC!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateUbmSurfaceSEC(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func createUbmSurfaceSEC(_ createInfo: UbmSurfaceCreateInfoSEC) throws(Result) -> SurfaceKHR {
        let vkCreateUbmSurfaceSEC = self.table.pointee.vkCreateUbmSurfaceSEC!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateUbmSurfaceSEC(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func createWin32SurfaceKHR(_ createInfo: (some Chainable<Win32SurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        let vkCreateWin32SurfaceKHR = self.table.pointee.vkCreateWin32SurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateWin32SurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func createWin32SurfaceKHR(_ createInfo: Win32SurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        let vkCreateWin32SurfaceKHR = self.table.pointee.vkCreateWin32SurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateWin32SurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func createXlibSurfaceKHR(_ createInfo: (some Chainable<XlibSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        let vkCreateXlibSurfaceKHR = self.table.pointee.vkCreateXlibSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateXlibSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func createXlibSurfaceKHR(_ createInfo: XlibSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        let vkCreateXlibSurfaceKHR = self.table.pointee.vkCreateXlibSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateXlibSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func createXcbSurfaceKHR(_ createInfo: (some Chainable<XcbSurfaceCreateInfoKHR>)) throws(Result) -> SurfaceKHR {
        let vkCreateXcbSurfaceKHR = self.table.pointee.vkCreateXcbSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateXcbSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func createXcbSurfaceKHR(_ createInfo: XcbSurfaceCreateInfoKHR) throws(Result) -> SurfaceKHR {
        let vkCreateXcbSurfaceKHR = self.table.pointee.vkCreateXcbSurfaceKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateXcbSurfaceKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func createDirectFBSurfaceEXT(_ createInfo: (some Chainable<DirectFBSurfaceCreateInfoEXT>)) throws(Result) -> SurfaceKHR {
        let vkCreateDirectFBSurfaceEXT = self.table.pointee.vkCreateDirectFBSurfaceEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateDirectFBSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func createDirectFBSurfaceEXT(_ createInfo: DirectFBSurfaceCreateInfoEXT) throws(Result) -> SurfaceKHR {
        let vkCreateDirectFBSurfaceEXT = self.table.pointee.vkCreateDirectFBSurfaceEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateDirectFBSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createImagePipeSurfaceFUCHSIA(_ createInfo: (some Chainable<ImagePipeSurfaceCreateInfoFUCHSIA>)) throws(Result) -> SurfaceKHR {
        let vkCreateImagePipeSurfaceFUCHSIA = self.table.pointee.vkCreateImagePipeSurfaceFUCHSIA!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateImagePipeSurfaceFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createImagePipeSurfaceFUCHSIA(_ createInfo: ImagePipeSurfaceCreateInfoFUCHSIA) throws(Result) -> SurfaceKHR {
        let vkCreateImagePipeSurfaceFUCHSIA = self.table.pointee.vkCreateImagePipeSurfaceFUCHSIA!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateImagePipeSurfaceFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_GGP
    public func createStreamDescriptorSurfaceGGP(_ createInfo: (some Chainable<StreamDescriptorSurfaceCreateInfoGGP>)) throws(Result) -> SurfaceKHR {
        let vkCreateStreamDescriptorSurfaceGGP = self.table.pointee.vkCreateStreamDescriptorSurfaceGGP!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateStreamDescriptorSurfaceGGP(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_GGP
    public func createStreamDescriptorSurfaceGGP(_ createInfo: StreamDescriptorSurfaceCreateInfoGGP) throws(Result) -> SurfaceKHR {
        let vkCreateStreamDescriptorSurfaceGGP = self.table.pointee.vkCreateStreamDescriptorSurfaceGGP!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateStreamDescriptorSurfaceGGP(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func createScreenSurfaceQNX(_ createInfo: (some Chainable<ScreenSurfaceCreateInfoQNX>)) throws(Result) -> SurfaceKHR {
        let vkCreateScreenSurfaceQNX = self.table.pointee.vkCreateScreenSurfaceQNX!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateScreenSurfaceQNX(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func createScreenSurfaceQNX(_ createInfo: ScreenSurfaceCreateInfoQNX) throws(Result) -> SurfaceKHR {
        let vkCreateScreenSurfaceQNX = self.table.pointee.vkCreateScreenSurfaceQNX!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateScreenSurfaceQNX(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    public func createDebugReportCallbackEXT(_ createInfo: (some Chainable<DebugReportCallbackCreateInfoEXT>)) throws(Result) -> DebugReportCallbackEXT {
        let vkCreateDebugReportCallbackEXT = self.table.pointee.vkCreateDebugReportCallbackEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugReportCallbackEXT!
            try checkResult(
                vkCreateDebugReportCallbackEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugReportCallbackEXT(handle: out)
        }
    }

    public func createDebugReportCallbackEXT(_ createInfo: DebugReportCallbackCreateInfoEXT) throws(Result) -> DebugReportCallbackEXT {
        let vkCreateDebugReportCallbackEXT = self.table.pointee.vkCreateDebugReportCallbackEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugReportCallbackEXT!
            try checkResult(
                vkCreateDebugReportCallbackEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugReportCallbackEXT(handle: out)
        }
    }

    public func destroyDebugReportCallbackEXT(callback: DebugReportCallbackEXT? = nil) -> Void {
        let vkDestroyDebugReportCallbackEXT = self.table.pointee.vkDestroyDebugReportCallbackEXT!
        vkDestroyDebugReportCallbackEXT(self.handle, callback?.handle, nil)
    }

    public func debugReportMessageEXT(flags: DebugReportFlagsEXT, objectType: DebugReportObjectTypeEXT, object: UInt64, location: Int, messageCode: Int32, layerPrefix: String, message: String) -> Void {
        let vkDebugReportMessageEXT = self.table.pointee.vkDebugReportMessageEXT!
        return layerPrefix._withCString { cString_layerPrefix in
            message._withCString { cString_message in
                vkDebugReportMessageEXT(self.handle, flags.rawValue, VkDebugReportObjectTypeEXT(rawValue: VkDebugReportObjectTypeEXT.RawValue(objectType.rawValue)), object, location, messageCode, cString_layerPrefix, cString_message)
            }
        }
    }

    public func getPhysicalDeviceGroups() throws(Result) -> Array<PhysicalDeviceGroupProperties> {
        let vkEnumeratePhysicalDeviceGroups = self.table.pointee.vkEnumeratePhysicalDeviceGroups!
        return try enumerate { pPhysicalDeviceGroupProperties, pPhysicalDeviceGroupCount in
            vkEnumeratePhysicalDeviceGroups(self.handle, pPhysicalDeviceGroupCount, pPhysicalDeviceGroupProperties)
        }.map { PhysicalDeviceGroupProperties(cStruct: $0, table: self.table) }
    }

    #if VK_USE_PLATFORM_IOS_MVK
    public func createIOSSurfaceMVK(_ createInfo: (some Chainable<IOSSurfaceCreateInfoMVK>)) throws(Result) -> SurfaceKHR {
        let vkCreateIOSSurfaceMVK = self.table.pointee.vkCreateIOSSurfaceMVK!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateIOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_IOS_MVK
    public func createIOSSurfaceMVK(_ createInfo: IOSSurfaceCreateInfoMVK) throws(Result) -> SurfaceKHR {
        let vkCreateIOSSurfaceMVK = self.table.pointee.vkCreateIOSSurfaceMVK!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateIOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_MACOS_MVK
    public func createMacOSSurfaceMVK(_ createInfo: (some Chainable<MacOSSurfaceCreateInfoMVK>)) throws(Result) -> SurfaceKHR {
        let vkCreateMacOSSurfaceMVK = self.table.pointee.vkCreateMacOSSurfaceMVK!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateMacOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_MACOS_MVK
    public func createMacOSSurfaceMVK(_ createInfo: MacOSSurfaceCreateInfoMVK) throws(Result) -> SurfaceKHR {
        let vkCreateMacOSSurfaceMVK = self.table.pointee.vkCreateMacOSSurfaceMVK!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateMacOSSurfaceMVK(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func createMetalSurfaceEXT(_ createInfo: (some Chainable<MetalSurfaceCreateInfoEXT>)) throws(Result) -> SurfaceKHR {
        let vkCreateMetalSurfaceEXT = self.table.pointee.vkCreateMetalSurfaceEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateMetalSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func createMetalSurfaceEXT(_ createInfo: MetalSurfaceCreateInfoEXT) throws(Result) -> SurfaceKHR {
        let vkCreateMetalSurfaceEXT = self.table.pointee.vkCreateMetalSurfaceEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateMetalSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
    #endif

    public func createDebugUtilsMessengerEXT(_ createInfo: (some Chainable<DebugUtilsMessengerCreateInfoEXT>)) throws(Result) -> DebugUtilsMessengerEXT {
        let vkCreateDebugUtilsMessengerEXT = self.table.pointee.vkCreateDebugUtilsMessengerEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugUtilsMessengerEXT!
            try checkResult(
                vkCreateDebugUtilsMessengerEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugUtilsMessengerEXT(handle: out)
        }
    }

    public func createDebugUtilsMessengerEXT(_ createInfo: DebugUtilsMessengerCreateInfoEXT) throws(Result) -> DebugUtilsMessengerEXT {
        let vkCreateDebugUtilsMessengerEXT = self.table.pointee.vkCreateDebugUtilsMessengerEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDebugUtilsMessengerEXT!
            try checkResult(
                vkCreateDebugUtilsMessengerEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return DebugUtilsMessengerEXT(handle: out)
        }
    }

    public func destroyDebugUtilsMessengerEXT(messenger: DebugUtilsMessengerEXT? = nil) -> Void {
        let vkDestroyDebugUtilsMessengerEXT = self.table.pointee.vkDestroyDebugUtilsMessengerEXT!
        vkDestroyDebugUtilsMessengerEXT(self.handle, messenger?.handle, nil)
    }

    public func submitDebugUtilsMessageEXT(messageSeverity: DebugUtilsMessageSeverityFlagsEXT, messageTypes: DebugUtilsMessageTypeFlagsEXT, callbackData: (some Chainable<DebugUtilsMessengerCallbackDataEXT>)) -> Void {
        let vkSubmitDebugUtilsMessageEXT = self.table.pointee.vkSubmitDebugUtilsMessageEXT!
        return callbackData.withCStruct { ptr_callbackData in
            vkSubmitDebugUtilsMessageEXT(self.handle, VkDebugUtilsMessageSeverityFlagBitsEXT(rawValue: VkDebugUtilsMessageSeverityFlagBitsEXT.RawValue(messageSeverity.rawValue)), messageTypes.rawValue, ptr_callbackData)
        }
    }

    public func submitDebugUtilsMessageEXT(messageSeverity: DebugUtilsMessageSeverityFlagsEXT, messageTypes: DebugUtilsMessageTypeFlagsEXT, callbackData: DebugUtilsMessengerCallbackDataEXT) -> Void {
        let vkSubmitDebugUtilsMessageEXT = self.table.pointee.vkSubmitDebugUtilsMessageEXT!
        return callbackData.withCStruct { ptr_callbackData in
            vkSubmitDebugUtilsMessageEXT(self.handle, VkDebugUtilsMessageSeverityFlagBitsEXT(rawValue: VkDebugUtilsMessageSeverityFlagBitsEXT.RawValue(messageSeverity.rawValue)), messageTypes.rawValue, ptr_callbackData)
        }
    }

    public func createHeadlessSurfaceEXT(_ createInfo: (some Chainable<HeadlessSurfaceCreateInfoEXT>)) throws(Result) -> SurfaceKHR {
        let vkCreateHeadlessSurfaceEXT = self.table.pointee.vkCreateHeadlessSurfaceEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateHeadlessSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }

    public func createHeadlessSurfaceEXT(_ createInfo: HeadlessSurfaceCreateInfoEXT = HeadlessSurfaceCreateInfoEXT()) throws(Result) -> SurfaceKHR {
        let vkCreateHeadlessSurfaceEXT = self.table.pointee.vkCreateHeadlessSurfaceEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSurfaceKHR!
            try checkResult(
                vkCreateHeadlessSurfaceEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return SurfaceKHR(handle: out)
        }
    }
}

public struct PhysicalDevice: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .physicalDevice
    public let handle: VkPhysicalDevice
    public let table: UnsafePointer<InstanceDispatchTable>

    public init(handle: VkPhysicalDevice!, table: UnsafePointer<InstanceDispatchTable>) {
        self.handle = handle
        self.table = table
    }

    public func getProperties() -> PhysicalDeviceProperties {
        let vkGetPhysicalDeviceProperties = self.table.pointee.vkGetPhysicalDeviceProperties!
        var out = VkPhysicalDeviceProperties()
        vkGetPhysicalDeviceProperties(self.handle, &out)
        return PhysicalDeviceProperties(cStruct: out)
    }

    public func getQueueFamilyProperties() -> Array<QueueFamilyProperties> {
        let vkGetPhysicalDeviceQueueFamilyProperties = self.table.pointee.vkGetPhysicalDeviceQueueFamilyProperties!
        return enumerate { pQueueFamilyProperties, pQueueFamilyPropertyCount in
            vkGetPhysicalDeviceQueueFamilyProperties(self.handle, pQueueFamilyPropertyCount, pQueueFamilyProperties)
        }.map { QueueFamilyProperties(cStruct: $0) }
    }

    public func getMemoryProperties() -> PhysicalDeviceMemoryProperties {
        let vkGetPhysicalDeviceMemoryProperties = self.table.pointee.vkGetPhysicalDeviceMemoryProperties!
        var out = VkPhysicalDeviceMemoryProperties()
        vkGetPhysicalDeviceMemoryProperties(self.handle, &out)
        return PhysicalDeviceMemoryProperties(cStruct: out)
    }

    public func getFeatures() -> PhysicalDeviceFeatures {
        let vkGetPhysicalDeviceFeatures = self.table.pointee.vkGetPhysicalDeviceFeatures!
        var out = VkPhysicalDeviceFeatures()
        vkGetPhysicalDeviceFeatures(self.handle, &out)
        return PhysicalDeviceFeatures(cStruct: out)
    }

    public func getFormatProperties(format: Format) -> FormatProperties {
        let vkGetPhysicalDeviceFormatProperties = self.table.pointee.vkGetPhysicalDeviceFormatProperties!
        var out = VkFormatProperties()
        vkGetPhysicalDeviceFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), &out)
        return FormatProperties(cStruct: out)
    }

    public func getImageFormatProperties(format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags = []) throws(Result) -> ImageFormatProperties {
        let vkGetPhysicalDeviceImageFormatProperties = self.table.pointee.vkGetPhysicalDeviceImageFormatProperties!
        var out = VkImageFormatProperties()
        try checkResult(
            vkGetPhysicalDeviceImageFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), usage.rawValue, flags.rawValue, &out)
        )
        return ImageFormatProperties(cStruct: out)
    }

    public func createDevice(_ createInfo: (some Chainable<DeviceCreateInfo>)) throws(Result) -> Device {
        let vkCreateDevice = self.table.pointee.vkCreateDevice!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDevice!
            try checkResult(
                vkCreateDevice(self.handle, ptr_createInfo, nil, &out)
            )
            let table = UnsafeMutablePointer<DeviceDispatchTable>.allocate(capacity: 1)
            table.initialize(to: DeviceDispatchTable(vkGetDeviceProcAddr: self.table.pointee.vkGetDeviceProcAddr, device: out))
            return Device(handle: out, table: UnsafePointer(table))
        }
    }

    public func createDevice(_ createInfo: DeviceCreateInfo = DeviceCreateInfo()) throws(Result) -> Device {
        let vkCreateDevice = self.table.pointee.vkCreateDevice!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDevice!
            try checkResult(
                vkCreateDevice(self.handle, ptr_createInfo, nil, &out)
            )
            let table = UnsafeMutablePointer<DeviceDispatchTable>.allocate(capacity: 1)
            table.initialize(to: DeviceDispatchTable(vkGetDeviceProcAddr: self.table.pointee.vkGetDeviceProcAddr, device: out))
            return Device(handle: out, table: UnsafePointer(table))
        }
    }

    public func getDeviceLayerProperties() throws(Result) -> Array<LayerProperties> {
        let vkEnumerateDeviceLayerProperties = self.table.pointee.vkEnumerateDeviceLayerProperties!
        return try enumerate { pProperties, pPropertyCount in
            vkEnumerateDeviceLayerProperties(self.handle, pPropertyCount, pProperties)
        }.map { LayerProperties(cStruct: $0) }
    }

    public func getDeviceExtensionProperties(layerName: String? = nil) throws(Result) -> Array<ExtensionProperties> {
        let vkEnumerateDeviceExtensionProperties = self.table.pointee.vkEnumerateDeviceExtensionProperties!
        return try layerName.withOptionalCString { cString_layerName throws(Result) in
            try enumerate { pProperties, pPropertyCount in
                vkEnumerateDeviceExtensionProperties(self.handle, cString_layerName, pPropertyCount, pProperties)
            }.map { ExtensionProperties(cStruct: $0) }
        }
    }

    public func getSparseImageFormatProperties(format: Format, type: ImageType, samples: SampleCountFlags, usage: ImageUsageFlags, tiling: ImageTiling) -> Array<SparseImageFormatProperties> {
        let vkGetPhysicalDeviceSparseImageFormatProperties = self.table.pointee.vkGetPhysicalDeviceSparseImageFormatProperties!
        return enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceSparseImageFormatProperties(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), usage.rawValue, VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), pPropertyCount, pProperties)
        }.map { SparseImageFormatProperties(cStruct: $0) }
    }

    public func getDisplayPropertiesKHR() throws(Result) -> Array<DisplayPropertiesKHR> {
        let vkGetPhysicalDeviceDisplayPropertiesKHR = self.table.pointee.vkGetPhysicalDeviceDisplayPropertiesKHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceDisplayPropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPropertiesKHR(cStruct: $0) }
    }

    public func getDisplayPlanePropertiesKHR() throws(Result) -> Array<DisplayPlanePropertiesKHR> {
        let vkGetPhysicalDeviceDisplayPlanePropertiesKHR = self.table.pointee.vkGetPhysicalDeviceDisplayPlanePropertiesKHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceDisplayPlanePropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPlanePropertiesKHR(cStruct: $0) }
    }

    public func getDisplayPlaneSupportedDisplaysKHR(planeIndex: UInt32) throws(Result) -> Array<DisplayKHR> {
        let vkGetDisplayPlaneSupportedDisplaysKHR = self.table.pointee.vkGetDisplayPlaneSupportedDisplaysKHR!
        return try enumerate { pDisplays, pDisplayCount in
            vkGetDisplayPlaneSupportedDisplaysKHR(self.handle, planeIndex, pDisplayCount, pDisplays)
        }.map { DisplayKHR(handle: $0) }
    }

    public func getDisplayModePropertiesKHR(display: DisplayKHR) throws(Result) -> Array<DisplayModePropertiesKHR> {
        let vkGetDisplayModePropertiesKHR = self.table.pointee.vkGetDisplayModePropertiesKHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetDisplayModePropertiesKHR(self.handle, display.handle, pPropertyCount, pProperties)
        }.map { DisplayModePropertiesKHR(cStruct: $0) }
    }

    public func createDisplayModeKHR(_ createInfo: (some Chainable<DisplayModeCreateInfoKHR>), display: DisplayKHR) throws(Result) -> DisplayModeKHR {
        let vkCreateDisplayModeKHR = self.table.pointee.vkCreateDisplayModeKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDisplayModeKHR!
            try checkResult(
                vkCreateDisplayModeKHR(self.handle, display.handle, ptr_createInfo, nil, &out)
            )
            return DisplayModeKHR(handle: out)
        }
    }

    public func createDisplayModeKHR(_ createInfo: DisplayModeCreateInfoKHR, display: DisplayKHR) throws(Result) -> DisplayModeKHR {
        let vkCreateDisplayModeKHR = self.table.pointee.vkCreateDisplayModeKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDisplayModeKHR!
            try checkResult(
                vkCreateDisplayModeKHR(self.handle, display.handle, ptr_createInfo, nil, &out)
            )
            return DisplayModeKHR(handle: out)
        }
    }

    public func getDisplayPlaneCapabilitiesKHR(mode: DisplayModeKHR, planeIndex: UInt32) throws(Result) -> DisplayPlaneCapabilitiesKHR {
        let vkGetDisplayPlaneCapabilitiesKHR = self.table.pointee.vkGetDisplayPlaneCapabilitiesKHR!
        var out = VkDisplayPlaneCapabilitiesKHR()
        try checkResult(
            vkGetDisplayPlaneCapabilitiesKHR(self.handle, mode.handle, planeIndex, &out)
        )
        return DisplayPlaneCapabilitiesKHR(cStruct: out)
    }

    public func getSurfaceSupportKHR(queueFamilyIndex: UInt32, surface: SurfaceKHR) throws(Result) -> Bool {
        let vkGetPhysicalDeviceSurfaceSupportKHR = self.table.pointee.vkGetPhysicalDeviceSurfaceSupportKHR!
        var out = VkBool32()
        try checkResult(
            vkGetPhysicalDeviceSurfaceSupportKHR(self.handle, queueFamilyIndex, surface.handle, &out)
        )
        return out == VK_TRUE
    }

    public func getSurfaceCapabilitiesKHR(surface: SurfaceKHR) throws(Result) -> SurfaceCapabilitiesKHR {
        let vkGetPhysicalDeviceSurfaceCapabilitiesKHR = self.table.pointee.vkGetPhysicalDeviceSurfaceCapabilitiesKHR!
        var out = VkSurfaceCapabilitiesKHR()
        try checkResult(
            vkGetPhysicalDeviceSurfaceCapabilitiesKHR(self.handle, surface.handle, &out)
        )
        return SurfaceCapabilitiesKHR(cStruct: out)
    }

    public func getSurfaceFormatsKHR(surface: SurfaceKHR? = nil) throws(Result) -> Array<SurfaceFormatKHR> {
        let vkGetPhysicalDeviceSurfaceFormatsKHR = self.table.pointee.vkGetPhysicalDeviceSurfaceFormatsKHR!
        return try enumerate { pSurfaceFormats, pSurfaceFormatCount in
            vkGetPhysicalDeviceSurfaceFormatsKHR(self.handle, surface?.handle, pSurfaceFormatCount, pSurfaceFormats)
        }.map { SurfaceFormatKHR(cStruct: $0) }
    }

    public func getSurfacePresentModesKHR(surface: SurfaceKHR? = nil) throws(Result) -> Array<PresentModeKHR> {
        let vkGetPhysicalDeviceSurfacePresentModesKHR = self.table.pointee.vkGetPhysicalDeviceSurfacePresentModesKHR!
        return try enumerate { pPresentModes, pPresentModeCount in
            vkGetPhysicalDeviceSurfacePresentModesKHR(self.handle, surface?.handle, pPresentModeCount, pPresentModes)
        }.map { PresentModeKHR(rawValue: numericBitCast($0.rawValue))! }
    }

    #if VK_USE_PLATFORM_WAYLAND_KHR
    public func getWaylandPresentationSupportKHR(queueFamilyIndex: UInt32, display: OpaquePointer) -> Bool {
        let vkGetPhysicalDeviceWaylandPresentationSupportKHR = self.table.pointee.vkGetPhysicalDeviceWaylandPresentationSupportKHR!
        return vkGetPhysicalDeviceWaylandPresentationSupportKHR(self.handle, queueFamilyIndex, display) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_UBM_SEC
    public func getUbmPresentationSupportSEC(queueFamilyIndex: UInt32, device: UnsafeMutablePointer<ubm_device>) -> Bool {
        let vkGetPhysicalDeviceUbmPresentationSupportSEC = self.table.pointee.vkGetPhysicalDeviceUbmPresentationSupportSEC!
        return vkGetPhysicalDeviceUbmPresentationSupportSEC(self.handle, queueFamilyIndex, device) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getWin32PresentationSupportKHR(queueFamilyIndex: UInt32) -> Bool {
        let vkGetPhysicalDeviceWin32PresentationSupportKHR = self.table.pointee.vkGetPhysicalDeviceWin32PresentationSupportKHR!
        return vkGetPhysicalDeviceWin32PresentationSupportKHR(self.handle, queueFamilyIndex) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_KHR
    public func getXlibPresentationSupportKHR(queueFamilyIndex: UInt32, dpy: UnsafeMutablePointer<Display>, visualID: VisualID) -> Bool {
        let vkGetPhysicalDeviceXlibPresentationSupportKHR = self.table.pointee.vkGetPhysicalDeviceXlibPresentationSupportKHR!
        return vkGetPhysicalDeviceXlibPresentationSupportKHR(self.handle, queueFamilyIndex, dpy, visualID) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_XCB_KHR
    public func getXcbPresentationSupportKHR(queueFamilyIndex: UInt32, connection: UnsafeMutablePointer<xcb_connection_t>, visual_id: xcb_visualid_t) -> Bool {
        let vkGetPhysicalDeviceXcbPresentationSupportKHR = self.table.pointee.vkGetPhysicalDeviceXcbPresentationSupportKHR!
        return vkGetPhysicalDeviceXcbPresentationSupportKHR(self.handle, queueFamilyIndex, connection, visual_id) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_DIRECTFB_EXT
    public func getDirectFBPresentationSupportEXT(queueFamilyIndex: UInt32, dfb: UnsafeMutablePointer<IDirectFB>) -> Bool {
        let vkGetPhysicalDeviceDirectFBPresentationSupportEXT = self.table.pointee.vkGetPhysicalDeviceDirectFBPresentationSupportEXT!
        return vkGetPhysicalDeviceDirectFBPresentationSupportEXT(self.handle, queueFamilyIndex, dfb) == VK_TRUE
    }
    #endif

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func getScreenPresentationSupportQNX(queueFamilyIndex: UInt32, window: UnsafeMutablePointer<_screen_window>) -> Bool {
        let vkGetPhysicalDeviceScreenPresentationSupportQNX = self.table.pointee.vkGetPhysicalDeviceScreenPresentationSupportQNX!
        return vkGetPhysicalDeviceScreenPresentationSupportQNX(self.handle, queueFamilyIndex, window) == VK_TRUE
    }
    #endif

    public func getExternalImageFormatPropertiesNV(format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags = [], externalHandleType: ExternalMemoryHandleTypeFlagsNV = []) throws(Result) -> ExternalImageFormatPropertiesNV {
        let vkGetPhysicalDeviceExternalImageFormatPropertiesNV = self.table.pointee.vkGetPhysicalDeviceExternalImageFormatPropertiesNV!
        var out = VkExternalImageFormatPropertiesNV()
        try checkResult(
            vkGetPhysicalDeviceExternalImageFormatPropertiesNV(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), VkImageType(rawValue: VkImageType.RawValue(type.rawValue)), VkImageTiling(rawValue: VkImageTiling.RawValue(tiling.rawValue)), usage.rawValue, flags.rawValue, externalHandleType.rawValue, &out)
        )
        return ExternalImageFormatPropertiesNV(cStruct: out)
    }

    public func getFeatures2() -> PhysicalDeviceFeatures2 {
        let vkGetPhysicalDeviceFeatures2 = self.table.pointee.vkGetPhysicalDeviceFeatures2!
        var out = VkPhysicalDeviceFeatures2()
        out.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2
        vkGetPhysicalDeviceFeatures2(self.handle, &out)
        return PhysicalDeviceFeatures2(cStruct: out)
    }

    public func getProperties2() -> PhysicalDeviceProperties2 {
        let vkGetPhysicalDeviceProperties2 = self.table.pointee.vkGetPhysicalDeviceProperties2!
        var out = VkPhysicalDeviceProperties2()
        out.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2
        vkGetPhysicalDeviceProperties2(self.handle, &out)
        return PhysicalDeviceProperties2(cStruct: out)
    }

    public func getFormatProperties2(format: Format) -> FormatProperties2 {
        let vkGetPhysicalDeviceFormatProperties2 = self.table.pointee.vkGetPhysicalDeviceFormatProperties2!
        var out = VkFormatProperties2()
        out.sType = VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2
        vkGetPhysicalDeviceFormatProperties2(self.handle, VkFormat(rawValue: VkFormat.RawValue(format.rawValue)), &out)
        return FormatProperties2(cStruct: out)
    }

    public func getImageFormatProperties2(_ imageFormatInfo: (some Chainable<PhysicalDeviceImageFormatInfo2>)) throws(Result) -> ImageFormatProperties2 {
        let vkGetPhysicalDeviceImageFormatProperties2 = self.table.pointee.vkGetPhysicalDeviceImageFormatProperties2!
        return try imageFormatInfo.withCStruct { ptr_imageFormatInfo throws(Result) in
            var out = VkImageFormatProperties2()
            out.sType = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
            try checkResult(
                vkGetPhysicalDeviceImageFormatProperties2(self.handle, ptr_imageFormatInfo, &out)
            )
            return ImageFormatProperties2(cStruct: out)
        }
    }

    public func getImageFormatProperties2(_ imageFormatInfo: PhysicalDeviceImageFormatInfo2) throws(Result) -> ImageFormatProperties2 {
        let vkGetPhysicalDeviceImageFormatProperties2 = self.table.pointee.vkGetPhysicalDeviceImageFormatProperties2!
        return try imageFormatInfo.withCStruct { ptr_imageFormatInfo throws(Result) in
            var out = VkImageFormatProperties2()
            out.sType = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
            try checkResult(
                vkGetPhysicalDeviceImageFormatProperties2(self.handle, ptr_imageFormatInfo, &out)
            )
            return ImageFormatProperties2(cStruct: out)
        }
    }

    public func getQueueFamilyProperties2() -> Array<QueueFamilyProperties2> {
        let vkGetPhysicalDeviceQueueFamilyProperties2 = self.table.pointee.vkGetPhysicalDeviceQueueFamilyProperties2!
        return enumerate { pQueueFamilyProperties, pQueueFamilyPropertyCount in
            vkGetPhysicalDeviceQueueFamilyProperties2(self.handle, pQueueFamilyPropertyCount, pQueueFamilyProperties)
        }.map { QueueFamilyProperties2(cStruct: $0) }
    }

    public func getMemoryProperties2() -> PhysicalDeviceMemoryProperties2 {
        let vkGetPhysicalDeviceMemoryProperties2 = self.table.pointee.vkGetPhysicalDeviceMemoryProperties2!
        var out = VkPhysicalDeviceMemoryProperties2()
        out.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2
        vkGetPhysicalDeviceMemoryProperties2(self.handle, &out)
        return PhysicalDeviceMemoryProperties2(cStruct: out)
    }

    public func getSparseImageFormatProperties2(_ formatInfo: (some Chainable<PhysicalDeviceSparseImageFormatInfo2>)) -> Array<SparseImageFormatProperties2> {
        let vkGetPhysicalDeviceSparseImageFormatProperties2 = self.table.pointee.vkGetPhysicalDeviceSparseImageFormatProperties2!
        return formatInfo.withCStruct { ptr_formatInfo in
            enumerate { pProperties, pPropertyCount in
                vkGetPhysicalDeviceSparseImageFormatProperties2(self.handle, ptr_formatInfo, pPropertyCount, pProperties)
            }.map { SparseImageFormatProperties2(cStruct: $0) }
        }
    }

    public func getSparseImageFormatProperties2(_ formatInfo: PhysicalDeviceSparseImageFormatInfo2) -> Array<SparseImageFormatProperties2> {
        let vkGetPhysicalDeviceSparseImageFormatProperties2 = self.table.pointee.vkGetPhysicalDeviceSparseImageFormatProperties2!
        return formatInfo.withCStruct { ptr_formatInfo in
            enumerate { pProperties, pPropertyCount in
                vkGetPhysicalDeviceSparseImageFormatProperties2(self.handle, ptr_formatInfo, pPropertyCount, pProperties)
            }.map { SparseImageFormatProperties2(cStruct: $0) }
        }
    }

    public func getExternalBufferProperties(_ externalBufferInfo: (some Chainable<PhysicalDeviceExternalBufferInfo>)) -> ExternalBufferProperties {
        let vkGetPhysicalDeviceExternalBufferProperties = self.table.pointee.vkGetPhysicalDeviceExternalBufferProperties!
        return externalBufferInfo.withCStruct { ptr_externalBufferInfo in
            var out = VkExternalBufferProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES
            vkGetPhysicalDeviceExternalBufferProperties(self.handle, ptr_externalBufferInfo, &out)
            return ExternalBufferProperties(cStruct: out)
        }
    }

    public func getExternalBufferProperties(_ externalBufferInfo: PhysicalDeviceExternalBufferInfo) -> ExternalBufferProperties {
        let vkGetPhysicalDeviceExternalBufferProperties = self.table.pointee.vkGetPhysicalDeviceExternalBufferProperties!
        return externalBufferInfo.withCStruct { ptr_externalBufferInfo in
            var out = VkExternalBufferProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES
            vkGetPhysicalDeviceExternalBufferProperties(self.handle, ptr_externalBufferInfo, &out)
            return ExternalBufferProperties(cStruct: out)
        }
    }

    public func getExternalSemaphoreProperties(_ externalSemaphoreInfo: (some Chainable<PhysicalDeviceExternalSemaphoreInfo>)) -> ExternalSemaphoreProperties {
        let vkGetPhysicalDeviceExternalSemaphoreProperties = self.table.pointee.vkGetPhysicalDeviceExternalSemaphoreProperties!
        return externalSemaphoreInfo.withCStruct { ptr_externalSemaphoreInfo in
            var out = VkExternalSemaphoreProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES
            vkGetPhysicalDeviceExternalSemaphoreProperties(self.handle, ptr_externalSemaphoreInfo, &out)
            return ExternalSemaphoreProperties(cStruct: out)
        }
    }

    public func getExternalSemaphoreProperties(_ externalSemaphoreInfo: PhysicalDeviceExternalSemaphoreInfo) -> ExternalSemaphoreProperties {
        let vkGetPhysicalDeviceExternalSemaphoreProperties = self.table.pointee.vkGetPhysicalDeviceExternalSemaphoreProperties!
        return externalSemaphoreInfo.withCStruct { ptr_externalSemaphoreInfo in
            var out = VkExternalSemaphoreProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES
            vkGetPhysicalDeviceExternalSemaphoreProperties(self.handle, ptr_externalSemaphoreInfo, &out)
            return ExternalSemaphoreProperties(cStruct: out)
        }
    }

    public func getExternalFenceProperties(_ externalFenceInfo: (some Chainable<PhysicalDeviceExternalFenceInfo>)) -> ExternalFenceProperties {
        let vkGetPhysicalDeviceExternalFenceProperties = self.table.pointee.vkGetPhysicalDeviceExternalFenceProperties!
        return externalFenceInfo.withCStruct { ptr_externalFenceInfo in
            var out = VkExternalFenceProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES
            vkGetPhysicalDeviceExternalFenceProperties(self.handle, ptr_externalFenceInfo, &out)
            return ExternalFenceProperties(cStruct: out)
        }
    }

    public func getExternalFenceProperties(_ externalFenceInfo: PhysicalDeviceExternalFenceInfo) -> ExternalFenceProperties {
        let vkGetPhysicalDeviceExternalFenceProperties = self.table.pointee.vkGetPhysicalDeviceExternalFenceProperties!
        return externalFenceInfo.withCStruct { ptr_externalFenceInfo in
            var out = VkExternalFenceProperties()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_FENCE_PROPERTIES
            vkGetPhysicalDeviceExternalFenceProperties(self.handle, ptr_externalFenceInfo, &out)
            return ExternalFenceProperties(cStruct: out)
        }
    }

    public func releaseDisplayEXT(display: DisplayKHR) throws(Result) -> Void {
        let vkReleaseDisplayEXT = self.table.pointee.vkReleaseDisplayEXT!
        try checkResult(
            vkReleaseDisplayEXT(self.handle, display.handle)
        )
    }

    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    public func acquireXlibDisplayEXT(display: DisplayKHR) throws(Result) -> Display {
        let vkAcquireXlibDisplayEXT = self.table.pointee.vkAcquireXlibDisplayEXT!
        var out = Display()
        try checkResult(
            vkAcquireXlibDisplayEXT(self.handle, &out, display.handle)
        )
        return out
    }
    #endif

    #if VK_USE_PLATFORM_XLIB_XRANDR_EXT
    public func getRandROutputDisplayEXT(dpy: UnsafeMutablePointer<Display>, rrOutput: RROutput, display: UnsafeMutablePointer<VkDisplayKHR?>) throws(Result) -> Void {
        let vkGetRandROutputDisplayEXT = self.table.pointee.vkGetRandROutputDisplayEXT!
        try checkResult(
            vkGetRandROutputDisplayEXT(self.handle, dpy, rrOutput, display)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func acquireWinrtDisplayNV(display: DisplayKHR) throws(Result) -> Void {
        let vkAcquireWinrtDisplayNV = self.table.pointee.vkAcquireWinrtDisplayNV!
        try checkResult(
            vkAcquireWinrtDisplayNV(self.handle, display.handle)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getWinrtDisplayNV(deviceRelativeId: UInt32) throws(Result) -> DisplayKHR {
        let vkGetWinrtDisplayNV = self.table.pointee.vkGetWinrtDisplayNV!
        var out: VkDisplayKHR!
        try checkResult(
            vkGetWinrtDisplayNV(self.handle, deviceRelativeId, &out)
        )
        return DisplayKHR(handle: out)
    }
    #endif

    public func getSurfaceCapabilities2EXT(surface: SurfaceKHR) throws(Result) -> SurfaceCapabilities2EXT {
        let vkGetPhysicalDeviceSurfaceCapabilities2EXT = self.table.pointee.vkGetPhysicalDeviceSurfaceCapabilities2EXT!
        var out = VkSurfaceCapabilities2EXT()
        out.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_EXT
        try checkResult(
            vkGetPhysicalDeviceSurfaceCapabilities2EXT(self.handle, surface.handle, &out)
        )
        return SurfaceCapabilities2EXT(cStruct: out)
    }

    public func getPresentRectanglesKHR(surface: SurfaceKHR) throws(Result) -> Array<Rect2D> {
        let vkGetPhysicalDevicePresentRectanglesKHR = self.table.pointee.vkGetPhysicalDevicePresentRectanglesKHR!
        return try enumerate { pRects, pRectCount in
            vkGetPhysicalDevicePresentRectanglesKHR(self.handle, surface.handle, pRectCount, pRects)
        }.map { Rect2D(cStruct: $0) }
    }

    public func getMultisamplePropertiesEXT(samples: SampleCountFlags) -> MultisamplePropertiesEXT {
        let vkGetPhysicalDeviceMultisamplePropertiesEXT = self.table.pointee.vkGetPhysicalDeviceMultisamplePropertiesEXT!
        var out = VkMultisamplePropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_MULTISAMPLE_PROPERTIES_EXT
        vkGetPhysicalDeviceMultisamplePropertiesEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), &out)
        return MultisamplePropertiesEXT(cStruct: out)
    }

    public func getSurfaceCapabilities2KHR(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> SurfaceCapabilities2KHR {
        let vkGetPhysicalDeviceSurfaceCapabilities2KHR = self.table.pointee.vkGetPhysicalDeviceSurfaceCapabilities2KHR!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkSurfaceCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
            try checkResult(
                vkGetPhysicalDeviceSurfaceCapabilities2KHR(self.handle, ptr_surfaceInfo, &out)
            )
            return SurfaceCapabilities2KHR(cStruct: out)
        }
    }

    public func getSurfaceCapabilities2KHR(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> SurfaceCapabilities2KHR {
        let vkGetPhysicalDeviceSurfaceCapabilities2KHR = self.table.pointee.vkGetPhysicalDeviceSurfaceCapabilities2KHR!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkSurfaceCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
            try checkResult(
                vkGetPhysicalDeviceSurfaceCapabilities2KHR(self.handle, ptr_surfaceInfo, &out)
            )
            return SurfaceCapabilities2KHR(cStruct: out)
        }
    }

    public func getSurfaceFormats2KHR(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> Array<SurfaceFormat2KHR> {
        let vkGetPhysicalDeviceSurfaceFormats2KHR = self.table.pointee.vkGetPhysicalDeviceSurfaceFormats2KHR!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pSurfaceFormats, pSurfaceFormatCount in
                vkGetPhysicalDeviceSurfaceFormats2KHR(self.handle, ptr_surfaceInfo, pSurfaceFormatCount, pSurfaceFormats)
            }.map { SurfaceFormat2KHR(cStruct: $0) }
        }
    }

    public func getSurfaceFormats2KHR(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> Array<SurfaceFormat2KHR> {
        let vkGetPhysicalDeviceSurfaceFormats2KHR = self.table.pointee.vkGetPhysicalDeviceSurfaceFormats2KHR!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pSurfaceFormats, pSurfaceFormatCount in
                vkGetPhysicalDeviceSurfaceFormats2KHR(self.handle, ptr_surfaceInfo, pSurfaceFormatCount, pSurfaceFormats)
            }.map { SurfaceFormat2KHR(cStruct: $0) }
        }
    }

    public func getDisplayProperties2KHR() throws(Result) -> Array<DisplayProperties2KHR> {
        let vkGetPhysicalDeviceDisplayProperties2KHR = self.table.pointee.vkGetPhysicalDeviceDisplayProperties2KHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceDisplayProperties2KHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayProperties2KHR(cStruct: $0) }
    }

    public func getDisplayPlaneProperties2KHR() throws(Result) -> Array<DisplayPlaneProperties2KHR> {
        let vkGetPhysicalDeviceDisplayPlaneProperties2KHR = self.table.pointee.vkGetPhysicalDeviceDisplayPlaneProperties2KHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceDisplayPlaneProperties2KHR(self.handle, pPropertyCount, pProperties)
        }.map { DisplayPlaneProperties2KHR(cStruct: $0) }
    }

    public func getDisplayModeProperties2KHR(display: DisplayKHR) throws(Result) -> Array<DisplayModeProperties2KHR> {
        let vkGetDisplayModeProperties2KHR = self.table.pointee.vkGetDisplayModeProperties2KHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetDisplayModeProperties2KHR(self.handle, display.handle, pPropertyCount, pProperties)
        }.map { DisplayModeProperties2KHR(cStruct: $0) }
    }

    public func getDisplayPlaneCapabilities2KHR(_ displayPlaneInfo: (some Chainable<DisplayPlaneInfo2KHR>)) throws(Result) -> DisplayPlaneCapabilities2KHR {
        let vkGetDisplayPlaneCapabilities2KHR = self.table.pointee.vkGetDisplayPlaneCapabilities2KHR!
        return try displayPlaneInfo.withCStruct { ptr_displayPlaneInfo throws(Result) in
            var out = VkDisplayPlaneCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR
            try checkResult(
                vkGetDisplayPlaneCapabilities2KHR(self.handle, ptr_displayPlaneInfo, &out)
            )
            return DisplayPlaneCapabilities2KHR(cStruct: out)
        }
    }

    public func getDisplayPlaneCapabilities2KHR(_ displayPlaneInfo: DisplayPlaneInfo2KHR) throws(Result) -> DisplayPlaneCapabilities2KHR {
        let vkGetDisplayPlaneCapabilities2KHR = self.table.pointee.vkGetDisplayPlaneCapabilities2KHR!
        return try displayPlaneInfo.withCStruct { ptr_displayPlaneInfo throws(Result) in
            var out = VkDisplayPlaneCapabilities2KHR()
            out.sType = VK_STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR
            try checkResult(
                vkGetDisplayPlaneCapabilities2KHR(self.handle, ptr_displayPlaneInfo, &out)
            )
            return DisplayPlaneCapabilities2KHR(cStruct: out)
        }
    }

    public func getCalibrateableTimeDomainsKHR() throws(Result) -> Array<TimeDomainKHR> {
        let vkGetPhysicalDeviceCalibrateableTimeDomainsKHR = self.table.pointee.vkGetPhysicalDeviceCalibrateableTimeDomainsKHR!
        return try enumerate { pTimeDomains, pTimeDomainCount in
            vkGetPhysicalDeviceCalibrateableTimeDomainsKHR(self.handle, pTimeDomainCount, pTimeDomains)
        }.map { TimeDomainKHR(rawValue: numericBitCast($0.rawValue))! }
    }

    public func getCooperativeMatrixPropertiesNV() throws(Result) -> Array<CooperativeMatrixPropertiesNV> {
        let vkGetPhysicalDeviceCooperativeMatrixPropertiesNV = self.table.pointee.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceCooperativeMatrixPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixPropertiesNV(cStruct: $0) }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSurfacePresentModes2EXT(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> Array<PresentModeKHR> {
        let vkGetPhysicalDeviceSurfacePresentModes2EXT = self.table.pointee.vkGetPhysicalDeviceSurfacePresentModes2EXT!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pPresentModes, pPresentModeCount in
                vkGetPhysicalDeviceSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, pPresentModeCount, pPresentModes)
            }.map { PresentModeKHR(rawValue: numericBitCast($0.rawValue))! }
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSurfacePresentModes2EXT(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> Array<PresentModeKHR> {
        let vkGetPhysicalDeviceSurfacePresentModes2EXT = self.table.pointee.vkGetPhysicalDeviceSurfacePresentModes2EXT!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            try enumerate { pPresentModes, pPresentModeCount in
                vkGetPhysicalDeviceSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, pPresentModeCount, pPresentModes)
            }.map { PresentModeKHR(rawValue: numericBitCast($0.rawValue))! }
        }
    }
    #endif

    public func getQueueFamilyPerformanceQueryCountersKHR(queueFamilyIndex: UInt32, counterCount: UnsafeMutablePointer<UInt32>, counters: UnsafeMutablePointer<VkPerformanceCounterKHR>? = nil, counterDescriptions: UnsafeMutablePointer<VkPerformanceCounterDescriptionKHR>? = nil) throws(Result) -> Void {
        let vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR = self.table.pointee.vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR!
        try checkResult(
            vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(self.handle, queueFamilyIndex, counterCount, counters, counterDescriptions)
        )
    }

    public func getQueueFamilyPerformanceQueryPassesKHR(_ performanceQueryCreateInfo: (some Chainable<QueryPoolPerformanceCreateInfoKHR>)) -> UInt32 {
        let vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = self.table.pointee.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR!
        return performanceQueryCreateInfo.withCStruct { ptr_performanceQueryCreateInfo in
            var out = UInt32()
            vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(self.handle, ptr_performanceQueryCreateInfo, &out)
            return out
        }
    }

    public func getQueueFamilyPerformanceQueryPassesKHR(_ performanceQueryCreateInfo: QueryPoolPerformanceCreateInfoKHR) -> UInt32 {
        let vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = self.table.pointee.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR!
        return performanceQueryCreateInfo.withCStruct { ptr_performanceQueryCreateInfo in
            var out = UInt32()
            vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(self.handle, ptr_performanceQueryCreateInfo, &out)
            return out
        }
    }

    public func getSupportedFramebufferMixedSamplesCombinationsNV() throws(Result) -> Array<FramebufferMixedSamplesCombinationNV> {
        let vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV = self.table.pointee.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV!
        return try enumerate { pCombinations, pCombinationCount in
            vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(self.handle, pCombinationCount, pCombinations)
        }.map { FramebufferMixedSamplesCombinationNV(cStruct: $0) }
    }

    public func getToolProperties() throws(Result) -> Array<PhysicalDeviceToolProperties> {
        let vkGetPhysicalDeviceToolProperties = self.table.pointee.vkGetPhysicalDeviceToolProperties!
        return try enumerate { pToolProperties, pToolCount in
            vkGetPhysicalDeviceToolProperties(self.handle, pToolCount, pToolProperties)
        }.map { PhysicalDeviceToolProperties(cStruct: $0) }
    }

    public func getFragmentShadingRatesKHR() throws(Result) -> Array<PhysicalDeviceFragmentShadingRateKHR> {
        let vkGetPhysicalDeviceFragmentShadingRatesKHR = self.table.pointee.vkGetPhysicalDeviceFragmentShadingRatesKHR!
        return try enumerate { pFragmentShadingRates, pFragmentShadingRateCount in
            vkGetPhysicalDeviceFragmentShadingRatesKHR(self.handle, pFragmentShadingRateCount, pFragmentShadingRates)
        }.map { PhysicalDeviceFragmentShadingRateKHR(cStruct: $0) }
    }

    public func getVideoCapabilitiesKHR(videoProfile: (some Chainable<VideoProfileInfoKHR>)) throws(Result) -> VideoCapabilitiesKHR {
        let vkGetPhysicalDeviceVideoCapabilitiesKHR = self.table.pointee.vkGetPhysicalDeviceVideoCapabilitiesKHR!
        return try videoProfile.withCStruct { ptr_videoProfile throws(Result) in
            var out = VkVideoCapabilitiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR
            try checkResult(
                vkGetPhysicalDeviceVideoCapabilitiesKHR(self.handle, ptr_videoProfile, &out)
            )
            return VideoCapabilitiesKHR(cStruct: out)
        }
    }

    public func getVideoCapabilitiesKHR(videoProfile: VideoProfileInfoKHR) throws(Result) -> VideoCapabilitiesKHR {
        let vkGetPhysicalDeviceVideoCapabilitiesKHR = self.table.pointee.vkGetPhysicalDeviceVideoCapabilitiesKHR!
        return try videoProfile.withCStruct { ptr_videoProfile throws(Result) in
            var out = VkVideoCapabilitiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR
            try checkResult(
                vkGetPhysicalDeviceVideoCapabilitiesKHR(self.handle, ptr_videoProfile, &out)
            )
            return VideoCapabilitiesKHR(cStruct: out)
        }
    }

    public func getVideoFormatPropertiesKHR(_ videoFormatInfo: (some Chainable<PhysicalDeviceVideoFormatInfoKHR>)) throws(Result) -> Array<VideoFormatPropertiesKHR> {
        let vkGetPhysicalDeviceVideoFormatPropertiesKHR = self.table.pointee.vkGetPhysicalDeviceVideoFormatPropertiesKHR!
        return try videoFormatInfo.withCStruct { ptr_videoFormatInfo throws(Result) in
            try enumerate { pVideoFormatProperties, pVideoFormatPropertyCount in
                vkGetPhysicalDeviceVideoFormatPropertiesKHR(self.handle, ptr_videoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties)
            }.map { VideoFormatPropertiesKHR(cStruct: $0) }
        }
    }

    public func getVideoFormatPropertiesKHR(_ videoFormatInfo: PhysicalDeviceVideoFormatInfoKHR) throws(Result) -> Array<VideoFormatPropertiesKHR> {
        let vkGetPhysicalDeviceVideoFormatPropertiesKHR = self.table.pointee.vkGetPhysicalDeviceVideoFormatPropertiesKHR!
        return try videoFormatInfo.withCStruct { ptr_videoFormatInfo throws(Result) in
            try enumerate { pVideoFormatProperties, pVideoFormatPropertyCount in
                vkGetPhysicalDeviceVideoFormatPropertiesKHR(self.handle, ptr_videoFormatInfo, pVideoFormatPropertyCount, pVideoFormatProperties)
            }.map { VideoFormatPropertiesKHR(cStruct: $0) }
        }
    }

    public func getVideoEncodeQualityLevelPropertiesKHR(_ qualityLevelInfo: (some Chainable<PhysicalDeviceVideoEncodeQualityLevelInfoKHR>)) throws(Result) -> VideoEncodeQualityLevelPropertiesKHR {
        let vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = self.table.pointee.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR!
        return try qualityLevelInfo.withCStruct { ptr_qualityLevelInfo throws(Result) in
            var out = VkVideoEncodeQualityLevelPropertiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR
            try checkResult(
                vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(self.handle, ptr_qualityLevelInfo, &out)
            )
            return VideoEncodeQualityLevelPropertiesKHR(cStruct: out)
        }
    }

    public func getVideoEncodeQualityLevelPropertiesKHR(_ qualityLevelInfo: PhysicalDeviceVideoEncodeQualityLevelInfoKHR) throws(Result) -> VideoEncodeQualityLevelPropertiesKHR {
        let vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = self.table.pointee.vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR!
        return try qualityLevelInfo.withCStruct { ptr_qualityLevelInfo throws(Result) in
            var out = VkVideoEncodeQualityLevelPropertiesKHR()
            out.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR
            try checkResult(
                vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(self.handle, ptr_qualityLevelInfo, &out)
            )
            return VideoEncodeQualityLevelPropertiesKHR(cStruct: out)
        }
    }

    public func acquireDrmDisplayEXT(drmFd: Int32, display: DisplayKHR) throws(Result) -> Void {
        let vkAcquireDrmDisplayEXT = self.table.pointee.vkAcquireDrmDisplayEXT!
        try checkResult(
            vkAcquireDrmDisplayEXT(self.handle, drmFd, display.handle)
        )
    }

    public func getDrmDisplayEXT(drmFd: Int32, connectorId: UInt32) throws(Result) -> DisplayKHR {
        let vkGetDrmDisplayEXT = self.table.pointee.vkGetDrmDisplayEXT!
        var out: VkDisplayKHR!
        try checkResult(
            vkGetDrmDisplayEXT(self.handle, drmFd, connectorId, &out)
        )
        return DisplayKHR(handle: out)
    }

    public func getOpticalFlowImageFormatsNV(_ opticalFlowImageFormatInfo: (some Chainable<OpticalFlowImageFormatInfoNV>)) throws(Result) -> Array<OpticalFlowImageFormatPropertiesNV> {
        let vkGetPhysicalDeviceOpticalFlowImageFormatsNV = self.table.pointee.vkGetPhysicalDeviceOpticalFlowImageFormatsNV!
        return try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
            try enumerate { pImageFormatProperties, pFormatCount in
                vkGetPhysicalDeviceOpticalFlowImageFormatsNV(self.handle, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
            }.map { OpticalFlowImageFormatPropertiesNV(cStruct: $0) }
        }
    }

    public func getOpticalFlowImageFormatsNV(_ opticalFlowImageFormatInfo: OpticalFlowImageFormatInfoNV) throws(Result) -> Array<OpticalFlowImageFormatPropertiesNV> {
        let vkGetPhysicalDeviceOpticalFlowImageFormatsNV = self.table.pointee.vkGetPhysicalDeviceOpticalFlowImageFormatsNV!
        return try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
            try enumerate { pImageFormatProperties, pFormatCount in
                vkGetPhysicalDeviceOpticalFlowImageFormatsNV(self.handle, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
            }.map { OpticalFlowImageFormatPropertiesNV(cStruct: $0) }
        }
    }

    public func getCooperativeMatrixPropertiesKHR() throws(Result) -> Array<CooperativeMatrixPropertiesKHR> {
        let vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR = self.table.pointee.vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixPropertiesKHR(cStruct: $0) }
    }

    public func getCooperativeMatrixFlexibleDimensionsPropertiesNV() throws(Result) -> Array<CooperativeMatrixFlexibleDimensionsPropertiesNV> {
        let vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV = self.table.pointee.vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeMatrixFlexibleDimensionsPropertiesNV(cStruct: $0) }
    }

    public func getCooperativeVectorPropertiesNV() throws(Result) -> Array<CooperativeVectorPropertiesNV> {
        let vkGetPhysicalDeviceCooperativeVectorPropertiesNV = self.table.pointee.vkGetPhysicalDeviceCooperativeVectorPropertiesNV!
        return try enumerate { pProperties, pPropertyCount in
            vkGetPhysicalDeviceCooperativeVectorPropertiesNV(self.handle, pPropertyCount, pProperties)
        }.map { CooperativeVectorPropertiesNV(cStruct: $0) }
    }

    public func getShaderInstrumentationMetricsARM() throws(Result) -> Array<ShaderInstrumentationMetricDescriptionARM> {
        let vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM = self.table.pointee.vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM!
        return try enumerate { pDescriptions, pDescriptionCount in
            vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM(self.handle, pDescriptionCount, pDescriptions)
        }.map { ShaderInstrumentationMetricDescriptionARM(cStruct: $0) }
    }

    public func getExternalTensorPropertiesARM(_ externalTensorInfo: (some Chainable<PhysicalDeviceExternalTensorInfoARM>)) -> ExternalTensorPropertiesARM {
        let vkGetPhysicalDeviceExternalTensorPropertiesARM = self.table.pointee.vkGetPhysicalDeviceExternalTensorPropertiesARM!
        return externalTensorInfo.withCStruct { ptr_externalTensorInfo in
            var out = VkExternalTensorPropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM
            vkGetPhysicalDeviceExternalTensorPropertiesARM(self.handle, ptr_externalTensorInfo, &out)
            return ExternalTensorPropertiesARM(cStruct: out)
        }
    }

    public func getExternalTensorPropertiesARM(_ externalTensorInfo: PhysicalDeviceExternalTensorInfoARM) -> ExternalTensorPropertiesARM {
        let vkGetPhysicalDeviceExternalTensorPropertiesARM = self.table.pointee.vkGetPhysicalDeviceExternalTensorPropertiesARM!
        return externalTensorInfo.withCStruct { ptr_externalTensorInfo in
            var out = VkExternalTensorPropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_EXTERNAL_TENSOR_PROPERTIES_ARM
            vkGetPhysicalDeviceExternalTensorPropertiesARM(self.handle, ptr_externalTensorInfo, &out)
            return ExternalTensorPropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyDataGraphPropertiesARM(queueFamilyIndex: UInt32) throws(Result) -> Array<QueueFamilyDataGraphPropertiesARM> {
        let vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM!
        return try enumerate { pQueueFamilyDataGraphProperties, pQueueFamilyDataGraphPropertyCount in
            vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM(self.handle, queueFamilyIndex, pQueueFamilyDataGraphPropertyCount, pQueueFamilyDataGraphProperties)
        }.map { QueueFamilyDataGraphPropertiesARM(cStruct: $0) }
    }

    public func getQueueFamilyDataGraphProcessingEnginePropertiesARM(_ queueFamilyDataGraphProcessingEngineInfo: (some Chainable<PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM>)) -> QueueFamilyDataGraphProcessingEnginePropertiesARM {
        let vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM!
        return queueFamilyDataGraphProcessingEngineInfo.withCStruct { ptr_queueFamilyDataGraphProcessingEngineInfo in
            var out = VkQueueFamilyDataGraphProcessingEnginePropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM
            vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM(self.handle, ptr_queueFamilyDataGraphProcessingEngineInfo, &out)
            return QueueFamilyDataGraphProcessingEnginePropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyDataGraphProcessingEnginePropertiesARM(_ queueFamilyDataGraphProcessingEngineInfo: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM) -> QueueFamilyDataGraphProcessingEnginePropertiesARM {
        let vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM!
        return queueFamilyDataGraphProcessingEngineInfo.withCStruct { ptr_queueFamilyDataGraphProcessingEngineInfo in
            var out = VkQueueFamilyDataGraphProcessingEnginePropertiesARM()
            out.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM
            vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM(self.handle, ptr_queueFamilyDataGraphProcessingEngineInfo, &out)
            return QueueFamilyDataGraphProcessingEnginePropertiesARM(cStruct: out)
        }
    }

    public func getQueueFamilyPerformanceCountersByRegionARM(queueFamilyIndex: UInt32, counterCount: UnsafeMutablePointer<UInt32>, counters: UnsafeMutablePointer<VkPerformanceCounterARM>? = nil, counterDescriptions: UnsafeMutablePointer<VkPerformanceCounterDescriptionARM>? = nil) throws(Result) -> Void {
        let vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM = self.table.pointee.vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM!
        try checkResult(
            vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM(self.handle, queueFamilyIndex, counterCount, counters, counterDescriptions)
        )
    }

    public func getDescriptorSizeEXT(descriptorType: DescriptorType) -> VkDeviceSize {
        let vkGetPhysicalDeviceDescriptorSizeEXT = self.table.pointee.vkGetPhysicalDeviceDescriptorSizeEXT!
        return vkGetPhysicalDeviceDescriptorSizeEXT(self.handle, VkDescriptorType(rawValue: VkDescriptorType.RawValue(descriptorType.rawValue)))
    }

    public func getQueueFamilyDataGraphEngineOperationPropertiesARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: (some Chainable<QueueFamilyDataGraphPropertiesARM>)) throws(Result) -> VkBaseOutStructure {
        let vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM!
        return try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, &out)
            )
            return out
        }
    }

    public func getQueueFamilyDataGraphEngineOperationPropertiesARM(queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: QueueFamilyDataGraphPropertiesARM) throws(Result) -> VkBaseOutStructure {
        let vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM!
        return try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, &out)
            )
            return out
        }
    }

    public func getQueueFamilyDataGraphOpticalFlowImageFormatsARM(_ opticalFlowImageFormatInfo: (some Chainable<DataGraphOpticalFlowImageFormatInfoARM>), queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: (some Chainable<QueueFamilyDataGraphPropertiesARM>)) throws(Result) -> Array<DataGraphOpticalFlowImageFormatPropertiesARM> {
        let vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM!
        return try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
                try enumerate { pImageFormatProperties, pFormatCount in
                    vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
                }.map { DataGraphOpticalFlowImageFormatPropertiesARM(cStruct: $0) }
            }
        }
    }

    public func getQueueFamilyDataGraphOpticalFlowImageFormatsARM(_ opticalFlowImageFormatInfo: DataGraphOpticalFlowImageFormatInfoARM, queueFamilyIndex: UInt32, queueFamilyDataGraphProperties: QueueFamilyDataGraphPropertiesARM) throws(Result) -> Array<DataGraphOpticalFlowImageFormatPropertiesARM> {
        let vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM = self.table.pointee.vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM!
        return try queueFamilyDataGraphProperties.withCStruct { ptr_queueFamilyDataGraphProperties throws(Result) in
            try opticalFlowImageFormatInfo.withCStruct { ptr_opticalFlowImageFormatInfo throws(Result) in
                try enumerate { pImageFormatProperties, pFormatCount in
                    vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM(self.handle, queueFamilyIndex, ptr_queueFamilyDataGraphProperties, ptr_opticalFlowImageFormatInfo, pFormatCount, pImageFormatProperties)
                }.map { DataGraphOpticalFlowImageFormatPropertiesARM(cStruct: $0) }
            }
        }
    }
}

public struct Queue: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .queue
    public let handle: VkQueue
    public let table: UnsafePointer<DeviceDispatchTable>

    public init(handle: VkQueue!, table: UnsafePointer<DeviceDispatchTable>) {
        self.handle = handle
        self.table = table
    }

    public func submit(submits: (AnyChainableArray<SubmitInfo>), fence: Fence? = nil) throws(Result) -> Void {
        let vkQueueSubmit = self.table.pointee.vkQueueSubmit!
        return try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                vkQueueSubmit(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func submit(submits: Array<SubmitInfo> = [], fence: Fence? = nil) throws(Result) -> Void {
        let vkQueueSubmit = self.table.pointee.vkQueueSubmit!
        return try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                vkQueueSubmit(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func waitIdle() throws(Result) -> Void {
        let vkQueueWaitIdle = self.table.pointee.vkQueueWaitIdle!
        try checkResult(
            vkQueueWaitIdle(self.handle)
        )
    }

    public func bindSparse(_ bindInfo: (AnyChainableArray<BindSparseInfo>), fence: Fence? = nil) throws(Result) -> Void {
        let vkQueueBindSparse = self.table.pointee.vkQueueBindSparse!
        return try bindInfo.withCStructBufferPointer { ptr_bindInfo throws(Result) in
            try checkResult(
                vkQueueBindSparse(self.handle, UInt32(ptr_bindInfo.count), ptr_bindInfo.baseAddress, fence?.handle)
            )
        }
    }

    public func bindSparse(_ bindInfo: Array<BindSparseInfo> = [], fence: Fence? = nil) throws(Result) -> Void {
        let vkQueueBindSparse = self.table.pointee.vkQueueBindSparse!
        return try bindInfo.withCStructBufferPointer { ptr_bindInfo throws(Result) in
            try checkResult(
                vkQueueBindSparse(self.handle, UInt32(ptr_bindInfo.count), ptr_bindInfo.baseAddress, fence?.handle)
            )
        }
    }

    public func presentKHR(_ presentInfo: (some Chainable<PresentInfoKHR>)) throws(Result) -> Void {
        let vkQueuePresentKHR = self.table.pointee.vkQueuePresentKHR!
        return try presentInfo.withCStruct { ptr_presentInfo throws(Result) in
            try checkResult(
                vkQueuePresentKHR(self.handle, ptr_presentInfo)
            )
        }
    }

    public func presentKHR(_ presentInfo: PresentInfoKHR) throws(Result) -> Void {
        let vkQueuePresentKHR = self.table.pointee.vkQueuePresentKHR!
        return try presentInfo.withCStruct { ptr_presentInfo throws(Result) in
            try checkResult(
                vkQueuePresentKHR(self.handle, ptr_presentInfo)
            )
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        let vkQueueBeginDebugUtilsLabelEXT = self.table.pointee.vkQueueBeginDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkQueueBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        let vkQueueBeginDebugUtilsLabelEXT = self.table.pointee.vkQueueBeginDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkQueueBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func endDebugUtilsLabelEXT() -> Void {
        let vkQueueEndDebugUtilsLabelEXT = self.table.pointee.vkQueueEndDebugUtilsLabelEXT!
        vkQueueEndDebugUtilsLabelEXT(self.handle)
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        let vkQueueInsertDebugUtilsLabelEXT = self.table.pointee.vkQueueInsertDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkQueueInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        let vkQueueInsertDebugUtilsLabelEXT = self.table.pointee.vkQueueInsertDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkQueueInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func getCheckpointDataNV() -> Array<CheckpointDataNV> {
        let vkGetQueueCheckpointDataNV = self.table.pointee.vkGetQueueCheckpointDataNV!
        return enumerate { pCheckpointData, pCheckpointDataCount in
            vkGetQueueCheckpointDataNV(self.handle, pCheckpointDataCount, pCheckpointData)
        }.map { CheckpointDataNV(cStruct: $0) }
    }

    public func setPerformanceConfigurationINTEL(configuration: PerformanceConfigurationINTEL) throws(Result) -> Void {
        let vkQueueSetPerformanceConfigurationINTEL = self.table.pointee.vkQueueSetPerformanceConfigurationINTEL!
        try checkResult(
            vkQueueSetPerformanceConfigurationINTEL(self.handle, configuration.handle)
        )
    }

    public func submit2(submits: (AnyChainableArray<SubmitInfo2>), fence: Fence? = nil) throws(Result) -> Void {
        let vkQueueSubmit2 = self.table.pointee.vkQueueSubmit2!
        return try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                vkQueueSubmit2(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func submit2(submits: Array<SubmitInfo2> = [], fence: Fence? = nil) throws(Result) -> Void {
        let vkQueueSubmit2 = self.table.pointee.vkQueueSubmit2!
        return try submits.withCStructBufferPointer { ptr_submits throws(Result) in
            try checkResult(
                vkQueueSubmit2(self.handle, UInt32(ptr_submits.count), ptr_submits.baseAddress, fence?.handle)
            )
        }
    }

    public func getCheckpointData2NV() -> Array<CheckpointData2NV> {
        let vkGetQueueCheckpointData2NV = self.table.pointee.vkGetQueueCheckpointData2NV!
        return enumerate { pCheckpointData, pCheckpointDataCount in
            vkGetQueueCheckpointData2NV(self.handle, pCheckpointDataCount, pCheckpointData)
        }.map { CheckpointData2NV(cStruct: $0) }
    }

    public func notifyOutOfBandNV(_ queueTypeInfo: (some Chainable<OutOfBandQueueTypeInfoNV>)) -> Void {
        let vkQueueNotifyOutOfBandNV = self.table.pointee.vkQueueNotifyOutOfBandNV!
        return queueTypeInfo.withCStruct { ptr_queueTypeInfo in
            vkQueueNotifyOutOfBandNV(self.handle, ptr_queueTypeInfo)
        }
    }

    public func notifyOutOfBandNV(_ queueTypeInfo: OutOfBandQueueTypeInfoNV) -> Void {
        let vkQueueNotifyOutOfBandNV = self.table.pointee.vkQueueNotifyOutOfBandNV!
        return queueTypeInfo.withCStruct { ptr_queueTypeInfo in
            vkQueueNotifyOutOfBandNV(self.handle, ptr_queueTypeInfo)
        }
    }

    public func setPerfHintQCOM(_ perfHintInfo: (some Chainable<PerfHintInfoQCOM>)) throws(Result) -> Void {
        let vkQueueSetPerfHintQCOM = self.table.pointee.vkQueueSetPerfHintQCOM!
        return try perfHintInfo.withCStruct { ptr_perfHintInfo throws(Result) in
            try checkResult(
                vkQueueSetPerfHintQCOM(self.handle, ptr_perfHintInfo)
            )
        }
    }

    public func setPerfHintQCOM(_ perfHintInfo: PerfHintInfoQCOM) throws(Result) -> Void {
        let vkQueueSetPerfHintQCOM = self.table.pointee.vkQueueSetPerfHintQCOM!
        return try perfHintInfo.withCStruct { ptr_perfHintInfo throws(Result) in
            try checkResult(
                vkQueueSetPerfHintQCOM(self.handle, ptr_perfHintInfo)
            )
        }
    }
}

public struct DeviceMemory: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .deviceMemory
    public let handle: VkDeviceMemory

    public init(handle: VkDeviceMemory!) {
        self.handle = handle
    }
}

public struct CommandPool: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .commandPool
    public let handle: VkCommandPool

    public init(handle: VkCommandPool!) {
        self.handle = handle
    }
}

public struct Buffer: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .buffer
    public let handle: VkBuffer

    public init(handle: VkBuffer!) {
        self.handle = handle
    }
}

public struct BufferView: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .bufferView
    public let handle: VkBufferView

    public init(handle: VkBufferView!) {
        self.handle = handle
    }
}

public struct Image: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .image
    public let handle: VkImage

    public init(handle: VkImage!) {
        self.handle = handle
    }
}

public struct ImageView: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .imageView
    public let handle: VkImageView

    public init(handle: VkImageView!) {
        self.handle = handle
    }
}

public struct ShaderModule: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .shaderModule
    public let handle: VkShaderModule

    public init(handle: VkShaderModule!) {
        self.handle = handle
    }
}

public struct Pipeline: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .pipeline
    public let handle: VkPipeline

    public init(handle: VkPipeline!) {
        self.handle = handle
    }
}

public struct PipelineLayout: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .pipelineLayout
    public let handle: VkPipelineLayout

    public init(handle: VkPipelineLayout!) {
        self.handle = handle
    }
}

public struct Sampler: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .sampler
    public let handle: VkSampler

    public init(handle: VkSampler!) {
        self.handle = handle
    }
}

public struct DescriptorSet: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .descriptorSet
    public let handle: VkDescriptorSet

    public init(handle: VkDescriptorSet!) {
        self.handle = handle
    }
}

public struct DescriptorSetLayout: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .descriptorSetLayout
    public let handle: VkDescriptorSetLayout

    public init(handle: VkDescriptorSetLayout!) {
        self.handle = handle
    }
}

public struct DescriptorPool: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .descriptorPool
    public let handle: VkDescriptorPool

    public init(handle: VkDescriptorPool!) {
        self.handle = handle
    }
}

public struct Fence: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .fence
    public let handle: VkFence

    public init(handle: VkFence!) {
        self.handle = handle
    }
}

public struct Semaphore: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .semaphore
    public let handle: VkSemaphore

    public init(handle: VkSemaphore!) {
        self.handle = handle
    }
}

public struct Event: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .event
    public let handle: VkEvent

    public init(handle: VkEvent!) {
        self.handle = handle
    }
}

public struct QueryPool: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .queryPool
    public let handle: VkQueryPool

    public init(handle: VkQueryPool!) {
        self.handle = handle
    }
}

public struct Framebuffer: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .framebuffer
    public let handle: VkFramebuffer

    public init(handle: VkFramebuffer!) {
        self.handle = handle
    }
}

public struct RenderPass: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .renderPass
    public let handle: VkRenderPass

    public init(handle: VkRenderPass!) {
        self.handle = handle
    }
}

public struct PipelineCache: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .pipelineCache
    public let handle: VkPipelineCache

    public init(handle: VkPipelineCache!) {
        self.handle = handle
    }
}

public struct PipelineBinaryKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .pipelineBinaryKHR
    public let handle: VkPipelineBinaryKHR

    public init(handle: VkPipelineBinaryKHR!) {
        self.handle = handle
    }
}

public struct IndirectCommandsLayoutNV: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .indirectCommandsLayoutNV
    public let handle: VkIndirectCommandsLayoutNV

    public init(handle: VkIndirectCommandsLayoutNV!) {
        self.handle = handle
    }
}

public struct IndirectCommandsLayoutEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .indirectCommandsLayoutEXT
    public let handle: VkIndirectCommandsLayoutEXT

    public init(handle: VkIndirectCommandsLayoutEXT!) {
        self.handle = handle
    }
}

public struct IndirectExecutionSetEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .indirectExecutionSetEXT
    public let handle: VkIndirectExecutionSetEXT

    public init(handle: VkIndirectExecutionSetEXT!) {
        self.handle = handle
    }
}

public struct DescriptorUpdateTemplate: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .descriptorUpdateTemplate
    public let handle: VkDescriptorUpdateTemplate

    public init(handle: VkDescriptorUpdateTemplate!) {
        self.handle = handle
    }
}

public struct SamplerYcbcrConversion: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .samplerYcbcrConversion
    public let handle: VkSamplerYcbcrConversion

    public init(handle: VkSamplerYcbcrConversion!) {
        self.handle = handle
    }
}

public struct ValidationCacheEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .validationCacheEXT
    public let handle: VkValidationCacheEXT

    public init(handle: VkValidationCacheEXT!) {
        self.handle = handle
    }
}

public struct AccelerationStructureKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .accelerationStructureKHR
    public let handle: VkAccelerationStructureKHR

    public init(handle: VkAccelerationStructureKHR!) {
        self.handle = handle
    }
}

public struct AccelerationStructureNV: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .accelerationStructureNV
    public let handle: VkAccelerationStructureNV

    public init(handle: VkAccelerationStructureNV!) {
        self.handle = handle
    }
}

public struct PerformanceConfigurationINTEL: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .performanceConfigurationINTEL
    public let handle: VkPerformanceConfigurationINTEL

    public init(handle: VkPerformanceConfigurationINTEL!) {
        self.handle = handle
    }
}

#if VK_USE_PLATFORM_FUCHSIA
public struct BufferCollectionFUCHSIA: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .bufferCollectionFUCHSIA
    public let handle: VkBufferCollectionFUCHSIA

    public init(handle: VkBufferCollectionFUCHSIA!) {
        self.handle = handle
    }
}
#endif

public struct DeferredOperationKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .deferredOperationKHR
    public let handle: VkDeferredOperationKHR

    public init(handle: VkDeferredOperationKHR!) {
        self.handle = handle
    }
}

public struct PrivateDataSlot: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .privateDataSlot
    public let handle: VkPrivateDataSlot

    public init(handle: VkPrivateDataSlot!) {
        self.handle = handle
    }
}

public struct CuModuleNVX: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .cuModuleNVX
    public let handle: VkCuModuleNVX

    public init(handle: VkCuModuleNVX!) {
        self.handle = handle
    }
}

public struct CuFunctionNVX: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .cuFunctionNVX
    public let handle: VkCuFunctionNVX

    public init(handle: VkCuFunctionNVX!) {
        self.handle = handle
    }
}

public struct OpticalFlowSessionNV: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .opticalFlowSessionNV
    public let handle: VkOpticalFlowSessionNV

    public init(handle: VkOpticalFlowSessionNV!) {
        self.handle = handle
    }
}

public struct MicromapEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .micromapEXT
    public let handle: VkMicromapEXT

    public init(handle: VkMicromapEXT!) {
        self.handle = handle
    }
}

public struct ShaderEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .shaderEXT
    public let handle: VkShaderEXT

    public init(handle: VkShaderEXT!) {
        self.handle = handle
    }
}

public struct TensorARM: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .tensorARM
    public let handle: VkTensorARM

    public init(handle: VkTensorARM!) {
        self.handle = handle
    }
}

public struct TensorViewARM: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .tensorViewARM
    public let handle: VkTensorViewARM

    public init(handle: VkTensorViewARM!) {
        self.handle = handle
    }
}

public struct DataGraphPipelineSessionARM: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .dataGraphPipelineSessionARM
    public let handle: VkDataGraphPipelineSessionARM

    public init(handle: VkDataGraphPipelineSessionARM!) {
        self.handle = handle
    }
}

public struct ShaderInstrumentationARM: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .shaderInstrumentationARM
    public let handle: VkShaderInstrumentationARM

    public init(handle: VkShaderInstrumentationARM!) {
        self.handle = handle
    }
}

public struct GpaSessionAMD: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .gpaSessionAMD
    public let handle: VkGpaSessionAMD

    public init(handle: VkGpaSessionAMD!) {
        self.handle = handle
    }
}

public struct DisplayKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .displayKHR
    public let handle: VkDisplayKHR

    public init(handle: VkDisplayKHR!) {
        self.handle = handle
    }
}

public struct DisplayModeKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .displayModeKHR
    public let handle: VkDisplayModeKHR

    public init(handle: VkDisplayModeKHR!) {
        self.handle = handle
    }
}

public struct SurfaceKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .surfaceKHR
    public let handle: VkSurfaceKHR

    public init(handle: VkSurfaceKHR!) {
        self.handle = handle
    }
}

public struct SwapchainKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .swapchainKHR
    public let handle: VkSwapchainKHR

    public init(handle: VkSwapchainKHR!) {
        self.handle = handle
    }
}

public struct DebugReportCallbackEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .debugReportCallbackEXT
    public let handle: VkDebugReportCallbackEXT

    public init(handle: VkDebugReportCallbackEXT!) {
        self.handle = handle
    }
}

public struct DebugUtilsMessengerEXT: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .debugUtilsMessengerEXT
    public let handle: VkDebugUtilsMessengerEXT

    public init(handle: VkDebugUtilsMessengerEXT!) {
        self.handle = handle
    }
}

public struct VideoSessionKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .videoSessionKHR
    public let handle: VkVideoSessionKHR

    public init(handle: VkVideoSessionKHR!) {
        self.handle = handle
    }
}

public struct VideoSessionParametersKHR: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .videoSessionParametersKHR
    public let handle: VkVideoSessionParametersKHR

    public init(handle: VkVideoSessionParametersKHR!) {
        self.handle = handle
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
public struct CudaModuleNV: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .cudaModuleNV
    public let handle: VkCudaModuleNV

    public init(handle: VkCudaModuleNV!) {
        self.handle = handle
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
public struct CudaFunctionNV: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .cudaFunctionNV
    public let handle: VkCudaFunctionNV

    public init(handle: VkCudaFunctionNV!) {
        self.handle = handle
    }
}
#endif

public struct ExternalComputeQueueNV: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .externalComputeQueueNV
    public let handle: VkExternalComputeQueueNV
    public let table: UnsafePointer<DeviceDispatchTable>

    public init(handle: VkExternalComputeQueueNV!, table: UnsafePointer<DeviceDispatchTable>) {
        self.handle = handle
        self.table = table
    }

    public func getDataNV(data: UnsafeMutableRawPointer) -> ExternalComputeQueueDataParamsNV {
        let vkGetExternalComputeQueueDataNV = self.table.pointee.vkGetExternalComputeQueueDataNV!
        var out = VkExternalComputeQueueDataParamsNV()
        out.sType = VK_STRUCTURE_TYPE_EXTERNAL_COMPUTE_QUEUE_DATA_PARAMS_NV
        vkGetExternalComputeQueueDataNV(self.handle, &out, data)
        return ExternalComputeQueueDataParamsNV(cStruct: out)
    }
}

