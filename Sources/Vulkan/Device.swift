import CVulkan

public final class Device: _HandleContainer {
    public let handle: VkDevice?
    public let physicalDevice: PhysicalDevice!
    public let dispatchTable: DeviceDispatchTable

    public init(handle: VkDevice?, physicalDevice: PhysicalDevice!) {
        self.handle = handle
        self.physicalDevice = physicalDevice
        self.dispatchTable = DeviceDispatchTable(vkGetDeviceProcAddr: self.physicalDevice.instance.dispatchTable.vkGetDeviceProcAddr, device: handle)
    }

    public func getProcAddr(name: String) -> PFN_vkVoidFunction? {
        name._withCString { cString_name in
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

    public func waitIdle() throws(Result) -> Void {
        try checkResult(
            self.dispatchTable.vkDeviceWaitIdle(self.handle)
        )
    }

    public func allocateMemory(_ allocateInfo: (some Chainable<MemoryAllocateInfo>)) throws(Result) -> DeviceMemory {
        try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            var out: VkDeviceMemory!
            try checkResult(
                self.dispatchTable.vkAllocateMemory(self.handle, ptr_allocateInfo, nil, &out)
            )
            return DeviceMemory(handle: out, device: self)
        }
    }

    public func allocateMemory(_ allocateInfo: MemoryAllocateInfo) throws(Result) -> DeviceMemory {
        try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            var out: VkDeviceMemory!
            try checkResult(
                self.dispatchTable.vkAllocateMemory(self.handle, ptr_allocateInfo, nil, &out)
            )
            return DeviceMemory(handle: out, device: self)
        }
    }

    public func flushMappedMemoryRanges(memoryRanges: (AnyChainableArray<MappedMemoryRange>)) throws(Result) -> Void {
        try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                self.dispatchTable.vkFlushMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func flushMappedMemoryRanges(memoryRanges: Array<MappedMemoryRange>) throws(Result) -> Void {
        try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                self.dispatchTable.vkFlushMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func invalidateMappedMemoryRanges(memoryRanges: (AnyChainableArray<MappedMemoryRange>)) throws(Result) -> Void {
        try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                self.dispatchTable.vkInvalidateMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func invalidateMappedMemoryRanges(memoryRanges: Array<MappedMemoryRange>) throws(Result) -> Void {
        try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                self.dispatchTable.vkInvalidateMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func createFence(_ createInfo: (some Chainable<FenceCreateInfo>)) throws(Result) -> Fence {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkCreateFence(self.handle, ptr_createInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func createFence(_ createInfo: FenceCreateInfo = FenceCreateInfo()) throws(Result) -> Fence {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkCreateFence(self.handle, ptr_createInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func resetFences(fences: Array<Fence>) throws(Result) -> Void {
        try fences.map{ $0.handle }.withUnsafeBufferPointer { ptr_fences throws(Result) in
            try checkResult(
                self.dispatchTable.vkResetFences(self.handle, UInt32(ptr_fences.count), ptr_fences.baseAddress)
            )
        }
    }

    public func waitForFences(fences: Array<Fence>, waitAll: Bool, timeout: UInt64) throws(Result) -> Void {
        try fences.map{ $0.handle }.withUnsafeBufferPointer { ptr_fences throws(Result) in
            try checkResult(
                self.dispatchTable.vkWaitForFences(self.handle, UInt32(ptr_fences.count), ptr_fences.baseAddress, VkBool32(waitAll ? VK_TRUE : VK_FALSE), timeout)
            )
        }
    }

    public func createSemaphore(_ createInfo: (some Chainable<SemaphoreCreateInfo>)) throws(Result) -> Semaphore {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSemaphore!
            try checkResult(
                self.dispatchTable.vkCreateSemaphore(self.handle, ptr_createInfo, nil, &out)
            )
            return Semaphore(handle: out, device: self)
        }
    }

    public func createSemaphore(_ createInfo: SemaphoreCreateInfo = SemaphoreCreateInfo()) throws(Result) -> Semaphore {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSemaphore!
            try checkResult(
                self.dispatchTable.vkCreateSemaphore(self.handle, ptr_createInfo, nil, &out)
            )
            return Semaphore(handle: out, device: self)
        }
    }

    public func createEvent(_ createInfo: (some Chainable<EventCreateInfo>)) throws(Result) -> Event {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkEvent!
            try checkResult(
                self.dispatchTable.vkCreateEvent(self.handle, ptr_createInfo, nil, &out)
            )
            return Event(handle: out, device: self)
        }
    }

    public func createEvent(_ createInfo: EventCreateInfo = EventCreateInfo()) throws(Result) -> Event {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkEvent!
            try checkResult(
                self.dispatchTable.vkCreateEvent(self.handle, ptr_createInfo, nil, &out)
            )
            return Event(handle: out, device: self)
        }
    }

    public func createQueryPool(_ createInfo: (some Chainable<QueryPoolCreateInfo>)) throws(Result) -> QueryPool {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkQueryPool!
            try checkResult(
                self.dispatchTable.vkCreateQueryPool(self.handle, ptr_createInfo, nil, &out)
            )
            return QueryPool(handle: out, device: self)
        }
    }

    public func createQueryPool(_ createInfo: QueryPoolCreateInfo) throws(Result) -> QueryPool {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkQueryPool!
            try checkResult(
                self.dispatchTable.vkCreateQueryPool(self.handle, ptr_createInfo, nil, &out)
            )
            return QueryPool(handle: out, device: self)
        }
    }

    public func createBuffer(_ createInfo: (some Chainable<BufferCreateInfo>)) throws(Result) -> Buffer {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBuffer!
            try checkResult(
                self.dispatchTable.vkCreateBuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Buffer(handle: out, device: self)
        }
    }

    public func createBuffer(_ createInfo: BufferCreateInfo) throws(Result) -> Buffer {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBuffer!
            try checkResult(
                self.dispatchTable.vkCreateBuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Buffer(handle: out, device: self)
        }
    }

    public func createBufferView(_ createInfo: (some Chainable<BufferViewCreateInfo>)) throws(Result) -> BufferView {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferView!
            try checkResult(
                self.dispatchTable.vkCreateBufferView(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferView(handle: out, device: self)
        }
    }

    public func createBufferView(_ createInfo: BufferViewCreateInfo) throws(Result) -> BufferView {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferView!
            try checkResult(
                self.dispatchTable.vkCreateBufferView(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferView(handle: out, device: self)
        }
    }

    public func createImage(_ createInfo: (some Chainable<ImageCreateInfo>)) throws(Result) -> Image {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImage!
            try checkResult(
                self.dispatchTable.vkCreateImage(self.handle, ptr_createInfo, nil, &out)
            )
            return Image(handle: out, device: self)
        }
    }

    public func createImage(_ createInfo: ImageCreateInfo) throws(Result) -> Image {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImage!
            try checkResult(
                self.dispatchTable.vkCreateImage(self.handle, ptr_createInfo, nil, &out)
            )
            return Image(handle: out, device: self)
        }
    }

    public func createImageView(_ createInfo: (some Chainable<ImageViewCreateInfo>)) throws(Result) -> ImageView {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImageView!
            try checkResult(
                self.dispatchTable.vkCreateImageView(self.handle, ptr_createInfo, nil, &out)
            )
            return ImageView(handle: out, device: self)
        }
    }

    public func createImageView(_ createInfo: ImageViewCreateInfo) throws(Result) -> ImageView {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImageView!
            try checkResult(
                self.dispatchTable.vkCreateImageView(self.handle, ptr_createInfo, nil, &out)
            )
            return ImageView(handle: out, device: self)
        }
    }

    public func createShaderModule(_ createInfo: (some Chainable<ShaderModuleCreateInfo>)) throws(Result) -> ShaderModule {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderModule!
            try checkResult(
                self.dispatchTable.vkCreateShaderModule(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderModule(handle: out, device: self)
        }
    }

    public func createShaderModule(_ createInfo: ShaderModuleCreateInfo) throws(Result) -> ShaderModule {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderModule!
            try checkResult(
                self.dispatchTable.vkCreateShaderModule(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderModule(handle: out, device: self)
        }
    }

    public func createPipelineCache(_ createInfo: (some Chainable<PipelineCacheCreateInfo>)) throws(Result) -> PipelineCache {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineCache!
            try checkResult(
                self.dispatchTable.vkCreatePipelineCache(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineCache(handle: out, device: self)
        }
    }

    public func createPipelineCache(_ createInfo: PipelineCacheCreateInfo) throws(Result) -> PipelineCache {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineCache!
            try checkResult(
                self.dispatchTable.vkCreatePipelineCache(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineCache(handle: out, device: self)
        }
    }

    public func createPipelineBinariesKHR(_ createInfo: (some Chainable<PipelineBinaryCreateInfoKHR>)) throws(Result) -> PipelineBinaryHandlesInfoKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out = VkPipelineBinaryHandlesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR
            try checkResult(
                self.dispatchTable.vkCreatePipelineBinariesKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineBinaryHandlesInfoKHR(cStruct: out, device: self)
        }
    }

    public func createPipelineBinariesKHR(_ createInfo: PipelineBinaryCreateInfoKHR = PipelineBinaryCreateInfoKHR()) throws(Result) -> PipelineBinaryHandlesInfoKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out = VkPipelineBinaryHandlesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR
            try checkResult(
                self.dispatchTable.vkCreatePipelineBinariesKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineBinaryHandlesInfoKHR(cStruct: out, device: self)
        }
    }

    public func getPipelineKeyKHR(_ pipelineCreateInfo: (some Chainable<PipelineCreateInfoKHR>)) throws(Result) -> PipelineBinaryKeyKHR {
        try pipelineCreateInfo.withCStruct { ptr_pipelineCreateInfo throws(Result) in
            var out = VkPipelineBinaryKeyKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR
            try checkResult(
                self.dispatchTable.vkGetPipelineKeyKHR(self.handle, ptr_pipelineCreateInfo, &out)
            )
            return PipelineBinaryKeyKHR(cStruct: out)
        }
    }

    public func getPipelineKeyKHR(_ pipelineCreateInfo: PipelineCreateInfoKHR? = nil) throws(Result) -> PipelineBinaryKeyKHR {
        try pipelineCreateInfo.withOptionalCStruct { ptr_pipelineCreateInfo throws(Result) in
            var out = VkPipelineBinaryKeyKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR
            try checkResult(
                self.dispatchTable.vkGetPipelineKeyKHR(self.handle, ptr_pipelineCreateInfo, &out)
            )
            return PipelineBinaryKeyKHR(cStruct: out)
        }
    }

    public func getPipelineBinaryDataKHR(_ info: (some Chainable<PipelineBinaryDataInfoKHR>), pipelineBinaryKey: UnsafeMutablePointer<VkPipelineBinaryKeyKHR>, pipelineBinaryDataSize: UnsafeMutablePointer<Int>, pipelineBinaryData: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetPipelineBinaryDataKHR(self.handle, ptr_info, pipelineBinaryKey, pipelineBinaryDataSize, pipelineBinaryData)
            )
        }
    }

    public func getPipelineBinaryDataKHR(_ info: PipelineBinaryDataInfoKHR, pipelineBinaryKey: UnsafeMutablePointer<VkPipelineBinaryKeyKHR>, pipelineBinaryDataSize: UnsafeMutablePointer<Int>, pipelineBinaryData: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetPipelineBinaryDataKHR(self.handle, ptr_info, pipelineBinaryKey, pipelineBinaryDataSize, pipelineBinaryData)
            )
        }
    }

    public func releaseCapturedPipelineDataKHR(_ info: (some Chainable<ReleaseCapturedPipelineDataInfoKHR>)) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkReleaseCapturedPipelineDataKHR(self.handle, ptr_info, nil)
            )
        }
    }

    public func releaseCapturedPipelineDataKHR(_ info: ReleaseCapturedPipelineDataInfoKHR) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkReleaseCapturedPipelineDataKHR(self.handle, ptr_info, nil)
            )
        }
    }

    public func createGraphicsPipelines(_ createInfos: (AnyChainableArray<GraphicsPipelineCreateInfo>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateGraphicsPipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createGraphicsPipelines(_ createInfos: Array<GraphicsPipelineCreateInfo>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateGraphicsPipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createComputePipelines(_ createInfos: (AnyChainableArray<ComputePipelineCreateInfo>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateComputePipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createComputePipelines(_ createInfos: Array<ComputePipelineCreateInfo>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateComputePipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createPipelineLayout(_ createInfo: (some Chainable<PipelineLayoutCreateInfo>)) throws(Result) -> PipelineLayout {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineLayout!
            try checkResult(
                self.dispatchTable.vkCreatePipelineLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineLayout(handle: out, device: self)
        }
    }

    public func createPipelineLayout(_ createInfo: PipelineLayoutCreateInfo = PipelineLayoutCreateInfo()) throws(Result) -> PipelineLayout {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineLayout!
            try checkResult(
                self.dispatchTable.vkCreatePipelineLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineLayout(handle: out, device: self)
        }
    }

    public func createSampler(_ createInfo: (some Chainable<SamplerCreateInfo>)) throws(Result) -> Sampler {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSampler!
            try checkResult(
                self.dispatchTable.vkCreateSampler(self.handle, ptr_createInfo, nil, &out)
            )
            return Sampler(handle: out, device: self)
        }
    }

    public func createSampler(_ createInfo: SamplerCreateInfo) throws(Result) -> Sampler {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSampler!
            try checkResult(
                self.dispatchTable.vkCreateSampler(self.handle, ptr_createInfo, nil, &out)
            )
            return Sampler(handle: out, device: self)
        }
    }

    public func createDescriptorSetLayout(_ createInfo: (some Chainable<DescriptorSetLayoutCreateInfo>)) throws(Result) -> DescriptorSetLayout {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorSetLayout!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorSetLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorSetLayout(handle: out, device: self)
        }
    }

    public func createDescriptorSetLayout(_ createInfo: DescriptorSetLayoutCreateInfo = DescriptorSetLayoutCreateInfo()) throws(Result) -> DescriptorSetLayout {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorSetLayout!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorSetLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorSetLayout(handle: out, device: self)
        }
    }

    public func createDescriptorPool(_ createInfo: (some Chainable<DescriptorPoolCreateInfo>)) throws(Result) -> DescriptorPool {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorPool!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorPool(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorPool(handle: out, device: self)
        }
    }

    public func createDescriptorPool(_ createInfo: DescriptorPoolCreateInfo) throws(Result) -> DescriptorPool {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorPool!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorPool(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorPool(handle: out, device: self)
        }
    }

    public func allocateDescriptorSets(_ allocateInfo: (some Chainable<DescriptorSetAllocateInfo>)) throws(Result) -> Array<DescriptorSet> {
        try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkDescriptorSet?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.descriptorSetCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkAllocateDescriptorSets(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DescriptorSet(handle: $0, descriptorPool: allocateInfo.base.descriptorPool) }
        }
    }

    public func allocateDescriptorSets(_ allocateInfo: DescriptorSetAllocateInfo) throws(Result) -> Array<DescriptorSet> {
        try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkDescriptorSet?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.descriptorSetCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkAllocateDescriptorSets(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DescriptorSet(handle: $0, descriptorPool: allocateInfo.base.descriptorPool) }
        }
    }

    public func updateDescriptorSets(descriptorWrites: (AnyChainableArray<WriteDescriptorSet>), descriptorCopies: (AnyChainableArray<CopyDescriptorSet>)) -> Void {
        descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            descriptorCopies.withCStructBufferPointer { ptr_descriptorCopies in
                self.dispatchTable.vkUpdateDescriptorSets(self.handle, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress, UInt32(ptr_descriptorCopies.count), ptr_descriptorCopies.baseAddress)
            }
        }
    }

    public func updateDescriptorSets(descriptorWrites: Array<WriteDescriptorSet> = [], descriptorCopies: Array<CopyDescriptorSet> = []) -> Void {
        descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            descriptorCopies.withCStructBufferPointer { ptr_descriptorCopies in
                self.dispatchTable.vkUpdateDescriptorSets(self.handle, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress, UInt32(ptr_descriptorCopies.count), ptr_descriptorCopies.baseAddress)
            }
        }
    }

    public func createFramebuffer(_ createInfo: (some Chainable<FramebufferCreateInfo>)) throws(Result) -> Framebuffer {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFramebuffer!
            try checkResult(
                self.dispatchTable.vkCreateFramebuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Framebuffer(handle: out, device: self)
        }
    }

    public func createFramebuffer(_ createInfo: FramebufferCreateInfo) throws(Result) -> Framebuffer {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFramebuffer!
            try checkResult(
                self.dispatchTable.vkCreateFramebuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Framebuffer(handle: out, device: self)
        }
    }

    public func createRenderPass(_ createInfo: (some Chainable<RenderPassCreateInfo>)) throws(Result) -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func createRenderPass(_ createInfo: RenderPassCreateInfo) throws(Result) -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
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

    public func createCommandPool(_ createInfo: (some Chainable<CommandPoolCreateInfo>)) throws(Result) -> CommandPool {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCommandPool!
            try checkResult(
                self.dispatchTable.vkCreateCommandPool(self.handle, ptr_createInfo, nil, &out)
            )
            return CommandPool(handle: out, device: self)
        }
    }

    public func createCommandPool(_ createInfo: CommandPoolCreateInfo) throws(Result) -> CommandPool {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCommandPool!
            try checkResult(
                self.dispatchTable.vkCreateCommandPool(self.handle, ptr_createInfo, nil, &out)
            )
            return CommandPool(handle: out, device: self)
        }
    }

    public func allocateCommandBuffers(_ allocateInfo: (some Chainable<CommandBufferAllocateInfo>)) throws(Result) -> Array<CommandBuffer> {
        try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkCommandBuffer?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.commandBufferCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkAllocateCommandBuffers(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { CommandBuffer(handle: $0, commandPool: allocateInfo.base.commandPool) }
        }
    }

    public func allocateCommandBuffers(_ allocateInfo: CommandBufferAllocateInfo) throws(Result) -> Array<CommandBuffer> {
        try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkCommandBuffer?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.commandBufferCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkAllocateCommandBuffers(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { CommandBuffer(handle: $0, commandPool: allocateInfo.base.commandPool) }
        }
    }

    public func createSharedSwapchainsKHR(_ createInfos: (AnyChainableArray<SwapchainCreateInfoKHR>)) throws(Result) -> Array<SwapchainKHR> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkSwapchainKHR?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateSharedSwapchainsKHR(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { SwapchainKHR(handle: $0, device: self) }
        }
    }

    public func createSharedSwapchainsKHR(_ createInfos: Array<SwapchainCreateInfoKHR>) throws(Result) -> Array<SwapchainKHR> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkSwapchainKHR?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateSharedSwapchainsKHR(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { SwapchainKHR(handle: $0, device: self) }
        }
    }

    public func createSwapchainKHR(_ createInfo: (some Chainable<SwapchainCreateInfoKHR>)) throws(Result) -> SwapchainKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSwapchainKHR!
            try checkResult(
                self.dispatchTable.vkCreateSwapchainKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SwapchainKHR(handle: out, device: self)
        }
    }

    public func createSwapchainKHR(_ createInfo: SwapchainCreateInfoKHR) throws(Result) -> SwapchainKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSwapchainKHR!
            try checkResult(
                self.dispatchTable.vkCreateSwapchainKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SwapchainKHR(handle: out, device: self)
        }
    }

    public func debugMarkerSetObjectNameEXT(_ nameInfo: (some Chainable<DebugMarkerObjectNameInfoEXT>)) throws(Result) -> Void {
        try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func debugMarkerSetObjectNameEXT(_ nameInfo: DebugMarkerObjectNameInfoEXT) throws(Result) -> Void {
        try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func debugMarkerSetObjectTagEXT(_ tagInfo: (some Chainable<DebugMarkerObjectTagInfoEXT>)) throws(Result) -> Void {
        try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func debugMarkerSetObjectTagEXT(_ tagInfo: DebugMarkerObjectTagInfoEXT) throws(Result) -> Void {
        try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkDebugMarkerSetObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func getGeneratedCommandsMemoryRequirementsNV(_ info: (some Chainable<GeneratedCommandsMemoryRequirementsInfoNV>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsNV(_ info: GeneratedCommandsMemoryRequirementsInfoNV) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func createIndirectCommandsLayoutNV(_ createInfo: (some Chainable<IndirectCommandsLayoutCreateInfoNV>)) throws(Result) -> IndirectCommandsLayoutNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutNV!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutNV(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutNV(handle: out, device: self)
        }
    }

    public func createIndirectCommandsLayoutNV(_ createInfo: IndirectCommandsLayoutCreateInfoNV) throws(Result) -> IndirectCommandsLayoutNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutNV!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutNV(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutNV(handle: out, device: self)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsEXT(_ info: (some Chainable<GeneratedCommandsMemoryRequirementsInfoEXT>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsEXT(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsEXT(_ info: GeneratedCommandsMemoryRequirementsInfoEXT) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetGeneratedCommandsMemoryRequirementsEXT(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func createIndirectCommandsLayoutEXT(_ createInfo: (some Chainable<IndirectCommandsLayoutCreateInfoEXT>)) throws(Result) -> IndirectCommandsLayoutEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutEXT(handle: out, device: self)
        }
    }

    public func createIndirectCommandsLayoutEXT(_ createInfo: IndirectCommandsLayoutCreateInfoEXT) throws(Result) -> IndirectCommandsLayoutEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectCommandsLayoutEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutEXT(handle: out, device: self)
        }
    }

    public func createIndirectExecutionSetEXT(_ createInfo: (some Chainable<IndirectExecutionSetCreateInfoEXT>)) throws(Result) -> IndirectExecutionSetEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectExecutionSetEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectExecutionSetEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectExecutionSetEXT(handle: out, device: self)
        }
    }

    public func createIndirectExecutionSetEXT(_ createInfo: IndirectExecutionSetCreateInfoEXT) throws(Result) -> IndirectExecutionSetEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectExecutionSetEXT!
            try checkResult(
                self.dispatchTable.vkCreateIndirectExecutionSetEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectExecutionSetEXT(handle: out, device: self)
        }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<MemoryGetWin32HandleInfoKHR>)) throws(Result) -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetMemoryWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleKHR(_ getWin32HandleInfo: MemoryGetWin32HandleInfoKHR) throws(Result) -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetMemoryWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandlePropertiesKHR(handleType: ExternalMemoryHandleTypeFlags, handle: HANDLE) throws(Result) -> MemoryWin32HandlePropertiesKHR {
        var out = VkMemoryWin32HandlePropertiesKHR()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR
        try checkResult(
            self.dispatchTable.vkGetMemoryWin32HandlePropertiesKHR(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), handle, &out)
        )
        return MemoryWin32HandlePropertiesKHR(cStruct: out)
    }
    #endif

    public func getMemoryFdKHR(_ getFdInfo: (some Chainable<MemoryGetFdInfoKHR>)) throws(Result) -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetMemoryFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getMemoryFdKHR(_ getFdInfo: MemoryGetFdInfoKHR) throws(Result) -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetMemoryFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getMemoryFdPropertiesKHR(handleType: ExternalMemoryHandleTypeFlags, fd: Int32) throws(Result) -> MemoryFdPropertiesKHR {
        var out = VkMemoryFdPropertiesKHR()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR
        try checkResult(
            self.dispatchTable.vkGetMemoryFdPropertiesKHR(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), fd, &out)
        )
        return MemoryFdPropertiesKHR(cStruct: out)
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandleFUCHSIA(_ getZirconHandleInfo: (some Chainable<MemoryGetZirconHandleInfoFUCHSIA>)) throws(Result) -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetMemoryZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandleFUCHSIA(_ getZirconHandleInfo: MemoryGetZirconHandleInfoFUCHSIA) throws(Result) -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetMemoryZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandlePropertiesFUCHSIA(handleType: ExternalMemoryHandleTypeFlags, zirconHandle: zx_handle_t) throws(Result) -> MemoryZirconHandlePropertiesFUCHSIA {
        var out = VkMemoryZirconHandlePropertiesFUCHSIA()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA
        try checkResult(
            self.dispatchTable.vkGetMemoryZirconHandlePropertiesFUCHSIA(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), zirconHandle, &out)
        )
        return MemoryZirconHandlePropertiesFUCHSIA(cStruct: out)
    }
    #endif

    public func getMemoryRemoteAddressNV(_ memoryGetRemoteAddressInfo: (some Chainable<MemoryGetRemoteAddressInfoNV>)) throws(Result) -> VkRemoteAddressNV {
        try memoryGetRemoteAddressInfo.withCStruct { ptr_memoryGetRemoteAddressInfo throws(Result) in
            var out: VkRemoteAddressNV!
            try checkResult(
                self.dispatchTable.vkGetMemoryRemoteAddressNV(self.handle, ptr_memoryGetRemoteAddressInfo, &out)
            )
            return out
        }
    }

    public func getMemoryRemoteAddressNV(_ memoryGetRemoteAddressInfo: MemoryGetRemoteAddressInfoNV) throws(Result) -> VkRemoteAddressNV {
        try memoryGetRemoteAddressInfo.withCStruct { ptr_memoryGetRemoteAddressInfo throws(Result) in
            var out: VkRemoteAddressNV!
            try checkResult(
                self.dispatchTable.vkGetMemoryRemoteAddressNV(self.handle, ptr_memoryGetRemoteAddressInfo, &out)
            )
            return out
        }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSemaphoreWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<SemaphoreGetWin32HandleInfoKHR>)) throws(Result) -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetSemaphoreWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSemaphoreWin32HandleKHR(_ getWin32HandleInfo: SemaphoreGetWin32HandleInfoKHR) throws(Result) -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetSemaphoreWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importSemaphoreWin32HandleKHR(_ importSemaphoreWin32HandleInfo: (some Chainable<ImportSemaphoreWin32HandleInfoKHR>)) throws(Result) -> Void {
        try importSemaphoreWin32HandleInfo.withCStruct { ptr_importSemaphoreWin32HandleInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreWin32HandleKHR(self.handle, ptr_importSemaphoreWin32HandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importSemaphoreWin32HandleKHR(_ importSemaphoreWin32HandleInfo: ImportSemaphoreWin32HandleInfoKHR) throws(Result) -> Void {
        try importSemaphoreWin32HandleInfo.withCStruct { ptr_importSemaphoreWin32HandleInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreWin32HandleKHR(self.handle, ptr_importSemaphoreWin32HandleInfo)
            )
        }
    }
    #endif

    public func getSemaphoreFdKHR(_ getFdInfo: (some Chainable<SemaphoreGetFdInfoKHR>)) throws(Result) -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getSemaphoreFdKHR(_ getFdInfo: SemaphoreGetFdInfoKHR) throws(Result) -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func importSemaphoreFdKHR(_ importSemaphoreFdInfo: (some Chainable<ImportSemaphoreFdInfoKHR>)) throws(Result) -> Void {
        try importSemaphoreFdInfo.withCStruct { ptr_importSemaphoreFdInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreFdKHR(self.handle, ptr_importSemaphoreFdInfo)
            )
        }
    }

    public func importSemaphoreFdKHR(_ importSemaphoreFdInfo: ImportSemaphoreFdInfoKHR) throws(Result) -> Void {
        try importSemaphoreFdInfo.withCStruct { ptr_importSemaphoreFdInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreFdKHR(self.handle, ptr_importSemaphoreFdInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func getSemaphoreZirconHandleFUCHSIA(_ getZirconHandleInfo: (some Chainable<SemaphoreGetZirconHandleInfoFUCHSIA>)) throws(Result) -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getSemaphoreZirconHandleFUCHSIA(_ getZirconHandleInfo: SemaphoreGetZirconHandleInfoFUCHSIA) throws(Result) -> zx_handle_t {
        try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                self.dispatchTable.vkGetSemaphoreZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func importSemaphoreZirconHandleFUCHSIA(_ importSemaphoreZirconHandleInfo: (some Chainable<ImportSemaphoreZirconHandleInfoFUCHSIA>)) throws(Result) -> Void {
        try importSemaphoreZirconHandleInfo.withCStruct { ptr_importSemaphoreZirconHandleInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreZirconHandleFUCHSIA(self.handle, ptr_importSemaphoreZirconHandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func importSemaphoreZirconHandleFUCHSIA(_ importSemaphoreZirconHandleInfo: ImportSemaphoreZirconHandleInfoFUCHSIA) throws(Result) -> Void {
        try importSemaphoreZirconHandleInfo.withCStruct { ptr_importSemaphoreZirconHandleInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportSemaphoreZirconHandleFUCHSIA(self.handle, ptr_importSemaphoreZirconHandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getFenceWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<FenceGetWin32HandleInfoKHR>)) throws(Result) -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetFenceWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getFenceWin32HandleKHR(_ getWin32HandleInfo: FenceGetWin32HandleInfoKHR) throws(Result) -> HANDLE {
        try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                self.dispatchTable.vkGetFenceWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importFenceWin32HandleKHR(_ importFenceWin32HandleInfo: (some Chainable<ImportFenceWin32HandleInfoKHR>)) throws(Result) -> Void {
        try importFenceWin32HandleInfo.withCStruct { ptr_importFenceWin32HandleInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportFenceWin32HandleKHR(self.handle, ptr_importFenceWin32HandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importFenceWin32HandleKHR(_ importFenceWin32HandleInfo: ImportFenceWin32HandleInfoKHR) throws(Result) -> Void {
        try importFenceWin32HandleInfo.withCStruct { ptr_importFenceWin32HandleInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportFenceWin32HandleKHR(self.handle, ptr_importFenceWin32HandleInfo)
            )
        }
    }
    #endif

    public func getFenceFdKHR(_ getFdInfo: (some Chainable<FenceGetFdInfoKHR>)) throws(Result) -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetFenceFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getFenceFdKHR(_ getFdInfo: FenceGetFdInfoKHR) throws(Result) -> Int32 {
        try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                self.dispatchTable.vkGetFenceFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func importFenceFdKHR(_ importFenceFdInfo: (some Chainable<ImportFenceFdInfoKHR>)) throws(Result) -> Void {
        try importFenceFdInfo.withCStruct { ptr_importFenceFdInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportFenceFdKHR(self.handle, ptr_importFenceFdInfo)
            )
        }
    }

    public func importFenceFdKHR(_ importFenceFdInfo: ImportFenceFdInfoKHR) throws(Result) -> Void {
        try importFenceFdInfo.withCStruct { ptr_importFenceFdInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkImportFenceFdKHR(self.handle, ptr_importFenceFdInfo)
            )
        }
    }

    public func displayPowerControlEXT(_ displayPowerInfo: (some Chainable<DisplayPowerInfoEXT>), display: DisplayKHR) throws(Result) -> Void {
        try displayPowerInfo.withCStruct { ptr_displayPowerInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkDisplayPowerControlEXT(self.handle, display.handle, ptr_displayPowerInfo)
            )
        }
    }

    public func displayPowerControlEXT(_ displayPowerInfo: DisplayPowerInfoEXT, display: DisplayKHR) throws(Result) -> Void {
        try displayPowerInfo.withCStruct { ptr_displayPowerInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkDisplayPowerControlEXT(self.handle, display.handle, ptr_displayPowerInfo)
            )
        }
    }

    public func registerEventEXT(_ deviceEventInfo: (some Chainable<DeviceEventInfoEXT>)) throws(Result) -> Fence {
        try deviceEventInfo.withCStruct { ptr_deviceEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDeviceEventEXT(self.handle, ptr_deviceEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func registerEventEXT(_ deviceEventInfo: DeviceEventInfoEXT) throws(Result) -> Fence {
        try deviceEventInfo.withCStruct { ptr_deviceEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDeviceEventEXT(self.handle, ptr_deviceEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func registerDisplayEventEXT(_ displayEventInfo: (some Chainable<DisplayEventInfoEXT>), display: DisplayKHR) throws(Result) -> Fence {
        try displayEventInfo.withCStruct { ptr_displayEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                self.dispatchTable.vkRegisterDisplayEventEXT(self.handle, display.handle, ptr_displayEventInfo, nil, &out)
            )
            return Fence(handle: out, device: self)
        }
    }

    public func registerDisplayEventEXT(_ displayEventInfo: DisplayEventInfoEXT, display: DisplayKHR) throws(Result) -> Fence {
        try displayEventInfo.withCStruct { ptr_displayEventInfo throws(Result) in
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

    public func bindBufferMemory2(_ bindInfos: (AnyChainableArray<BindBufferMemoryInfo>)) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindBufferMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindBufferMemory2(_ bindInfos: Array<BindBufferMemoryInfo>) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindBufferMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindImageMemory2(_ bindInfos: (AnyChainableArray<BindImageMemoryInfo>)) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindImageMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindImageMemory2(_ bindInfos: Array<BindImageMemoryInfo>) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindImageMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getGroupPresentCapabilitiesKHR() throws(Result) -> DeviceGroupPresentCapabilitiesKHR {
        var out = VkDeviceGroupPresentCapabilitiesKHR()
        out.sType = VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR
        try checkResult(
            self.dispatchTable.vkGetDeviceGroupPresentCapabilitiesKHR(self.handle, &out)
        )
        return DeviceGroupPresentCapabilitiesKHR(cStruct: out)
    }

    public func getGroupSurfacePresentModesKHR(surface: SurfaceKHR) throws(Result) -> DeviceGroupPresentModeFlagsKHR {
        var out = VkDeviceGroupPresentModeFlagsKHR()
        try checkResult(
            self.dispatchTable.vkGetDeviceGroupSurfacePresentModesKHR(self.handle, surface.handle, &out)
        )
        return DeviceGroupPresentModeFlagsKHR(rawValue: out)
    }

    public func acquireNextImage2KHR(_ acquireInfo: (some Chainable<AcquireNextImageInfoKHR>)) throws(Result) -> UInt32 {
        try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkAcquireNextImage2KHR(self.handle, ptr_acquireInfo, &out)
            )
            return out
        }
    }

    public func acquireNextImage2KHR(_ acquireInfo: AcquireNextImageInfoKHR) throws(Result) -> UInt32 {
        try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkAcquireNextImage2KHR(self.handle, ptr_acquireInfo, &out)
            )
            return out
        }
    }

    public func createDescriptorUpdateTemplate(_ createInfo: (some Chainable<DescriptorUpdateTemplateCreateInfo>)) throws(Result) -> DescriptorUpdateTemplate {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorUpdateTemplate!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorUpdateTemplate(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorUpdateTemplate(handle: out, device: self)
        }
    }

    public func createDescriptorUpdateTemplate(_ createInfo: DescriptorUpdateTemplateCreateInfo) throws(Result) -> DescriptorUpdateTemplate {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorUpdateTemplate!
            try checkResult(
                self.dispatchTable.vkCreateDescriptorUpdateTemplate(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorUpdateTemplate(handle: out, device: self)
        }
    }

    public func setHdrMetadataEXT(swapchains: Array<SwapchainKHR>, metadata: (AnyChainableArray<HdrMetadataEXT>)) -> Void {
        swapchains.map{ $0.handle }.withUnsafeBufferPointer { ptr_swapchains in
            metadata.withCStructBufferPointer { ptr_metadata in
                self.dispatchTable.vkSetHdrMetadataEXT(self.handle, UInt32(ptr_swapchains.count), ptr_swapchains.baseAddress, ptr_metadata.baseAddress)
            }
        }
    }

    public func setHdrMetadataEXT(swapchains: Array<SwapchainKHR>, metadata: Array<HdrMetadataEXT>) -> Void {
        swapchains.map{ $0.handle }.withUnsafeBufferPointer { ptr_swapchains in
            metadata.withCStructBufferPointer { ptr_metadata in
                self.dispatchTable.vkSetHdrMetadataEXT(self.handle, UInt32(ptr_swapchains.count), ptr_swapchains.baseAddress, ptr_metadata.baseAddress)
            }
        }
    }

    public func getBufferMemoryRequirements2(_ info: (some Chainable<BufferMemoryRequirementsInfo2>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetBufferMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getBufferMemoryRequirements2(_ info: BufferMemoryRequirementsInfo2) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetBufferMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements2(_ info: (some Chainable<ImageMemoryRequirementsInfo2>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetImageMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements2(_ info: ImageMemoryRequirementsInfo2) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetImageMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageSparseMemoryRequirements2(_ info: (some Chainable<ImageSparseMemoryRequirementsInfo2>)) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetImageSparseMemoryRequirements2(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getImageSparseMemoryRequirements2(_ info: ImageSparseMemoryRequirementsInfo2) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetImageSparseMemoryRequirements2(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getBufferMemoryRequirements(_ info: (some Chainable<DeviceBufferMemoryRequirements>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDeviceBufferMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getBufferMemoryRequirements(_ info: DeviceBufferMemoryRequirements) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDeviceBufferMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements(_ info: (some Chainable<DeviceImageMemoryRequirements>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDeviceImageMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements(_ info: DeviceImageMemoryRequirements) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDeviceImageMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageSparseMemoryRequirements(_ info: (some Chainable<DeviceImageMemoryRequirements>)) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetDeviceImageSparseMemoryRequirements(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getImageSparseMemoryRequirements(_ info: DeviceImageMemoryRequirements) -> Array<SparseImageMemoryRequirements2> {
        info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                self.dispatchTable.vkGetDeviceImageSparseMemoryRequirements(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func createSamplerYcbcrConversion(_ createInfo: (some Chainable<SamplerYcbcrConversionCreateInfo>)) throws(Result) -> SamplerYcbcrConversion {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSamplerYcbcrConversion!
            try checkResult(
                self.dispatchTable.vkCreateSamplerYcbcrConversion(self.handle, ptr_createInfo, nil, &out)
            )
            return SamplerYcbcrConversion(handle: out, device: self)
        }
    }

    public func createSamplerYcbcrConversion(_ createInfo: SamplerYcbcrConversionCreateInfo) throws(Result) -> SamplerYcbcrConversion {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
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

    public func createValidationCacheEXT(_ createInfo: (some Chainable<ValidationCacheCreateInfoEXT>)) throws(Result) -> ValidationCacheEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkValidationCacheEXT!
            try checkResult(
                self.dispatchTable.vkCreateValidationCacheEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return ValidationCacheEXT(handle: out, device: self)
        }
    }

    public func createValidationCacheEXT(_ createInfo: ValidationCacheCreateInfoEXT) throws(Result) -> ValidationCacheEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
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
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT
            self.dispatchTable.vkGetDescriptorSetLayoutSupport(self.handle, ptr_createInfo, &out)
            return DescriptorSetLayoutSupport(cStruct: out)
        }
    }

    public func getDescriptorSetLayoutSupport(_ createInfo: DescriptorSetLayoutCreateInfo = DescriptorSetLayoutCreateInfo()) -> DescriptorSetLayoutSupport {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkDescriptorSetLayoutSupport()
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT
            self.dispatchTable.vkGetDescriptorSetLayoutSupport(self.handle, ptr_createInfo, &out)
            return DescriptorSetLayoutSupport(cStruct: out)
        }
    }

    public func getCalibratedTimestampsKHR(_ timestampInfos: (AnyChainableArray<CalibratedTimestampInfoKHR>), timestamps: UnsafeMutablePointer<UInt64>, maxDeviation: UnsafeMutablePointer<UInt64>) throws(Result) -> Void {
        try timestampInfos.withCStructBufferPointer { ptr_timestampInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetCalibratedTimestampsKHR(self.handle, UInt32(ptr_timestampInfos.count), ptr_timestampInfos.baseAddress, timestamps, maxDeviation)
            )
        }
    }

    public func getCalibratedTimestampsKHR(_ timestampInfos: Array<CalibratedTimestampInfoKHR>, timestamps: UnsafeMutablePointer<UInt64>, maxDeviation: UnsafeMutablePointer<UInt64>) throws(Result) -> Void {
        try timestampInfos.withCStructBufferPointer { ptr_timestampInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetCalibratedTimestampsKHR(self.handle, UInt32(ptr_timestampInfos.count), ptr_timestampInfos.baseAddress, timestamps, maxDeviation)
            )
        }
    }

    public func setDebugUtilsObjectNameEXT(_ nameInfo: (some Chainable<DebugUtilsObjectNameInfoEXT>)) throws(Result) -> Void {
        try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func setDebugUtilsObjectNameEXT(_ nameInfo: DebugUtilsObjectNameInfoEXT) throws(Result) -> Void {
        try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func setDebugUtilsObjectTagEXT(_ tagInfo: (some Chainable<DebugUtilsObjectTagInfoEXT>)) throws(Result) -> Void {
        try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func setDebugUtilsObjectTagEXT(_ tagInfo: DebugUtilsObjectTagInfoEXT) throws(Result) -> Void {
        try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkSetDebugUtilsObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func getMemoryHostPointerPropertiesEXT(handleType: ExternalMemoryHandleTypeFlags, hostPointer: UnsafeRawPointer) throws(Result) -> MemoryHostPointerPropertiesEXT {
        var out = VkMemoryHostPointerPropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT
        try checkResult(
            self.dispatchTable.vkGetMemoryHostPointerPropertiesEXT(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), hostPointer, &out)
        )
        return MemoryHostPointerPropertiesEXT(cStruct: out)
    }

    public func createRenderPass2(_ createInfo: (some Chainable<RenderPassCreateInfo2>)) throws(Result) -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass2(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func createRenderPass2(_ createInfo: RenderPassCreateInfo2) throws(Result) -> RenderPass {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                self.dispatchTable.vkCreateRenderPass2(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out, device: self)
        }
    }

    public func waitSemaphores(_ waitInfo: (some Chainable<SemaphoreWaitInfo>), timeout: UInt64) throws(Result) -> Void {
        try waitInfo.withCStruct { ptr_waitInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkWaitSemaphores(self.handle, ptr_waitInfo, timeout)
            )
        }
    }

    public func waitSemaphores(_ waitInfo: SemaphoreWaitInfo, timeout: UInt64) throws(Result) -> Void {
        try waitInfo.withCStruct { ptr_waitInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkWaitSemaphores(self.handle, ptr_waitInfo, timeout)
            )
        }
    }

    public func signalSemaphore(_ signalInfo: (some Chainable<SemaphoreSignalInfo>)) throws(Result) -> Void {
        try signalInfo.withCStruct { ptr_signalInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkSignalSemaphore(self.handle, ptr_signalInfo)
            )
        }
    }

    public func signalSemaphore(_ signalInfo: SemaphoreSignalInfo) throws(Result) -> Void {
        try signalInfo.withCStruct { ptr_signalInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkSignalSemaphore(self.handle, ptr_signalInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getAndroidHardwareBufferPropertiesANDROID(buffer: UnsafePointer<AHardwareBuffer>) throws(Result) -> AndroidHardwareBufferPropertiesANDROID {
        var out = VkAndroidHardwareBufferPropertiesANDROID()
        out.sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID
        try checkResult(
            self.dispatchTable.vkGetAndroidHardwareBufferPropertiesANDROID(self.handle, buffer, &out)
        )
        return AndroidHardwareBufferPropertiesANDROID(cStruct: out)
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getMemoryAndroidHardwareBufferANDROID(_ info: (some Chainable<MemoryGetAndroidHardwareBufferInfoANDROID>)) throws(Result) -> UnsafeMutablePointer<AHardwareBuffer> {
        try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<AHardwareBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryAndroidHardwareBufferANDROID(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getMemoryAndroidHardwareBufferANDROID(_ info: MemoryGetAndroidHardwareBufferInfoANDROID) throws(Result) -> UnsafeMutablePointer<AHardwareBuffer> {
        try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<AHardwareBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryAndroidHardwareBufferANDROID(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    public func createAccelerationStructureNV(_ createInfo: (some Chainable<AccelerationStructureCreateInfoNV>)) throws(Result) -> AccelerationStructureNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureNV!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureNV(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureNV(handle: out, device: self)
        }
    }

    public func createAccelerationStructureNV(_ createInfo: AccelerationStructureCreateInfoNV) throws(Result) -> AccelerationStructureNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureNV!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureNV(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureNV(handle: out, device: self)
        }
    }

    public func getAccelerationStructureMemoryRequirementsNV(_ info: (some Chainable<AccelerationStructureMemoryRequirementsInfoNV>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetAccelerationStructureMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getAccelerationStructureMemoryRequirementsNV(_ info: AccelerationStructureMemoryRequirementsInfoNV) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetAccelerationStructureMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindAccelerationStructureMemoryNV(_ bindInfos: (AnyChainableArray<BindAccelerationStructureMemoryInfoNV>)) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindAccelerationStructureMemoryNV(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindAccelerationStructureMemoryNV(_ bindInfos: Array<BindAccelerationStructureMemoryInfoNV>) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindAccelerationStructureMemoryNV(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func copyAccelerationStructureKHR(_ info: (some Chainable<CopyAccelerationStructureInfoKHR>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureKHR(_ info: CopyAccelerationStructureInfoKHR, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: (some Chainable<CopyAccelerationStructureToMemoryInfoKHR>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureToMemoryKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: CopyAccelerationStructureToMemoryInfoKHR, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyAccelerationStructureToMemoryKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: (some Chainable<CopyMemoryToAccelerationStructureInfoKHR>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: CopyMemoryToAccelerationStructureInfoKHR, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func writeAccelerationStructuresPropertiesKHR(accelerationStructures: Array<AccelerationStructureKHR>, queryType: QueryType, dataSize: Int, data: UnsafeMutableRawPointer, stride: Int) throws(Result) -> Void {
        try accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures throws(Result) in
            try checkResult(
                self.dispatchTable.vkWriteAccelerationStructuresPropertiesKHR(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), dataSize, data, stride)
            )
        }
    }

    public func createRayTracingPipelinesNV(_ createInfos: (AnyChainableArray<RayTracingPipelineCreateInfoNV>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateRayTracingPipelinesNV(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createRayTracingPipelinesNV(_ createInfos: Array<RayTracingPipelineCreateInfoNV>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateRayTracingPipelinesNV(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createRayTracingPipelinesKHR(_ createInfos: (AnyChainableArray<RayTracingPipelineCreateInfoKHR>), deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateRayTracingPipelinesKHR(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createRayTracingPipelinesKHR(_ createInfos: Array<RayTracingPipelineCreateInfoKHR>, deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateRayTracingPipelinesKHR(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func getClusterAccelerationStructureBuildSizesNV(_ info: (some Chainable<ClusterAccelerationStructureInputInfoNV>)) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            self.dispatchTable.vkGetClusterAccelerationStructureBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getClusterAccelerationStructureBuildSizesNV(_ info: ClusterAccelerationStructureInputInfoNV) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            self.dispatchTable.vkGetClusterAccelerationStructureBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getAccelerationStructureCompatibilityKHR(_ versionInfo: (some Chainable<AccelerationStructureVersionInfoKHR>)) -> AccelerationStructureCompatibilityKHR {
        versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            self.dispatchTable.vkGetDeviceAccelerationStructureCompatibilityKHR(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out))!
        }
    }

    public func getAccelerationStructureCompatibilityKHR(_ versionInfo: AccelerationStructureVersionInfoKHR) -> AccelerationStructureCompatibilityKHR {
        versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            self.dispatchTable.vkGetDeviceAccelerationStructureCompatibilityKHR(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out))!
        }
    }

    public func getImageViewHandleNVX(_ info: (some Chainable<ImageViewHandleInfoNVX>)) -> UInt32 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandleNVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandleNVX(_ info: ImageViewHandleInfoNVX) -> UInt32 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandleNVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandle64NVX(_ info: (some Chainable<ImageViewHandleInfoNVX>)) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandle64NVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandle64NVX(_ info: ImageViewHandleInfoNVX) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetImageViewHandle64NVX(self.handle, ptr_info)
        }
    }

    public func getCombinedImageSamplerIndexNVX(imageViewIndex: UInt64, samplerIndex: UInt64) -> UInt64 {
        self.dispatchTable.vkGetDeviceCombinedImageSamplerIndexNVX(self.handle, imageViewIndex, samplerIndex)
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getGroupSurfacePresentModes2EXT(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> DeviceGroupPresentModeFlagsKHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkDeviceGroupPresentModeFlagsKHR()
            try checkResult(
                self.dispatchTable.vkGetDeviceGroupSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, &out)
            )
            return DeviceGroupPresentModeFlagsKHR(rawValue: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getGroupSurfacePresentModes2EXT(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> DeviceGroupPresentModeFlagsKHR {
        try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkDeviceGroupPresentModeFlagsKHR()
            try checkResult(
                self.dispatchTable.vkGetDeviceGroupSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, &out)
            )
            return DeviceGroupPresentModeFlagsKHR(rawValue: out)
        }
    }
    #endif

    public func acquireProfilingLockKHR(_ info: (some Chainable<AcquireProfilingLockInfoKHR>)) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkAcquireProfilingLockKHR(self.handle, ptr_info)
            )
        }
    }

    public func acquireProfilingLockKHR(_ info: AcquireProfilingLockInfoKHR) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkAcquireProfilingLockKHR(self.handle, ptr_info)
            )
        }
    }

    public func releaseProfilingLockKHR() -> Void {
        self.dispatchTable.vkReleaseProfilingLockKHR(self.handle)
    }

    public func getBufferOpaqueCaptureAddress(_ info: (some Chainable<BufferDeviceAddressInfo>)) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getBufferOpaqueCaptureAddress(_ info: BufferDeviceAddressInfo) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getBufferAddress(_ info: (some Chainable<BufferDeviceAddressInfo>)) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferDeviceAddress(self.handle, ptr_info)
        }
    }

    public func getBufferAddress(_ info: BufferDeviceAddressInfo) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetBufferDeviceAddress(self.handle, ptr_info)
        }
    }

    public func initializePerformanceApiINTEL(_ initializeInfo: (some Chainable<InitializePerformanceApiInfoINTEL>)) throws(Result) -> Void {
        try initializeInfo.withCStruct { ptr_initializeInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkInitializePerformanceApiINTEL(self.handle, ptr_initializeInfo)
            )
        }
    }

    public func initializePerformanceApiINTEL(_ initializeInfo: InitializePerformanceApiInfoINTEL = InitializePerformanceApiInfoINTEL()) throws(Result) -> Void {
        try initializeInfo.withCStruct { ptr_initializeInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkInitializePerformanceApiINTEL(self.handle, ptr_initializeInfo)
            )
        }
    }

    public func uninitializePerformanceApiINTEL() -> Void {
        self.dispatchTable.vkUninitializePerformanceApiINTEL(self.handle)
    }

    public func acquirePerformanceConfigurationINTEL(_ acquireInfo: (some Chainable<PerformanceConfigurationAcquireInfoINTEL>)) throws(Result) -> PerformanceConfigurationINTEL {
        try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out: VkPerformanceConfigurationINTEL!
            try checkResult(
                self.dispatchTable.vkAcquirePerformanceConfigurationINTEL(self.handle, ptr_acquireInfo, &out)
            )
            return PerformanceConfigurationINTEL(handle: out, device: self)
        }
    }

    public func acquirePerformanceConfigurationINTEL(_ acquireInfo: PerformanceConfigurationAcquireInfoINTEL) throws(Result) -> PerformanceConfigurationINTEL {
        try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out: VkPerformanceConfigurationINTEL!
            try checkResult(
                self.dispatchTable.vkAcquirePerformanceConfigurationINTEL(self.handle, ptr_acquireInfo, &out)
            )
            return PerformanceConfigurationINTEL(handle: out, device: self)
        }
    }

    public func releasePerformanceConfigurationINTEL(configuration: PerformanceConfigurationINTEL? = nil) throws(Result) -> Void {
        try checkResult(
            self.dispatchTable.vkReleasePerformanceConfigurationINTEL(self.handle, configuration?.handle)
        )
    }

    public func getPerformanceParameterINTEL(parameter: PerformanceParameterTypeINTEL) throws(Result) -> PerformanceValueINTEL {
        var out = VkPerformanceValueINTEL()
        try checkResult(
            self.dispatchTable.vkGetPerformanceParameterINTEL(self.handle, VkPerformanceParameterTypeINTEL(rawValue: VkPerformanceParameterTypeINTEL.RawValue(parameter.rawValue)), &out)
        )
        return PerformanceValueINTEL(cStruct: out)
    }

    public func getMemoryOpaqueCaptureAddress(_ info: (some Chainable<DeviceMemoryOpaqueCaptureAddressInfo>)) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetDeviceMemoryOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getMemoryOpaqueCaptureAddress(_ info: DeviceMemoryOpaqueCaptureAddressInfo) -> UInt64 {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetDeviceMemoryOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getPipelineExecutablePropertiesKHR(_ pipelineInfo: (some Chainable<PipelineInfoKHR>)) throws(Result) -> Array<PipelineExecutablePropertiesKHR> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pExecutableCount in
                self.dispatchTable.vkGetPipelineExecutablePropertiesKHR(self.handle, ptr_pipelineInfo, pExecutableCount, pProperties)
            }.map { PipelineExecutablePropertiesKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutablePropertiesKHR(_ pipelineInfo: PipelineInfoKHR) throws(Result) -> Array<PipelineExecutablePropertiesKHR> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pExecutableCount in
                self.dispatchTable.vkGetPipelineExecutablePropertiesKHR(self.handle, ptr_pipelineInfo, pExecutableCount, pProperties)
            }.map { PipelineExecutablePropertiesKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableStatisticsKHR(_ executableInfo: (some Chainable<PipelineExecutableInfoKHR>)) throws(Result) -> Array<PipelineExecutableStatisticKHR> {
        try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pStatistics, pStatisticCount in
                self.dispatchTable.vkGetPipelineExecutableStatisticsKHR(self.handle, ptr_executableInfo, pStatisticCount, pStatistics)
            }.map { PipelineExecutableStatisticKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableStatisticsKHR(_ executableInfo: PipelineExecutableInfoKHR) throws(Result) -> Array<PipelineExecutableStatisticKHR> {
        try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pStatistics, pStatisticCount in
                self.dispatchTable.vkGetPipelineExecutableStatisticsKHR(self.handle, ptr_executableInfo, pStatisticCount, pStatistics)
            }.map { PipelineExecutableStatisticKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableInternalRepresentationsKHR(_ executableInfo: (some Chainable<PipelineExecutableInfoKHR>)) throws(Result) -> Array<PipelineExecutableInternalRepresentationKHR> {
        try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pInternalRepresentations, pInternalRepresentationCount in
                self.dispatchTable.vkGetPipelineExecutableInternalRepresentationsKHR(self.handle, ptr_executableInfo, pInternalRepresentationCount, pInternalRepresentations)
            }.map { PipelineExecutableInternalRepresentationKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableInternalRepresentationsKHR(_ executableInfo: PipelineExecutableInfoKHR) throws(Result) -> Array<PipelineExecutableInternalRepresentationKHR> {
        try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pInternalRepresentations, pInternalRepresentationCount in
                self.dispatchTable.vkGetPipelineExecutableInternalRepresentationsKHR(self.handle, ptr_executableInfo, pInternalRepresentationCount, pInternalRepresentations)
            }.map { PipelineExecutableInternalRepresentationKHR(cStruct: $0) }
        }
    }

    public func createAccelerationStructureKHR(_ createInfo: (some Chainable<AccelerationStructureCreateInfoKHR>)) throws(Result) -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }

    public func createAccelerationStructureKHR(_ createInfo: AccelerationStructureCreateInfoKHR) throws(Result) -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructureKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }

    public func buildAccelerationStructuresKHR(_ infos: (AnyChainableArray<AccelerationStructureBuildGeometryInfoKHR>), _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBuildAccelerationStructuresKHR(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
            )
        }
    }

    public func buildAccelerationStructuresKHR(_ infos: Array<AccelerationStructureBuildGeometryInfoKHR>, _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBuildAccelerationStructuresKHR(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
            )
        }
    }

    public func getAccelerationStructureAddressKHR(_ info: (some Chainable<AccelerationStructureDeviceAddressInfoKHR>)) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetAccelerationStructureDeviceAddressKHR(self.handle, ptr_info)
        }
    }

    public func getAccelerationStructureAddressKHR(_ info: AccelerationStructureDeviceAddressInfoKHR) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetAccelerationStructureDeviceAddressKHR(self.handle, ptr_info)
        }
    }

    public func createDeferredOperationKHR() throws(Result) -> DeferredOperationKHR {
        var out: VkDeferredOperationKHR!
        try checkResult(
            self.dispatchTable.vkCreateDeferredOperationKHR(self.handle, nil, &out)
        )
        return DeferredOperationKHR(handle: out, device: self)
    }

    public func getPipelineIndirectMemoryRequirementsNV(_ createInfo: (some Chainable<ComputePipelineCreateInfo>)) -> MemoryRequirements2 {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetPipelineIndirectMemoryRequirementsNV(self.handle, ptr_createInfo, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getPipelineIndirectMemoryRequirementsNV(_ createInfo: ComputePipelineCreateInfo) -> MemoryRequirements2 {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetPipelineIndirectMemoryRequirementsNV(self.handle, ptr_createInfo, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getPipelineIndirectAddressNV(_ info: (some Chainable<PipelineIndirectDeviceAddressInfoNV>)) -> VkDeviceAddress {
        info.withCStruct { ptr_info in
            self.dispatchTable.vkGetPipelineIndirectDeviceAddressNV(self.handle, ptr_info)
        }
    }

    public func getPipelineIndirectAddressNV(_ info: PipelineIndirectDeviceAddressInfoNV) -> VkDeviceAddress {
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

    public func createPrivateDataSlot(_ createInfo: (some Chainable<PrivateDataSlotCreateInfo>)) throws(Result) -> PrivateDataSlot {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPrivateDataSlot!
            try checkResult(
                self.dispatchTable.vkCreatePrivateDataSlot(self.handle, ptr_createInfo, nil, &out)
            )
            return PrivateDataSlot(handle: out, device: self)
        }
    }

    public func createPrivateDataSlot(_ createInfo: PrivateDataSlotCreateInfo) throws(Result) -> PrivateDataSlot {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPrivateDataSlot!
            try checkResult(
                self.dispatchTable.vkCreatePrivateDataSlot(self.handle, ptr_createInfo, nil, &out)
            )
            return PrivateDataSlot(handle: out, device: self)
        }
    }

    public func setPrivateData(objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot, data: UInt64) throws(Result) -> Void {
        try checkResult(
            self.dispatchTable.vkSetPrivateData(self.handle, VkObjectType(rawValue: VkObjectType.RawValue(objectType.rawValue)), objectHandle, privateDataSlot.handle, data)
        )
    }

    public func getPrivateData(objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot) -> UInt64 {
        var out = UInt64()
        self.dispatchTable.vkGetPrivateData(self.handle, VkObjectType(rawValue: VkObjectType.RawValue(objectType.rawValue)), objectHandle, privateDataSlot.handle, &out)
        return out
    }

    public func getAccelerationStructureBuildSizesKHR(_ buildInfo: (some Chainable<AccelerationStructureBuildGeometryInfoKHR>), buildType: AccelerationStructureBuildTypeKHR, maxPrimitiveCounts: Array<UInt32>? = nil) -> AccelerationStructureBuildSizesInfoKHR {
        buildInfo.withCStruct { ptr_buildInfo in
            maxPrimitiveCounts.withOptionalUnsafeBufferPointer { ptr_maxPrimitiveCounts in
                var out = VkAccelerationStructureBuildSizesInfoKHR()
                out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
                self.dispatchTable.vkGetAccelerationStructureBuildSizesKHR(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, ptr_maxPrimitiveCounts.baseAddress, &out)
                return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
            }
        }
    }

    public func getAccelerationStructureBuildSizesKHR(_ buildInfo: AccelerationStructureBuildGeometryInfoKHR, buildType: AccelerationStructureBuildTypeKHR, maxPrimitiveCounts: Array<UInt32>? = nil) -> AccelerationStructureBuildSizesInfoKHR {
        buildInfo.withCStruct { ptr_buildInfo in
            maxPrimitiveCounts.withOptionalUnsafeBufferPointer { ptr_maxPrimitiveCounts in
                var out = VkAccelerationStructureBuildSizesInfoKHR()
                out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
                self.dispatchTable.vkGetAccelerationStructureBuildSizesKHR(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, ptr_maxPrimitiveCounts.baseAddress, &out)
                return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
            }
        }
    }

    public func copyMemoryToImage(_ copyMemoryToImageInfo: (some Chainable<CopyMemoryToImageInfo>)) throws(Result) -> Void {
        try copyMemoryToImageInfo.withCStruct { ptr_copyMemoryToImageInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToImage(self.handle, ptr_copyMemoryToImageInfo)
            )
        }
    }

    public func copyMemoryToImage(_ copyMemoryToImageInfo: CopyMemoryToImageInfo) throws(Result) -> Void {
        try copyMemoryToImageInfo.withCStruct { ptr_copyMemoryToImageInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToImage(self.handle, ptr_copyMemoryToImageInfo)
            )
        }
    }

    public func copyImageToMemory(_ copyImageToMemoryInfo: (some Chainable<CopyImageToMemoryInfo>)) throws(Result) -> Void {
        try copyImageToMemoryInfo.withCStruct { ptr_copyImageToMemoryInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyImageToMemory(self.handle, ptr_copyImageToMemoryInfo)
            )
        }
    }

    public func copyImageToMemory(_ copyImageToMemoryInfo: CopyImageToMemoryInfo) throws(Result) -> Void {
        try copyImageToMemoryInfo.withCStruct { ptr_copyImageToMemoryInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyImageToMemory(self.handle, ptr_copyImageToMemoryInfo)
            )
        }
    }

    public func copyImageToImage(_ copyImageToImageInfo: (some Chainable<CopyImageToImageInfo>)) throws(Result) -> Void {
        try copyImageToImageInfo.withCStruct { ptr_copyImageToImageInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyImageToImage(self.handle, ptr_copyImageToImageInfo)
            )
        }
    }

    public func copyImageToImage(_ copyImageToImageInfo: CopyImageToImageInfo) throws(Result) -> Void {
        try copyImageToImageInfo.withCStruct { ptr_copyImageToImageInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyImageToImage(self.handle, ptr_copyImageToImageInfo)
            )
        }
    }

    public func transitionImageLayout(transitions: (AnyChainableArray<HostImageLayoutTransitionInfo>)) throws(Result) -> Void {
        try transitions.withCStructBufferPointer { ptr_transitions throws(Result) in
            try checkResult(
                self.dispatchTable.vkTransitionImageLayout(self.handle, UInt32(ptr_transitions.count), ptr_transitions.baseAddress)
            )
        }
    }

    public func transitionImageLayout(transitions: Array<HostImageLayoutTransitionInfo>) throws(Result) -> Void {
        try transitions.withCStructBufferPointer { ptr_transitions throws(Result) in
            try checkResult(
                self.dispatchTable.vkTransitionImageLayout(self.handle, UInt32(ptr_transitions.count), ptr_transitions.baseAddress)
            )
        }
    }

    public func createVideoSessionKHR(_ createInfo: (some Chainable<VideoSessionCreateInfoKHR>)) throws(Result) -> VideoSessionKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionKHR(handle: out, device: self)
        }
    }

    public func createVideoSessionKHR(_ createInfo: VideoSessionCreateInfoKHR) throws(Result) -> VideoSessionKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionKHR(handle: out, device: self)
        }
    }

    public func createVideoSessionParametersKHR(_ createInfo: (some Chainable<VideoSessionParametersCreateInfoKHR>)) throws(Result) -> VideoSessionParametersKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionParametersKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionParametersKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionParametersKHR(handle: out, device: self)
        }
    }

    public func createVideoSessionParametersKHR(_ createInfo: VideoSessionParametersCreateInfoKHR) throws(Result) -> VideoSessionParametersKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionParametersKHR!
            try checkResult(
                self.dispatchTable.vkCreateVideoSessionParametersKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionParametersKHR(handle: out, device: self)
        }
    }

    public func getEncodedVideoSessionParametersKHR(_ videoSessionParametersInfo: (some Chainable<VideoEncodeSessionParametersGetInfoKHR>), _ feedbackInfo: UnsafeMutablePointer<VkVideoEncodeSessionParametersFeedbackInfoKHR>? = nil, dataSize: UnsafeMutablePointer<Int>, data: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        try videoSessionParametersInfo.withCStruct { ptr_videoSessionParametersInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetEncodedVideoSessionParametersKHR(self.handle, ptr_videoSessionParametersInfo, feedbackInfo, dataSize, data)
            )
        }
    }

    public func getEncodedVideoSessionParametersKHR(_ videoSessionParametersInfo: VideoEncodeSessionParametersGetInfoKHR, _ feedbackInfo: UnsafeMutablePointer<VkVideoEncodeSessionParametersFeedbackInfoKHR>? = nil, dataSize: UnsafeMutablePointer<Int>, data: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        try videoSessionParametersInfo.withCStruct { ptr_videoSessionParametersInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetEncodedVideoSessionParametersKHR(self.handle, ptr_videoSessionParametersInfo, feedbackInfo, dataSize, data)
            )
        }
    }

    public func getPartitionedAccelerationStructuresBuildSizesNV(_ info: (some Chainable<PartitionedAccelerationStructureInstancesInputNV>)) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            self.dispatchTable.vkGetPartitionedAccelerationStructuresBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getPartitionedAccelerationStructuresBuildSizesNV(_ info: PartitionedAccelerationStructureInstancesInputNV) -> AccelerationStructureBuildSizesInfoKHR {
        info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            self.dispatchTable.vkGetPartitionedAccelerationStructuresBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func createCuModuleNVX(_ createInfo: (some Chainable<CuModuleCreateInfoNVX>)) throws(Result) -> CuModuleNVX {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuModuleNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuModuleNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuModuleNVX(handle: out, device: self)
        }
    }

    public func createCuModuleNVX(_ createInfo: CuModuleCreateInfoNVX) throws(Result) -> CuModuleNVX {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuModuleNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuModuleNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuModuleNVX(handle: out, device: self)
        }
    }

    public func createCuFunctionNVX(_ createInfo: (some Chainable<CuFunctionCreateInfoNVX>)) throws(Result) -> CuFunctionNVX {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuFunctionNVX!
            try checkResult(
                self.dispatchTable.vkCreateCuFunctionNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuFunctionNVX(handle: out, device: self)
        }
    }

    public func createCuFunctionNVX(_ createInfo: CuFunctionCreateInfoNVX) throws(Result) -> CuFunctionNVX {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
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

    public func getBufferOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<BufferCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetBufferOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getBufferOpaqueCaptureDescriptorDataEXT(_ info: BufferCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetBufferOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<ImageCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetImageOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageOpaqueCaptureDescriptorDataEXT(_ info: ImageCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetImageOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageViewOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<ImageViewCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetImageViewOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageViewOpaqueCaptureDescriptorDataEXT(_ info: ImageViewCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetImageViewOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getSamplerOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<SamplerCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetSamplerOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getSamplerOpaqueCaptureDescriptorDataEXT(_ info: SamplerCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetSamplerOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getAccelerationStructureOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<AccelerationStructureCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getAccelerationStructureOpaqueCaptureDescriptorDataEXT(_ info: AccelerationStructureCaptureDescriptorDataInfoEXT = AccelerationStructureCaptureDescriptorDataInfoEXT(), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func createBufferCollectionFUCHSIA(_ createInfo: (some Chainable<BufferCollectionCreateInfoFUCHSIA>)) throws(Result) -> BufferCollectionFUCHSIA {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferCollectionFUCHSIA!
            try checkResult(
                self.dispatchTable.vkCreateBufferCollectionFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferCollectionFUCHSIA(handle: out, device: self)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createBufferCollectionFUCHSIA(_ createInfo: BufferCollectionCreateInfoFUCHSIA) throws(Result) -> BufferCollectionFUCHSIA {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferCollectionFUCHSIA!
            try checkResult(
                self.dispatchTable.vkCreateBufferCollectionFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferCollectionFUCHSIA(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaModuleNV(_ createInfo: (some Chainable<CudaModuleCreateInfoNV>)) throws(Result) -> CudaModuleNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaModuleNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaModuleNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaModuleNV(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaModuleNV(_ createInfo: CudaModuleCreateInfoNV) throws(Result) -> CudaModuleNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaModuleNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaModuleNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaModuleNV(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaFunctionNV(_ createInfo: (some Chainable<CudaFunctionCreateInfoNV>)) throws(Result) -> CudaFunctionNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaFunctionNV!
            try checkResult(
                self.dispatchTable.vkCreateCudaFunctionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaFunctionNV(handle: out, device: self)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaFunctionNV(_ createInfo: CudaFunctionCreateInfoNV) throws(Result) -> CudaFunctionNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
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
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE
            self.dispatchTable.vkGetDescriptorSetLayoutHostMappingInfoVALVE(self.handle, ptr_bindingReference, &out)
            return DescriptorSetLayoutHostMappingInfoVALVE(cStruct: out)
        }
    }

    public func getDescriptorSetLayoutHostMappingInfoVALVE(bindingReference: DescriptorSetBindingReferenceVALVE) -> DescriptorSetLayoutHostMappingInfoVALVE {
        bindingReference.withCStruct { ptr_bindingReference in
            var out = VkDescriptorSetLayoutHostMappingInfoVALVE()
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE
            self.dispatchTable.vkGetDescriptorSetLayoutHostMappingInfoVALVE(self.handle, ptr_bindingReference, &out)
            return DescriptorSetLayoutHostMappingInfoVALVE(cStruct: out)
        }
    }

    public func createMicromapEXT(_ createInfo: (some Chainable<MicromapCreateInfoEXT>)) throws(Result) -> MicromapEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkMicromapEXT!
            try checkResult(
                self.dispatchTable.vkCreateMicromapEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return MicromapEXT(handle: out, device: self)
        }
    }

    public func createMicromapEXT(_ createInfo: MicromapCreateInfoEXT) throws(Result) -> MicromapEXT {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkMicromapEXT!
            try checkResult(
                self.dispatchTable.vkCreateMicromapEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return MicromapEXT(handle: out, device: self)
        }
    }

    public func buildMicromapsEXT(_ infos: (AnyChainableArray<MicromapBuildInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBuildMicromapsEXT(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
            )
        }
    }

    public func buildMicromapsEXT(_ infos: Array<MicromapBuildInfoEXT>, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBuildMicromapsEXT(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
            )
        }
    }

    public func copyMicromapEXT(_ info: (some Chainable<CopyMicromapInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMicromapEXT(_ info: CopyMicromapInfoEXT, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMicromapToMemoryEXT(_ info: (some Chainable<CopyMicromapToMemoryInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMicromapToMemoryEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMicromapToMemoryEXT(_ info: CopyMicromapToMemoryInfoEXT, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMicromapToMemoryEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToMicromapEXT(_ info: (some Chainable<CopyMemoryToMicromapInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToMicromapEXT(_ info: CopyMemoryToMicromapInfoEXT, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkCopyMemoryToMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func writeMicromapsPropertiesEXT(micromaps: Array<MicromapEXT>, queryType: QueryType, dataSize: Int, data: UnsafeMutableRawPointer, stride: Int) throws(Result) -> Void {
        try micromaps.map{ $0.handle }.withUnsafeBufferPointer { ptr_micromaps throws(Result) in
            try checkResult(
                self.dispatchTable.vkWriteMicromapsPropertiesEXT(self.handle, UInt32(ptr_micromaps.count), ptr_micromaps.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), dataSize, data, stride)
            )
        }
    }

    public func getMicromapCompatibilityEXT(_ versionInfo: (some Chainable<MicromapVersionInfoEXT>)) -> AccelerationStructureCompatibilityKHR {
        versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            self.dispatchTable.vkGetDeviceMicromapCompatibilityEXT(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out))!
        }
    }

    public func getMicromapCompatibilityEXT(_ versionInfo: MicromapVersionInfoEXT) -> AccelerationStructureCompatibilityKHR {
        versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            self.dispatchTable.vkGetDeviceMicromapCompatibilityEXT(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out))!
        }
    }

    public func getMicromapBuildSizesEXT(_ buildInfo: (some Chainable<MicromapBuildInfoEXT>), buildType: AccelerationStructureBuildTypeKHR) -> MicromapBuildSizesInfoEXT {
        buildInfo.withCStruct { ptr_buildInfo in
            var out = VkMicromapBuildSizesInfoEXT()
            out.sType = VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT
            self.dispatchTable.vkGetMicromapBuildSizesEXT(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, &out)
            return MicromapBuildSizesInfoEXT(cStruct: out)
        }
    }

    public func getMicromapBuildSizesEXT(_ buildInfo: MicromapBuildInfoEXT, buildType: AccelerationStructureBuildTypeKHR) -> MicromapBuildSizesInfoEXT {
        buildInfo.withCStruct { ptr_buildInfo in
            var out = VkMicromapBuildSizesInfoEXT()
            out.sType = VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT
            self.dispatchTable.vkGetMicromapBuildSizesEXT(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, &out)
            return MicromapBuildSizesInfoEXT(cStruct: out)
        }
    }

    public func getShaderModuleCreateInfoIdentifierEXT(_ createInfo: (some Chainable<ShaderModuleCreateInfo>)) -> ShaderModuleIdentifierEXT {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkShaderModuleIdentifierEXT()
            out.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT
            self.dispatchTable.vkGetShaderModuleCreateInfoIdentifierEXT(self.handle, ptr_createInfo, &out)
            return ShaderModuleIdentifierEXT(cStruct: out)
        }
    }

    public func getShaderModuleCreateInfoIdentifierEXT(_ createInfo: ShaderModuleCreateInfo) -> ShaderModuleIdentifierEXT {
        createInfo.withCStruct { ptr_createInfo in
            var out = VkShaderModuleIdentifierEXT()
            out.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT
            self.dispatchTable.vkGetShaderModuleCreateInfoIdentifierEXT(self.handle, ptr_createInfo, &out)
            return ShaderModuleIdentifierEXT(cStruct: out)
        }
    }

    public func getPipelinePropertiesEXT(_ pipelineInfo: (some Chainable<PipelineInfoKHR>)) throws(Result) -> VkBaseOutStructure {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                self.dispatchTable.vkGetPipelinePropertiesEXT(self.handle, ptr_pipelineInfo, &out)
            )
            return out
        }
    }

    public func getPipelinePropertiesEXT(_ pipelineInfo: PipelineInfoKHR) throws(Result) -> VkBaseOutStructure {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
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
        out.sType = VK_STRUCTURE_TYPE_EXPORT_METAL_OBJECTS_INFO_EXT
        self.dispatchTable.vkExportMetalObjectsEXT(self.handle, &out)
        return ExportMetalObjectsInfoEXT(cStruct: out)
    }
    #endif

    public func getDynamicRenderingTilePropertiesQCOM(_ renderingInfo: (some Chainable<RenderingInfo>)) throws(Result) -> TilePropertiesQCOM {
        try renderingInfo.withCStruct { ptr_renderingInfo throws(Result) in
            var out = VkTilePropertiesQCOM()
            out.sType = VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM
            try checkResult(
                self.dispatchTable.vkGetDynamicRenderingTilePropertiesQCOM(self.handle, ptr_renderingInfo, &out)
            )
            return TilePropertiesQCOM(cStruct: out)
        }
    }

    public func getDynamicRenderingTilePropertiesQCOM(_ renderingInfo: RenderingInfo) throws(Result) -> TilePropertiesQCOM {
        try renderingInfo.withCStruct { ptr_renderingInfo throws(Result) in
            var out = VkTilePropertiesQCOM()
            out.sType = VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM
            try checkResult(
                self.dispatchTable.vkGetDynamicRenderingTilePropertiesQCOM(self.handle, ptr_renderingInfo, &out)
            )
            return TilePropertiesQCOM(cStruct: out)
        }
    }

    public func createOpticalFlowSessionNV(_ createInfo: (some Chainable<OpticalFlowSessionCreateInfoNV>)) throws(Result) -> OpticalFlowSessionNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkOpticalFlowSessionNV!
            try checkResult(
                self.dispatchTable.vkCreateOpticalFlowSessionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return OpticalFlowSessionNV(handle: out, device: self)
        }
    }

    public func createOpticalFlowSessionNV(_ createInfo: OpticalFlowSessionCreateInfoNV) throws(Result) -> OpticalFlowSessionNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkOpticalFlowSessionNV!
            try checkResult(
                self.dispatchTable.vkCreateOpticalFlowSessionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return OpticalFlowSessionNV(handle: out, device: self)
        }
    }

    public func getFaultInfoEXT(_ faultInfo: UnsafeMutablePointer<VkDeviceFaultInfoEXT>? = nil, faultCounts: UnsafeMutablePointer<VkDeviceFaultCountsEXT>) throws(Result) -> Void {
        try checkResult(
            self.dispatchTable.vkGetDeviceFaultInfoEXT(self.handle, faultCounts, faultInfo)
        )
    }

    public func getFaultReportsKHR(timeout: UInt64) throws(Result) -> Array<DeviceFaultInfoKHR> {
        try enumerate { pFaultInfo, pFaultCounts in
            self.dispatchTable.vkGetDeviceFaultReportsKHR(self.handle, timeout, pFaultCounts, pFaultInfo)
        }.map { DeviceFaultInfoKHR(cStruct: $0) }
    }

    public func getFaultDebugInfoKHR() throws(Result) -> DeviceFaultDebugInfoKHR {
        var out = VkDeviceFaultDebugInfoKHR()
        out.sType = VK_STRUCTURE_TYPE_DEVICE_FAULT_DEBUG_INFO_KHR
        try checkResult(
            self.dispatchTable.vkGetDeviceFaultDebugInfoKHR(self.handle, &out)
        )
        return DeviceFaultDebugInfoKHR(cStruct: out)
    }

    public func releaseSwapchainImagesKHR(_ releaseInfo: (some Chainable<ReleaseSwapchainImagesInfoKHR>)) throws(Result) -> Void {
        try releaseInfo.withCStruct { ptr_releaseInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkReleaseSwapchainImagesKHR(self.handle, ptr_releaseInfo)
            )
        }
    }

    public func releaseSwapchainImagesKHR(_ releaseInfo: ReleaseSwapchainImagesInfoKHR) throws(Result) -> Void {
        try releaseInfo.withCStruct { ptr_releaseInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkReleaseSwapchainImagesKHR(self.handle, ptr_releaseInfo)
            )
        }
    }

    public func getImageSubresourceLayout(_ info: (some Chainable<DeviceImageSubresourceInfo>)) -> SubresourceLayout2 {
        info.withCStruct { ptr_info in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            self.dispatchTable.vkGetDeviceImageSubresourceLayout(self.handle, ptr_info, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getImageSubresourceLayout(_ info: DeviceImageSubresourceInfo) -> SubresourceLayout2 {
        info.withCStruct { ptr_info in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            self.dispatchTable.vkGetDeviceImageSubresourceLayout(self.handle, ptr_info, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func mapMemory2(_ memoryMapInfo: (some Chainable<MemoryMapInfo>)) throws(Result) -> UnsafeMutableRawPointer {
        try memoryMapInfo.withCStruct { ptr_memoryMapInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkMapMemory2(self.handle, ptr_memoryMapInfo, &out)
            )
            return out
        }
    }

    public func mapMemory2(_ memoryMapInfo: MemoryMapInfo) throws(Result) -> UnsafeMutableRawPointer {
        try memoryMapInfo.withCStruct { ptr_memoryMapInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkMapMemory2(self.handle, ptr_memoryMapInfo, &out)
            )
            return out
        }
    }

    public func unmapMemory2(_ memoryUnmapInfo: (some Chainable<MemoryUnmapInfo>)) throws(Result) -> Void {
        try memoryUnmapInfo.withCStruct { ptr_memoryUnmapInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkUnmapMemory2(self.handle, ptr_memoryUnmapInfo)
            )
        }
    }

    public func unmapMemory2(_ memoryUnmapInfo: MemoryUnmapInfo) throws(Result) -> Void {
        try memoryUnmapInfo.withCStruct { ptr_memoryUnmapInfo throws(Result) in
            try checkResult(
                self.dispatchTable.vkUnmapMemory2(self.handle, ptr_memoryUnmapInfo)
            )
        }
    }

    public func createShadersEXT(_ createInfos: (AnyChainableArray<ShaderCreateInfoEXT>)) throws(Result) -> Array<ShaderEXT> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkShaderEXT?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateShadersEXT(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { ShaderEXT(handle: $0, device: self) }
        }
    }

    public func createShadersEXT(_ createInfos: Array<ShaderCreateInfoEXT>) throws(Result) -> Array<ShaderEXT> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkShaderEXT?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateShadersEXT(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { ShaderEXT(handle: $0, device: self) }
        }
    }

    public func getPastPresentationTimingEXT(_ pastPresentationTimingInfo: (some Chainable<PastPresentationTimingInfoEXT>)) throws(Result) -> PastPresentationTimingPropertiesEXT {
        try pastPresentationTimingInfo.withCStruct { ptr_pastPresentationTimingInfo throws(Result) in
            var out = VkPastPresentationTimingPropertiesEXT()
            out.sType = VK_STRUCTURE_TYPE_PAST_PRESENTATION_TIMING_PROPERTIES_EXT
            try checkResult(
                self.dispatchTable.vkGetPastPresentationTimingEXT(self.handle, ptr_pastPresentationTimingInfo, &out)
            )
            return PastPresentationTimingPropertiesEXT(cStruct: out)
        }
    }

    public func getPastPresentationTimingEXT(_ pastPresentationTimingInfo: PastPresentationTimingInfoEXT) throws(Result) -> PastPresentationTimingPropertiesEXT {
        try pastPresentationTimingInfo.withCStruct { ptr_pastPresentationTimingInfo throws(Result) in
            var out = VkPastPresentationTimingPropertiesEXT()
            out.sType = VK_STRUCTURE_TYPE_PAST_PRESENTATION_TIMING_PROPERTIES_EXT
            try checkResult(
                self.dispatchTable.vkGetPastPresentationTimingEXT(self.handle, ptr_pastPresentationTimingInfo, &out)
            )
            return PastPresentationTimingPropertiesEXT(cStruct: out)
        }
    }

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func getScreenBufferPropertiesQNX(buffer: UnsafePointer<_screen_buffer>) throws(Result) -> ScreenBufferPropertiesQNX {
        var out = VkScreenBufferPropertiesQNX()
        out.sType = VK_STRUCTURE_TYPE_SCREEN_BUFFER_PROPERTIES_QNX
        try checkResult(
            self.dispatchTable.vkGetScreenBufferPropertiesQNX(self.handle, buffer, &out)
        )
        return ScreenBufferPropertiesQNX(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createExecutionGraphPipelinesAMDX(_ createInfos: (AnyChainableArray<ExecutionGraphPipelineCreateInfoAMDX>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateExecutionGraphPipelinesAMDX(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createExecutionGraphPipelinesAMDX(_ createInfos: Array<ExecutionGraphPipelineCreateInfoAMDX>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateExecutionGraphPipelinesAMDX(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }
    #endif

    public func createGpaSessionAMD(_ createInfo: (some Chainable<GpaSessionCreateInfoAMD>)) throws(Result) -> GpaSessionAMD {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkGpaSessionAMD!
            try checkResult(
                self.dispatchTable.vkCreateGpaSessionAMD(self.handle, ptr_createInfo, nil, &out)
            )
            return GpaSessionAMD(handle: out, device: self)
        }
    }

    public func createGpaSessionAMD(_ createInfo: GpaSessionCreateInfoAMD = GpaSessionCreateInfoAMD()) throws(Result) -> GpaSessionAMD {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkGpaSessionAMD!
            try checkResult(
                self.dispatchTable.vkCreateGpaSessionAMD(self.handle, ptr_createInfo, nil, &out)
            )
            return GpaSessionAMD(handle: out, device: self)
        }
    }

    public func setGpaClockModeAMD() throws(Result) -> GpaDeviceClockModeInfoAMD {
        var out = VkGpaDeviceClockModeInfoAMD()
        out.sType = VK_STRUCTURE_TYPE_GPA_DEVICE_CLOCK_MODE_INFO_AMD
        try checkResult(
            self.dispatchTable.vkSetGpaDeviceClockModeAMD(self.handle, &out)
        )
        return GpaDeviceClockModeInfoAMD(cStruct: out)
    }

    public func getGpaClockInfoAMD() throws(Result) -> GpaDeviceGetClockInfoAMD {
        var out = VkGpaDeviceGetClockInfoAMD()
        out.sType = VK_STRUCTURE_TYPE_GPA_DEVICE_GET_CLOCK_INFO_AMD
        try checkResult(
            self.dispatchTable.vkGetGpaDeviceClockInfoAMD(self.handle, &out)
        )
        return GpaDeviceGetClockInfoAMD(cStruct: out)
    }

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandleEXT(_ getMetalHandleInfo: (some Chainable<MemoryGetMetalHandleInfoEXT>)) throws(Result) -> UnsafeMutableRawPointer {
        try getMetalHandleInfo.withCStruct { ptr_getMetalHandleInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkGetMemoryMetalHandleEXT(self.handle, ptr_getMetalHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandleEXT(_ getMetalHandleInfo: MemoryGetMetalHandleInfoEXT) throws(Result) -> UnsafeMutableRawPointer {
        try getMetalHandleInfo.withCStruct { ptr_getMetalHandleInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                self.dispatchTable.vkGetMemoryMetalHandleEXT(self.handle, ptr_getMetalHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandlePropertiesEXT(handleType: ExternalMemoryHandleTypeFlags, handle: UnsafeRawPointer) throws(Result) -> MemoryMetalHandlePropertiesEXT {
        var out = VkMemoryMetalHandlePropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_METAL_HANDLE_PROPERTIES_EXT
        try checkResult(
            self.dispatchTable.vkGetMemoryMetalHandlePropertiesEXT(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), handle, &out)
        )
        return MemoryMetalHandlePropertiesEXT(cStruct: out)
    }
    #endif

    public func convertCooperativeVectorMatrixNV(_ info: (some Chainable<ConvertCooperativeVectorMatrixInfoNV>)) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkConvertCooperativeVectorMatrixNV(self.handle, ptr_info)
            )
        }
    }

    public func convertCooperativeVectorMatrixNV(_ info: ConvertCooperativeVectorMatrixInfoNV) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkConvertCooperativeVectorMatrixNV(self.handle, ptr_info)
            )
        }
    }

    public func createExternalComputeQueueNV(_ createInfo: (some Chainable<ExternalComputeQueueCreateInfoNV>)) throws(Result) -> ExternalComputeQueueNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkExternalComputeQueueNV!
            try checkResult(
                self.dispatchTable.vkCreateExternalComputeQueueNV(self.handle, ptr_createInfo, nil, &out)
            )
            return ExternalComputeQueueNV(handle: out, device: self)
        }
    }

    public func createExternalComputeQueueNV(_ createInfo: ExternalComputeQueueCreateInfoNV) throws(Result) -> ExternalComputeQueueNV {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkExternalComputeQueueNV!
            try checkResult(
                self.dispatchTable.vkCreateExternalComputeQueueNV(self.handle, ptr_createInfo, nil, &out)
            )
            return ExternalComputeQueueNV(handle: out, device: self)
        }
    }

    public func createShaderInstrumentationARM(_ createInfo: (some Chainable<ShaderInstrumentationCreateInfoARM>)) throws(Result) -> ShaderInstrumentationARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderInstrumentationARM!
            try checkResult(
                self.dispatchTable.vkCreateShaderInstrumentationARM(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderInstrumentationARM(handle: out, device: self)
        }
    }

    public func createShaderInstrumentationARM(_ createInfo: ShaderInstrumentationCreateInfoARM = ShaderInstrumentationCreateInfoARM()) throws(Result) -> ShaderInstrumentationARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderInstrumentationARM!
            try checkResult(
                self.dispatchTable.vkCreateShaderInstrumentationARM(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderInstrumentationARM(handle: out, device: self)
        }
    }

    public func createTensorARM(_ createInfo: (some Chainable<TensorCreateInfoARM>)) throws(Result) -> TensorARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorARM(handle: out, device: self)
        }
    }

    public func createTensorARM(_ createInfo: TensorCreateInfoARM) throws(Result) -> TensorARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorARM(handle: out, device: self)
        }
    }

    public func createTensorViewARM(_ createInfo: (some Chainable<TensorViewCreateInfoARM>)) throws(Result) -> TensorViewARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorViewARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorViewARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorViewARM(handle: out, device: self)
        }
    }

    public func createTensorViewARM(_ createInfo: TensorViewCreateInfoARM) throws(Result) -> TensorViewARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorViewARM!
            try checkResult(
                self.dispatchTable.vkCreateTensorViewARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorViewARM(handle: out, device: self)
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: (some Chainable<TensorMemoryRequirementsInfoARM>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: TensorMemoryRequirementsInfoARM) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindTensorMemoryARM(_ bindInfos: (AnyChainableArray<BindTensorMemoryInfoARM>)) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindTensorMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindTensorMemoryARM(_ bindInfos: Array<BindTensorMemoryInfoARM>) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindTensorMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: (some Chainable<DeviceTensorMemoryRequirementsARM>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDeviceTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: DeviceTensorMemoryRequirementsARM) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDeviceTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorOpaqueCaptureDescriptorDataARM(_ info: (some Chainable<TensorCaptureDescriptorDataInfoARM>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetTensorOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorOpaqueCaptureDescriptorDataARM(_ info: TensorCaptureDescriptorDataInfoARM, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetTensorOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorViewOpaqueCaptureDescriptorDataARM(_ info: (some Chainable<TensorViewCaptureDescriptorDataInfoARM>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetTensorViewOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorViewOpaqueCaptureDescriptorDataARM(_ info: TensorViewCaptureDescriptorDataInfoARM, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                self.dispatchTable.vkGetTensorViewOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func createDataGraphPipelinesARM(_ createInfos: (AnyChainableArray<DataGraphPipelineCreateInfoARM>), deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateDataGraphPipelinesARM(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createDataGraphPipelinesARM(_ createInfos: Array<DataGraphPipelineCreateInfoARM>, deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkCreateDataGraphPipelinesARM(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0, device: self) }
        }
    }

    public func createDataGraphPipelineSessionARM(_ createInfo: (some Chainable<DataGraphPipelineSessionCreateInfoARM>)) throws(Result) -> DataGraphPipelineSessionARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDataGraphPipelineSessionARM!
            try checkResult(
                self.dispatchTable.vkCreateDataGraphPipelineSessionARM(self.handle, ptr_createInfo, nil, &out)
            )
            return DataGraphPipelineSessionARM(handle: out, device: self)
        }
    }

    public func createDataGraphPipelineSessionARM(_ createInfo: DataGraphPipelineSessionCreateInfoARM) throws(Result) -> DataGraphPipelineSessionARM {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDataGraphPipelineSessionARM!
            try checkResult(
                self.dispatchTable.vkCreateDataGraphPipelineSessionARM(self.handle, ptr_createInfo, nil, &out)
            )
            return DataGraphPipelineSessionARM(handle: out, device: self)
        }
    }

    public func getDataGraphPipelineSessionBindPointRequirementsARM(_ info: (some Chainable<DataGraphPipelineSessionBindPointRequirementsInfoARM>)) throws(Result) -> Array<DataGraphPipelineSessionBindPointRequirementARM> {
        try info.withCStruct { ptr_info throws(Result) in
            try enumerate { pBindPointRequirements, pBindPointRequirementCount in
                self.dispatchTable.vkGetDataGraphPipelineSessionBindPointRequirementsARM(self.handle, ptr_info, pBindPointRequirementCount, pBindPointRequirements)
            }.map { DataGraphPipelineSessionBindPointRequirementARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelineSessionBindPointRequirementsARM(_ info: DataGraphPipelineSessionBindPointRequirementsInfoARM) throws(Result) -> Array<DataGraphPipelineSessionBindPointRequirementARM> {
        try info.withCStruct { ptr_info throws(Result) in
            try enumerate { pBindPointRequirements, pBindPointRequirementCount in
                self.dispatchTable.vkGetDataGraphPipelineSessionBindPointRequirementsARM(self.handle, ptr_info, pBindPointRequirementCount, pBindPointRequirements)
            }.map { DataGraphPipelineSessionBindPointRequirementARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelineSessionMemoryRequirementsARM(_ info: (some Chainable<DataGraphPipelineSessionMemoryRequirementsInfoARM>)) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDataGraphPipelineSessionMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getDataGraphPipelineSessionMemoryRequirementsARM(_ info: DataGraphPipelineSessionMemoryRequirementsInfoARM) -> MemoryRequirements2 {
        info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            self.dispatchTable.vkGetDataGraphPipelineSessionMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindDataGraphPipelineSessionMemoryARM(_ bindInfos: (AnyChainableArray<BindDataGraphPipelineSessionMemoryInfoARM>)) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindDataGraphPipelineSessionMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindDataGraphPipelineSessionMemoryARM(_ bindInfos: Array<BindDataGraphPipelineSessionMemoryInfoARM>) throws(Result) -> Void {
        try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                self.dispatchTable.vkBindDataGraphPipelineSessionMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getDataGraphPipelineAvailablePropertiesARM(_ pipelineInfo: (some Chainable<DataGraphPipelineInfoARM>)) throws(Result) -> Array<DataGraphPipelinePropertyARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pPropertiesCount in
                self.dispatchTable.vkGetDataGraphPipelineAvailablePropertiesARM(self.handle, ptr_pipelineInfo, pPropertiesCount, pProperties)
            }.map { DataGraphPipelinePropertyARM(rawValue: numericBitCast($0))! }
        }
    }

    public func getDataGraphPipelineAvailablePropertiesARM(_ pipelineInfo: DataGraphPipelineInfoARM) throws(Result) -> Array<DataGraphPipelinePropertyARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pPropertiesCount in
                self.dispatchTable.vkGetDataGraphPipelineAvailablePropertiesARM(self.handle, ptr_pipelineInfo, pPropertiesCount, pProperties)
            }.map { DataGraphPipelinePropertyARM(rawValue: numericBitCast($0))! }
        }
    }

    public func getDataGraphPipelinePropertiesARM(_ pipelineInfo: (some Chainable<DataGraphPipelineInfoARM>), propertiesCount: UInt32) throws(Result) -> Array<DataGraphPipelinePropertyQueryResultARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try Array<VkDataGraphPipelinePropertyQueryResultARM>(unsafeUninitializedCapacity: Int(propertiesCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkGetDataGraphPipelinePropertiesARM(self.handle, ptr_pipelineInfo, propertiesCount, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DataGraphPipelinePropertyQueryResultARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelinePropertiesARM(_ pipelineInfo: DataGraphPipelineInfoARM, propertiesCount: UInt32) throws(Result) -> Array<DataGraphPipelinePropertyQueryResultARM> {
        try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try Array<VkDataGraphPipelinePropertyQueryResultARM>(unsafeUninitializedCapacity: Int(propertiesCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkGetDataGraphPipelinePropertiesARM(self.handle, ptr_pipelineInfo, propertiesCount, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DataGraphPipelinePropertyQueryResultARM(cStruct: $0) }
        }
    }

    #if VK_USE_PLATFORM_OHOS
    public func getNativeBufferPropertiesOHOS(buffer: UnsafePointer<OH_NativeBuffer>) throws(Result) -> NativeBufferPropertiesOHOS {
        var out = VkNativeBufferPropertiesOHOS()
        out.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS
        try checkResult(
            self.dispatchTable.vkGetNativeBufferPropertiesOHOS(self.handle, buffer, &out)
        )
        return NativeBufferPropertiesOHOS(cStruct: out)
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func getMemoryNativeBufferOHOS(_ info: (some Chainable<MemoryGetNativeBufferInfoOHOS>)) throws(Result) -> UnsafeMutablePointer<OH_NativeBuffer> {
        try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<OH_NativeBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryNativeBufferOHOS(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func getMemoryNativeBufferOHOS(_ info: MemoryGetNativeBufferInfoOHOS) throws(Result) -> UnsafeMutablePointer<OH_NativeBuffer> {
        try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<OH_NativeBuffer>!
            try checkResult(
                self.dispatchTable.vkGetMemoryNativeBufferOHOS(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    public func writeSamplerDescriptorsEXT(samplers: (AnyChainableArray<SamplerCreateInfo>), descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        try samplers.withCStructBufferPointer { ptr_samplers throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    self.dispatchTable.vkWriteSamplerDescriptorsEXT(self.handle, UInt32(ptr_samplers.count), ptr_samplers.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeSamplerDescriptorsEXT(samplers: Array<SamplerCreateInfo>, descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        try samplers.withCStructBufferPointer { ptr_samplers throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    self.dispatchTable.vkWriteSamplerDescriptorsEXT(self.handle, UInt32(ptr_samplers.count), ptr_samplers.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeResourceDescriptorsEXT(resources: (AnyChainableArray<ResourceDescriptorInfoEXT>), descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        try resources.withCStructBufferPointer { ptr_resources throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    self.dispatchTable.vkWriteResourceDescriptorsEXT(self.handle, UInt32(ptr_resources.count), ptr_resources.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeResourceDescriptorsEXT(resources: Array<ResourceDescriptorInfoEXT>, descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        try resources.withCStructBufferPointer { ptr_resources throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    self.dispatchTable.vkWriteResourceDescriptorsEXT(self.handle, UInt32(ptr_resources.count), ptr_resources.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func registerCustomBorderColorEXT(borderColor: (some Chainable<SamplerCustomBorderColorCreateInfoEXT>), requestIndex: Bool) throws(Result) -> UInt32 {
        try borderColor.withCStruct { ptr_borderColor throws(Result) in
            var out = UInt32()
            try checkResult(
                self.dispatchTable.vkRegisterCustomBorderColorEXT(self.handle, ptr_borderColor, VkBool32(requestIndex ? VK_TRUE : VK_FALSE), &out)
            )
            return out
        }
    }

    public func registerCustomBorderColorEXT(borderColor: SamplerCustomBorderColorCreateInfoEXT, requestIndex: Bool) throws(Result) -> UInt32 {
        try borderColor.withCStruct { ptr_borderColor throws(Result) in
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

    public func getImageOpaqueCaptureDataEXT(images: Array<Image>) throws(Result) -> Array<HostAddressRangeEXT> {
        try images.map{ $0.handle }.withUnsafeBufferPointer { ptr_images throws(Result) in
            try Array<VkHostAddressRangeEXT>(unsafeUninitializedCapacity: Int(UInt32(ptr_images.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkGetImageOpaqueCaptureDataEXT(self.handle, UInt32(ptr_images.count), ptr_images.baseAddress, out.baseAddress)
                )
                initializedCount = out.count
            }.map { HostAddressRangeEXT(cStruct: $0) }
        }
    }

    public func getTensorOpaqueCaptureDataARM(tensors: Array<TensorARM>) throws(Result) -> Array<HostAddressRangeEXT> {
        try tensors.map{ $0.handle }.withUnsafeBufferPointer { ptr_tensors throws(Result) in
            try Array<VkHostAddressRangeEXT>(unsafeUninitializedCapacity: Int(UInt32(ptr_tensors.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    self.dispatchTable.vkGetTensorOpaqueCaptureDataARM(self.handle, UInt32(ptr_tensors.count), ptr_tensors.baseAddress, out.baseAddress)
                )
                initializedCount = out.count
            }.map { HostAddressRangeEXT(cStruct: $0) }
        }
    }

    public func createAccelerationStructure2KHR(_ createInfo: (some Chainable<AccelerationStructureCreateInfo2KHR>)) throws(Result) -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructure2KHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }

    public func createAccelerationStructure2KHR(_ createInfo: AccelerationStructureCreateInfo2KHR) throws(Result) -> AccelerationStructureKHR {
        try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                self.dispatchTable.vkCreateAccelerationStructure2KHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out, device: self)
        }
    }
}

