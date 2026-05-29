extension Chain where Base == ApplicationInfo {
    public func push<NewValue: ApplicationInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceQueueCreateInfo {
    public func push<NewValue: DeviceQueueCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceCreateInfo {
    public func push<NewValue: DeviceCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == InstanceCreateInfo {
    public func push<NewValue: InstanceCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryAllocateInfo {
    public func push<NewValue: MemoryAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MappedMemoryRange {
    public func push<NewValue: MappedMemoryRangeExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteDescriptorSet {
    public func push<NewValue: WriteDescriptorSetExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyDescriptorSet {
    public func push<NewValue: CopyDescriptorSetExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferUsageFlags2CreateInfo {
    public func push<NewValue: BufferUsageFlags2CreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferCreateInfo {
    public func push<NewValue: BufferCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferViewCreateInfo {
    public func push<NewValue: BufferViewCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryBarrier {
    public func push<NewValue: MemoryBarrierExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferMemoryBarrier {
    public func push<NewValue: BufferMemoryBarrierExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageMemoryBarrier {
    public func push<NewValue: ImageMemoryBarrierExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageCreateInfo {
    public func push<NewValue: ImageCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewCreateInfo {
    public func push<NewValue: ImageViewCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindSparseInfo {
    public func push<NewValue: BindSparseInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyMemoryIndirectInfoKHR {
    public func push<NewValue: CopyMemoryIndirectInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyMemoryToImageIndirectInfoKHR {
    public func push<NewValue: CopyMemoryToImageIndirectInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderModuleCreateInfo {
    public func push<NewValue: ShaderModuleCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetLayoutCreateInfo {
    public func push<NewValue: DescriptorSetLayoutCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorPoolCreateInfo {
    public func push<NewValue: DescriptorPoolCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetAllocateInfo {
    public func push<NewValue: DescriptorSetAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineShaderStageCreateInfo {
    public func push<NewValue: PipelineShaderStageCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ComputePipelineCreateInfo {
    public func push<NewValue: ComputePipelineCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ComputePipelineIndirectBufferInfoNV {
    public func push<NewValue: ComputePipelineIndirectBufferInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCreateFlags2CreateInfo {
    public func push<NewValue: PipelineCreateFlags2CreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineVertexInputStateCreateInfo {
    public func push<NewValue: PipelineVertexInputStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineInputAssemblyStateCreateInfo {
    public func push<NewValue: PipelineInputAssemblyStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineTessellationStateCreateInfo {
    public func push<NewValue: PipelineTessellationStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportStateCreateInfo {
    public func push<NewValue: PipelineViewportStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationStateCreateInfo {
    public func push<NewValue: PipelineRasterizationStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineMultisampleStateCreateInfo {
    public func push<NewValue: PipelineMultisampleStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineColorBlendStateCreateInfo {
    public func push<NewValue: PipelineColorBlendStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineDynamicStateCreateInfo {
    public func push<NewValue: PipelineDynamicStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineDepthStencilStateCreateInfo {
    public func push<NewValue: PipelineDepthStencilStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GraphicsPipelineCreateInfo {
    public func push<NewValue: GraphicsPipelineCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCacheCreateInfo {
    public func push<NewValue: PipelineCacheCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineBinaryKeyKHR {
    public func push<NewValue: PipelineBinaryKeyKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCreateInfoKHR {
    public func push<NewValue: PipelineCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineBinaryCreateInfoKHR {
    public func push<NewValue: PipelineBinaryCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineBinaryHandlesInfoKHR {
    public func push<NewValue: PipelineBinaryHandlesInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineBinaryInfoKHR {
    public func push<NewValue: PipelineBinaryInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ReleaseCapturedPipelineDataInfoKHR {
    public func push<NewValue: ReleaseCapturedPipelineDataInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineBinaryDataInfoKHR {
    public func push<NewValue: PipelineBinaryDataInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineLayoutCreateInfo {
    public func push<NewValue: PipelineLayoutCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerCreateInfo {
    public func push<NewValue: SamplerCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandPoolCreateInfo {
    public func push<NewValue: CommandPoolCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferAllocateInfo {
    public func push<NewValue: CommandBufferAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferInheritanceInfo {
    public func push<NewValue: CommandBufferInheritanceInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferBeginInfo {
    public func push<NewValue: CommandBufferBeginInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassBeginInfo {
    public func push<NewValue: RenderPassBeginInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassCreateInfo {
    public func push<NewValue: RenderPassCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == EventCreateInfo {
    public func push<NewValue: EventCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FenceCreateInfo {
    public func push<NewValue: FenceCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SemaphoreCreateInfo {
    public func push<NewValue: SemaphoreCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueryPoolCreateInfo {
    public func push<NewValue: QueryPoolCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FramebufferCreateInfo {
    public func push<NewValue: FramebufferCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubmitInfo {
    public func push<NewValue: SubmitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayModeCreateInfoKHR {
    public func push<NewValue: DisplayModeCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplaySurfaceCreateInfoKHR {
    public func push<NewValue: DisplaySurfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplaySurfaceStereoCreateInfoNV {
    public func push<NewValue: DisplaySurfaceStereoCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayPresentInfoKHR {
    public func push<NewValue: DisplayPresentInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == AndroidSurfaceCreateInfoKHR {
    public func push<NewValue: AndroidSurfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_VI_NN
extension Chain where Base == ViSurfaceCreateInfoNN {
    public func push<NewValue: ViSurfaceCreateInfoNNExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WAYLAND_KHR
extension Chain where Base == WaylandSurfaceCreateInfoKHR {
    public func push<NewValue: WaylandSurfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_UBM_SEC
extension Chain where Base == UbmSurfaceCreateInfoSEC {
    public func push<NewValue: UbmSurfaceCreateInfoSECExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == Win32SurfaceCreateInfoKHR {
    public func push<NewValue: Win32SurfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_XLIB_KHR
extension Chain where Base == XlibSurfaceCreateInfoKHR {
    public func push<NewValue: XlibSurfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_XCB_KHR
extension Chain where Base == XcbSurfaceCreateInfoKHR {
    public func push<NewValue: XcbSurfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_DIRECTFB_EXT
extension Chain where Base == DirectFBSurfaceCreateInfoEXT {
    public func push<NewValue: DirectFBSurfaceCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == ImagePipeSurfaceCreateInfoFUCHSIA {
    public func push<NewValue: ImagePipeSurfaceCreateInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_GGP
extension Chain where Base == StreamDescriptorSurfaceCreateInfoGGP {
    public func push<NewValue: StreamDescriptorSurfaceCreateInfoGGPExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_SCREEN_QNX
extension Chain where Base == ScreenSurfaceCreateInfoQNX {
    public func push<NewValue: ScreenSurfaceCreateInfoQNXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == SwapchainCreateInfoKHR {
    public func push<NewValue: SwapchainCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentInfoKHR {
    public func push<NewValue: PresentInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugReportCallbackCreateInfoEXT {
    public func push<NewValue: DebugReportCallbackCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ValidationFlagsEXT {
    public func push<NewValue: ValidationFlagsEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ValidationFeaturesEXT {
    public func push<NewValue: ValidationFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == LayerSettingsCreateInfoEXT {
    public func push<NewValue: LayerSettingsCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationStateRasterizationOrderAMD {
    public func push<NewValue: PipelineRasterizationStateRasterizationOrderAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugMarkerObjectNameInfoEXT {
    public func push<NewValue: DebugMarkerObjectNameInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugMarkerObjectTagInfoEXT {
    public func push<NewValue: DebugMarkerObjectTagInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugMarkerMarkerInfoEXT {
    public func push<NewValue: DebugMarkerMarkerInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DedicatedAllocationImageCreateInfoNV {
    public func push<NewValue: DedicatedAllocationImageCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DedicatedAllocationBufferCreateInfoNV {
    public func push<NewValue: DedicatedAllocationBufferCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DedicatedAllocationMemoryAllocateInfoNV {
    public func push<NewValue: DedicatedAllocationMemoryAllocateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalMemoryImageCreateInfoNV {
    public func push<NewValue: ExternalMemoryImageCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExportMemoryAllocateInfoNV {
    public func push<NewValue: ExportMemoryAllocateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ImportMemoryWin32HandleInfoNV {
    public func push<NewValue: ImportMemoryWin32HandleInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ExportMemoryWin32HandleInfoNV {
    public func push<NewValue: ExportMemoryWin32HandleInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == Win32KeyedMutexAcquireReleaseInfoNV {
    public func push<NewValue: Win32KeyedMutexAcquireReleaseInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceDeviceGeneratedCommandsFeaturesNV {
    public func push<NewValue: PhysicalDeviceDeviceGeneratedCommandsFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PushConstantBankInfoNV {
    public func push<NewValue: PushConstantBankInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePushConstantBankFeaturesNV {
    public func push<NewValue: PhysicalDevicePushConstantBankFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePushConstantBankPropertiesNV {
    public func push<NewValue: PhysicalDevicePushConstantBankPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV {
    public func push<NewValue: PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DevicePrivateDataCreateInfo {
    public func push<NewValue: DevicePrivateDataCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PrivateDataSlotCreateInfo {
    public func push<NewValue: PrivateDataSlotCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePrivateDataFeatures {
    public func push<NewValue: PhysicalDevicePrivateDataFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDeviceGeneratedCommandsPropertiesNV {
    public func push<NewValue: PhysicalDeviceDeviceGeneratedCommandsPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceClusterAccelerationStructureFeaturesNV {
    public func push<NewValue: PhysicalDeviceClusterAccelerationStructureFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceClusterAccelerationStructurePropertiesNV {
    public func push<NewValue: PhysicalDeviceClusterAccelerationStructurePropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RayTracingPipelineClusterAccelerationStructureCreateInfoNV {
    public func push<NewValue: RayTracingPipelineClusterAccelerationStructureCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ClusterAccelerationStructureClustersBottomLevelInputNV {
    public func push<NewValue: ClusterAccelerationStructureClustersBottomLevelInputNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ClusterAccelerationStructureTriangleClusterInputNV {
    public func push<NewValue: ClusterAccelerationStructureTriangleClusterInputNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ClusterAccelerationStructureMoveObjectsInputNV {
    public func push<NewValue: ClusterAccelerationStructureMoveObjectsInputNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ClusterAccelerationStructureInputInfoNV {
    public func push<NewValue: ClusterAccelerationStructureInputInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ClusterAccelerationStructureCommandsInfoNV {
    public func push<NewValue: ClusterAccelerationStructureCommandsInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiDrawPropertiesEXT {
    public func push<NewValue: PhysicalDeviceMultiDrawPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GraphicsShaderGroupCreateInfoNV {
    public func push<NewValue: GraphicsShaderGroupCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GraphicsPipelineShaderGroupsCreateInfoNV {
    public func push<NewValue: GraphicsPipelineShaderGroupsCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectCommandsLayoutTokenNV {
    public func push<NewValue: IndirectCommandsLayoutTokenNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectCommandsLayoutCreateInfoNV {
    public func push<NewValue: IndirectCommandsLayoutCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeneratedCommandsInfoNV {
    public func push<NewValue: GeneratedCommandsInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeneratedCommandsMemoryRequirementsInfoNV {
    public func push<NewValue: GeneratedCommandsMemoryRequirementsInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineIndirectDeviceAddressInfoNV {
    public func push<NewValue: PipelineIndirectDeviceAddressInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFeatures2 {
    public func push<NewValue: PhysicalDeviceFeatures2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceProperties2 {
    public func push<NewValue: PhysicalDeviceProperties2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FormatProperties2 {
    public func push<NewValue: FormatProperties2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageFormatProperties2 {
    public func push<NewValue: ImageFormatProperties2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageFormatInfo2 {
    public func push<NewValue: PhysicalDeviceImageFormatInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyProperties2 {
    public func push<NewValue: QueueFamilyProperties2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMemoryProperties2 {
    public func push<NewValue: PhysicalDeviceMemoryProperties2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SparseImageFormatProperties2 {
    public func push<NewValue: SparseImageFormatProperties2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSparseImageFormatInfo2 {
    public func push<NewValue: PhysicalDeviceSparseImageFormatInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePushDescriptorProperties {
    public func push<NewValue: PhysicalDevicePushDescriptorPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDriverProperties {
    public func push<NewValue: PhysicalDeviceDriverPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentRegionsKHR {
    public func push<NewValue: PresentRegionsKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVariablePointersFeatures {
    public func push<NewValue: PhysicalDeviceVariablePointersFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExternalImageFormatInfo {
    public func push<NewValue: PhysicalDeviceExternalImageFormatInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalImageFormatProperties {
    public func push<NewValue: ExternalImageFormatPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExternalBufferInfo {
    public func push<NewValue: PhysicalDeviceExternalBufferInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalBufferProperties {
    public func push<NewValue: ExternalBufferPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceIDProperties {
    public func push<NewValue: PhysicalDeviceIDPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalMemoryImageCreateInfo {
    public func push<NewValue: ExternalMemoryImageCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalMemoryBufferCreateInfo {
    public func push<NewValue: ExternalMemoryBufferCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExportMemoryAllocateInfo {
    public func push<NewValue: ExportMemoryAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ImportMemoryWin32HandleInfoKHR {
    public func push<NewValue: ImportMemoryWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ExportMemoryWin32HandleInfoKHR {
    public func push<NewValue: ExportMemoryWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == ImportMemoryZirconHandleInfoFUCHSIA {
    public func push<NewValue: ImportMemoryZirconHandleInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == MemoryZirconHandlePropertiesFUCHSIA {
    public func push<NewValue: MemoryZirconHandlePropertiesFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == MemoryGetZirconHandleInfoFUCHSIA {
    public func push<NewValue: MemoryGetZirconHandleInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == MemoryWin32HandlePropertiesKHR {
    public func push<NewValue: MemoryWin32HandlePropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == MemoryGetWin32HandleInfoKHR {
    public func push<NewValue: MemoryGetWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == ImportMemoryFdInfoKHR {
    public func push<NewValue: ImportMemoryFdInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryFdPropertiesKHR {
    public func push<NewValue: MemoryFdPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryGetFdInfoKHR {
    public func push<NewValue: MemoryGetFdInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == Win32KeyedMutexAcquireReleaseInfoKHR {
    public func push<NewValue: Win32KeyedMutexAcquireReleaseInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ImportMemoryMetalHandleInfoEXT {
    public func push<NewValue: ImportMemoryMetalHandleInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == MemoryMetalHandlePropertiesEXT {
    public func push<NewValue: MemoryMetalHandlePropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == MemoryGetMetalHandleInfoEXT {
    public func push<NewValue: MemoryGetMetalHandleInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceExternalSemaphoreInfo {
    public func push<NewValue: PhysicalDeviceExternalSemaphoreInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalSemaphoreProperties {
    public func push<NewValue: ExternalSemaphorePropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExportSemaphoreCreateInfo {
    public func push<NewValue: ExportSemaphoreCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ImportSemaphoreWin32HandleInfoKHR {
    public func push<NewValue: ImportSemaphoreWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ExportSemaphoreWin32HandleInfoKHR {
    public func push<NewValue: ExportSemaphoreWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == D3D12FenceSubmitInfoKHR {
    public func push<NewValue: D3D12FenceSubmitInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == SemaphoreGetWin32HandleInfoKHR {
    public func push<NewValue: SemaphoreGetWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == ImportSemaphoreFdInfoKHR {
    public func push<NewValue: ImportSemaphoreFdInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SemaphoreGetFdInfoKHR {
    public func push<NewValue: SemaphoreGetFdInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == ImportSemaphoreZirconHandleInfoFUCHSIA {
    public func push<NewValue: ImportSemaphoreZirconHandleInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == SemaphoreGetZirconHandleInfoFUCHSIA {
    public func push<NewValue: SemaphoreGetZirconHandleInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceExternalFenceInfo {
    public func push<NewValue: PhysicalDeviceExternalFenceInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalFenceProperties {
    public func push<NewValue: ExternalFencePropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExportFenceCreateInfo {
    public func push<NewValue: ExportFenceCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ImportFenceWin32HandleInfoKHR {
    public func push<NewValue: ImportFenceWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == ExportFenceWin32HandleInfoKHR {
    public func push<NewValue: ExportFenceWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == FenceGetWin32HandleInfoKHR {
    public func push<NewValue: FenceGetWin32HandleInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == ImportFenceFdInfoKHR {
    public func push<NewValue: ImportFenceFdInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FenceGetFdInfoKHR {
    public func push<NewValue: FenceGetFdInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiviewFeatures {
    public func push<NewValue: PhysicalDeviceMultiviewFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiviewProperties {
    public func push<NewValue: PhysicalDeviceMultiviewPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassMultiviewCreateInfo {
    public func push<NewValue: RenderPassMultiviewCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceCapabilities2EXT {
    public func push<NewValue: SurfaceCapabilities2EXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayPowerInfoEXT {
    public func push<NewValue: DisplayPowerInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceEventInfoEXT {
    public func push<NewValue: DeviceEventInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayEventInfoEXT {
    public func push<NewValue: DisplayEventInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainCounterCreateInfoEXT {
    public func push<NewValue: SwapchainCounterCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceGroupProperties {
    public func push<NewValue: PhysicalDeviceGroupPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryAllocateFlagsInfo {
    public func push<NewValue: MemoryAllocateFlagsInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindBufferMemoryInfo {
    public func push<NewValue: BindBufferMemoryInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindBufferMemoryDeviceGroupInfo {
    public func push<NewValue: BindBufferMemoryDeviceGroupInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindImageMemoryInfo {
    public func push<NewValue: BindImageMemoryInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindImageMemoryDeviceGroupInfo {
    public func push<NewValue: BindImageMemoryDeviceGroupInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupRenderPassBeginInfo {
    public func push<NewValue: DeviceGroupRenderPassBeginInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupCommandBufferBeginInfo {
    public func push<NewValue: DeviceGroupCommandBufferBeginInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupSubmitInfo {
    public func push<NewValue: DeviceGroupSubmitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupBindSparseInfo {
    public func push<NewValue: DeviceGroupBindSparseInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupPresentCapabilitiesKHR {
    public func push<NewValue: DeviceGroupPresentCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageSwapchainCreateInfoKHR {
    public func push<NewValue: ImageSwapchainCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindImageMemorySwapchainInfoKHR {
    public func push<NewValue: BindImageMemorySwapchainInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AcquireNextImageInfoKHR {
    public func push<NewValue: AcquireNextImageInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupPresentInfoKHR {
    public func push<NewValue: DeviceGroupPresentInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupDeviceCreateInfo {
    public func push<NewValue: DeviceGroupDeviceCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceGroupSwapchainCreateInfoKHR {
    public func push<NewValue: DeviceGroupSwapchainCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorUpdateTemplateCreateInfo {
    public func push<NewValue: DescriptorUpdateTemplateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentIdFeaturesKHR {
    public func push<NewValue: PhysicalDevicePresentIdFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentIdKHR {
    public func push<NewValue: PresentIdKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentId2FeaturesKHR {
    public func push<NewValue: PhysicalDevicePresentId2FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentId2KHR {
    public func push<NewValue: PresentId2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentWait2InfoKHR {
    public func push<NewValue: PresentWait2InfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentWaitFeaturesKHR {
    public func push<NewValue: PhysicalDevicePresentWaitFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentWait2FeaturesKHR {
    public func push<NewValue: PhysicalDevicePresentWait2FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentTimingFeaturesEXT {
    public func push<NewValue: PhysicalDevicePresentTimingFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentTimingSurfaceCapabilitiesEXT {
    public func push<NewValue: PresentTimingSurfaceCapabilitiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainTimingPropertiesEXT {
    public func push<NewValue: SwapchainTimingPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainTimeDomainPropertiesEXT {
    public func push<NewValue: SwapchainTimeDomainPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PastPresentationTimingInfoEXT {
    public func push<NewValue: PastPresentationTimingInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PastPresentationTimingEXT {
    public func push<NewValue: PastPresentationTimingEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PastPresentationTimingPropertiesEXT {
    public func push<NewValue: PastPresentationTimingPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentTimingInfoEXT {
    public func push<NewValue: PresentTimingInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentTimingsInfoEXT {
    public func push<NewValue: PresentTimingsInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainCalibratedTimestampInfoEXT {
    public func push<NewValue: SwapchainCalibratedTimestampInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == HdrMetadataEXT {
    public func push<NewValue: HdrMetadataEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == HdrVividDynamicMetadataHUAWEI {
    public func push<NewValue: HdrVividDynamicMetadataHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayNativeHdrSurfaceCapabilitiesAMD {
    public func push<NewValue: DisplayNativeHdrSurfaceCapabilitiesAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainDisplayNativeHdrCreateInfoAMD {
    public func push<NewValue: SwapchainDisplayNativeHdrCreateInfoAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PresentTimesInfoGOOGLE {
    public func push<NewValue: PresentTimesInfoGOOGLEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_IOS_MVK
extension Chain where Base == IOSSurfaceCreateInfoMVK {
    public func push<NewValue: IOSSurfaceCreateInfoMVKExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_MACOS_MVK
extension Chain where Base == MacOSSurfaceCreateInfoMVK {
    public func push<NewValue: MacOSSurfaceCreateInfoMVKExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == MetalSurfaceCreateInfoEXT {
    public func push<NewValue: MetalSurfaceCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PipelineViewportWScalingStateCreateInfoNV {
    public func push<NewValue: PipelineViewportWScalingStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportSwizzleStateCreateInfoNV {
    public func push<NewValue: PipelineViewportSwizzleStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDiscardRectanglePropertiesEXT {
    public func push<NewValue: PhysicalDeviceDiscardRectanglePropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineDiscardRectangleStateCreateInfoEXT {
    public func push<NewValue: PipelineDiscardRectangleStateCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX {
    public func push<NewValue: PhysicalDeviceMultiviewPerViewAttributesPropertiesNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassInputAttachmentAspectCreateInfo {
    public func push<NewValue: RenderPassInputAttachmentAspectCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSurfaceInfo2KHR {
    public func push<NewValue: PhysicalDeviceSurfaceInfo2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceCapabilities2KHR {
    public func push<NewValue: SurfaceCapabilities2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceFormat2KHR {
    public func push<NewValue: SurfaceFormat2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayProperties2KHR {
    public func push<NewValue: DisplayProperties2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayPlaneProperties2KHR {
    public func push<NewValue: DisplayPlaneProperties2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayModeProperties2KHR {
    public func push<NewValue: DisplayModeProperties2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayModeStereoPropertiesNV {
    public func push<NewValue: DisplayModeStereoPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayPlaneInfo2KHR {
    public func push<NewValue: DisplayPlaneInfo2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DisplayPlaneCapabilities2KHR {
    public func push<NewValue: DisplayPlaneCapabilities2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SharedPresentSurfaceCapabilitiesKHR {
    public func push<NewValue: SharedPresentSurfaceCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevice16BitStorageFeatures {
    public func push<NewValue: PhysicalDevice16BitStorageFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSubgroupProperties {
    public func push<NewValue: PhysicalDeviceSubgroupPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderSubgroupExtendedTypesFeatures {
    public func push<NewValue: PhysicalDeviceShaderSubgroupExtendedTypesFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferMemoryRequirementsInfo2 {
    public func push<NewValue: BufferMemoryRequirementsInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceBufferMemoryRequirements {
    public func push<NewValue: DeviceBufferMemoryRequirementsExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageMemoryRequirementsInfo2 {
    public func push<NewValue: ImageMemoryRequirementsInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageSparseMemoryRequirementsInfo2 {
    public func push<NewValue: ImageSparseMemoryRequirementsInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceImageMemoryRequirements {
    public func push<NewValue: DeviceImageMemoryRequirementsExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryRequirements2 {
    public func push<NewValue: MemoryRequirements2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SparseImageMemoryRequirements2 {
    public func push<NewValue: SparseImageMemoryRequirements2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePointClippingProperties {
    public func push<NewValue: PhysicalDevicePointClippingPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryDedicatedRequirements {
    public func push<NewValue: MemoryDedicatedRequirementsExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryDedicatedAllocateInfo {
    public func push<NewValue: MemoryDedicatedAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewUsageCreateInfo {
    public func push<NewValue: ImageViewUsageCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewSlicedCreateInfoEXT {
    public func push<NewValue: ImageViewSlicedCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineTessellationDomainOriginStateCreateInfo {
    public func push<NewValue: PipelineTessellationDomainOriginStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerYcbcrConversionInfo {
    public func push<NewValue: SamplerYcbcrConversionInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerYcbcrConversionCreateInfo {
    public func push<NewValue: SamplerYcbcrConversionCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindImagePlaneMemoryInfo {
    public func push<NewValue: BindImagePlaneMemoryInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImagePlaneMemoryRequirementsInfo {
    public func push<NewValue: ImagePlaneMemoryRequirementsInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSamplerYcbcrConversionFeatures {
    public func push<NewValue: PhysicalDeviceSamplerYcbcrConversionFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerYcbcrConversionImageFormatProperties {
    public func push<NewValue: SamplerYcbcrConversionImageFormatPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TextureLODGatherFormatPropertiesAMD {
    public func push<NewValue: TextureLODGatherFormatPropertiesAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ConditionalRenderingBeginInfoEXT {
    public func push<NewValue: ConditionalRenderingBeginInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ProtectedSubmitInfo {
    public func push<NewValue: ProtectedSubmitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceProtectedMemoryFeatures {
    public func push<NewValue: PhysicalDeviceProtectedMemoryFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceProtectedMemoryProperties {
    public func push<NewValue: PhysicalDeviceProtectedMemoryPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceQueueInfo2 {
    public func push<NewValue: DeviceQueueInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCoverageToColorStateCreateInfoNV {
    public func push<NewValue: PipelineCoverageToColorStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSamplerFilterMinmaxProperties {
    public func push<NewValue: PhysicalDeviceSamplerFilterMinmaxPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SampleLocationsInfoEXT {
    public func push<NewValue: SampleLocationsInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassSampleLocationsBeginInfoEXT {
    public func push<NewValue: RenderPassSampleLocationsBeginInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineSampleLocationsStateCreateInfoEXT {
    public func push<NewValue: PipelineSampleLocationsStateCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSampleLocationsPropertiesEXT {
    public func push<NewValue: PhysicalDeviceSampleLocationsPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MultisamplePropertiesEXT {
    public func push<NewValue: MultisamplePropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerReductionModeCreateInfo {
    public func push<NewValue: SamplerReductionModeCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceBlendOperationAdvancedFeaturesEXT {
    public func push<NewValue: PhysicalDeviceBlendOperationAdvancedFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiDrawFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMultiDrawFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceBlendOperationAdvancedPropertiesEXT {
    public func push<NewValue: PhysicalDeviceBlendOperationAdvancedPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineColorBlendAdvancedStateCreateInfoEXT {
    public func push<NewValue: PipelineColorBlendAdvancedStateCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceInlineUniformBlockFeatures {
    public func push<NewValue: PhysicalDeviceInlineUniformBlockFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceInlineUniformBlockProperties {
    public func push<NewValue: PhysicalDeviceInlineUniformBlockPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteDescriptorSetInlineUniformBlock {
    public func push<NewValue: WriteDescriptorSetInlineUniformBlockExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorPoolInlineUniformBlockCreateInfo {
    public func push<NewValue: DescriptorPoolInlineUniformBlockCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCoverageModulationStateCreateInfoNV {
    public func push<NewValue: PipelineCoverageModulationStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageFormatListCreateInfo {
    public func push<NewValue: ImageFormatListCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ValidationCacheCreateInfoEXT {
    public func push<NewValue: ValidationCacheCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderModuleValidationCacheCreateInfoEXT {
    public func push<NewValue: ShaderModuleValidationCacheCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance3Properties {
    public func push<NewValue: PhysicalDeviceMaintenance3PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance4Features {
    public func push<NewValue: PhysicalDeviceMaintenance4FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance4Properties {
    public func push<NewValue: PhysicalDeviceMaintenance4PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance5Features {
    public func push<NewValue: PhysicalDeviceMaintenance5FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance5Properties {
    public func push<NewValue: PhysicalDeviceMaintenance5PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance6Features {
    public func push<NewValue: PhysicalDeviceMaintenance6FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance6Properties {
    public func push<NewValue: PhysicalDeviceMaintenance6PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance7FeaturesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance7FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance7PropertiesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance7PropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLayeredApiPropertiesKHR {
    public func push<NewValue: PhysicalDeviceLayeredApiPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLayeredApiPropertiesListKHR {
    public func push<NewValue: PhysicalDeviceLayeredApiPropertiesListKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLayeredApiVulkanPropertiesKHR {
    public func push<NewValue: PhysicalDeviceLayeredApiVulkanPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance8FeaturesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance8FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance9FeaturesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance9FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance9PropertiesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance9PropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance11FeaturesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance11FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance10PropertiesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance10PropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMaintenance10FeaturesKHR {
    public func push<NewValue: PhysicalDeviceMaintenance10FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyOwnershipTransferPropertiesKHR {
    public func push<NewValue: QueueFamilyOwnershipTransferPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyOptimalImageTransferGranularityPropertiesKHR {
    public func push<NewValue: QueueFamilyOptimalImageTransferGranularityPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingAreaInfo {
    public func push<NewValue: RenderingAreaInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetLayoutSupport {
    public func push<NewValue: DescriptorSetLayoutSupportExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderDrawParametersFeatures {
    public func push<NewValue: PhysicalDeviceShaderDrawParametersFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderFloat16Int8Features {
    public func push<NewValue: PhysicalDeviceShaderFloat16Int8FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFloatControlsProperties {
    public func push<NewValue: PhysicalDeviceFloatControlsPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceHostQueryResetFeatures {
    public func push<NewValue: PhysicalDeviceHostQueryResetFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceQueueGlobalPriorityCreateInfo {
    public func push<NewValue: DeviceQueueGlobalPriorityCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceGlobalPriorityQueryFeatures {
    public func push<NewValue: PhysicalDeviceGlobalPriorityQueryFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyGlobalPriorityProperties {
    public func push<NewValue: QueueFamilyGlobalPriorityPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugUtilsObjectNameInfoEXT {
    public func push<NewValue: DebugUtilsObjectNameInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugUtilsObjectTagInfoEXT {
    public func push<NewValue: DebugUtilsObjectTagInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugUtilsLabelEXT {
    public func push<NewValue: DebugUtilsLabelEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugUtilsMessengerCreateInfoEXT {
    public func push<NewValue: DebugUtilsMessengerCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DebugUtilsMessengerCallbackDataEXT {
    public func push<NewValue: DebugUtilsMessengerCallbackDataEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDeviceMemoryReportFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDeviceMemoryReportFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceDeviceMemoryReportCreateInfoEXT {
    public func push<NewValue: DeviceDeviceMemoryReportCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceMemoryReportCallbackDataEXT {
    public func push<NewValue: DeviceMemoryReportCallbackDataEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImportMemoryHostPointerInfoEXT {
    public func push<NewValue: ImportMemoryHostPointerInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryHostPointerPropertiesEXT {
    public func push<NewValue: MemoryHostPointerPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExternalMemoryHostPropertiesEXT {
    public func push<NewValue: PhysicalDeviceExternalMemoryHostPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceConservativeRasterizationPropertiesEXT {
    public func push<NewValue: PhysicalDeviceConservativeRasterizationPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CalibratedTimestampInfoKHR {
    public func push<NewValue: CalibratedTimestampInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderCorePropertiesAMD {
    public func push<NewValue: PhysicalDeviceShaderCorePropertiesAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderCoreProperties2AMD {
    public func push<NewValue: PhysicalDeviceShaderCoreProperties2AMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationConservativeStateCreateInfoEXT {
    public func push<NewValue: PipelineRasterizationConservativeStateCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorIndexingFeatures {
    public func push<NewValue: PhysicalDeviceDescriptorIndexingFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorIndexingProperties {
    public func push<NewValue: PhysicalDeviceDescriptorIndexingPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetLayoutBindingFlagsCreateInfo {
    public func push<NewValue: DescriptorSetLayoutBindingFlagsCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetVariableDescriptorCountAllocateInfo {
    public func push<NewValue: DescriptorSetVariableDescriptorCountAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetVariableDescriptorCountLayoutSupport {
    public func push<NewValue: DescriptorSetVariableDescriptorCountLayoutSupportExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AttachmentDescription2 {
    public func push<NewValue: AttachmentDescription2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AttachmentReference2 {
    public func push<NewValue: AttachmentReference2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassDescription2 {
    public func push<NewValue: SubpassDescription2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassDependency2 {
    public func push<NewValue: SubpassDependency2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassCreateInfo2 {
    public func push<NewValue: RenderPassCreateInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassBeginInfo {
    public func push<NewValue: SubpassBeginInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassEndInfo {
    public func push<NewValue: SubpassEndInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTimelineSemaphoreFeatures {
    public func push<NewValue: PhysicalDeviceTimelineSemaphoreFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTimelineSemaphoreProperties {
    public func push<NewValue: PhysicalDeviceTimelineSemaphorePropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SemaphoreTypeCreateInfo {
    public func push<NewValue: SemaphoreTypeCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TimelineSemaphoreSubmitInfo {
    public func push<NewValue: TimelineSemaphoreSubmitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SemaphoreWaitInfo {
    public func push<NewValue: SemaphoreWaitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SemaphoreSignalInfo {
    public func push<NewValue: SemaphoreSignalInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineVertexInputDivisorStateCreateInfo {
    public func push<NewValue: PipelineVertexInputDivisorStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVertexAttributeDivisorPropertiesEXT {
    public func push<NewValue: PhysicalDeviceVertexAttributeDivisorPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVertexAttributeDivisorProperties {
    public func push<NewValue: PhysicalDeviceVertexAttributeDivisorPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePCIBusInfoPropertiesEXT {
    public func push<NewValue: PhysicalDevicePCIBusInfoPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == ImportAndroidHardwareBufferInfoANDROID {
    public func push<NewValue: ImportAndroidHardwareBufferInfoANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == AndroidHardwareBufferUsageANDROID {
    public func push<NewValue: AndroidHardwareBufferUsageANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == AndroidHardwareBufferPropertiesANDROID {
    public func push<NewValue: AndroidHardwareBufferPropertiesANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == MemoryGetAndroidHardwareBufferInfoANDROID {
    public func push<NewValue: MemoryGetAndroidHardwareBufferInfoANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == AndroidHardwareBufferFormatPropertiesANDROID {
    public func push<NewValue: AndroidHardwareBufferFormatPropertiesANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == CommandBufferInheritanceConditionalRenderingInfoEXT {
    public func push<NewValue: CommandBufferInheritanceConditionalRenderingInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == ExternalFormatANDROID {
    public func push<NewValue: ExternalFormatANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDevice8BitStorageFeatures {
    public func push<NewValue: PhysicalDevice8BitStorageFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceConditionalRenderingFeaturesEXT {
    public func push<NewValue: PhysicalDeviceConditionalRenderingFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkanMemoryModelFeatures {
    public func push<NewValue: PhysicalDeviceVulkanMemoryModelFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderAtomicInt64Features {
    public func push<NewValue: PhysicalDeviceShaderAtomicInt64FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderAtomicFloatFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderAtomicFloatFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderAtomicFloat2FeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderAtomicFloat2FeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVertexAttributeDivisorFeatures {
    public func push<NewValue: PhysicalDeviceVertexAttributeDivisorFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyCheckpointPropertiesNV {
    public func push<NewValue: QueueFamilyCheckpointPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CheckpointDataNV {
    public func push<NewValue: CheckpointDataNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDepthStencilResolveProperties {
    public func push<NewValue: PhysicalDeviceDepthStencilResolvePropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassDescriptionDepthStencilResolve {
    public func push<NewValue: SubpassDescriptionDepthStencilResolveExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewASTCDecodeModeEXT {
    public func push<NewValue: ImageViewASTCDecodeModeEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceASTCDecodeFeaturesEXT {
    public func push<NewValue: PhysicalDeviceASTCDecodeFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTransformFeedbackFeaturesEXT {
    public func push<NewValue: PhysicalDeviceTransformFeedbackFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTransformFeedbackPropertiesEXT {
    public func push<NewValue: PhysicalDeviceTransformFeedbackPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationStateStreamCreateInfoEXT {
    public func push<NewValue: PipelineRasterizationStateStreamCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRepresentativeFragmentTestFeaturesNV {
    public func push<NewValue: PhysicalDeviceRepresentativeFragmentTestFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRepresentativeFragmentTestStateCreateInfoNV {
    public func push<NewValue: PipelineRepresentativeFragmentTestStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExclusiveScissorFeaturesNV {
    public func push<NewValue: PhysicalDeviceExclusiveScissorFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportExclusiveScissorStateCreateInfoNV {
    public func push<NewValue: PipelineViewportExclusiveScissorStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCornerSampledImageFeaturesNV {
    public func push<NewValue: PhysicalDeviceCornerSampledImageFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceComputeShaderDerivativesFeaturesKHR {
    public func push<NewValue: PhysicalDeviceComputeShaderDerivativesFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceComputeShaderDerivativesPropertiesKHR {
    public func push<NewValue: PhysicalDeviceComputeShaderDerivativesPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderImageFootprintFeaturesNV {
    public func push<NewValue: PhysicalDeviceShaderImageFootprintFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV {
    public func push<NewValue: PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCopyMemoryIndirectFeaturesKHR {
    public func push<NewValue: PhysicalDeviceCopyMemoryIndirectFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCopyMemoryIndirectFeaturesNV {
    public func push<NewValue: PhysicalDeviceCopyMemoryIndirectFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCopyMemoryIndirectPropertiesKHR {
    public func push<NewValue: PhysicalDeviceCopyMemoryIndirectPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMemoryDecompressionFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMemoryDecompressionFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMemoryDecompressionPropertiesEXT {
    public func push<NewValue: PhysicalDeviceMemoryDecompressionPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportShadingRateImageStateCreateInfoNV {
    public func push<NewValue: PipelineViewportShadingRateImageStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShadingRateImageFeaturesNV {
    public func push<NewValue: PhysicalDeviceShadingRateImageFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShadingRateImagePropertiesNV {
    public func push<NewValue: PhysicalDeviceShadingRateImagePropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceInvocationMaskFeaturesHUAWEI {
    public func push<NewValue: PhysicalDeviceInvocationMaskFeaturesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportCoarseSampleOrderStateCreateInfoNV {
    public func push<NewValue: PipelineViewportCoarseSampleOrderStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMeshShaderFeaturesNV {
    public func push<NewValue: PhysicalDeviceMeshShaderFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMeshShaderPropertiesNV {
    public func push<NewValue: PhysicalDeviceMeshShaderPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMeshShaderFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMeshShaderFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMeshShaderPropertiesEXT {
    public func push<NewValue: PhysicalDeviceMeshShaderPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RayTracingShaderGroupCreateInfoNV {
    public func push<NewValue: RayTracingShaderGroupCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RayTracingShaderGroupCreateInfoKHR {
    public func push<NewValue: RayTracingShaderGroupCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RayTracingPipelineCreateInfoNV {
    public func push<NewValue: RayTracingPipelineCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineLibraryCreateInfoKHR {
    public func push<NewValue: PipelineLibraryCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RayTracingPipelineInterfaceCreateInfoKHR {
    public func push<NewValue: RayTracingPipelineInterfaceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RayTracingPipelineCreateInfoKHR {
    public func push<NewValue: RayTracingPipelineCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeometryTrianglesNV {
    public func push<NewValue: GeometryTrianglesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeometryAABBNV {
    public func push<NewValue: GeometryAABBNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeometryNV {
    public func push<NewValue: GeometryNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureInfoNV {
    public func push<NewValue: AccelerationStructureInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureCreateInfoNV {
    public func push<NewValue: AccelerationStructureCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindAccelerationStructureMemoryInfoNV {
    public func push<NewValue: BindAccelerationStructureMemoryInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteDescriptorSetAccelerationStructureKHR {
    public func push<NewValue: WriteDescriptorSetAccelerationStructureKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteDescriptorSetAccelerationStructureNV {
    public func push<NewValue: WriteDescriptorSetAccelerationStructureNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureMemoryRequirementsInfoNV {
    public func push<NewValue: AccelerationStructureMemoryRequirementsInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceAccelerationStructureFeaturesKHR {
    public func push<NewValue: PhysicalDeviceAccelerationStructureFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingPipelineFeaturesKHR {
    public func push<NewValue: PhysicalDeviceRayTracingPipelineFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayQueryFeaturesKHR {
    public func push<NewValue: PhysicalDeviceRayQueryFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceAccelerationStructurePropertiesKHR {
    public func push<NewValue: PhysicalDeviceAccelerationStructurePropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingPipelinePropertiesKHR {
    public func push<NewValue: PhysicalDeviceRayTracingPipelinePropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingPropertiesNV {
    public func push<NewValue: PhysicalDeviceRayTracingPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingMaintenance1FeaturesKHR {
    public func push<NewValue: PhysicalDeviceRayTracingMaintenance1FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DrmFormatModifierPropertiesListEXT {
    public func push<NewValue: DrmFormatModifierPropertiesListEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageDrmFormatModifierInfoEXT {
    public func push<NewValue: PhysicalDeviceImageDrmFormatModifierInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageDrmFormatModifierListCreateInfoEXT {
    public func push<NewValue: ImageDrmFormatModifierListCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageDrmFormatModifierExplicitCreateInfoEXT {
    public func push<NewValue: ImageDrmFormatModifierExplicitCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageDrmFormatModifierPropertiesEXT {
    public func push<NewValue: ImageDrmFormatModifierPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageStencilUsageCreateInfo {
    public func push<NewValue: ImageStencilUsageCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceMemoryOverallocationCreateInfoAMD {
    public func push<NewValue: DeviceMemoryOverallocationCreateInfoAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMapFeaturesEXT {
    public func push<NewValue: PhysicalDeviceFragmentDensityMapFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMap2FeaturesEXT {
    public func push<NewValue: PhysicalDeviceFragmentDensityMap2FeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMapOffsetFeaturesEXT {
    public func push<NewValue: PhysicalDeviceFragmentDensityMapOffsetFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMapPropertiesEXT {
    public func push<NewValue: PhysicalDeviceFragmentDensityMapPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMap2PropertiesEXT {
    public func push<NewValue: PhysicalDeviceFragmentDensityMap2PropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMapOffsetPropertiesEXT {
    public func push<NewValue: PhysicalDeviceFragmentDensityMapOffsetPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassFragmentDensityMapCreateInfoEXT {
    public func push<NewValue: RenderPassFragmentDensityMapCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassFragmentDensityMapOffsetEndInfoEXT {
    public func push<NewValue: RenderPassFragmentDensityMapOffsetEndInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceScalarBlockLayoutFeatures {
    public func push<NewValue: PhysicalDeviceScalarBlockLayoutFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceProtectedCapabilitiesKHR {
    public func push<NewValue: SurfaceProtectedCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceUniformBufferStandardLayoutFeatures {
    public func push<NewValue: PhysicalDeviceUniformBufferStandardLayoutFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDepthClipEnableFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDepthClipEnableFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationDepthClipStateCreateInfoEXT {
    public func push<NewValue: PipelineRasterizationDepthClipStateCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMemoryBudgetPropertiesEXT {
    public func push<NewValue: PhysicalDeviceMemoryBudgetPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMemoryPriorityFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMemoryPriorityFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryPriorityAllocateInfoEXT {
    public func push<NewValue: MemoryPriorityAllocateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT {
    public func push<NewValue: PhysicalDevicePageableDeviceLocalMemoryFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceBufferDeviceAddressFeatures {
    public func push<NewValue: PhysicalDeviceBufferDeviceAddressFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceBufferDeviceAddressFeaturesEXT {
    public func push<NewValue: PhysicalDeviceBufferDeviceAddressFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferDeviceAddressInfo {
    public func push<NewValue: BufferDeviceAddressInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferOpaqueCaptureAddressCreateInfo {
    public func push<NewValue: BufferOpaqueCaptureAddressCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferDeviceAddressCreateInfoEXT {
    public func push<NewValue: BufferDeviceAddressCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageViewImageFormatInfoEXT {
    public func push<NewValue: PhysicalDeviceImageViewImageFormatInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FilterCubicImageViewImageFormatPropertiesEXT {
    public func push<NewValue: FilterCubicImageViewImageFormatPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImagelessFramebufferFeatures {
    public func push<NewValue: PhysicalDeviceImagelessFramebufferFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FramebufferAttachmentImageInfo {
    public func push<NewValue: FramebufferAttachmentImageInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FramebufferAttachmentsCreateInfo {
    public func push<NewValue: FramebufferAttachmentsCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassAttachmentBeginInfo {
    public func push<NewValue: RenderPassAttachmentBeginInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTextureCompressionASTCHDRFeatures {
    public func push<NewValue: PhysicalDeviceTextureCompressionASTCHDRFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeMatrixFeaturesNV {
    public func push<NewValue: PhysicalDeviceCooperativeMatrixFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeMatrixPropertiesNV {
    public func push<NewValue: PhysicalDeviceCooperativeMatrixPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CooperativeMatrixPropertiesNV {
    public func push<NewValue: CooperativeMatrixPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceYcbcrImageArraysFeaturesEXT {
    public func push<NewValue: PhysicalDeviceYcbcrImageArraysFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewHandleInfoNVX {
    public func push<NewValue: ImageViewHandleInfoNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewAddressPropertiesNVX {
    public func push<NewValue: ImageViewAddressPropertiesNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_GGP
extension Chain where Base == PresentFrameTokenGGP {
    public func push<NewValue: PresentFrameTokenGGPExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PipelineCreationFeedbackCreateInfo {
    public func push<NewValue: PipelineCreationFeedbackCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == SurfaceFullScreenExclusiveInfoEXT {
    public func push<NewValue: SurfaceFullScreenExclusiveInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == SurfaceFullScreenExclusiveWin32InfoEXT {
    public func push<NewValue: SurfaceFullScreenExclusiveWin32InfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
extension Chain where Base == SurfaceCapabilitiesFullScreenExclusiveEXT {
    public func push<NewValue: SurfaceCapabilitiesFullScreenExclusiveEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDevicePresentBarrierFeaturesNV {
    public func push<NewValue: PhysicalDevicePresentBarrierFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceCapabilitiesPresentBarrierNV {
    public func push<NewValue: SurfaceCapabilitiesPresentBarrierNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainPresentBarrierCreateInfoNV {
    public func push<NewValue: SwapchainPresentBarrierCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePerformanceQueryFeaturesKHR {
    public func push<NewValue: PhysicalDevicePerformanceQueryFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePerformanceQueryPropertiesKHR {
    public func push<NewValue: PhysicalDevicePerformanceQueryPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceCounterKHR {
    public func push<NewValue: PerformanceCounterKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceCounterDescriptionKHR {
    public func push<NewValue: PerformanceCounterDescriptionKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueryPoolPerformanceCreateInfoKHR {
    public func push<NewValue: QueryPoolPerformanceCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AcquireProfilingLockInfoKHR {
    public func push<NewValue: AcquireProfilingLockInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceQuerySubmitInfoKHR {
    public func push<NewValue: PerformanceQuerySubmitInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == HeadlessSurfaceCreateInfoEXT {
    public func push<NewValue: HeadlessSurfaceCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCoverageReductionModeFeaturesNV {
    public func push<NewValue: PhysicalDeviceCoverageReductionModeFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCoverageReductionStateCreateInfoNV {
    public func push<NewValue: PipelineCoverageReductionStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FramebufferMixedSamplesCombinationNV {
    public func push<NewValue: FramebufferMixedSamplesCombinationNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL {
    public func push<NewValue: PhysicalDeviceShaderIntegerFunctions2FeaturesINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == InitializePerformanceApiInfoINTEL {
    public func push<NewValue: InitializePerformanceApiInfoINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueryPoolPerformanceQueryCreateInfoINTEL {
    public func push<NewValue: QueryPoolPerformanceQueryCreateInfoINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceMarkerInfoINTEL {
    public func push<NewValue: PerformanceMarkerInfoINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceStreamMarkerInfoINTEL {
    public func push<NewValue: PerformanceStreamMarkerInfoINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceOverrideInfoINTEL {
    public func push<NewValue: PerformanceOverrideInfoINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceConfigurationAcquireInfoINTEL {
    public func push<NewValue: PerformanceConfigurationAcquireInfoINTELExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderClockFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderClockFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceIndexTypeUint8Features {
    public func push<NewValue: PhysicalDeviceIndexTypeUint8FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderSMBuiltinsPropertiesNV {
    public func push<NewValue: PhysicalDeviceShaderSMBuiltinsPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderSMBuiltinsFeaturesNV {
    public func push<NewValue: PhysicalDeviceShaderSMBuiltinsFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShaderInterlockFeaturesEXT {
    public func push<NewValue: PhysicalDeviceFragmentShaderInterlockFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSeparateDepthStencilLayoutsFeatures {
    public func push<NewValue: PhysicalDeviceSeparateDepthStencilLayoutsFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AttachmentReferenceStencilLayout {
    public func push<NewValue: AttachmentReferenceStencilLayoutExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePrimitiveTopologyListRestartFeaturesEXT {
    public func push<NewValue: PhysicalDevicePrimitiveTopologyListRestartFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AttachmentDescriptionStencilLayout {
    public func push<NewValue: AttachmentDescriptionStencilLayoutExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineExecutablePropertiesFeaturesKHR {
    public func push<NewValue: PhysicalDevicePipelineExecutablePropertiesFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineInfoKHR {
    public func push<NewValue: PipelineInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineExecutablePropertiesKHR {
    public func push<NewValue: PipelineExecutablePropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineExecutableInfoKHR {
    public func push<NewValue: PipelineExecutableInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineExecutableStatisticKHR {
    public func push<NewValue: PipelineExecutableStatisticKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineExecutableInternalRepresentationKHR {
    public func push<NewValue: PipelineExecutableInternalRepresentationKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderDemoteToHelperInvocationFeatures {
    public func push<NewValue: PhysicalDeviceShaderDemoteToHelperInvocationFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTexelBufferAlignmentFeaturesEXT {
    public func push<NewValue: PhysicalDeviceTexelBufferAlignmentFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTexelBufferAlignmentProperties {
    public func push<NewValue: PhysicalDeviceTexelBufferAlignmentPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSubgroupSizeControlFeatures {
    public func push<NewValue: PhysicalDeviceSubgroupSizeControlFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSubgroupSizeControlProperties {
    public func push<NewValue: PhysicalDeviceSubgroupSizeControlPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineShaderStageRequiredSubgroupSizeCreateInfo {
    public func push<NewValue: PipelineShaderStageRequiredSubgroupSizeCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassShadingPipelineCreateInfoHUAWEI {
    public func push<NewValue: SubpassShadingPipelineCreateInfoHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSubpassShadingPropertiesHUAWEI {
    public func push<NewValue: PhysicalDeviceSubpassShadingPropertiesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceClusterCullingShaderPropertiesHUAWEI {
    public func push<NewValue: PhysicalDeviceClusterCullingShaderPropertiesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryOpaqueCaptureAddressAllocateInfo {
    public func push<NewValue: MemoryOpaqueCaptureAddressAllocateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceMemoryOpaqueCaptureAddressInfo {
    public func push<NewValue: DeviceMemoryOpaqueCaptureAddressInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLineRasterizationFeatures {
    public func push<NewValue: PhysicalDeviceLineRasterizationFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLineRasterizationProperties {
    public func push<NewValue: PhysicalDeviceLineRasterizationPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationLineStateCreateInfo {
    public func push<NewValue: PipelineRasterizationLineStateCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineCreationCacheControlFeatures {
    public func push<NewValue: PhysicalDevicePipelineCreationCacheControlFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan11Features {
    public func push<NewValue: PhysicalDeviceVulkan11FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan11Properties {
    public func push<NewValue: PhysicalDeviceVulkan11PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan12Features {
    public func push<NewValue: PhysicalDeviceVulkan12FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan12Properties {
    public func push<NewValue: PhysicalDeviceVulkan12PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan13Features {
    public func push<NewValue: PhysicalDeviceVulkan13FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan13Properties {
    public func push<NewValue: PhysicalDeviceVulkan13PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan14Features {
    public func push<NewValue: PhysicalDeviceVulkan14FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVulkan14Properties {
    public func push<NewValue: PhysicalDeviceVulkan14PropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineCompilerControlCreateInfoAMD {
    public func push<NewValue: PipelineCompilerControlCreateInfoAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCoherentMemoryFeaturesAMD {
    public func push<NewValue: PhysicalDeviceCoherentMemoryFeaturesAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceToolProperties {
    public func push<NewValue: PhysicalDeviceToolPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerCustomBorderColorCreateInfoEXT {
    public func push<NewValue: SamplerCustomBorderColorCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCustomBorderColorPropertiesEXT {
    public func push<NewValue: PhysicalDeviceCustomBorderColorPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCustomBorderColorFeaturesEXT {
    public func push<NewValue: PhysicalDeviceCustomBorderColorFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerBorderColorComponentMappingCreateInfoEXT {
    public func push<NewValue: SamplerBorderColorComponentMappingCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceBorderColorSwizzleFeaturesEXT {
    public func push<NewValue: PhysicalDeviceBorderColorSwizzleFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometryTrianglesDataKHR {
    public func push<NewValue: AccelerationStructureGeometryTrianglesDataKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometryAabbsDataKHR {
    public func push<NewValue: AccelerationStructureGeometryAabbsDataKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometryInstancesDataKHR {
    public func push<NewValue: AccelerationStructureGeometryInstancesDataKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometryLinearSweptSpheresDataNV {
    public func push<NewValue: AccelerationStructureGeometryLinearSweptSpheresDataNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometrySpheresDataNV {
    public func push<NewValue: AccelerationStructureGeometrySpheresDataNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometryKHR {
    public func push<NewValue: AccelerationStructureGeometryKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureBuildGeometryInfoKHR {
    public func push<NewValue: AccelerationStructureBuildGeometryInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureCreateInfoKHR {
    public func push<NewValue: AccelerationStructureCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureDeviceAddressInfoKHR {
    public func push<NewValue: AccelerationStructureDeviceAddressInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureVersionInfoKHR {
    public func push<NewValue: AccelerationStructureVersionInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyAccelerationStructureInfoKHR {
    public func push<NewValue: CopyAccelerationStructureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyAccelerationStructureToMemoryInfoKHR {
    public func push<NewValue: CopyAccelerationStructureToMemoryInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyMemoryToAccelerationStructureInfoKHR {
    public func push<NewValue: CopyMemoryToAccelerationStructureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExtendedDynamicStateFeaturesEXT {
    public func push<NewValue: PhysicalDeviceExtendedDynamicStateFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExtendedDynamicState2FeaturesEXT {
    public func push<NewValue: PhysicalDeviceExtendedDynamicState2FeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExtendedDynamicState3FeaturesEXT {
    public func push<NewValue: PhysicalDeviceExtendedDynamicState3FeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExtendedDynamicState3PropertiesEXT {
    public func push<NewValue: PhysicalDeviceExtendedDynamicState3PropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassTransformBeginInfoQCOM {
    public func push<NewValue: RenderPassTransformBeginInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyCommandTransformInfoQCOM {
    public func push<NewValue: CopyCommandTransformInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferInheritanceRenderPassTransformInfoQCOM {
    public func push<NewValue: CommandBufferInheritanceRenderPassTransformInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePartitionedAccelerationStructureFeaturesNV {
    public func push<NewValue: PhysicalDevicePartitionedAccelerationStructureFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePartitionedAccelerationStructurePropertiesNV {
    public func push<NewValue: PhysicalDevicePartitionedAccelerationStructurePropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PartitionedAccelerationStructureFlagsNV {
    public func push<NewValue: PartitionedAccelerationStructureFlagsNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteDescriptorSetPartitionedAccelerationStructureNV {
    public func push<NewValue: WriteDescriptorSetPartitionedAccelerationStructureNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PartitionedAccelerationStructureInstancesInputNV {
    public func push<NewValue: PartitionedAccelerationStructureInstancesInputNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BuildPartitionedAccelerationStructureInfoNV {
    public func push<NewValue: BuildPartitionedAccelerationStructureInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDiagnosticsConfigFeaturesNV {
    public func push<NewValue: PhysicalDeviceDiagnosticsConfigFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceDiagnosticsConfigCreateInfoNV {
    public func push<NewValue: DeviceDiagnosticsConfigCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures {
    public func push<NewValue: PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRobustness2FeaturesKHR {
    public func push<NewValue: PhysicalDeviceRobustness2FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRobustness2PropertiesKHR {
    public func push<NewValue: PhysicalDeviceRobustness2PropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageRobustnessFeatures {
    public func push<NewValue: PhysicalDeviceImageRobustnessFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR {
    public func push<NewValue: PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDevicePortabilitySubsetFeaturesKHR {
    public func push<NewValue: PhysicalDevicePortabilitySubsetFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDevicePortabilitySubsetPropertiesKHR {
    public func push<NewValue: PhysicalDevicePortabilitySubsetPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDevice4444FormatsFeaturesEXT {
    public func push<NewValue: PhysicalDevice4444FormatsFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSubpassShadingFeaturesHUAWEI {
    public func push<NewValue: PhysicalDeviceSubpassShadingFeaturesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceClusterCullingShaderFeaturesHUAWEI {
    public func push<NewValue: PhysicalDeviceClusterCullingShaderFeaturesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceClusterCullingShaderVrsFeaturesHUAWEI {
    public func push<NewValue: PhysicalDeviceClusterCullingShaderVrsFeaturesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferCopy2 {
    public func push<NewValue: BufferCopy2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageCopy2 {
    public func push<NewValue: ImageCopy2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageBlit2 {
    public func push<NewValue: ImageBlit2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferImageCopy2 {
    public func push<NewValue: BufferImageCopy2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageResolve2 {
    public func push<NewValue: ImageResolve2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyBufferInfo2 {
    public func push<NewValue: CopyBufferInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyImageInfo2 {
    public func push<NewValue: CopyImageInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BlitImageInfo2 {
    public func push<NewValue: BlitImageInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyBufferToImageInfo2 {
    public func push<NewValue: CopyBufferToImageInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyImageToBufferInfo2 {
    public func push<NewValue: CopyImageToBufferInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ResolveImageInfo2 {
    public func push<NewValue: ResolveImageInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderImageAtomicInt64FeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderImageAtomicInt64FeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FragmentShadingRateAttachmentInfoKHR {
    public func push<NewValue: FragmentShadingRateAttachmentInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineFragmentShadingRateStateCreateInfoKHR {
    public func push<NewValue: PipelineFragmentShadingRateStateCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShadingRateFeaturesKHR {
    public func push<NewValue: PhysicalDeviceFragmentShadingRateFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShadingRatePropertiesKHR {
    public func push<NewValue: PhysicalDeviceFragmentShadingRatePropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShadingRateKHR {
    public func push<NewValue: PhysicalDeviceFragmentShadingRateKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderTerminateInvocationFeatures {
    public func push<NewValue: PhysicalDeviceShaderTerminateInvocationFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShadingRateEnumsFeaturesNV {
    public func push<NewValue: PhysicalDeviceFragmentShadingRateEnumsFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShadingRateEnumsPropertiesNV {
    public func push<NewValue: PhysicalDeviceFragmentShadingRateEnumsPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineFragmentShadingRateEnumStateCreateInfoNV {
    public func push<NewValue: PipelineFragmentShadingRateEnumStateCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureBuildSizesInfoKHR {
    public func push<NewValue: AccelerationStructureBuildSizesInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImage2DViewOf3DFeaturesEXT {
    public func push<NewValue: PhysicalDeviceImage2DViewOf3DFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageSlicedViewOf3DFeaturesEXT {
    public func push<NewValue: PhysicalDeviceImageSlicedViewOf3DFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT {
    public func push<NewValue: PhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLegacyVertexAttributesFeaturesEXT {
    public func push<NewValue: PhysicalDeviceLegacyVertexAttributesFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLegacyVertexAttributesPropertiesEXT {
    public func push<NewValue: PhysicalDeviceLegacyVertexAttributesPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMutableDescriptorTypeFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMutableDescriptorTypeFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MutableDescriptorTypeCreateInfoEXT {
    public func push<NewValue: MutableDescriptorTypeCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDepthClipControlFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDepthClipControlFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXT {
    public func push<NewValue: PhysicalDeviceZeroInitializeDeviceMemoryFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BeginCustomResolveInfoEXT {
    public func push<NewValue: BeginCustomResolveInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCustomResolveFeaturesEXT {
    public func push<NewValue: PhysicalDeviceCustomResolveFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CustomResolveCreateInfoEXT {
    public func push<NewValue: CustomResolveCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDeviceGeneratedCommandsFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT {
    public func push<NewValue: PhysicalDeviceDeviceGeneratedCommandsPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeneratedCommandsPipelineInfoEXT {
    public func push<NewValue: GeneratedCommandsPipelineInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeneratedCommandsShaderInfoEXT {
    public func push<NewValue: GeneratedCommandsShaderInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeneratedCommandsMemoryRequirementsInfoEXT {
    public func push<NewValue: GeneratedCommandsMemoryRequirementsInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectExecutionSetPipelineInfoEXT {
    public func push<NewValue: IndirectExecutionSetPipelineInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectExecutionSetShaderLayoutInfoEXT {
    public func push<NewValue: IndirectExecutionSetShaderLayoutInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectExecutionSetShaderInfoEXT {
    public func push<NewValue: IndirectExecutionSetShaderInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectExecutionSetCreateInfoEXT {
    public func push<NewValue: IndirectExecutionSetCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GeneratedCommandsInfoEXT {
    public func push<NewValue: GeneratedCommandsInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteIndirectExecutionSetPipelineEXT {
    public func push<NewValue: WriteIndirectExecutionSetPipelineEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteIndirectExecutionSetShaderEXT {
    public func push<NewValue: WriteIndirectExecutionSetShaderEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectCommandsLayoutTokenEXT {
    public func push<NewValue: IndirectCommandsLayoutTokenEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectCommandsLayoutCreateInfoEXT {
    public func push<NewValue: IndirectCommandsLayoutCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportDepthClipControlCreateInfoEXT {
    public func push<NewValue: PipelineViewportDepthClipControlCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDepthClampControlFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDepthClampControlFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineViewportDepthClampControlCreateInfoEXT {
    public func push<NewValue: PipelineViewportDepthClampControlCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVertexInputDynamicStateFeaturesEXT {
    public func push<NewValue: PhysicalDeviceVertexInputDynamicStateFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExternalMemoryRDMAFeaturesNV {
    public func push<NewValue: PhysicalDeviceExternalMemoryRDMAFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VertexInputBindingDescription2EXT {
    public func push<NewValue: VertexInputBindingDescription2EXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VertexInputAttributeDescription2EXT {
    public func push<NewValue: VertexInputAttributeDescription2EXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceColorWriteEnableFeaturesEXT {
    public func push<NewValue: PhysicalDeviceColorWriteEnableFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineColorWriteCreateInfoEXT {
    public func push<NewValue: PipelineColorWriteCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryBarrier2 {
    public func push<NewValue: MemoryBarrier2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageMemoryBarrier2 {
    public func push<NewValue: ImageMemoryBarrier2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferMemoryBarrier2 {
    public func push<NewValue: BufferMemoryBarrier2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryBarrierAccessFlags3KHR {
    public func push<NewValue: MemoryBarrierAccessFlags3KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DependencyInfo {
    public func push<NewValue: DependencyInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SemaphoreSubmitInfo {
    public func push<NewValue: SemaphoreSubmitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferSubmitInfo {
    public func push<NewValue: CommandBufferSubmitInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubmitInfo2 {
    public func push<NewValue: SubmitInfo2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyCheckpointProperties2NV {
    public func push<NewValue: QueueFamilyCheckpointProperties2NVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CheckpointData2NV {
    public func push<NewValue: CheckpointData2NVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSynchronization2Features {
    public func push<NewValue: PhysicalDeviceSynchronization2FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceUnifiedImageLayoutsFeaturesKHR {
    public func push<NewValue: PhysicalDeviceUnifiedImageLayoutsFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceHostImageCopyFeatures {
    public func push<NewValue: PhysicalDeviceHostImageCopyFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceHostImageCopyProperties {
    public func push<NewValue: PhysicalDeviceHostImageCopyPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryToImageCopy {
    public func push<NewValue: MemoryToImageCopyExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageToMemoryCopy {
    public func push<NewValue: ImageToMemoryCopyExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyMemoryToImageInfo {
    public func push<NewValue: CopyMemoryToImageInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyImageToMemoryInfo {
    public func push<NewValue: CopyImageToMemoryInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyImageToImageInfo {
    public func push<NewValue: CopyImageToImageInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == HostImageLayoutTransitionInfo {
    public func push<NewValue: HostImageLayoutTransitionInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubresourceHostMemcpySize {
    public func push<NewValue: SubresourceHostMemcpySizeExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == HostImageCopyDevicePerformanceQuery {
    public func push<NewValue: HostImageCopyDevicePerformanceQueryExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT {
    public func push<NewValue: PhysicalDevicePrimitivesGeneratedQueryFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLegacyDitheringFeaturesEXT {
    public func push<NewValue: PhysicalDeviceLegacyDitheringFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceCapabilitiesPresentId2KHR {
    public func push<NewValue: SurfaceCapabilitiesPresentId2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfaceCapabilitiesPresentWait2KHR {
    public func push<NewValue: SurfaceCapabilitiesPresentWait2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubpassResolvePerformanceQueryEXT {
    public func push<NewValue: SubpassResolvePerformanceQueryEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MultisampledRenderToSingleSampledInfoEXT {
    public func push<NewValue: MultisampledRenderToSingleSampledInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineProtectedAccessFeatures {
    public func push<NewValue: PhysicalDevicePipelineProtectedAccessFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyVideoPropertiesKHR {
    public func push<NewValue: QueueFamilyVideoPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyQueryResultStatusPropertiesKHR {
    public func push<NewValue: QueueFamilyQueryResultStatusPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoProfileInfoKHR {
    public func push<NewValue: VideoProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoProfileListInfoKHR {
    public func push<NewValue: VideoProfileListInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoFormatInfoKHR {
    public func push<NewValue: PhysicalDeviceVideoFormatInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoFormatPropertiesKHR {
    public func push<NewValue: VideoFormatPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeQuantizationMapCapabilitiesKHR {
    public func push<NewValue: VideoEncodeQuantizationMapCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264QuantizationMapCapabilitiesKHR {
    public func push<NewValue: VideoEncodeH264QuantizationMapCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265QuantizationMapCapabilitiesKHR {
    public func push<NewValue: VideoEncodeH265QuantizationMapCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1QuantizationMapCapabilitiesKHR {
    public func push<NewValue: VideoEncodeAV1QuantizationMapCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoFormatQuantizationMapPropertiesKHR {
    public func push<NewValue: VideoFormatQuantizationMapPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoFormatH265QuantizationMapPropertiesKHR {
    public func push<NewValue: VideoFormatH265QuantizationMapPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoFormatAV1QuantizationMapPropertiesKHR {
    public func push<NewValue: VideoFormatAV1QuantizationMapPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoCapabilitiesKHR {
    public func push<NewValue: VideoCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoSessionMemoryRequirementsKHR {
    public func push<NewValue: VideoSessionMemoryRequirementsKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindVideoSessionMemoryInfoKHR {
    public func push<NewValue: BindVideoSessionMemoryInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoPictureResourceInfoKHR {
    public func push<NewValue: VideoPictureResourceInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoReferenceSlotInfoKHR {
    public func push<NewValue: VideoReferenceSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeCapabilitiesKHR {
    public func push<NewValue: VideoDecodeCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeUsageInfoKHR {
    public func push<NewValue: VideoDecodeUsageInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeInfoKHR {
    public func push<NewValue: VideoDecodeInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoMaintenance1FeaturesKHR {
    public func push<NewValue: PhysicalDeviceVideoMaintenance1FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoMaintenance2FeaturesKHR {
    public func push<NewValue: PhysicalDeviceVideoMaintenance2FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoInlineQueryInfoKHR {
    public func push<NewValue: VideoInlineQueryInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264ProfileInfoKHR {
    public func push<NewValue: VideoDecodeH264ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264CapabilitiesKHR {
    public func push<NewValue: VideoDecodeH264CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264SessionParametersAddInfoKHR {
    public func push<NewValue: VideoDecodeH264SessionParametersAddInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264SessionParametersCreateInfoKHR {
    public func push<NewValue: VideoDecodeH264SessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264InlineSessionParametersInfoKHR {
    public func push<NewValue: VideoDecodeH264InlineSessionParametersInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264PictureInfoKHR {
    public func push<NewValue: VideoDecodeH264PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH264DpbSlotInfoKHR {
    public func push<NewValue: VideoDecodeH264DpbSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265ProfileInfoKHR {
    public func push<NewValue: VideoDecodeH265ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265CapabilitiesKHR {
    public func push<NewValue: VideoDecodeH265CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265SessionParametersAddInfoKHR {
    public func push<NewValue: VideoDecodeH265SessionParametersAddInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265SessionParametersCreateInfoKHR {
    public func push<NewValue: VideoDecodeH265SessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265InlineSessionParametersInfoKHR {
    public func push<NewValue: VideoDecodeH265InlineSessionParametersInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265PictureInfoKHR {
    public func push<NewValue: VideoDecodeH265PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeH265DpbSlotInfoKHR {
    public func push<NewValue: VideoDecodeH265DpbSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoDecodeVP9FeaturesKHR {
    public func push<NewValue: PhysicalDeviceVideoDecodeVP9FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeVP9ProfileInfoKHR {
    public func push<NewValue: VideoDecodeVP9ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeVP9CapabilitiesKHR {
    public func push<NewValue: VideoDecodeVP9CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeVP9PictureInfoKHR {
    public func push<NewValue: VideoDecodeVP9PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeAV1ProfileInfoKHR {
    public func push<NewValue: VideoDecodeAV1ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeAV1CapabilitiesKHR {
    public func push<NewValue: VideoDecodeAV1CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeAV1SessionParametersCreateInfoKHR {
    public func push<NewValue: VideoDecodeAV1SessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeAV1InlineSessionParametersInfoKHR {
    public func push<NewValue: VideoDecodeAV1InlineSessionParametersInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeAV1PictureInfoKHR {
    public func push<NewValue: VideoDecodeAV1PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoDecodeAV1DpbSlotInfoKHR {
    public func push<NewValue: VideoDecodeAV1DpbSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoSessionCreateInfoKHR {
    public func push<NewValue: VideoSessionCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoSessionParametersCreateInfoKHR {
    public func push<NewValue: VideoSessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoSessionParametersUpdateInfoKHR {
    public func push<NewValue: VideoSessionParametersUpdateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeSessionParametersGetInfoKHR {
    public func push<NewValue: VideoEncodeSessionParametersGetInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeSessionParametersFeedbackInfoKHR {
    public func push<NewValue: VideoEncodeSessionParametersFeedbackInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoBeginCodingInfoKHR {
    public func push<NewValue: VideoBeginCodingInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEndCodingInfoKHR {
    public func push<NewValue: VideoEndCodingInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoCodingControlInfoKHR {
    public func push<NewValue: VideoCodingControlInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeUsageInfoKHR {
    public func push<NewValue: VideoEncodeUsageInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeInfoKHR {
    public func push<NewValue: VideoEncodeInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeQuantizationMapInfoKHR {
    public func push<NewValue: VideoEncodeQuantizationMapInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeQuantizationMapSessionParametersCreateInfoKHR {
    public func push<NewValue: VideoEncodeQuantizationMapSessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR {
    public func push<NewValue: PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueryPoolVideoEncodeFeedbackCreateInfoKHR {
    public func push<NewValue: QueryPoolVideoEncodeFeedbackCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeQualityLevelInfoKHR {
    public func push<NewValue: VideoEncodeQualityLevelInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoEncodeQualityLevelInfoKHR {
    public func push<NewValue: PhysicalDeviceVideoEncodeQualityLevelInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeQualityLevelPropertiesKHR {
    public func push<NewValue: VideoEncodeQualityLevelPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeRateControlLayerInfoKHR {
    public func push<NewValue: VideoEncodeRateControlLayerInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeRateControlInfoKHR {
    public func push<NewValue: VideoEncodeRateControlInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeCapabilitiesKHR {
    public func push<NewValue: VideoEncodeCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264CapabilitiesKHR {
    public func push<NewValue: VideoEncodeH264CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264QualityLevelPropertiesKHR {
    public func push<NewValue: VideoEncodeH264QualityLevelPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264SessionCreateInfoKHR {
    public func push<NewValue: VideoEncodeH264SessionCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264SessionParametersAddInfoKHR {
    public func push<NewValue: VideoEncodeH264SessionParametersAddInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264SessionParametersCreateInfoKHR {
    public func push<NewValue: VideoEncodeH264SessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264SessionParametersGetInfoKHR {
    public func push<NewValue: VideoEncodeH264SessionParametersGetInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264SessionParametersFeedbackInfoKHR {
    public func push<NewValue: VideoEncodeH264SessionParametersFeedbackInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264DpbSlotInfoKHR {
    public func push<NewValue: VideoEncodeH264DpbSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264NaluSliceInfoKHR {
    public func push<NewValue: VideoEncodeH264NaluSliceInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264PictureInfoKHR {
    public func push<NewValue: VideoEncodeH264PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264ProfileInfoKHR {
    public func push<NewValue: VideoEncodeH264ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264RateControlInfoKHR {
    public func push<NewValue: VideoEncodeH264RateControlInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264GopRemainingFrameInfoKHR {
    public func push<NewValue: VideoEncodeH264GopRemainingFrameInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH264RateControlLayerInfoKHR {
    public func push<NewValue: VideoEncodeH264RateControlLayerInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265CapabilitiesKHR {
    public func push<NewValue: VideoEncodeH265CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265QualityLevelPropertiesKHR {
    public func push<NewValue: VideoEncodeH265QualityLevelPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265SessionCreateInfoKHR {
    public func push<NewValue: VideoEncodeH265SessionCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265SessionParametersAddInfoKHR {
    public func push<NewValue: VideoEncodeH265SessionParametersAddInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265SessionParametersCreateInfoKHR {
    public func push<NewValue: VideoEncodeH265SessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265SessionParametersGetInfoKHR {
    public func push<NewValue: VideoEncodeH265SessionParametersGetInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265SessionParametersFeedbackInfoKHR {
    public func push<NewValue: VideoEncodeH265SessionParametersFeedbackInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265NaluSliceSegmentInfoKHR {
    public func push<NewValue: VideoEncodeH265NaluSliceSegmentInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265PictureInfoKHR {
    public func push<NewValue: VideoEncodeH265PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265RateControlInfoKHR {
    public func push<NewValue: VideoEncodeH265RateControlInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265GopRemainingFrameInfoKHR {
    public func push<NewValue: VideoEncodeH265GopRemainingFrameInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265RateControlLayerInfoKHR {
    public func push<NewValue: VideoEncodeH265RateControlLayerInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265ProfileInfoKHR {
    public func push<NewValue: VideoEncodeH265ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeH265DpbSlotInfoKHR {
    public func push<NewValue: VideoEncodeH265DpbSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1CapabilitiesKHR {
    public func push<NewValue: VideoEncodeAV1CapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1QualityLevelPropertiesKHR {
    public func push<NewValue: VideoEncodeAV1QualityLevelPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoEncodeAV1FeaturesKHR {
    public func push<NewValue: PhysicalDeviceVideoEncodeAV1FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1SessionCreateInfoKHR {
    public func push<NewValue: VideoEncodeAV1SessionCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1SessionParametersCreateInfoKHR {
    public func push<NewValue: VideoEncodeAV1SessionParametersCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1DpbSlotInfoKHR {
    public func push<NewValue: VideoEncodeAV1DpbSlotInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1PictureInfoKHR {
    public func push<NewValue: VideoEncodeAV1PictureInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1ProfileInfoKHR {
    public func push<NewValue: VideoEncodeAV1ProfileInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1RateControlInfoKHR {
    public func push<NewValue: VideoEncodeAV1RateControlInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1GopRemainingFrameInfoKHR {
    public func push<NewValue: VideoEncodeAV1GopRemainingFrameInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeAV1RateControlLayerInfoKHR {
    public func push<NewValue: VideoEncodeAV1RateControlLayerInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceInheritedViewportScissorFeaturesNV {
    public func push<NewValue: PhysicalDeviceInheritedViewportScissorFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferInheritanceViewportScissorInfoNV {
    public func push<NewValue: CommandBufferInheritanceViewportScissorInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT {
    public func push<NewValue: PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceProvokingVertexFeaturesEXT {
    public func push<NewValue: PhysicalDeviceProvokingVertexFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceProvokingVertexPropertiesEXT {
    public func push<NewValue: PhysicalDeviceProvokingVertexPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRasterizationProvokingVertexStateCreateInfoEXT {
    public func push<NewValue: PipelineRasterizationProvokingVertexStateCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeIntraRefreshCapabilitiesKHR {
    public func push<NewValue: VideoEncodeIntraRefreshCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeSessionIntraRefreshCreateInfoKHR {
    public func push<NewValue: VideoEncodeSessionIntraRefreshCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeIntraRefreshInfoKHR {
    public func push<NewValue: VideoEncodeIntraRefreshInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoReferenceIntraRefreshInfoKHR {
    public func push<NewValue: VideoReferenceIntraRefreshInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoEncodeIntraRefreshFeaturesKHR {
    public func push<NewValue: PhysicalDeviceVideoEncodeIntraRefreshFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CuModuleCreateInfoNVX {
    public func push<NewValue: CuModuleCreateInfoNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CuModuleTexturingModeCreateInfoNVX {
    public func push<NewValue: CuModuleTexturingModeCreateInfoNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CuFunctionCreateInfoNVX {
    public func push<NewValue: CuFunctionCreateInfoNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CuLaunchInfoNVX {
    public func push<NewValue: CuLaunchInfoNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorBufferFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDescriptorBufferFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorBufferPropertiesEXT {
    public func push<NewValue: PhysicalDeviceDescriptorBufferPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorBufferDensityMapPropertiesEXT {
    public func push<NewValue: PhysicalDeviceDescriptorBufferDensityMapPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorAddressInfoEXT {
    public func push<NewValue: DescriptorAddressInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorBufferBindingInfoEXT {
    public func push<NewValue: DescriptorBufferBindingInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorBufferBindingPushDescriptorBufferHandleEXT {
    public func push<NewValue: DescriptorBufferBindingPushDescriptorBufferHandleEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorGetInfoEXT {
    public func push<NewValue: DescriptorGetInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BufferCaptureDescriptorDataInfoEXT {
    public func push<NewValue: BufferCaptureDescriptorDataInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageCaptureDescriptorDataInfoEXT {
    public func push<NewValue: ImageCaptureDescriptorDataInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewCaptureDescriptorDataInfoEXT {
    public func push<NewValue: ImageViewCaptureDescriptorDataInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerCaptureDescriptorDataInfoEXT {
    public func push<NewValue: SamplerCaptureDescriptorDataInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureCaptureDescriptorDataInfoEXT {
    public func push<NewValue: AccelerationStructureCaptureDescriptorDataInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpaqueCaptureDescriptorDataCreateInfoEXT {
    public func push<NewValue: OpaqueCaptureDescriptorDataCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderIntegerDotProductFeatures {
    public func push<NewValue: PhysicalDeviceShaderIntegerDotProductFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderIntegerDotProductProperties {
    public func push<NewValue: PhysicalDeviceShaderIntegerDotProductPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDrmPropertiesEXT {
    public func push<NewValue: PhysicalDeviceDrmPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShaderBarycentricFeaturesKHR {
    public func push<NewValue: PhysicalDeviceFragmentShaderBarycentricFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentShaderBarycentricPropertiesKHR {
    public func push<NewValue: PhysicalDeviceFragmentShaderBarycentricPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderFmaFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderFmaFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingMotionBlurFeaturesNV {
    public func push<NewValue: PhysicalDeviceRayTracingMotionBlurFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingValidationFeaturesNV {
    public func push<NewValue: PhysicalDeviceRayTracingValidationFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingLinearSweptSpheresFeaturesNV {
    public func push<NewValue: PhysicalDeviceRayTracingLinearSweptSpheresFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureGeometryMotionTrianglesDataNV {
    public func push<NewValue: AccelerationStructureGeometryMotionTrianglesDataNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureMotionInfoNV {
    public func push<NewValue: AccelerationStructureMotionInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryGetRemoteAddressInfoNV {
    public func push<NewValue: MemoryGetRemoteAddressInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == ImportMemoryBufferCollectionFUCHSIA {
    public func push<NewValue: ImportMemoryBufferCollectionFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == BufferCollectionImageCreateInfoFUCHSIA {
    public func push<NewValue: BufferCollectionImageCreateInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == BufferCollectionBufferCreateInfoFUCHSIA {
    public func push<NewValue: BufferCollectionBufferCreateInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == BufferCollectionCreateInfoFUCHSIA {
    public func push<NewValue: BufferCollectionCreateInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == SysmemColorSpaceFUCHSIA {
    public func push<NewValue: SysmemColorSpaceFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == BufferCollectionPropertiesFUCHSIA {
    public func push<NewValue: BufferCollectionPropertiesFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == BufferCollectionConstraintsInfoFUCHSIA {
    public func push<NewValue: BufferCollectionConstraintsInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == BufferConstraintsInfoFUCHSIA {
    public func push<NewValue: BufferConstraintsInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == ImageFormatConstraintsInfoFUCHSIA {
    public func push<NewValue: ImageFormatConstraintsInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
extension Chain where Base == ImageConstraintsInfoFUCHSIA {
    public func push<NewValue: ImageConstraintsInfoFUCHSIAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == CudaModuleCreateInfoNV {
    public func push<NewValue: CudaModuleCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == CudaFunctionCreateInfoNV {
    public func push<NewValue: CudaFunctionCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == CudaLaunchInfoNV {
    public func push<NewValue: CudaLaunchInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceRGBA10X6FormatsFeaturesEXT {
    public func push<NewValue: PhysicalDeviceRGBA10X6FormatsFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FormatProperties3 {
    public func push<NewValue: FormatProperties3Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DrmFormatModifierPropertiesList2EXT {
    public func push<NewValue: DrmFormatModifierPropertiesList2EXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == AndroidHardwareBufferFormatProperties2ANDROID {
    public func push<NewValue: AndroidHardwareBufferFormatProperties2ANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PipelineRenderingCreateInfo {
    public func push<NewValue: PipelineRenderingCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingAttachmentInfo {
    public func push<NewValue: RenderingAttachmentInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingInfo {
    public func push<NewValue: RenderingInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingEndInfoKHR {
    public func push<NewValue: RenderingEndInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingFragmentShadingRateAttachmentInfoKHR {
    public func push<NewValue: RenderingFragmentShadingRateAttachmentInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingFragmentDensityMapAttachmentInfoEXT {
    public func push<NewValue: RenderingFragmentDensityMapAttachmentInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDynamicRenderingFeatures {
    public func push<NewValue: PhysicalDeviceDynamicRenderingFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferInheritanceRenderingInfo {
    public func push<NewValue: CommandBufferInheritanceRenderingInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AttachmentSampleCountInfoAMD {
    public func push<NewValue: AttachmentSampleCountInfoAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MultiviewPerViewAttributesInfoNVX {
    public func push<NewValue: MultiviewPerViewAttributesInfoNVXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageViewMinLodFeaturesEXT {
    public func push<NewValue: PhysicalDeviceImageViewMinLodFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewMinLodCreateInfoEXT {
    public func push<NewValue: ImageViewMinLodCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT {
    public func push<NewValue: PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLinearColorAttachmentFeaturesNV {
    public func push<NewValue: PhysicalDeviceLinearColorAttachmentFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT {
    public func push<NewValue: PhysicalDeviceGraphicsPipelineLibraryFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineBinaryFeaturesKHR {
    public func push<NewValue: PhysicalDevicePipelineBinaryFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DevicePipelineBinaryInternalCacheControlKHR {
    public func push<NewValue: DevicePipelineBinaryInternalCacheControlKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineBinaryPropertiesKHR {
    public func push<NewValue: PhysicalDevicePipelineBinaryPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT {
    public func push<NewValue: PhysicalDeviceGraphicsPipelineLibraryPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GraphicsPipelineLibraryCreateInfoEXT {
    public func push<NewValue: GraphicsPipelineLibraryCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDataGraphNeuralAcceleratorStatisticsFeaturesARM {
    public func push<NewValue: PhysicalDeviceDataGraphNeuralAcceleratorStatisticsFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineNeuralStatisticsCreateInfoARM {
    public func push<NewValue: DataGraphPipelineNeuralStatisticsCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSessionNeuralStatisticsCreateInfoARM {
    public func push<NewValue: DataGraphPipelineSessionNeuralStatisticsCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorSetHostMappingFeaturesVALVE {
    public func push<NewValue: PhysicalDeviceDescriptorSetHostMappingFeaturesVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetBindingReferenceVALVE {
    public func push<NewValue: DescriptorSetBindingReferenceVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetLayoutHostMappingInfoVALVE {
    public func push<NewValue: DescriptorSetLayoutHostMappingInfoVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceNestedCommandBufferFeaturesEXT {
    public func push<NewValue: PhysicalDeviceNestedCommandBufferFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceNestedCommandBufferPropertiesEXT {
    public func push<NewValue: PhysicalDeviceNestedCommandBufferPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderModuleIdentifierFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderModuleIdentifierFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderModuleIdentifierPropertiesEXT {
    public func push<NewValue: PhysicalDeviceShaderModuleIdentifierPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineShaderStageModuleIdentifierCreateInfoEXT {
    public func push<NewValue: PipelineShaderStageModuleIdentifierCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderModuleIdentifierEXT {
    public func push<NewValue: ShaderModuleIdentifierEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageCompressionControlEXT {
    public func push<NewValue: ImageCompressionControlEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageCompressionControlFeaturesEXT {
    public func push<NewValue: PhysicalDeviceImageCompressionControlFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageCompressionPropertiesEXT {
    public func push<NewValue: ImageCompressionPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT {
    public func push<NewValue: PhysicalDeviceImageCompressionControlSwapchainFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageSubresource2 {
    public func push<NewValue: ImageSubresource2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubresourceLayout2 {
    public func push<NewValue: SubresourceLayout2Extension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassCreationControlEXT {
    public func push<NewValue: RenderPassCreationControlEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassCreationFeedbackCreateInfoEXT {
    public func push<NewValue: RenderPassCreationFeedbackCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassSubpassFeedbackCreateInfoEXT {
    public func push<NewValue: RenderPassSubpassFeedbackCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSubpassMergeFeedbackFeaturesEXT {
    public func push<NewValue: PhysicalDeviceSubpassMergeFeedbackFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceDisplacementMicromapFeaturesNV {
    public func push<NewValue: PhysicalDeviceDisplacementMicromapFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceDisplacementMicromapPropertiesNV {
    public func push<NewValue: PhysicalDeviceDisplacementMicromapPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == AccelerationStructureTrianglesDisplacementMicromapNV {
    public func push<NewValue: AccelerationStructureTrianglesDisplacementMicromapNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PipelinePropertiesIdentifierEXT {
    public func push<NewValue: PipelinePropertiesIdentifierEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelinePropertiesFeaturesEXT {
    public func push<NewValue: PhysicalDevicePipelinePropertiesFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD {
    public func push<NewValue: PhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalMemoryAcquireUnmodifiedEXT {
    public func push<NewValue: ExternalMemoryAcquireUnmodifiedEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalObjectCreateInfoEXT {
    public func push<NewValue: ExportMetalObjectCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalObjectsInfoEXT {
    public func push<NewValue: ExportMetalObjectsInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalDeviceInfoEXT {
    public func push<NewValue: ExportMetalDeviceInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalCommandQueueInfoEXT {
    public func push<NewValue: ExportMetalCommandQueueInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalBufferInfoEXT {
    public func push<NewValue: ExportMetalBufferInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ImportMetalBufferInfoEXT {
    public func push<NewValue: ImportMetalBufferInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalTextureInfoEXT {
    public func push<NewValue: ExportMetalTextureInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ImportMetalTextureInfoEXT {
    public func push<NewValue: ImportMetalTextureInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalIOSurfaceInfoEXT {
    public func push<NewValue: ExportMetalIOSurfaceInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ImportMetalIOSurfaceInfoEXT {
    public func push<NewValue: ImportMetalIOSurfaceInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ExportMetalSharedEventInfoEXT {
    public func push<NewValue: ExportMetalSharedEventInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
extension Chain where Base == ImportMetalSharedEventInfoEXT {
    public func push<NewValue: ImportMetalSharedEventInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceNonSeamlessCubeMapFeaturesEXT {
    public func push<NewValue: PhysicalDeviceNonSeamlessCubeMapFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineRobustnessFeatures {
    public func push<NewValue: PhysicalDevicePipelineRobustnessFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineRobustnessCreateInfo {
    public func push<NewValue: PipelineRobustnessCreateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineRobustnessProperties {
    public func push<NewValue: PhysicalDevicePipelineRobustnessPropertiesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageViewSampleWeightCreateInfoQCOM {
    public func push<NewValue: ImageViewSampleWeightCreateInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageProcessingFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceImageProcessingFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageProcessingPropertiesQCOM {
    public func push<NewValue: PhysicalDeviceImageProcessingPropertiesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTilePropertiesFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceTilePropertiesFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TilePropertiesQCOM {
    public func push<NewValue: TilePropertiesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TileMemoryBindInfoQCOM {
    public func push<NewValue: TileMemoryBindInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceAmigoProfilingFeaturesSEC {
    public func push<NewValue: PhysicalDeviceAmigoProfilingFeaturesSECExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AmigoProfilingSubmitInfoSEC {
    public func push<NewValue: AmigoProfilingSubmitInfoSECExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT {
    public func push<NewValue: PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AttachmentFeedbackLoopInfoEXT {
    public func push<NewValue: AttachmentFeedbackLoopInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceAddressBindingReportFeaturesEXT {
    public func push<NewValue: PhysicalDeviceAddressBindingReportFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingAttachmentFlagsInfoKHR {
    public func push<NewValue: RenderingAttachmentFlagsInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ResolveImageModeInfoKHR {
    public func push<NewValue: ResolveImageModeInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceAddressBindingCallbackDataEXT {
    public func push<NewValue: DeviceAddressBindingCallbackDataEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceOpticalFlowFeaturesNV {
    public func push<NewValue: PhysicalDeviceOpticalFlowFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceOpticalFlowPropertiesNV {
    public func push<NewValue: PhysicalDeviceOpticalFlowPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpticalFlowImageFormatInfoNV {
    public func push<NewValue: OpticalFlowImageFormatInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpticalFlowImageFormatPropertiesNV {
    public func push<NewValue: OpticalFlowImageFormatPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpticalFlowSessionCreateInfoNV {
    public func push<NewValue: OpticalFlowSessionCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpticalFlowSessionCreatePrivateDataInfoNV {
    public func push<NewValue: OpticalFlowSessionCreatePrivateDataInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpticalFlowExecuteInfoNV {
    public func push<NewValue: OpticalFlowExecuteInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFaultFeaturesEXT {
    public func push<NewValue: PhysicalDeviceFaultFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceFaultInfoKHR {
    public func push<NewValue: DeviceFaultInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceFaultDebugInfoKHR {
    public func push<NewValue: DeviceFaultDebugInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceFaultCountsEXT {
    public func push<NewValue: DeviceFaultCountsEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceFaultInfoEXT {
    public func push<NewValue: DeviceFaultInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFaultFeaturesKHR {
    public func push<NewValue: PhysicalDeviceFaultFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFaultPropertiesKHR {
    public func push<NewValue: PhysicalDeviceFaultPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT {
    public func push<NewValue: PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DepthBiasInfoEXT {
    public func push<NewValue: DepthBiasInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DepthBiasRepresentationInfoEXT {
    public func push<NewValue: DepthBiasRepresentationInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DecompressMemoryInfoEXT {
    public func push<NewValue: DecompressMemoryInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderCoreBuiltinsPropertiesARM {
    public func push<NewValue: PhysicalDeviceShaderCoreBuiltinsPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderCoreBuiltinsFeaturesARM {
    public func push<NewValue: PhysicalDeviceShaderCoreBuiltinsFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FrameBoundaryEXT {
    public func push<NewValue: FrameBoundaryEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFrameBoundaryFeaturesEXT {
    public func push<NewValue: PhysicalDeviceFrameBoundaryFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceInternallySynchronizedQueuesFeaturesKHR {
    public func push<NewValue: PhysicalDeviceInternallySynchronizedQueuesFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfacePresentModeKHR {
    public func push<NewValue: SurfacePresentModeKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfacePresentScalingCapabilitiesKHR {
    public func push<NewValue: SurfacePresentScalingCapabilitiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SurfacePresentModeCompatibilityKHR {
    public func push<NewValue: SurfacePresentModeCompatibilityKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSwapchainMaintenance1FeaturesKHR {
    public func push<NewValue: PhysicalDeviceSwapchainMaintenance1FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainPresentFenceInfoKHR {
    public func push<NewValue: SwapchainPresentFenceInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainPresentModesCreateInfoKHR {
    public func push<NewValue: SwapchainPresentModesCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainPresentModeInfoKHR {
    public func push<NewValue: SwapchainPresentModeInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainPresentScalingCreateInfoKHR {
    public func push<NewValue: SwapchainPresentScalingCreateInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ReleaseSwapchainImagesInfoKHR {
    public func push<NewValue: ReleaseSwapchainImagesInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDepthBiasControlFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDepthBiasControlFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingInvocationReorderFeaturesEXT {
    public func push<NewValue: PhysicalDeviceRayTracingInvocationReorderFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingInvocationReorderFeaturesNV {
    public func push<NewValue: PhysicalDeviceRayTracingInvocationReorderFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingInvocationReorderPropertiesEXT {
    public func push<NewValue: PhysicalDeviceRayTracingInvocationReorderPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingInvocationReorderPropertiesNV {
    public func push<NewValue: PhysicalDeviceRayTracingInvocationReorderPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExtendedSparseAddressSpaceFeaturesNV {
    public func push<NewValue: PhysicalDeviceExtendedSparseAddressSpaceFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExtendedSparseAddressSpacePropertiesNV {
    public func push<NewValue: PhysicalDeviceExtendedSparseAddressSpacePropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DirectDriverLoadingInfoLUNARG {
    public func push<NewValue: DirectDriverLoadingInfoLUNARGExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DirectDriverLoadingListLUNARG {
    public func push<NewValue: DirectDriverLoadingListLUNARGExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiviewPerViewViewportsFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceMultiviewPerViewViewportsFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRayTracingPositionFetchFeaturesKHR {
    public func push<NewValue: PhysicalDeviceRayTracingPositionFetchFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceImageSubresourceInfo {
    public func push<NewValue: DeviceImageSubresourceInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderCorePropertiesARM {
    public func push<NewValue: PhysicalDeviceShaderCorePropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MultiviewPerViewRenderAreasRenderPassBeginInfoQCOM {
    public func push<NewValue: MultiviewPerViewRenderAreasRenderPassBeginInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueryLowLatencySupportNV {
    public func push<NewValue: QueryLowLatencySupportNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryMapInfo {
    public func push<NewValue: MemoryMapInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryUnmapInfo {
    public func push<NewValue: MemoryUnmapInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderObjectFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderObjectFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderObjectPropertiesEXT {
    public func push<NewValue: PhysicalDeviceShaderObjectPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderCreateInfoEXT {
    public func push<NewValue: ShaderCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderTileImageFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderTileImageFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderTileImagePropertiesEXT {
    public func push<NewValue: PhysicalDeviceShaderTileImagePropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_SCREEN_QNX
extension Chain where Base == ImportScreenBufferInfoQNX {
    public func push<NewValue: ImportScreenBufferInfoQNXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_SCREEN_QNX
extension Chain where Base == ScreenBufferPropertiesQNX {
    public func push<NewValue: ScreenBufferPropertiesQNXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_SCREEN_QNX
extension Chain where Base == ScreenBufferFormatPropertiesQNX {
    public func push<NewValue: ScreenBufferFormatPropertiesQNXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_SCREEN_QNX
extension Chain where Base == ExternalFormatQNX {
    public func push<NewValue: ExternalFormatQNXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_SCREEN_QNX
extension Chain where Base == PhysicalDeviceExternalMemoryScreenBufferFeaturesQNX {
    public func push<NewValue: PhysicalDeviceExternalMemoryScreenBufferFeaturesQNXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceCooperativeMatrixFeaturesKHR {
    public func push<NewValue: PhysicalDeviceCooperativeMatrixFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CooperativeMatrixPropertiesKHR {
    public func push<NewValue: CooperativeMatrixPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeMatrixPropertiesKHR {
    public func push<NewValue: PhysicalDeviceCooperativeMatrixPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeMatrixConversionFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceCooperativeMatrixConversionFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceShaderEnqueuePropertiesAMDX {
    public func push<NewValue: PhysicalDeviceShaderEnqueuePropertiesAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceShaderEnqueueFeaturesAMDX {
    public func push<NewValue: PhysicalDeviceShaderEnqueueFeaturesAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == ExecutionGraphPipelineCreateInfoAMDX {
    public func push<NewValue: ExecutionGraphPipelineCreateInfoAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PipelineShaderStageNodeCreateInfoAMDX {
    public func push<NewValue: PipelineShaderStageNodeCreateInfoAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == ExecutionGraphPipelineScratchSizeAMDX {
    public func push<NewValue: ExecutionGraphPipelineScratchSizeAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceAntiLagFeaturesAMD {
    public func push<NewValue: PhysicalDeviceAntiLagFeaturesAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AntiLagPresentationInfoAMD {
    public func push<NewValue: AntiLagPresentationInfoAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AntiLagDataAMD {
    public func push<NewValue: AntiLagDataAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindMemoryStatus {
    public func push<NewValue: BindMemoryStatusExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTileMemoryHeapFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceTileMemoryHeapFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTileMemoryHeapPropertiesQCOM {
    public func push<NewValue: PhysicalDeviceTileMemoryHeapPropertiesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TileMemorySizeInfoQCOM {
    public func push<NewValue: TileMemorySizeInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TileMemoryRequirementsQCOM {
    public func push<NewValue: TileMemoryRequirementsQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindDescriptorSetsInfo {
    public func push<NewValue: BindDescriptorSetsInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PushConstantsInfo {
    public func push<NewValue: PushConstantsInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PushDescriptorSetInfo {
    public func push<NewValue: PushDescriptorSetInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PushDescriptorSetWithTemplateInfo {
    public func push<NewValue: PushDescriptorSetWithTemplateInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SetDescriptorBufferOffsetsInfoEXT {
    public func push<NewValue: SetDescriptorBufferOffsetsInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindDescriptorBufferEmbeddedSamplersInfoEXT {
    public func push<NewValue: BindDescriptorBufferEmbeddedSamplersInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCubicClampFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceCubicClampFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceYcbcrDegammaFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceYcbcrDegammaFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM {
    public func push<NewValue: SamplerYcbcrConversionYcbcrDegammaCreateInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCubicWeightsFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceCubicWeightsFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerCubicWeightsCreateInfoQCOM {
    public func push<NewValue: SamplerCubicWeightsCreateInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BlitImageCubicWeightsInfoQCOM {
    public func push<NewValue: BlitImageCubicWeightsInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageProcessing2FeaturesQCOM {
    public func push<NewValue: PhysicalDeviceImageProcessing2FeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageProcessing2PropertiesQCOM {
    public func push<NewValue: PhysicalDeviceImageProcessing2PropertiesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerBlockMatchWindowCreateInfoQCOM {
    public func push<NewValue: SamplerBlockMatchWindowCreateInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorPoolOverallocationFeaturesNV {
    public func push<NewValue: PhysicalDeviceDescriptorPoolOverallocationFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceLayeredDriverPropertiesMSFT {
    public func push<NewValue: PhysicalDeviceLayeredDriverPropertiesMSFTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePerStageDescriptorSetFeaturesNV {
    public func push<NewValue: PhysicalDevicePerStageDescriptorSetFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == PhysicalDeviceExternalFormatResolveFeaturesANDROID {
    public func push<NewValue: PhysicalDeviceExternalFormatResolveFeaturesANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == PhysicalDeviceExternalFormatResolvePropertiesANDROID {
    public func push<NewValue: PhysicalDeviceExternalFormatResolvePropertiesANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_ANDROID_KHR
extension Chain where Base == AndroidHardwareBufferFormatResolvePropertiesANDROID {
    public func push<NewValue: AndroidHardwareBufferFormatResolvePropertiesANDROIDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == LatencySleepModeInfoNV {
    public func push<NewValue: LatencySleepModeInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == LatencySleepInfoNV {
    public func push<NewValue: LatencySleepInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SetLatencyMarkerInfoNV {
    public func push<NewValue: SetLatencyMarkerInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == LatencyTimingsFrameReportNV {
    public func push<NewValue: LatencyTimingsFrameReportNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == GetLatencyMarkerInfoNV {
    public func push<NewValue: GetLatencyMarkerInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OutOfBandQueueTypeInfoNV {
    public func push<NewValue: OutOfBandQueueTypeInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == LatencySubmissionPresentIdNV {
    public func push<NewValue: LatencySubmissionPresentIdNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SwapchainLatencyCreateInfoNV {
    public func push<NewValue: SwapchainLatencyCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == LatencySurfaceCapabilitiesNV {
    public func push<NewValue: LatencySurfaceCapabilitiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceCudaKernelLaunchFeaturesNV {
    public func push<NewValue: PhysicalDeviceCudaKernelLaunchFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceCudaKernelLaunchPropertiesNV {
    public func push<NewValue: PhysicalDeviceCudaKernelLaunchPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == DeviceQueueShaderCoreControlCreateInfoARM {
    public func push<NewValue: DeviceQueueShaderCoreControlCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSchedulingControlsFeaturesARM {
    public func push<NewValue: PhysicalDeviceSchedulingControlsFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSchedulingControlsPropertiesARM {
    public func push<NewValue: PhysicalDeviceSchedulingControlsPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceSchedulingControlsDispatchParametersPropertiesARM {
    public func push<NewValue: PhysicalDeviceSchedulingControlsDispatchParametersPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DispatchParametersARM {
    public func push<NewValue: DispatchParametersARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRelaxedLineRasterizationFeaturesIMG {
    public func push<NewValue: PhysicalDeviceRelaxedLineRasterizationFeaturesIMGExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRenderPassStripedFeaturesARM {
    public func push<NewValue: PhysicalDeviceRenderPassStripedFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRenderPassStripedPropertiesARM {
    public func push<NewValue: PhysicalDeviceRenderPassStripedPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassStripeInfoARM {
    public func push<NewValue: RenderPassStripeInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassStripeBeginInfoARM {
    public func push<NewValue: RenderPassStripeBeginInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassStripeSubmitInfoARM {
    public func push<NewValue: RenderPassStripeSubmitInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineOpacityMicromapFeaturesARM {
    public func push<NewValue: PhysicalDevicePipelineOpacityMicromapFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderMaximalReconvergenceFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderSubgroupRotateFeatures {
    public func push<NewValue: PhysicalDeviceShaderSubgroupRotateFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderExpectAssumeFeatures {
    public func push<NewValue: PhysicalDeviceShaderExpectAssumeFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderFloatControls2Features {
    public func push<NewValue: PhysicalDeviceShaderFloatControls2FeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDynamicRenderingLocalReadFeatures {
    public func push<NewValue: PhysicalDeviceDynamicRenderingLocalReadFeaturesExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingAttachmentLocationInfo {
    public func push<NewValue: RenderingAttachmentLocationInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderingInputAttachmentIndexInfo {
    public func push<NewValue: RenderingInputAttachmentIndexInfoExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderQuadControlFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderQuadControlFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderAtomicFloat16VectorFeaturesNV {
    public func push<NewValue: PhysicalDeviceShaderAtomicFloat16VectorFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMapMemoryPlacedFeaturesEXT {
    public func push<NewValue: PhysicalDeviceMapMemoryPlacedFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceMapMemoryPlacedPropertiesEXT {
    public func push<NewValue: PhysicalDeviceMapMemoryPlacedPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryMapPlacedInfoEXT {
    public func push<NewValue: MemoryMapPlacedInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderBfloat16FeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderBfloat16FeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceRawAccessChainsFeaturesNV {
    public func push<NewValue: PhysicalDeviceRawAccessChainsFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCommandBufferInheritanceFeaturesNV {
    public func push<NewValue: PhysicalDeviceCommandBufferInheritanceFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageAlignmentControlFeaturesMESA {
    public func push<NewValue: PhysicalDeviceImageAlignmentControlFeaturesMESAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceImageAlignmentControlPropertiesMESA {
    public func push<NewValue: PhysicalDeviceImageAlignmentControlPropertiesMESAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageAlignmentControlCreateInfoMESA {
    public func push<NewValue: ImageAlignmentControlCreateInfoMESAExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderReplicatedCompositesFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderReplicatedCompositesFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentModeFifoLatestReadyFeaturesKHR {
    public func push<NewValue: PhysicalDevicePresentModeFifoLatestReadyFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeMatrix2FeaturesNV {
    public func push<NewValue: PhysicalDeviceCooperativeMatrix2FeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeMatrix2PropertiesNV {
    public func push<NewValue: PhysicalDeviceCooperativeMatrix2PropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CooperativeMatrixFlexibleDimensionsPropertiesNV {
    public func push<NewValue: CooperativeMatrixFlexibleDimensionsPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceHdrVividFeaturesHUAWEI {
    public func push<NewValue: PhysicalDeviceHdrVividFeaturesHUAWEIExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVertexAttributeRobustnessFeaturesEXT {
    public func push<NewValue: PhysicalDeviceVertexAttributeRobustnessFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == PhysicalDeviceDenseGeometryFormatFeaturesAMDX {
    public func push<NewValue: PhysicalDeviceDenseGeometryFormatFeaturesAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_ENABLE_BETA_EXTENSIONS
extension Chain where Base == AccelerationStructureDenseGeometryFormatTrianglesDataAMDX {
    public func push<NewValue: AccelerationStructureDenseGeometryFormatTrianglesDataAMDXExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceDepthClampZeroOneFeaturesKHR {
    public func push<NewValue: PhysicalDeviceDepthClampZeroOneFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeVectorFeaturesNV {
    public func push<NewValue: PhysicalDeviceCooperativeVectorFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CooperativeVectorPropertiesNV {
    public func push<NewValue: CooperativeVectorPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceCooperativeVectorPropertiesNV {
    public func push<NewValue: PhysicalDeviceCooperativeVectorPropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ConvertCooperativeVectorMatrixInfoNV {
    public func push<NewValue: ConvertCooperativeVectorMatrixInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTileShadingFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceTileShadingFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTileShadingPropertiesQCOM {
    public func push<NewValue: PhysicalDeviceTileShadingPropertiesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassTileShadingCreateInfoQCOM {
    public func push<NewValue: RenderPassTileShadingCreateInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerTileBeginInfoQCOM {
    public func push<NewValue: PerTileBeginInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerTileEndInfoQCOM {
    public func push<NewValue: PerTileEndInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DispatchTileInfoQCOM {
    public func push<NewValue: DispatchTileInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMapLayeredPropertiesVALVE {
    public func push<NewValue: PhysicalDeviceFragmentDensityMapLayeredPropertiesVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFragmentDensityMapLayeredFeaturesVALVE {
    public func push<NewValue: PhysicalDeviceFragmentDensityMapLayeredFeaturesVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PipelineFragmentDensityMapLayeredCreateInfoVALVE {
    public func push<NewValue: PipelineFragmentDensityMapLayeredCreateInfoVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SetPresentConfigNV {
    public func push<NewValue: SetPresentConfigNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePresentMeteringFeaturesNV {
    public func push<NewValue: PhysicalDevicePresentMeteringFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalComputeQueueDeviceCreateInfoNV {
    public func push<NewValue: ExternalComputeQueueDeviceCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalComputeQueueCreateInfoNV {
    public func push<NewValue: ExternalComputeQueueCreateInfoNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalComputeQueueDataParamsNV {
    public func push<NewValue: ExternalComputeQueueDataParamsNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExternalComputeQueuePropertiesNV {
    public func push<NewValue: PhysicalDeviceExternalComputeQueuePropertiesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderUniformBufferUnsizedArrayFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderUniformBufferUnsizedArrayFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderMixedFloatDotProductFeaturesVALVE {
    public func push<NewValue: PhysicalDeviceShaderMixedFloatDotProductFeaturesVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePrimitiveRestartIndexFeaturesEXT {
    public func push<NewValue: PhysicalDevicePrimitiveRestartIndexFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceFormatPackFeaturesARM {
    public func push<NewValue: PhysicalDeviceFormatPackFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceThrottleHintFeaturesSEC {
    public func push<NewValue: PhysicalDeviceThrottleHintFeaturesSECExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ThrottleHintSubmitInfoSEC {
    public func push<NewValue: ThrottleHintSubmitInfoSECExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorDescriptionARM {
    public func push<NewValue: TensorDescriptionARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorCreateInfoARM {
    public func push<NewValue: TensorCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorViewCreateInfoARM {
    public func push<NewValue: TensorViewCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorMemoryRequirementsInfoARM {
    public func push<NewValue: TensorMemoryRequirementsInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindTensorMemoryInfoARM {
    public func push<NewValue: BindTensorMemoryInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == WriteDescriptorSetTensorARM {
    public func push<NewValue: WriteDescriptorSetTensorARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorFormatPropertiesARM {
    public func push<NewValue: TensorFormatPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTensorPropertiesARM {
    public func push<NewValue: PhysicalDeviceTensorPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorMemoryBarrierARM {
    public func push<NewValue: TensorMemoryBarrierARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorDependencyInfoARM {
    public func push<NewValue: TensorDependencyInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTensorFeaturesARM {
    public func push<NewValue: PhysicalDeviceTensorFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceTensorMemoryRequirementsARM {
    public func push<NewValue: DeviceTensorMemoryRequirementsARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorCopyARM {
    public func push<NewValue: TensorCopyARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyTensorInfoARM {
    public func push<NewValue: CopyTensorInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryDedicatedAllocateInfoTensorARM {
    public func push<NewValue: MemoryDedicatedAllocateInfoTensorARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorBufferTensorPropertiesARM {
    public func push<NewValue: PhysicalDeviceDescriptorBufferTensorPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorBufferTensorFeaturesARM {
    public func push<NewValue: PhysicalDeviceDescriptorBufferTensorFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorCaptureDescriptorDataInfoARM {
    public func push<NewValue: TensorCaptureDescriptorDataInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TensorViewCaptureDescriptorDataInfoARM {
    public func push<NewValue: TensorViewCaptureDescriptorDataInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorGetTensorInfoARM {
    public func push<NewValue: DescriptorGetTensorInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == FrameBoundaryTensorsARM {
    public func push<NewValue: FrameBoundaryTensorsARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceExternalTensorInfoARM {
    public func push<NewValue: PhysicalDeviceExternalTensorInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalTensorPropertiesARM {
    public func push<NewValue: ExternalTensorPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ExternalMemoryTensorCreateInfoARM {
    public func push<NewValue: ExternalMemoryTensorCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderFloat8FeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderFloat8FeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == SurfaceCreateInfoOHOS {
    public func push<NewValue: SurfaceCreateInfoOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PhysicalDeviceDataGraphFeaturesARM {
    public func push<NewValue: PhysicalDeviceDataGraphFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineConstantTensorSemiStructuredSparsityInfoARM {
    public func push<NewValue: DataGraphPipelineConstantTensorSemiStructuredSparsityInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineConstantARM {
    public func push<NewValue: DataGraphPipelineConstantARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineResourceInfoARM {
    public func push<NewValue: DataGraphPipelineResourceInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineResourceInfoImageLayoutARM {
    public func push<NewValue: DataGraphPipelineResourceInfoImageLayoutARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineCompilerControlCreateInfoARM {
    public func push<NewValue: DataGraphPipelineCompilerControlCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineCreateInfoARM {
    public func push<NewValue: DataGraphPipelineCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineShaderModuleCreateInfoARM {
    public func push<NewValue: DataGraphPipelineShaderModuleCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSessionCreateInfoARM {
    public func push<NewValue: DataGraphPipelineSessionCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSessionBindPointRequirementsInfoARM {
    public func push<NewValue: DataGraphPipelineSessionBindPointRequirementsInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSessionBindPointRequirementARM {
    public func push<NewValue: DataGraphPipelineSessionBindPointRequirementARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSessionMemoryRequirementsInfoARM {
    public func push<NewValue: DataGraphPipelineSessionMemoryRequirementsInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindDataGraphPipelineSessionMemoryInfoARM {
    public func push<NewValue: BindDataGraphPipelineSessionMemoryInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineInfoARM {
    public func push<NewValue: DataGraphPipelineInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelinePropertyQueryResultARM {
    public func push<NewValue: DataGraphPipelinePropertyQueryResultARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineIdentifierCreateInfoARM {
    public func push<NewValue: DataGraphPipelineIdentifierCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineDispatchInfoARM {
    public func push<NewValue: DataGraphPipelineDispatchInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyDataGraphPropertiesARM {
    public func push<NewValue: QueueFamilyDataGraphPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM {
    public func push<NewValue: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyDataGraphProcessingEnginePropertiesARM {
    public func push<NewValue: QueueFamilyDataGraphProcessingEnginePropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphProcessingEngineCreateInfoARM {
    public func push<NewValue: DataGraphProcessingEngineCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePipelineCacheIncrementalModeFeaturesSEC {
    public func push<NewValue: PhysicalDevicePipelineCacheIncrementalModeFeaturesSECExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineBuiltinModelCreateInfoQCOM {
    public func push<NewValue: DataGraphPipelineBuiltinModelCreateInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDataGraphModelFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceDataGraphModelFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderUntypedPointersFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderUntypedPointersFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceVideoEncodeRgbConversionFeaturesVALVE {
    public func push<NewValue: PhysicalDeviceVideoEncodeRgbConversionFeaturesVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeRgbConversionCapabilitiesVALVE {
    public func push<NewValue: VideoEncodeRgbConversionCapabilitiesVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeProfileRgbConversionInfoVALVE {
    public func push<NewValue: VideoEncodeProfileRgbConversionInfoVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == VideoEncodeSessionRgbConversionCreateInfoVALVE {
    public func push<NewValue: VideoEncodeSessionRgbConversionCreateInfoVALVEExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShader64BitIndexingFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShader64BitIndexingFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == NativeBufferUsageOHOS {
    public func push<NewValue: NativeBufferUsageOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == NativeBufferPropertiesOHOS {
    public func push<NewValue: NativeBufferPropertiesOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == NativeBufferFormatPropertiesOHOS {
    public func push<NewValue: NativeBufferFormatPropertiesOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == ImportNativeBufferInfoOHOS {
    public func push<NewValue: ImportNativeBufferInfoOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == MemoryGetNativeBufferInfoOHOS {
    public func push<NewValue: MemoryGetNativeBufferInfoOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

#if VK_USE_PLATFORM_OHOS
extension Chain where Base == ExternalFormatOHOS {
    public func push<NewValue: ExternalFormatOHOSExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}
#endif

extension Chain where Base == PerfHintInfoQCOM {
    public func push<NewValue: PerfHintInfoQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceQueuePerfHintFeaturesQCOM {
    public func push<NewValue: PhysicalDeviceQueuePerfHintFeaturesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceQueuePerfHintPropertiesQCOM {
    public func push<NewValue: PhysicalDeviceQueuePerfHintPropertiesQCOMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePerformanceCountersByRegionFeaturesARM {
    public func push<NewValue: PhysicalDevicePerformanceCountersByRegionFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDevicePerformanceCountersByRegionPropertiesARM {
    public func push<NewValue: PhysicalDevicePerformanceCountersByRegionPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceCounterARM {
    public func push<NewValue: PerformanceCounterARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PerformanceCounterDescriptionARM {
    public func push<NewValue: PerformanceCounterDescriptionARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == RenderPassPerformanceCountersByRegionBeginInfoARM {
    public func push<NewValue: RenderPassPerformanceCountersByRegionBeginInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ComputeOccupancyPriorityParametersNV {
    public func push<NewValue: ComputeOccupancyPriorityParametersNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceComputeOccupancyPriorityFeaturesNV {
    public func push<NewValue: PhysicalDeviceComputeOccupancyPriorityFeaturesNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderLongVectorFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderLongVectorFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderLongVectorPropertiesEXT {
    public func push<NewValue: PhysicalDeviceShaderLongVectorPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceTextureCompressionASTC3DFeaturesEXT {
    public func push<NewValue: PhysicalDeviceTextureCompressionASTC3DFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderSubgroupPartitionedFeaturesEXT {
    public func push<NewValue: PhysicalDeviceShaderSubgroupPartitionedFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == TexelBufferDescriptorInfoEXT {
    public func push<NewValue: TexelBufferDescriptorInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ImageDescriptorInfoEXT {
    public func push<NewValue: ImageDescriptorInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ResourceDescriptorInfoEXT {
    public func push<NewValue: ResourceDescriptorInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindHeapInfoEXT {
    public func push<NewValue: BindHeapInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PushDataInfoEXT {
    public func push<NewValue: PushDataInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DescriptorSetAndBindingMappingEXT {
    public func push<NewValue: DescriptorSetAndBindingMappingEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderDescriptorSetAndBindingMappingInfoEXT {
    public func push<NewValue: ShaderDescriptorSetAndBindingMappingInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SamplerCustomBorderColorIndexCreateInfoEXT {
    public func push<NewValue: SamplerCustomBorderColorIndexCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == OpaqueCaptureDataCreateInfoEXT {
    public func push<NewValue: OpaqueCaptureDataCreateInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == IndirectCommandsLayoutPushDataTokenNV {
    public func push<NewValue: IndirectCommandsLayoutPushDataTokenNVExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == SubsampledImageFormatPropertiesEXT {
    public func push<NewValue: SubsampledImageFormatPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorHeapFeaturesEXT {
    public func push<NewValue: PhysicalDeviceDescriptorHeapFeaturesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorHeapPropertiesEXT {
    public func push<NewValue: PhysicalDeviceDescriptorHeapPropertiesEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CommandBufferInheritanceDescriptorHeapInfoEXT {
    public func push<NewValue: CommandBufferInheritanceDescriptorHeapInfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDescriptorHeapTensorPropertiesARM {
    public func push<NewValue: PhysicalDeviceDescriptorHeapTensorPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderInstrumentationFeaturesARM {
    public func push<NewValue: PhysicalDeviceShaderInstrumentationFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderInstrumentationPropertiesARM {
    public func push<NewValue: PhysicalDeviceShaderInstrumentationPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderInstrumentationCreateInfoARM {
    public func push<NewValue: ShaderInstrumentationCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ShaderInstrumentationMetricDescriptionARM {
    public func push<NewValue: ShaderInstrumentationMetricDescriptionARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceMemoryCopyKHR {
    public func push<NewValue: DeviceMemoryCopyKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyDeviceMemoryInfoKHR {
    public func push<NewValue: CopyDeviceMemoryInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceMemoryImageCopyKHR {
    public func push<NewValue: DeviceMemoryImageCopyKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == CopyDeviceMemoryImageInfoKHR {
    public func push<NewValue: CopyDeviceMemoryImageInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryRangeBarrierKHR {
    public func push<NewValue: MemoryRangeBarrierKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryRangeBarriersInfoKHR {
    public func push<NewValue: MemoryRangeBarriersInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDeviceAddressCommandsFeaturesKHR {
    public func push<NewValue: PhysicalDeviceDeviceAddressCommandsFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == ConditionalRenderingBeginInfo2EXT {
    public func push<NewValue: ConditionalRenderingBeginInfo2EXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == AccelerationStructureCreateInfo2KHR {
    public func push<NewValue: AccelerationStructureCreateInfo2KHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindIndexBuffer3InfoKHR {
    public func push<NewValue: BindIndexBuffer3InfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindVertexBuffer3InfoKHR {
    public func push<NewValue: BindVertexBuffer3InfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DrawIndirect2InfoKHR {
    public func push<NewValue: DrawIndirect2InfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DrawIndirectCount2InfoKHR {
    public func push<NewValue: DrawIndirectCount2InfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DispatchIndirect2InfoKHR {
    public func push<NewValue: DispatchIndirect2InfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == BindTransformFeedbackBuffer2InfoEXT {
    public func push<NewValue: BindTransformFeedbackBuffer2InfoEXTExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == MemoryMarkerInfoAMD {
    public func push<NewValue: MemoryMarkerInfoAMDExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderConstantDataFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderConstantDataFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderAbortFeaturesKHR {
    public func push<NewValue: PhysicalDeviceShaderAbortFeaturesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceShaderAbortPropertiesKHR {
    public func push<NewValue: PhysicalDeviceShaderAbortPropertiesKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DeviceFaultShaderAbortMessageInfoKHR {
    public func push<NewValue: DeviceFaultShaderAbortMessageInfoKHRExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyDataGraphTOSAPropertiesARM {
    public func push<NewValue: QueueFamilyDataGraphTOSAPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSingleNodeConnectionARM {
    public func push<NewValue: DataGraphPipelineSingleNodeConnectionARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == PhysicalDeviceDataGraphOpticalFlowFeaturesARM {
    public func push<NewValue: PhysicalDeviceDataGraphOpticalFlowFeaturesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == QueueFamilyDataGraphOpticalFlowPropertiesARM {
    public func push<NewValue: QueueFamilyDataGraphOpticalFlowPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphOpticalFlowImageFormatInfoARM {
    public func push<NewValue: DataGraphOpticalFlowImageFormatInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphOpticalFlowImageFormatPropertiesARM {
    public func push<NewValue: DataGraphOpticalFlowImageFormatPropertiesARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineSingleNodeCreateInfoARM {
    public func push<NewValue: DataGraphPipelineSingleNodeCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineOpticalFlowCreateInfoARM {
    public func push<NewValue: DataGraphPipelineOpticalFlowCreateInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

extension Chain where Base == DataGraphPipelineOpticalFlowDispatchInfoARM {
    public func push<NewValue: DataGraphPipelineOpticalFlowDispatchInfoARMExtension>(_ newValue: NewValue) -> Chain<Base, Chain<NewValue, Next>> {
        Chain<Base, Chain<NewValue, Next>>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
    }
}

