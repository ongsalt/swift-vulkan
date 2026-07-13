@preconcurrency import CVulkan

public struct Device: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .device
    public let handle: VkDevice
    public let table: UnsafePointer<DeviceDispatchTable>

    public init(handle: VkDevice!, table: UnsafePointer<DeviceDispatchTable>) {
        self.handle = handle
        self.table = table
    }

    public func getProcAddr(name: String) -> PFN_vkVoidFunction? {
        let vkGetDeviceProcAddr = self.table.pointee.vkGetDeviceProcAddr
        return name._withCString { cString_name in
            vkGetDeviceProcAddr(self.handle, cString_name)
        }
    }

    public func destroy() -> Void {
        let vkDestroyDevice = self.table.pointee.vkDestroyDevice!
        vkDestroyDevice(self.handle, nil)
        UnsafeMutablePointer(mutating: self.table).deallocate()
    }

    public func getQueue(queueFamilyIndex: UInt32, queueIndex: UInt32) -> Queue {
        let vkGetDeviceQueue = self.table.pointee.vkGetDeviceQueue!
        var out: VkQueue!
        vkGetDeviceQueue(self.handle, queueFamilyIndex, queueIndex, &out)
        return Queue(handle: out, table: self.table)
    }

    public func waitIdle() throws(Result) -> Void {
        let vkDeviceWaitIdle = self.table.pointee.vkDeviceWaitIdle!
        try checkResult(
            vkDeviceWaitIdle(self.handle)
        )
    }

    public func allocateMemory(_ allocateInfo: (some Chainable<MemoryAllocateInfo>)) throws(Result) -> DeviceMemory {
        let vkAllocateMemory = self.table.pointee.vkAllocateMemory!
        return try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            var out: VkDeviceMemory!
            try checkResult(
                vkAllocateMemory(self.handle, ptr_allocateInfo, nil, &out)
            )
            return DeviceMemory(handle: out)
        }
    }

    public func allocateMemory(_ allocateInfo: MemoryAllocateInfo) throws(Result) -> DeviceMemory {
        let vkAllocateMemory = self.table.pointee.vkAllocateMemory!
        return try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            var out: VkDeviceMemory!
            try checkResult(
                vkAllocateMemory(self.handle, ptr_allocateInfo, nil, &out)
            )
            return DeviceMemory(handle: out)
        }
    }

    public func freeMemory(memory: DeviceMemory? = nil) -> Void {
        let vkFreeMemory = self.table.pointee.vkFreeMemory!
        vkFreeMemory(self.handle, memory?.handle, nil)
    }

    public func mapMemory(memory: DeviceMemory, offset: VkDeviceSize, size: VkDeviceSize, flags: MemoryMapFlags = []) throws(Result) -> UnsafeMutableRawPointer {
        let vkMapMemory = self.table.pointee.vkMapMemory!
        var out: UnsafeMutableRawPointer!
        try checkResult(
            vkMapMemory(self.handle, memory.handle, offset, size, flags.rawValue, &out)
        )
        return out
    }

    public func unmapMemory(memory: DeviceMemory) -> Void {
        let vkUnmapMemory = self.table.pointee.vkUnmapMemory!
        vkUnmapMemory(self.handle, memory.handle)
    }

    public func flushMappedMemoryRanges(memoryRanges: (AnyChainableArray<MappedMemoryRange>)) throws(Result) -> Void {
        let vkFlushMappedMemoryRanges = self.table.pointee.vkFlushMappedMemoryRanges!
        return try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                vkFlushMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func flushMappedMemoryRanges(memoryRanges: Array<MappedMemoryRange>) throws(Result) -> Void {
        let vkFlushMappedMemoryRanges = self.table.pointee.vkFlushMappedMemoryRanges!
        return try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                vkFlushMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func invalidateMappedMemoryRanges(memoryRanges: (AnyChainableArray<MappedMemoryRange>)) throws(Result) -> Void {
        let vkInvalidateMappedMemoryRanges = self.table.pointee.vkInvalidateMappedMemoryRanges!
        return try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                vkInvalidateMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func invalidateMappedMemoryRanges(memoryRanges: Array<MappedMemoryRange>) throws(Result) -> Void {
        let vkInvalidateMappedMemoryRanges = self.table.pointee.vkInvalidateMappedMemoryRanges!
        return try memoryRanges.withCStructBufferPointer { ptr_memoryRanges throws(Result) in
            try checkResult(
                vkInvalidateMappedMemoryRanges(self.handle, UInt32(ptr_memoryRanges.count), ptr_memoryRanges.baseAddress)
            )
        }
    }

    public func getMemoryCommitment(memory: DeviceMemory) -> VkDeviceSize {
        let vkGetDeviceMemoryCommitment = self.table.pointee.vkGetDeviceMemoryCommitment!
        var out = VkDeviceSize()
        vkGetDeviceMemoryCommitment(self.handle, memory.handle, &out)
        return out
    }

    public func getBufferMemoryRequirements(buffer: Buffer) -> MemoryRequirements {
        let vkGetBufferMemoryRequirements = self.table.pointee.vkGetBufferMemoryRequirements!
        var out = VkMemoryRequirements()
        vkGetBufferMemoryRequirements(self.handle, buffer.handle, &out)
        return MemoryRequirements(cStruct: out)
    }

    public func bindBufferMemory(buffer: Buffer, memory: DeviceMemory, memoryOffset: VkDeviceSize) throws(Result) -> Void {
        let vkBindBufferMemory = self.table.pointee.vkBindBufferMemory!
        try checkResult(
            vkBindBufferMemory(self.handle, buffer.handle, memory.handle, memoryOffset)
        )
    }

    public func getImageMemoryRequirements(image: Image) -> MemoryRequirements {
        let vkGetImageMemoryRequirements = self.table.pointee.vkGetImageMemoryRequirements!
        var out = VkMemoryRequirements()
        vkGetImageMemoryRequirements(self.handle, image.handle, &out)
        return MemoryRequirements(cStruct: out)
    }

    public func bindImageMemory(image: Image, memory: DeviceMemory, memoryOffset: VkDeviceSize) throws(Result) -> Void {
        let vkBindImageMemory = self.table.pointee.vkBindImageMemory!
        try checkResult(
            vkBindImageMemory(self.handle, image.handle, memory.handle, memoryOffset)
        )
    }

    public func getImageSparseMemoryRequirements(image: Image) -> Array<SparseImageMemoryRequirements> {
        let vkGetImageSparseMemoryRequirements = self.table.pointee.vkGetImageSparseMemoryRequirements!
        return enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
            vkGetImageSparseMemoryRequirements(self.handle, image.handle, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
        }.map { SparseImageMemoryRequirements(cStruct: $0) }
    }

    public func createFence(_ createInfo: (some Chainable<FenceCreateInfo>)) throws(Result) -> Fence {
        let vkCreateFence = self.table.pointee.vkCreateFence!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                vkCreateFence(self.handle, ptr_createInfo, nil, &out)
            )
            return Fence(handle: out)
        }
    }

    public func createFence(_ createInfo: FenceCreateInfo = FenceCreateInfo()) throws(Result) -> Fence {
        let vkCreateFence = self.table.pointee.vkCreateFence!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                vkCreateFence(self.handle, ptr_createInfo, nil, &out)
            )
            return Fence(handle: out)
        }
    }

    public func destroyFence(fence: Fence? = nil) -> Void {
        let vkDestroyFence = self.table.pointee.vkDestroyFence!
        vkDestroyFence(self.handle, fence?.handle, nil)
    }

    public func resetFences(fences: Array<Fence>) throws(Result) -> Void {
        let vkResetFences = self.table.pointee.vkResetFences!
        return try fences.map{ $0.handle }.withUnsafeBufferPointer { ptr_fences throws(Result) in
            try checkResult(
                vkResetFences(self.handle, UInt32(ptr_fences.count), ptr_fences.baseAddress?.cast())
            )
        }
    }

    public func getFenceStatus(fence: Fence) throws(Result) -> Void {
        let vkGetFenceStatus = self.table.pointee.vkGetFenceStatus!
        try checkResult(
            vkGetFenceStatus(self.handle, fence.handle)
        )
    }

    public func waitForFences(fences: Array<Fence>, waitAll: Bool, timeout: UInt64) throws(Result) -> Void {
        let vkWaitForFences = self.table.pointee.vkWaitForFences!
        return try fences.map{ $0.handle }.withUnsafeBufferPointer { ptr_fences throws(Result) in
            try checkResult(
                vkWaitForFences(self.handle, UInt32(ptr_fences.count), ptr_fences.baseAddress?.cast(), VkBool32(waitAll ? VK_TRUE : VK_FALSE), timeout)
            )
        }
    }

    public func createSemaphore(_ createInfo: (some Chainable<SemaphoreCreateInfo>)) throws(Result) -> Semaphore {
        let vkCreateSemaphore = self.table.pointee.vkCreateSemaphore!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSemaphore!
            try checkResult(
                vkCreateSemaphore(self.handle, ptr_createInfo, nil, &out)
            )
            return Semaphore(handle: out)
        }
    }

    public func createSemaphore(_ createInfo: SemaphoreCreateInfo = SemaphoreCreateInfo()) throws(Result) -> Semaphore {
        let vkCreateSemaphore = self.table.pointee.vkCreateSemaphore!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSemaphore!
            try checkResult(
                vkCreateSemaphore(self.handle, ptr_createInfo, nil, &out)
            )
            return Semaphore(handle: out)
        }
    }

    public func destroySemaphore(semaphore: Semaphore? = nil) -> Void {
        let vkDestroySemaphore = self.table.pointee.vkDestroySemaphore!
        vkDestroySemaphore(self.handle, semaphore?.handle, nil)
    }

    public func createEvent(_ createInfo: (some Chainable<EventCreateInfo>)) throws(Result) -> Event {
        let vkCreateEvent = self.table.pointee.vkCreateEvent!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkEvent!
            try checkResult(
                vkCreateEvent(self.handle, ptr_createInfo, nil, &out)
            )
            return Event(handle: out)
        }
    }

    public func createEvent(_ createInfo: EventCreateInfo = EventCreateInfo()) throws(Result) -> Event {
        let vkCreateEvent = self.table.pointee.vkCreateEvent!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkEvent!
            try checkResult(
                vkCreateEvent(self.handle, ptr_createInfo, nil, &out)
            )
            return Event(handle: out)
        }
    }

    public func destroyEvent(event: Event? = nil) -> Void {
        let vkDestroyEvent = self.table.pointee.vkDestroyEvent!
        vkDestroyEvent(self.handle, event?.handle, nil)
    }

    public func getEventStatus(event: Event) throws(Result) -> Void {
        let vkGetEventStatus = self.table.pointee.vkGetEventStatus!
        try checkResult(
            vkGetEventStatus(self.handle, event.handle)
        )
    }

    public func setEvent(event: Event) throws(Result) -> Void {
        let vkSetEvent = self.table.pointee.vkSetEvent!
        try checkResult(
            vkSetEvent(self.handle, event.handle)
        )
    }

    public func resetEvent(event: Event) throws(Result) -> Void {
        let vkResetEvent = self.table.pointee.vkResetEvent!
        try checkResult(
            vkResetEvent(self.handle, event.handle)
        )
    }

    public func createQueryPool(_ createInfo: (some Chainable<QueryPoolCreateInfo>)) throws(Result) -> QueryPool {
        let vkCreateQueryPool = self.table.pointee.vkCreateQueryPool!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkQueryPool!
            try checkResult(
                vkCreateQueryPool(self.handle, ptr_createInfo, nil, &out)
            )
            return QueryPool(handle: out)
        }
    }

    public func createQueryPool(_ createInfo: QueryPoolCreateInfo) throws(Result) -> QueryPool {
        let vkCreateQueryPool = self.table.pointee.vkCreateQueryPool!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkQueryPool!
            try checkResult(
                vkCreateQueryPool(self.handle, ptr_createInfo, nil, &out)
            )
            return QueryPool(handle: out)
        }
    }

    public func destroyQueryPool(queryPool: QueryPool? = nil) -> Void {
        let vkDestroyQueryPool = self.table.pointee.vkDestroyQueryPool!
        vkDestroyQueryPool(self.handle, queryPool?.handle, nil)
    }

    public func getQueryPoolResults(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer, stride: VkDeviceSize, flags: QueryResultFlags = []) throws(Result) -> Void {
        let vkGetQueryPoolResults = self.table.pointee.vkGetQueryPoolResults!
        try checkResult(
            vkGetQueryPoolResults(self.handle, queryPool.handle, firstQuery, queryCount, dataSize, data, stride, flags.rawValue)
        )
    }

    public func resetQueryPool(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32) -> Void {
        let vkResetQueryPool = self.table.pointee.vkResetQueryPool!
        vkResetQueryPool(self.handle, queryPool.handle, firstQuery, queryCount)
    }

    public func createBuffer(_ createInfo: (some Chainable<BufferCreateInfo>)) throws(Result) -> Buffer {
        let vkCreateBuffer = self.table.pointee.vkCreateBuffer!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBuffer!
            try checkResult(
                vkCreateBuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Buffer(handle: out)
        }
    }

    public func createBuffer(_ createInfo: BufferCreateInfo) throws(Result) -> Buffer {
        let vkCreateBuffer = self.table.pointee.vkCreateBuffer!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBuffer!
            try checkResult(
                vkCreateBuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Buffer(handle: out)
        }
    }

    public func destroyBuffer(buffer: Buffer? = nil) -> Void {
        let vkDestroyBuffer = self.table.pointee.vkDestroyBuffer!
        vkDestroyBuffer(self.handle, buffer?.handle, nil)
    }

    public func createBufferView(_ createInfo: (some Chainable<BufferViewCreateInfo>)) throws(Result) -> BufferView {
        let vkCreateBufferView = self.table.pointee.vkCreateBufferView!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferView!
            try checkResult(
                vkCreateBufferView(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferView(handle: out)
        }
    }

    public func createBufferView(_ createInfo: BufferViewCreateInfo) throws(Result) -> BufferView {
        let vkCreateBufferView = self.table.pointee.vkCreateBufferView!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferView!
            try checkResult(
                vkCreateBufferView(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferView(handle: out)
        }
    }

    public func destroyBufferView(bufferView: BufferView? = nil) -> Void {
        let vkDestroyBufferView = self.table.pointee.vkDestroyBufferView!
        vkDestroyBufferView(self.handle, bufferView?.handle, nil)
    }

    public func createImage(_ createInfo: (some Chainable<ImageCreateInfo>)) throws(Result) -> Image {
        let vkCreateImage = self.table.pointee.vkCreateImage!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImage!
            try checkResult(
                vkCreateImage(self.handle, ptr_createInfo, nil, &out)
            )
            return Image(handle: out)
        }
    }

    public func createImage(_ createInfo: ImageCreateInfo) throws(Result) -> Image {
        let vkCreateImage = self.table.pointee.vkCreateImage!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImage!
            try checkResult(
                vkCreateImage(self.handle, ptr_createInfo, nil, &out)
            )
            return Image(handle: out)
        }
    }

    public func destroyImage(image: Image? = nil) -> Void {
        let vkDestroyImage = self.table.pointee.vkDestroyImage!
        vkDestroyImage(self.handle, image?.handle, nil)
    }

    public func getImageSubresourceLayout(image: Image, subresource: ImageSubresource) -> SubresourceLayout {
        let vkGetImageSubresourceLayout = self.table.pointee.vkGetImageSubresourceLayout!
        return subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout()
            vkGetImageSubresourceLayout(self.handle, image.handle, ptr_subresource, &out)
            return SubresourceLayout(cStruct: out)
        }
    }

    public func createImageView(_ createInfo: (some Chainable<ImageViewCreateInfo>)) throws(Result) -> ImageView {
        let vkCreateImageView = self.table.pointee.vkCreateImageView!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImageView!
            try checkResult(
                vkCreateImageView(self.handle, ptr_createInfo, nil, &out)
            )
            return ImageView(handle: out)
        }
    }

    public func createImageView(_ createInfo: ImageViewCreateInfo) throws(Result) -> ImageView {
        let vkCreateImageView = self.table.pointee.vkCreateImageView!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkImageView!
            try checkResult(
                vkCreateImageView(self.handle, ptr_createInfo, nil, &out)
            )
            return ImageView(handle: out)
        }
    }

    public func destroyImageView(imageView: ImageView? = nil) -> Void {
        let vkDestroyImageView = self.table.pointee.vkDestroyImageView!
        vkDestroyImageView(self.handle, imageView?.handle, nil)
    }

    public func createShaderModule(_ createInfo: (some Chainable<ShaderModuleCreateInfo>)) throws(Result) -> ShaderModule {
        let vkCreateShaderModule = self.table.pointee.vkCreateShaderModule!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderModule!
            try checkResult(
                vkCreateShaderModule(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderModule(handle: out)
        }
    }

    public func createShaderModule(_ createInfo: ShaderModuleCreateInfo) throws(Result) -> ShaderModule {
        let vkCreateShaderModule = self.table.pointee.vkCreateShaderModule!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderModule!
            try checkResult(
                vkCreateShaderModule(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderModule(handle: out)
        }
    }

    public func destroyShaderModule(shaderModule: ShaderModule? = nil) -> Void {
        let vkDestroyShaderModule = self.table.pointee.vkDestroyShaderModule!
        vkDestroyShaderModule(self.handle, shaderModule?.handle, nil)
    }

    public func createPipelineCache(_ createInfo: (some Chainable<PipelineCacheCreateInfo>)) throws(Result) -> PipelineCache {
        let vkCreatePipelineCache = self.table.pointee.vkCreatePipelineCache!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineCache!
            try checkResult(
                vkCreatePipelineCache(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineCache(handle: out)
        }
    }

    public func createPipelineCache(_ createInfo: PipelineCacheCreateInfo) throws(Result) -> PipelineCache {
        let vkCreatePipelineCache = self.table.pointee.vkCreatePipelineCache!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineCache!
            try checkResult(
                vkCreatePipelineCache(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineCache(handle: out)
        }
    }

    public func destroyPipelineCache(pipelineCache: PipelineCache? = nil) -> Void {
        let vkDestroyPipelineCache = self.table.pointee.vkDestroyPipelineCache!
        vkDestroyPipelineCache(self.handle, pipelineCache?.handle, nil)
    }

    public func getPipelineCacheData(pipelineCache: PipelineCache) throws(Result) -> Array<UInt8> {
        let vkGetPipelineCacheData = self.table.pointee.vkGetPipelineCacheData!
        return try enumerateBytes { pData, pDataSize in
            vkGetPipelineCacheData(self.handle, pipelineCache.handle, pDataSize, pData)
        }
    }

    public func mergePipelineCaches(dstCache: PipelineCache, srcCaches: Array<PipelineCache>) throws(Result) -> Void {
        let vkMergePipelineCaches = self.table.pointee.vkMergePipelineCaches!
        return try srcCaches.map{ $0.handle }.withUnsafeBufferPointer { ptr_srcCaches throws(Result) in
            try checkResult(
                vkMergePipelineCaches(self.handle, dstCache.handle, UInt32(ptr_srcCaches.count), ptr_srcCaches.baseAddress?.cast())
            )
        }
    }

    public func createPipelineBinariesKHR(_ createInfo: (some Chainable<PipelineBinaryCreateInfoKHR>)) throws(Result) -> PipelineBinaryHandlesInfoKHR {
        let vkCreatePipelineBinariesKHR = self.table.pointee.vkCreatePipelineBinariesKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out = VkPipelineBinaryHandlesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR
            try checkResult(
                vkCreatePipelineBinariesKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineBinaryHandlesInfoKHR(cStruct: out)
        }
    }

    public func createPipelineBinariesKHR(_ createInfo: PipelineBinaryCreateInfoKHR = PipelineBinaryCreateInfoKHR()) throws(Result) -> PipelineBinaryHandlesInfoKHR {
        let vkCreatePipelineBinariesKHR = self.table.pointee.vkCreatePipelineBinariesKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out = VkPipelineBinaryHandlesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR
            try checkResult(
                vkCreatePipelineBinariesKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineBinaryHandlesInfoKHR(cStruct: out)
        }
    }

    public func destroyPipelineBinaryKHR(pipelineBinary: PipelineBinaryKHR? = nil) -> Void {
        let vkDestroyPipelineBinaryKHR = self.table.pointee.vkDestroyPipelineBinaryKHR!
        vkDestroyPipelineBinaryKHR(self.handle, pipelineBinary?.handle, nil)
    }

    public func getPipelineKeyKHR(_ pipelineCreateInfo: (some Chainable<PipelineCreateInfoKHR>)) throws(Result) -> PipelineBinaryKeyKHR {
        let vkGetPipelineKeyKHR = self.table.pointee.vkGetPipelineKeyKHR!
        return try pipelineCreateInfo.withCStruct { ptr_pipelineCreateInfo throws(Result) in
            var out = VkPipelineBinaryKeyKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR
            try checkResult(
                vkGetPipelineKeyKHR(self.handle, ptr_pipelineCreateInfo, &out)
            )
            return PipelineBinaryKeyKHR(cStruct: out)
        }
    }

    public func getPipelineKeyKHR(_ pipelineCreateInfo: PipelineCreateInfoKHR? = nil) throws(Result) -> PipelineBinaryKeyKHR {
        let vkGetPipelineKeyKHR = self.table.pointee.vkGetPipelineKeyKHR!
        return try pipelineCreateInfo.withOptionalCStruct { ptr_pipelineCreateInfo throws(Result) in
            var out = VkPipelineBinaryKeyKHR()
            out.sType = VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR
            try checkResult(
                vkGetPipelineKeyKHR(self.handle, ptr_pipelineCreateInfo, &out)
            )
            return PipelineBinaryKeyKHR(cStruct: out)
        }
    }

    public func getPipelineBinaryDataKHR(_ info: (some Chainable<PipelineBinaryDataInfoKHR>), pipelineBinaryKey: UnsafeMutablePointer<VkPipelineBinaryKeyKHR>, pipelineBinaryDataSize: UnsafeMutablePointer<Int>, pipelineBinaryData: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        let vkGetPipelineBinaryDataKHR = self.table.pointee.vkGetPipelineBinaryDataKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetPipelineBinaryDataKHR(self.handle, ptr_info, pipelineBinaryKey, pipelineBinaryDataSize, pipelineBinaryData)
            )
        }
    }

    public func getPipelineBinaryDataKHR(_ info: PipelineBinaryDataInfoKHR, pipelineBinaryKey: UnsafeMutablePointer<VkPipelineBinaryKeyKHR>, pipelineBinaryDataSize: UnsafeMutablePointer<Int>, pipelineBinaryData: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        let vkGetPipelineBinaryDataKHR = self.table.pointee.vkGetPipelineBinaryDataKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetPipelineBinaryDataKHR(self.handle, ptr_info, pipelineBinaryKey, pipelineBinaryDataSize, pipelineBinaryData)
            )
        }
    }

    public func releaseCapturedPipelineDataKHR(_ info: (some Chainable<ReleaseCapturedPipelineDataInfoKHR>)) throws(Result) -> Void {
        let vkReleaseCapturedPipelineDataKHR = self.table.pointee.vkReleaseCapturedPipelineDataKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkReleaseCapturedPipelineDataKHR(self.handle, ptr_info, nil)
            )
        }
    }

    public func releaseCapturedPipelineDataKHR(_ info: ReleaseCapturedPipelineDataInfoKHR) throws(Result) -> Void {
        let vkReleaseCapturedPipelineDataKHR = self.table.pointee.vkReleaseCapturedPipelineDataKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkReleaseCapturedPipelineDataKHR(self.handle, ptr_info, nil)
            )
        }
    }

    public func createGraphicsPipelines(_ createInfos: (AnyChainableArray<GraphicsPipelineCreateInfo>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateGraphicsPipelines = self.table.pointee.vkCreateGraphicsPipelines!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateGraphicsPipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createGraphicsPipelines(_ createInfos: Array<GraphicsPipelineCreateInfo>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateGraphicsPipelines = self.table.pointee.vkCreateGraphicsPipelines!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateGraphicsPipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createComputePipelines(_ createInfos: (AnyChainableArray<ComputePipelineCreateInfo>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateComputePipelines = self.table.pointee.vkCreateComputePipelines!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateComputePipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createComputePipelines(_ createInfos: Array<ComputePipelineCreateInfo>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateComputePipelines = self.table.pointee.vkCreateComputePipelines!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateComputePipelines(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func getSubpassShadingMaxWorkgroupSizeHUAWEI(renderpass: RenderPass) throws(Result) -> Extent2D {
        let vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI = self.table.pointee.vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI!
        var out = VkExtent2D()
        try checkResult(
            vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI(self.handle, renderpass.handle, &out)
        )
        return Extent2D(cStruct: out)
    }

    public func destroyPipeline(pipeline: Pipeline? = nil) -> Void {
        let vkDestroyPipeline = self.table.pointee.vkDestroyPipeline!
        vkDestroyPipeline(self.handle, pipeline?.handle, nil)
    }

    public func createPipelineLayout(_ createInfo: (some Chainable<PipelineLayoutCreateInfo>)) throws(Result) -> PipelineLayout {
        let vkCreatePipelineLayout = self.table.pointee.vkCreatePipelineLayout!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineLayout!
            try checkResult(
                vkCreatePipelineLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineLayout(handle: out)
        }
    }

    public func createPipelineLayout(_ createInfo: PipelineLayoutCreateInfo = PipelineLayoutCreateInfo()) throws(Result) -> PipelineLayout {
        let vkCreatePipelineLayout = self.table.pointee.vkCreatePipelineLayout!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPipelineLayout!
            try checkResult(
                vkCreatePipelineLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return PipelineLayout(handle: out)
        }
    }

    public func destroyPipelineLayout(pipelineLayout: PipelineLayout? = nil) -> Void {
        let vkDestroyPipelineLayout = self.table.pointee.vkDestroyPipelineLayout!
        vkDestroyPipelineLayout(self.handle, pipelineLayout?.handle, nil)
    }

    public func createSampler(_ createInfo: (some Chainable<SamplerCreateInfo>)) throws(Result) -> Sampler {
        let vkCreateSampler = self.table.pointee.vkCreateSampler!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSampler!
            try checkResult(
                vkCreateSampler(self.handle, ptr_createInfo, nil, &out)
            )
            return Sampler(handle: out)
        }
    }

    public func createSampler(_ createInfo: SamplerCreateInfo) throws(Result) -> Sampler {
        let vkCreateSampler = self.table.pointee.vkCreateSampler!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSampler!
            try checkResult(
                vkCreateSampler(self.handle, ptr_createInfo, nil, &out)
            )
            return Sampler(handle: out)
        }
    }

    public func destroySampler(sampler: Sampler? = nil) -> Void {
        let vkDestroySampler = self.table.pointee.vkDestroySampler!
        vkDestroySampler(self.handle, sampler?.handle, nil)
    }

    public func createDescriptorSetLayout(_ createInfo: (some Chainable<DescriptorSetLayoutCreateInfo>)) throws(Result) -> DescriptorSetLayout {
        let vkCreateDescriptorSetLayout = self.table.pointee.vkCreateDescriptorSetLayout!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorSetLayout!
            try checkResult(
                vkCreateDescriptorSetLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorSetLayout(handle: out)
        }
    }

    public func createDescriptorSetLayout(_ createInfo: DescriptorSetLayoutCreateInfo = DescriptorSetLayoutCreateInfo()) throws(Result) -> DescriptorSetLayout {
        let vkCreateDescriptorSetLayout = self.table.pointee.vkCreateDescriptorSetLayout!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorSetLayout!
            try checkResult(
                vkCreateDescriptorSetLayout(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorSetLayout(handle: out)
        }
    }

    public func destroyDescriptorSetLayout(descriptorSetLayout: DescriptorSetLayout? = nil) -> Void {
        let vkDestroyDescriptorSetLayout = self.table.pointee.vkDestroyDescriptorSetLayout!
        vkDestroyDescriptorSetLayout(self.handle, descriptorSetLayout?.handle, nil)
    }

    public func createDescriptorPool(_ createInfo: (some Chainable<DescriptorPoolCreateInfo>)) throws(Result) -> DescriptorPool {
        let vkCreateDescriptorPool = self.table.pointee.vkCreateDescriptorPool!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorPool!
            try checkResult(
                vkCreateDescriptorPool(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorPool(handle: out)
        }
    }

    public func createDescriptorPool(_ createInfo: DescriptorPoolCreateInfo) throws(Result) -> DescriptorPool {
        let vkCreateDescriptorPool = self.table.pointee.vkCreateDescriptorPool!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorPool!
            try checkResult(
                vkCreateDescriptorPool(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorPool(handle: out)
        }
    }

    public func destroyDescriptorPool(descriptorPool: DescriptorPool? = nil) -> Void {
        let vkDestroyDescriptorPool = self.table.pointee.vkDestroyDescriptorPool!
        vkDestroyDescriptorPool(self.handle, descriptorPool?.handle, nil)
    }

    public func resetDescriptorPool(descriptorPool: DescriptorPool, flags: DescriptorPoolResetFlags = []) throws(Result) -> Void {
        let vkResetDescriptorPool = self.table.pointee.vkResetDescriptorPool!
        try checkResult(
            vkResetDescriptorPool(self.handle, descriptorPool.handle, flags.rawValue)
        )
    }

    public func allocateDescriptorSets(_ allocateInfo: (some Chainable<DescriptorSetAllocateInfo>)) throws(Result) -> Array<DescriptorSet> {
        let vkAllocateDescriptorSets = self.table.pointee.vkAllocateDescriptorSets!
        return try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkDescriptorSet?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.descriptorSetCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    vkAllocateDescriptorSets(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DescriptorSet(handle: $0) }
        }
    }

    public func allocateDescriptorSets(_ allocateInfo: DescriptorSetAllocateInfo) throws(Result) -> Array<DescriptorSet> {
        let vkAllocateDescriptorSets = self.table.pointee.vkAllocateDescriptorSets!
        return try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkDescriptorSet?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.descriptorSetCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    vkAllocateDescriptorSets(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DescriptorSet(handle: $0) }
        }
    }

    public func freeDescriptorSets(descriptorPool: DescriptorPool, descriptorSets: Array<DescriptorSet>) throws(Result) -> Void {
        let vkFreeDescriptorSets = self.table.pointee.vkFreeDescriptorSets!
        return try descriptorSets.map{ $0.handle }.withUnsafeBufferPointer { ptr_descriptorSets throws(Result) in
            try checkResult(
                vkFreeDescriptorSets(self.handle, descriptorPool.handle, UInt32(ptr_descriptorSets.count), ptr_descriptorSets.baseAddress?.cast())
            )
        }
    }

    public func updateDescriptorSets(descriptorWrites: (AnyChainableArray<WriteDescriptorSet>), descriptorCopies: (AnyChainableArray<CopyDescriptorSet>)) -> Void {
        let vkUpdateDescriptorSets = self.table.pointee.vkUpdateDescriptorSets!
        return descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            descriptorCopies.withCStructBufferPointer { ptr_descriptorCopies in
                vkUpdateDescriptorSets(self.handle, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress, UInt32(ptr_descriptorCopies.count), ptr_descriptorCopies.baseAddress)
            }
        }
    }

    public func updateDescriptorSets(descriptorWrites: Array<WriteDescriptorSet> = [], descriptorCopies: Array<CopyDescriptorSet> = []) -> Void {
        let vkUpdateDescriptorSets = self.table.pointee.vkUpdateDescriptorSets!
        return descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            descriptorCopies.withCStructBufferPointer { ptr_descriptorCopies in
                vkUpdateDescriptorSets(self.handle, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress, UInt32(ptr_descriptorCopies.count), ptr_descriptorCopies.baseAddress)
            }
        }
    }

    public func createFramebuffer(_ createInfo: (some Chainable<FramebufferCreateInfo>)) throws(Result) -> Framebuffer {
        let vkCreateFramebuffer = self.table.pointee.vkCreateFramebuffer!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFramebuffer!
            try checkResult(
                vkCreateFramebuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Framebuffer(handle: out)
        }
    }

    public func createFramebuffer(_ createInfo: FramebufferCreateInfo) throws(Result) -> Framebuffer {
        let vkCreateFramebuffer = self.table.pointee.vkCreateFramebuffer!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkFramebuffer!
            try checkResult(
                vkCreateFramebuffer(self.handle, ptr_createInfo, nil, &out)
            )
            return Framebuffer(handle: out)
        }
    }

    public func destroyFramebuffer(framebuffer: Framebuffer? = nil) -> Void {
        let vkDestroyFramebuffer = self.table.pointee.vkDestroyFramebuffer!
        vkDestroyFramebuffer(self.handle, framebuffer?.handle, nil)
    }

    public func createRenderPass(_ createInfo: (some Chainable<RenderPassCreateInfo>)) throws(Result) -> RenderPass {
        let vkCreateRenderPass = self.table.pointee.vkCreateRenderPass!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                vkCreateRenderPass(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out)
        }
    }

    public func createRenderPass(_ createInfo: RenderPassCreateInfo) throws(Result) -> RenderPass {
        let vkCreateRenderPass = self.table.pointee.vkCreateRenderPass!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                vkCreateRenderPass(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out)
        }
    }

    public func destroyRenderPass(renderPass: RenderPass? = nil) -> Void {
        let vkDestroyRenderPass = self.table.pointee.vkDestroyRenderPass!
        vkDestroyRenderPass(self.handle, renderPass?.handle, nil)
    }

    public func getRenderAreaGranularity(renderPass: RenderPass) -> Extent2D {
        let vkGetRenderAreaGranularity = self.table.pointee.vkGetRenderAreaGranularity!
        var out = VkExtent2D()
        vkGetRenderAreaGranularity(self.handle, renderPass.handle, &out)
        return Extent2D(cStruct: out)
    }

    public func getRenderingAreaGranularity(_ renderingAreaInfo: (some Chainable<RenderingAreaInfo>)) -> Extent2D {
        let vkGetRenderingAreaGranularity = self.table.pointee.vkGetRenderingAreaGranularity!
        return renderingAreaInfo.withCStruct { ptr_renderingAreaInfo in
            var out = VkExtent2D()
            vkGetRenderingAreaGranularity(self.handle, ptr_renderingAreaInfo, &out)
            return Extent2D(cStruct: out)
        }
    }

    public func getRenderingAreaGranularity(_ renderingAreaInfo: RenderingAreaInfo) -> Extent2D {
        let vkGetRenderingAreaGranularity = self.table.pointee.vkGetRenderingAreaGranularity!
        return renderingAreaInfo.withCStruct { ptr_renderingAreaInfo in
            var out = VkExtent2D()
            vkGetRenderingAreaGranularity(self.handle, ptr_renderingAreaInfo, &out)
            return Extent2D(cStruct: out)
        }
    }

    public func createCommandPool(_ createInfo: (some Chainable<CommandPoolCreateInfo>)) throws(Result) -> CommandPool {
        let vkCreateCommandPool = self.table.pointee.vkCreateCommandPool!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCommandPool!
            try checkResult(
                vkCreateCommandPool(self.handle, ptr_createInfo, nil, &out)
            )
            return CommandPool(handle: out)
        }
    }

    public func createCommandPool(_ createInfo: CommandPoolCreateInfo) throws(Result) -> CommandPool {
        let vkCreateCommandPool = self.table.pointee.vkCreateCommandPool!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCommandPool!
            try checkResult(
                vkCreateCommandPool(self.handle, ptr_createInfo, nil, &out)
            )
            return CommandPool(handle: out)
        }
    }

    public func destroyCommandPool(commandPool: CommandPool? = nil) -> Void {
        let vkDestroyCommandPool = self.table.pointee.vkDestroyCommandPool!
        vkDestroyCommandPool(self.handle, commandPool?.handle, nil)
    }

    public func resetCommandPool(commandPool: CommandPool, flags: CommandPoolResetFlags = []) throws(Result) -> Void {
        let vkResetCommandPool = self.table.pointee.vkResetCommandPool!
        try checkResult(
            vkResetCommandPool(self.handle, commandPool.handle, flags.rawValue)
        )
    }

    public func allocateCommandBuffers(_ allocateInfo: (some Chainable<CommandBufferAllocateInfo>)) throws(Result) -> Array<CommandBuffer> {
        let vkAllocateCommandBuffers = self.table.pointee.vkAllocateCommandBuffers!
        return try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkCommandBuffer?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.commandBufferCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    vkAllocateCommandBuffers(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { CommandBuffer(handle: $0, table: self.table) }
        }
    }

    public func allocateCommandBuffers(_ allocateInfo: CommandBufferAllocateInfo) throws(Result) -> Array<CommandBuffer> {
        let vkAllocateCommandBuffers = self.table.pointee.vkAllocateCommandBuffers!
        return try allocateInfo.withCStruct { ptr_allocateInfo throws(Result) in
            try Array<VkCommandBuffer?>(unsafeUninitializedCapacity: Int(ptr_allocateInfo.pointee.commandBufferCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    vkAllocateCommandBuffers(self.handle, ptr_allocateInfo, out.baseAddress)
                )
                initializedCount = out.count
            }.map { CommandBuffer(handle: $0, table: self.table) }
        }
    }

    public func freeCommandBuffers(commandPool: CommandPool, commandBuffers: Array<CommandBuffer>) -> Void {
        let vkFreeCommandBuffers = self.table.pointee.vkFreeCommandBuffers!
        return commandBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_commandBuffers in
            vkFreeCommandBuffers(self.handle, commandPool.handle, UInt32(ptr_commandBuffers.count), ptr_commandBuffers.baseAddress?.cast())
        }
    }

    public func createSharedSwapchainsKHR(_ createInfos: (AnyChainableArray<SwapchainCreateInfoKHR>)) throws(Result) -> Array<SwapchainKHR> {
        let vkCreateSharedSwapchainsKHR = self.table.pointee.vkCreateSharedSwapchainsKHR!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkSwapchainKHR?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateSharedSwapchainsKHR(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { SwapchainKHR(handle: $0) }
        }
    }

    public func createSharedSwapchainsKHR(_ createInfos: Array<SwapchainCreateInfoKHR>) throws(Result) -> Array<SwapchainKHR> {
        let vkCreateSharedSwapchainsKHR = self.table.pointee.vkCreateSharedSwapchainsKHR!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkSwapchainKHR?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateSharedSwapchainsKHR(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { SwapchainKHR(handle: $0) }
        }
    }

    public func createSwapchainKHR(_ createInfo: (some Chainable<SwapchainCreateInfoKHR>)) throws(Result) -> SwapchainKHR {
        let vkCreateSwapchainKHR = self.table.pointee.vkCreateSwapchainKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSwapchainKHR!
            try checkResult(
                vkCreateSwapchainKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SwapchainKHR(handle: out)
        }
    }

    public func createSwapchainKHR(_ createInfo: SwapchainCreateInfoKHR) throws(Result) -> SwapchainKHR {
        let vkCreateSwapchainKHR = self.table.pointee.vkCreateSwapchainKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSwapchainKHR!
            try checkResult(
                vkCreateSwapchainKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return SwapchainKHR(handle: out)
        }
    }

    public func destroySwapchainKHR(swapchain: SwapchainKHR? = nil) -> Void {
        let vkDestroySwapchainKHR = self.table.pointee.vkDestroySwapchainKHR!
        vkDestroySwapchainKHR(self.handle, swapchain?.handle, nil)
    }

    public func getSwapchainImagesKHR(swapchain: SwapchainKHR) throws(Result) -> Array<Image> {
        let vkGetSwapchainImagesKHR = self.table.pointee.vkGetSwapchainImagesKHR!
        return try enumerate { pSwapchainImages, pSwapchainImageCount in
            vkGetSwapchainImagesKHR(self.handle, swapchain.handle, pSwapchainImageCount, pSwapchainImages)
        }.map { Image(handle: $0) }
    }

    public func acquireNextImageKHR(swapchain: SwapchainKHR, timeout: UInt64, semaphore: Semaphore? = nil, fence: Fence? = nil) throws(Result) -> UInt32 {
        let vkAcquireNextImageKHR = self.table.pointee.vkAcquireNextImageKHR!
        var out = UInt32()
        try checkResult(
            vkAcquireNextImageKHR(self.handle, swapchain.handle, timeout, semaphore?.handle, fence?.handle, &out)
        )
        return out
    }

    public func debugMarkerSetObjectNameEXT(_ nameInfo: (some Chainable<DebugMarkerObjectNameInfoEXT>)) throws(Result) -> Void {
        let vkDebugMarkerSetObjectNameEXT = self.table.pointee.vkDebugMarkerSetObjectNameEXT!
        return try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                vkDebugMarkerSetObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func debugMarkerSetObjectNameEXT(_ nameInfo: DebugMarkerObjectNameInfoEXT) throws(Result) -> Void {
        let vkDebugMarkerSetObjectNameEXT = self.table.pointee.vkDebugMarkerSetObjectNameEXT!
        return try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                vkDebugMarkerSetObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func debugMarkerSetObjectTagEXT(_ tagInfo: (some Chainable<DebugMarkerObjectTagInfoEXT>)) throws(Result) -> Void {
        let vkDebugMarkerSetObjectTagEXT = self.table.pointee.vkDebugMarkerSetObjectTagEXT!
        return try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                vkDebugMarkerSetObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func debugMarkerSetObjectTagEXT(_ tagInfo: DebugMarkerObjectTagInfoEXT) throws(Result) -> Void {
        let vkDebugMarkerSetObjectTagEXT = self.table.pointee.vkDebugMarkerSetObjectTagEXT!
        return try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                vkDebugMarkerSetObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleNV(memory: DeviceMemory, handleType: ExternalMemoryHandleTypeFlagsNV) throws(Result) -> HANDLE {
        let vkGetMemoryWin32HandleNV = self.table.pointee.vkGetMemoryWin32HandleNV!
        var out: HANDLE!
        try checkResult(
            vkGetMemoryWin32HandleNV(self.handle, memory.handle, handleType.rawValue, &out)
        )
        return out
    }
    #endif

    public func getGeneratedCommandsMemoryRequirementsNV(_ info: (some Chainable<GeneratedCommandsMemoryRequirementsInfoNV>)) -> MemoryRequirements2 {
        let vkGetGeneratedCommandsMemoryRequirementsNV = self.table.pointee.vkGetGeneratedCommandsMemoryRequirementsNV!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetGeneratedCommandsMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsNV(_ info: GeneratedCommandsMemoryRequirementsInfoNV) -> MemoryRequirements2 {
        let vkGetGeneratedCommandsMemoryRequirementsNV = self.table.pointee.vkGetGeneratedCommandsMemoryRequirementsNV!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetGeneratedCommandsMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func createIndirectCommandsLayoutNV(_ createInfo: (some Chainable<IndirectCommandsLayoutCreateInfoNV>)) throws(Result) -> IndirectCommandsLayoutNV {
        let vkCreateIndirectCommandsLayoutNV = self.table.pointee.vkCreateIndirectCommandsLayoutNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutNV!
            try checkResult(
                vkCreateIndirectCommandsLayoutNV(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutNV(handle: out)
        }
    }

    public func createIndirectCommandsLayoutNV(_ createInfo: IndirectCommandsLayoutCreateInfoNV) throws(Result) -> IndirectCommandsLayoutNV {
        let vkCreateIndirectCommandsLayoutNV = self.table.pointee.vkCreateIndirectCommandsLayoutNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutNV!
            try checkResult(
                vkCreateIndirectCommandsLayoutNV(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutNV(handle: out)
        }
    }

    public func destroyIndirectCommandsLayoutNV(indirectCommandsLayout: IndirectCommandsLayoutNV? = nil) -> Void {
        let vkDestroyIndirectCommandsLayoutNV = self.table.pointee.vkDestroyIndirectCommandsLayoutNV!
        vkDestroyIndirectCommandsLayoutNV(self.handle, indirectCommandsLayout?.handle, nil)
    }

    public func getGeneratedCommandsMemoryRequirementsEXT(_ info: (some Chainable<GeneratedCommandsMemoryRequirementsInfoEXT>)) -> MemoryRequirements2 {
        let vkGetGeneratedCommandsMemoryRequirementsEXT = self.table.pointee.vkGetGeneratedCommandsMemoryRequirementsEXT!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetGeneratedCommandsMemoryRequirementsEXT(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getGeneratedCommandsMemoryRequirementsEXT(_ info: GeneratedCommandsMemoryRequirementsInfoEXT) -> MemoryRequirements2 {
        let vkGetGeneratedCommandsMemoryRequirementsEXT = self.table.pointee.vkGetGeneratedCommandsMemoryRequirementsEXT!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetGeneratedCommandsMemoryRequirementsEXT(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func createIndirectCommandsLayoutEXT(_ createInfo: (some Chainable<IndirectCommandsLayoutCreateInfoEXT>)) throws(Result) -> IndirectCommandsLayoutEXT {
        let vkCreateIndirectCommandsLayoutEXT = self.table.pointee.vkCreateIndirectCommandsLayoutEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutEXT!
            try checkResult(
                vkCreateIndirectCommandsLayoutEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutEXT(handle: out)
        }
    }

    public func createIndirectCommandsLayoutEXT(_ createInfo: IndirectCommandsLayoutCreateInfoEXT) throws(Result) -> IndirectCommandsLayoutEXT {
        let vkCreateIndirectCommandsLayoutEXT = self.table.pointee.vkCreateIndirectCommandsLayoutEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectCommandsLayoutEXT!
            try checkResult(
                vkCreateIndirectCommandsLayoutEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectCommandsLayoutEXT(handle: out)
        }
    }

    public func destroyIndirectCommandsLayoutEXT(indirectCommandsLayout: IndirectCommandsLayoutEXT? = nil) -> Void {
        let vkDestroyIndirectCommandsLayoutEXT = self.table.pointee.vkDestroyIndirectCommandsLayoutEXT!
        vkDestroyIndirectCommandsLayoutEXT(self.handle, indirectCommandsLayout?.handle, nil)
    }

    public func createIndirectExecutionSetEXT(_ createInfo: (some Chainable<IndirectExecutionSetCreateInfoEXT>)) throws(Result) -> IndirectExecutionSetEXT {
        let vkCreateIndirectExecutionSetEXT = self.table.pointee.vkCreateIndirectExecutionSetEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectExecutionSetEXT!
            try checkResult(
                vkCreateIndirectExecutionSetEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectExecutionSetEXT(handle: out)
        }
    }

    public func createIndirectExecutionSetEXT(_ createInfo: IndirectExecutionSetCreateInfoEXT) throws(Result) -> IndirectExecutionSetEXT {
        let vkCreateIndirectExecutionSetEXT = self.table.pointee.vkCreateIndirectExecutionSetEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkIndirectExecutionSetEXT!
            try checkResult(
                vkCreateIndirectExecutionSetEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return IndirectExecutionSetEXT(handle: out)
        }
    }

    public func destroyIndirectExecutionSetEXT(indirectExecutionSet: IndirectExecutionSetEXT? = nil) -> Void {
        let vkDestroyIndirectExecutionSetEXT = self.table.pointee.vkDestroyIndirectExecutionSetEXT!
        vkDestroyIndirectExecutionSetEXT(self.handle, indirectExecutionSet?.handle, nil)
    }

    public func updateIndirectExecutionSetPipelineEXT(indirectExecutionSet: IndirectExecutionSetEXT, executionSetWrites: (AnyChainableArray<WriteIndirectExecutionSetPipelineEXT>)) -> Void {
        let vkUpdateIndirectExecutionSetPipelineEXT = self.table.pointee.vkUpdateIndirectExecutionSetPipelineEXT!
        return executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            vkUpdateIndirectExecutionSetPipelineEXT(self.handle, indirectExecutionSet.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updateIndirectExecutionSetPipelineEXT(indirectExecutionSet: IndirectExecutionSetEXT, executionSetWrites: Array<WriteIndirectExecutionSetPipelineEXT>) -> Void {
        let vkUpdateIndirectExecutionSetPipelineEXT = self.table.pointee.vkUpdateIndirectExecutionSetPipelineEXT!
        return executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            vkUpdateIndirectExecutionSetPipelineEXT(self.handle, indirectExecutionSet.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updateIndirectExecutionSetShaderEXT(indirectExecutionSet: IndirectExecutionSetEXT, executionSetWrites: (AnyChainableArray<WriteIndirectExecutionSetShaderEXT>)) -> Void {
        let vkUpdateIndirectExecutionSetShaderEXT = self.table.pointee.vkUpdateIndirectExecutionSetShaderEXT!
        return executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            vkUpdateIndirectExecutionSetShaderEXT(self.handle, indirectExecutionSet.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func updateIndirectExecutionSetShaderEXT(indirectExecutionSet: IndirectExecutionSetEXT, executionSetWrites: Array<WriteIndirectExecutionSetShaderEXT>) -> Void {
        let vkUpdateIndirectExecutionSetShaderEXT = self.table.pointee.vkUpdateIndirectExecutionSetShaderEXT!
        return executionSetWrites.withCStructBufferPointer { ptr_executionSetWrites in
            vkUpdateIndirectExecutionSetShaderEXT(self.handle, indirectExecutionSet.handle, UInt32(ptr_executionSetWrites.count), ptr_executionSetWrites.baseAddress)
        }
    }

    public func trimCommandPool(commandPool: CommandPool, flags: CommandPoolTrimFlags = []) -> Void {
        let vkTrimCommandPool = self.table.pointee.vkTrimCommandPool!
        vkTrimCommandPool(self.handle, commandPool.handle, flags.rawValue)
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<MemoryGetWin32HandleInfoKHR>)) throws(Result) -> HANDLE {
        let vkGetMemoryWin32HandleKHR = self.table.pointee.vkGetMemoryWin32HandleKHR!
        return try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                vkGetMemoryWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandleKHR(_ getWin32HandleInfo: MemoryGetWin32HandleInfoKHR) throws(Result) -> HANDLE {
        let vkGetMemoryWin32HandleKHR = self.table.pointee.vkGetMemoryWin32HandleKHR!
        return try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                vkGetMemoryWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getMemoryWin32HandlePropertiesKHR(handleType: ExternalMemoryHandleTypeFlags, handle: HANDLE) throws(Result) -> MemoryWin32HandlePropertiesKHR {
        let vkGetMemoryWin32HandlePropertiesKHR = self.table.pointee.vkGetMemoryWin32HandlePropertiesKHR!
        var out = VkMemoryWin32HandlePropertiesKHR()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR
        try checkResult(
            vkGetMemoryWin32HandlePropertiesKHR(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), handle, &out)
        )
        return MemoryWin32HandlePropertiesKHR(cStruct: out)
    }
    #endif

    public func getMemoryFdKHR(_ getFdInfo: (some Chainable<MemoryGetFdInfoKHR>)) throws(Result) -> Int32 {
        let vkGetMemoryFdKHR = self.table.pointee.vkGetMemoryFdKHR!
        return try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                vkGetMemoryFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getMemoryFdKHR(_ getFdInfo: MemoryGetFdInfoKHR) throws(Result) -> Int32 {
        let vkGetMemoryFdKHR = self.table.pointee.vkGetMemoryFdKHR!
        return try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                vkGetMemoryFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getMemoryFdPropertiesKHR(handleType: ExternalMemoryHandleTypeFlags, fd: Int32) throws(Result) -> MemoryFdPropertiesKHR {
        let vkGetMemoryFdPropertiesKHR = self.table.pointee.vkGetMemoryFdPropertiesKHR!
        var out = VkMemoryFdPropertiesKHR()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR
        try checkResult(
            vkGetMemoryFdPropertiesKHR(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), fd, &out)
        )
        return MemoryFdPropertiesKHR(cStruct: out)
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandleFUCHSIA(_ getZirconHandleInfo: (some Chainable<MemoryGetZirconHandleInfoFUCHSIA>)) throws(Result) -> zx_handle_t {
        let vkGetMemoryZirconHandleFUCHSIA = self.table.pointee.vkGetMemoryZirconHandleFUCHSIA!
        return try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                vkGetMemoryZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandleFUCHSIA(_ getZirconHandleInfo: MemoryGetZirconHandleInfoFUCHSIA) throws(Result) -> zx_handle_t {
        let vkGetMemoryZirconHandleFUCHSIA = self.table.pointee.vkGetMemoryZirconHandleFUCHSIA!
        return try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                vkGetMemoryZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getMemoryZirconHandlePropertiesFUCHSIA(handleType: ExternalMemoryHandleTypeFlags, zirconHandle: zx_handle_t) throws(Result) -> MemoryZirconHandlePropertiesFUCHSIA {
        let vkGetMemoryZirconHandlePropertiesFUCHSIA = self.table.pointee.vkGetMemoryZirconHandlePropertiesFUCHSIA!
        var out = VkMemoryZirconHandlePropertiesFUCHSIA()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA
        try checkResult(
            vkGetMemoryZirconHandlePropertiesFUCHSIA(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), zirconHandle, &out)
        )
        return MemoryZirconHandlePropertiesFUCHSIA(cStruct: out)
    }
    #endif

    public func getMemoryRemoteAddressNV(_ memoryGetRemoteAddressInfo: (some Chainable<MemoryGetRemoteAddressInfoNV>)) throws(Result) -> VkRemoteAddressNV {
        let vkGetMemoryRemoteAddressNV = self.table.pointee.vkGetMemoryRemoteAddressNV!
        return try memoryGetRemoteAddressInfo.withCStruct { ptr_memoryGetRemoteAddressInfo throws(Result) in
            var out: VkRemoteAddressNV!
            try checkResult(
                vkGetMemoryRemoteAddressNV(self.handle, ptr_memoryGetRemoteAddressInfo, &out)
            )
            return out
        }
    }

    public func getMemoryRemoteAddressNV(_ memoryGetRemoteAddressInfo: MemoryGetRemoteAddressInfoNV) throws(Result) -> VkRemoteAddressNV {
        let vkGetMemoryRemoteAddressNV = self.table.pointee.vkGetMemoryRemoteAddressNV!
        return try memoryGetRemoteAddressInfo.withCStruct { ptr_memoryGetRemoteAddressInfo throws(Result) in
            var out: VkRemoteAddressNV!
            try checkResult(
                vkGetMemoryRemoteAddressNV(self.handle, ptr_memoryGetRemoteAddressInfo, &out)
            )
            return out
        }
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSemaphoreWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<SemaphoreGetWin32HandleInfoKHR>)) throws(Result) -> HANDLE {
        let vkGetSemaphoreWin32HandleKHR = self.table.pointee.vkGetSemaphoreWin32HandleKHR!
        return try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                vkGetSemaphoreWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getSemaphoreWin32HandleKHR(_ getWin32HandleInfo: SemaphoreGetWin32HandleInfoKHR) throws(Result) -> HANDLE {
        let vkGetSemaphoreWin32HandleKHR = self.table.pointee.vkGetSemaphoreWin32HandleKHR!
        return try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                vkGetSemaphoreWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importSemaphoreWin32HandleKHR(_ importSemaphoreWin32HandleInfo: (some Chainable<ImportSemaphoreWin32HandleInfoKHR>)) throws(Result) -> Void {
        let vkImportSemaphoreWin32HandleKHR = self.table.pointee.vkImportSemaphoreWin32HandleKHR!
        return try importSemaphoreWin32HandleInfo.withCStruct { ptr_importSemaphoreWin32HandleInfo throws(Result) in
            try checkResult(
                vkImportSemaphoreWin32HandleKHR(self.handle, ptr_importSemaphoreWin32HandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importSemaphoreWin32HandleKHR(_ importSemaphoreWin32HandleInfo: ImportSemaphoreWin32HandleInfoKHR) throws(Result) -> Void {
        let vkImportSemaphoreWin32HandleKHR = self.table.pointee.vkImportSemaphoreWin32HandleKHR!
        return try importSemaphoreWin32HandleInfo.withCStruct { ptr_importSemaphoreWin32HandleInfo throws(Result) in
            try checkResult(
                vkImportSemaphoreWin32HandleKHR(self.handle, ptr_importSemaphoreWin32HandleInfo)
            )
        }
    }
    #endif

    public func getSemaphoreFdKHR(_ getFdInfo: (some Chainable<SemaphoreGetFdInfoKHR>)) throws(Result) -> Int32 {
        let vkGetSemaphoreFdKHR = self.table.pointee.vkGetSemaphoreFdKHR!
        return try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                vkGetSemaphoreFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getSemaphoreFdKHR(_ getFdInfo: SemaphoreGetFdInfoKHR) throws(Result) -> Int32 {
        let vkGetSemaphoreFdKHR = self.table.pointee.vkGetSemaphoreFdKHR!
        return try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                vkGetSemaphoreFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func importSemaphoreFdKHR(_ importSemaphoreFdInfo: (some Chainable<ImportSemaphoreFdInfoKHR>)) throws(Result) -> Void {
        let vkImportSemaphoreFdKHR = self.table.pointee.vkImportSemaphoreFdKHR!
        return try importSemaphoreFdInfo.withCStruct { ptr_importSemaphoreFdInfo throws(Result) in
            try checkResult(
                vkImportSemaphoreFdKHR(self.handle, ptr_importSemaphoreFdInfo)
            )
        }
    }

    public func importSemaphoreFdKHR(_ importSemaphoreFdInfo: ImportSemaphoreFdInfoKHR) throws(Result) -> Void {
        let vkImportSemaphoreFdKHR = self.table.pointee.vkImportSemaphoreFdKHR!
        return try importSemaphoreFdInfo.withCStruct { ptr_importSemaphoreFdInfo throws(Result) in
            try checkResult(
                vkImportSemaphoreFdKHR(self.handle, ptr_importSemaphoreFdInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func getSemaphoreZirconHandleFUCHSIA(_ getZirconHandleInfo: (some Chainable<SemaphoreGetZirconHandleInfoFUCHSIA>)) throws(Result) -> zx_handle_t {
        let vkGetSemaphoreZirconHandleFUCHSIA = self.table.pointee.vkGetSemaphoreZirconHandleFUCHSIA!
        return try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                vkGetSemaphoreZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getSemaphoreZirconHandleFUCHSIA(_ getZirconHandleInfo: SemaphoreGetZirconHandleInfoFUCHSIA) throws(Result) -> zx_handle_t {
        let vkGetSemaphoreZirconHandleFUCHSIA = self.table.pointee.vkGetSemaphoreZirconHandleFUCHSIA!
        return try getZirconHandleInfo.withCStruct { ptr_getZirconHandleInfo throws(Result) in
            var out = zx_handle_t()
            try checkResult(
                vkGetSemaphoreZirconHandleFUCHSIA(self.handle, ptr_getZirconHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func importSemaphoreZirconHandleFUCHSIA(_ importSemaphoreZirconHandleInfo: (some Chainable<ImportSemaphoreZirconHandleInfoFUCHSIA>)) throws(Result) -> Void {
        let vkImportSemaphoreZirconHandleFUCHSIA = self.table.pointee.vkImportSemaphoreZirconHandleFUCHSIA!
        return try importSemaphoreZirconHandleInfo.withCStruct { ptr_importSemaphoreZirconHandleInfo throws(Result) in
            try checkResult(
                vkImportSemaphoreZirconHandleFUCHSIA(self.handle, ptr_importSemaphoreZirconHandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func importSemaphoreZirconHandleFUCHSIA(_ importSemaphoreZirconHandleInfo: ImportSemaphoreZirconHandleInfoFUCHSIA) throws(Result) -> Void {
        let vkImportSemaphoreZirconHandleFUCHSIA = self.table.pointee.vkImportSemaphoreZirconHandleFUCHSIA!
        return try importSemaphoreZirconHandleInfo.withCStruct { ptr_importSemaphoreZirconHandleInfo throws(Result) in
            try checkResult(
                vkImportSemaphoreZirconHandleFUCHSIA(self.handle, ptr_importSemaphoreZirconHandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getFenceWin32HandleKHR(_ getWin32HandleInfo: (some Chainable<FenceGetWin32HandleInfoKHR>)) throws(Result) -> HANDLE {
        let vkGetFenceWin32HandleKHR = self.table.pointee.vkGetFenceWin32HandleKHR!
        return try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                vkGetFenceWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getFenceWin32HandleKHR(_ getWin32HandleInfo: FenceGetWin32HandleInfoKHR) throws(Result) -> HANDLE {
        let vkGetFenceWin32HandleKHR = self.table.pointee.vkGetFenceWin32HandleKHR!
        return try getWin32HandleInfo.withCStruct { ptr_getWin32HandleInfo throws(Result) in
            var out: HANDLE!
            try checkResult(
                vkGetFenceWin32HandleKHR(self.handle, ptr_getWin32HandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importFenceWin32HandleKHR(_ importFenceWin32HandleInfo: (some Chainable<ImportFenceWin32HandleInfoKHR>)) throws(Result) -> Void {
        let vkImportFenceWin32HandleKHR = self.table.pointee.vkImportFenceWin32HandleKHR!
        return try importFenceWin32HandleInfo.withCStruct { ptr_importFenceWin32HandleInfo throws(Result) in
            try checkResult(
                vkImportFenceWin32HandleKHR(self.handle, ptr_importFenceWin32HandleInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func importFenceWin32HandleKHR(_ importFenceWin32HandleInfo: ImportFenceWin32HandleInfoKHR) throws(Result) -> Void {
        let vkImportFenceWin32HandleKHR = self.table.pointee.vkImportFenceWin32HandleKHR!
        return try importFenceWin32HandleInfo.withCStruct { ptr_importFenceWin32HandleInfo throws(Result) in
            try checkResult(
                vkImportFenceWin32HandleKHR(self.handle, ptr_importFenceWin32HandleInfo)
            )
        }
    }
    #endif

    public func getFenceFdKHR(_ getFdInfo: (some Chainable<FenceGetFdInfoKHR>)) throws(Result) -> Int32 {
        let vkGetFenceFdKHR = self.table.pointee.vkGetFenceFdKHR!
        return try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                vkGetFenceFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func getFenceFdKHR(_ getFdInfo: FenceGetFdInfoKHR) throws(Result) -> Int32 {
        let vkGetFenceFdKHR = self.table.pointee.vkGetFenceFdKHR!
        return try getFdInfo.withCStruct { ptr_getFdInfo throws(Result) in
            var out = Int32()
            try checkResult(
                vkGetFenceFdKHR(self.handle, ptr_getFdInfo, &out)
            )
            return out
        }
    }

    public func importFenceFdKHR(_ importFenceFdInfo: (some Chainable<ImportFenceFdInfoKHR>)) throws(Result) -> Void {
        let vkImportFenceFdKHR = self.table.pointee.vkImportFenceFdKHR!
        return try importFenceFdInfo.withCStruct { ptr_importFenceFdInfo throws(Result) in
            try checkResult(
                vkImportFenceFdKHR(self.handle, ptr_importFenceFdInfo)
            )
        }
    }

    public func importFenceFdKHR(_ importFenceFdInfo: ImportFenceFdInfoKHR) throws(Result) -> Void {
        let vkImportFenceFdKHR = self.table.pointee.vkImportFenceFdKHR!
        return try importFenceFdInfo.withCStruct { ptr_importFenceFdInfo throws(Result) in
            try checkResult(
                vkImportFenceFdKHR(self.handle, ptr_importFenceFdInfo)
            )
        }
    }

    public func displayPowerControlEXT(_ displayPowerInfo: (some Chainable<DisplayPowerInfoEXT>), display: DisplayKHR) throws(Result) -> Void {
        let vkDisplayPowerControlEXT = self.table.pointee.vkDisplayPowerControlEXT!
        return try displayPowerInfo.withCStruct { ptr_displayPowerInfo throws(Result) in
            try checkResult(
                vkDisplayPowerControlEXT(self.handle, display.handle, ptr_displayPowerInfo)
            )
        }
    }

    public func displayPowerControlEXT(_ displayPowerInfo: DisplayPowerInfoEXT, display: DisplayKHR) throws(Result) -> Void {
        let vkDisplayPowerControlEXT = self.table.pointee.vkDisplayPowerControlEXT!
        return try displayPowerInfo.withCStruct { ptr_displayPowerInfo throws(Result) in
            try checkResult(
                vkDisplayPowerControlEXT(self.handle, display.handle, ptr_displayPowerInfo)
            )
        }
    }

    public func registerEventEXT(_ deviceEventInfo: (some Chainable<DeviceEventInfoEXT>)) throws(Result) -> Fence {
        let vkRegisterDeviceEventEXT = self.table.pointee.vkRegisterDeviceEventEXT!
        return try deviceEventInfo.withCStruct { ptr_deviceEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                vkRegisterDeviceEventEXT(self.handle, ptr_deviceEventInfo, nil, &out)
            )
            return Fence(handle: out)
        }
    }

    public func registerEventEXT(_ deviceEventInfo: DeviceEventInfoEXT) throws(Result) -> Fence {
        let vkRegisterDeviceEventEXT = self.table.pointee.vkRegisterDeviceEventEXT!
        return try deviceEventInfo.withCStruct { ptr_deviceEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                vkRegisterDeviceEventEXT(self.handle, ptr_deviceEventInfo, nil, &out)
            )
            return Fence(handle: out)
        }
    }

    public func registerDisplayEventEXT(_ displayEventInfo: (some Chainable<DisplayEventInfoEXT>), display: DisplayKHR) throws(Result) -> Fence {
        let vkRegisterDisplayEventEXT = self.table.pointee.vkRegisterDisplayEventEXT!
        return try displayEventInfo.withCStruct { ptr_displayEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                vkRegisterDisplayEventEXT(self.handle, display.handle, ptr_displayEventInfo, nil, &out)
            )
            return Fence(handle: out)
        }
    }

    public func registerDisplayEventEXT(_ displayEventInfo: DisplayEventInfoEXT, display: DisplayKHR) throws(Result) -> Fence {
        let vkRegisterDisplayEventEXT = self.table.pointee.vkRegisterDisplayEventEXT!
        return try displayEventInfo.withCStruct { ptr_displayEventInfo throws(Result) in
            var out: VkFence!
            try checkResult(
                vkRegisterDisplayEventEXT(self.handle, display.handle, ptr_displayEventInfo, nil, &out)
            )
            return Fence(handle: out)
        }
    }

    public func getSwapchainCounterEXT(swapchain: SwapchainKHR, counter: SurfaceCounterFlagsEXT) throws(Result) -> UInt64 {
        let vkGetSwapchainCounterEXT = self.table.pointee.vkGetSwapchainCounterEXT!
        var out = UInt64()
        try checkResult(
            vkGetSwapchainCounterEXT(self.handle, swapchain.handle, VkSurfaceCounterFlagBitsEXT(rawValue: VkSurfaceCounterFlagBitsEXT.RawValue(counter.rawValue)), &out)
        )
        return out
    }

    public func getGroupPeerMemoryFeatures(heapIndex: UInt32, localDeviceIndex: UInt32, remoteDeviceIndex: UInt32) -> PeerMemoryFeatureFlags {
        let vkGetDeviceGroupPeerMemoryFeatures = self.table.pointee.vkGetDeviceGroupPeerMemoryFeatures!
        var out = VkPeerMemoryFeatureFlags()
        vkGetDeviceGroupPeerMemoryFeatures(self.handle, heapIndex, localDeviceIndex, remoteDeviceIndex, &out)
        return PeerMemoryFeatureFlags(rawValue: out)
    }

    public func bindBufferMemory2(_ bindInfos: (AnyChainableArray<BindBufferMemoryInfo>)) throws(Result) -> Void {
        let vkBindBufferMemory2 = self.table.pointee.vkBindBufferMemory2!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindBufferMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindBufferMemory2(_ bindInfos: Array<BindBufferMemoryInfo>) throws(Result) -> Void {
        let vkBindBufferMemory2 = self.table.pointee.vkBindBufferMemory2!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindBufferMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindImageMemory2(_ bindInfos: (AnyChainableArray<BindImageMemoryInfo>)) throws(Result) -> Void {
        let vkBindImageMemory2 = self.table.pointee.vkBindImageMemory2!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindImageMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindImageMemory2(_ bindInfos: Array<BindImageMemoryInfo>) throws(Result) -> Void {
        let vkBindImageMemory2 = self.table.pointee.vkBindImageMemory2!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindImageMemory2(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getGroupPresentCapabilitiesKHR() throws(Result) -> DeviceGroupPresentCapabilitiesKHR {
        let vkGetDeviceGroupPresentCapabilitiesKHR = self.table.pointee.vkGetDeviceGroupPresentCapabilitiesKHR!
        var out = VkDeviceGroupPresentCapabilitiesKHR()
        out.sType = VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHR
        try checkResult(
            vkGetDeviceGroupPresentCapabilitiesKHR(self.handle, &out)
        )
        return DeviceGroupPresentCapabilitiesKHR(cStruct: out)
    }

    public func getGroupSurfacePresentModesKHR(surface: SurfaceKHR) throws(Result) -> DeviceGroupPresentModeFlagsKHR {
        let vkGetDeviceGroupSurfacePresentModesKHR = self.table.pointee.vkGetDeviceGroupSurfacePresentModesKHR!
        var out = VkDeviceGroupPresentModeFlagsKHR()
        try checkResult(
            vkGetDeviceGroupSurfacePresentModesKHR(self.handle, surface.handle, &out)
        )
        return DeviceGroupPresentModeFlagsKHR(rawValue: out)
    }

    public func acquireNextImage2KHR(_ acquireInfo: (some Chainable<AcquireNextImageInfoKHR>)) throws(Result) -> UInt32 {
        let vkAcquireNextImage2KHR = self.table.pointee.vkAcquireNextImage2KHR!
        return try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                vkAcquireNextImage2KHR(self.handle, ptr_acquireInfo, &out)
            )
            return out
        }
    }

    public func acquireNextImage2KHR(_ acquireInfo: AcquireNextImageInfoKHR) throws(Result) -> UInt32 {
        let vkAcquireNextImage2KHR = self.table.pointee.vkAcquireNextImage2KHR!
        return try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                vkAcquireNextImage2KHR(self.handle, ptr_acquireInfo, &out)
            )
            return out
        }
    }

    public func createDescriptorUpdateTemplate(_ createInfo: (some Chainable<DescriptorUpdateTemplateCreateInfo>)) throws(Result) -> DescriptorUpdateTemplate {
        let vkCreateDescriptorUpdateTemplate = self.table.pointee.vkCreateDescriptorUpdateTemplate!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorUpdateTemplate!
            try checkResult(
                vkCreateDescriptorUpdateTemplate(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorUpdateTemplate(handle: out)
        }
    }

    public func createDescriptorUpdateTemplate(_ createInfo: DescriptorUpdateTemplateCreateInfo) throws(Result) -> DescriptorUpdateTemplate {
        let vkCreateDescriptorUpdateTemplate = self.table.pointee.vkCreateDescriptorUpdateTemplate!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDescriptorUpdateTemplate!
            try checkResult(
                vkCreateDescriptorUpdateTemplate(self.handle, ptr_createInfo, nil, &out)
            )
            return DescriptorUpdateTemplate(handle: out)
        }
    }

    public func destroyDescriptorUpdateTemplate(descriptorUpdateTemplate: DescriptorUpdateTemplate? = nil) -> Void {
        let vkDestroyDescriptorUpdateTemplate = self.table.pointee.vkDestroyDescriptorUpdateTemplate!
        vkDestroyDescriptorUpdateTemplate(self.handle, descriptorUpdateTemplate?.handle, nil)
    }

    public func updateDescriptorSetWithTemplate(descriptorSet: DescriptorSet, descriptorUpdateTemplate: DescriptorUpdateTemplate, data: UnsafeRawPointer) -> Void {
        let vkUpdateDescriptorSetWithTemplate = self.table.pointee.vkUpdateDescriptorSetWithTemplate!
        vkUpdateDescriptorSetWithTemplate(self.handle, descriptorSet.handle, descriptorUpdateTemplate.handle, data)
    }

    public func setHdrMetadataEXT(swapchains: Array<SwapchainKHR>, metadata: (AnyChainableArray<HdrMetadataEXT>)) -> Void {
        let vkSetHdrMetadataEXT = self.table.pointee.vkSetHdrMetadataEXT!
        return swapchains.map{ $0.handle }.withUnsafeBufferPointer { ptr_swapchains in
            metadata.withCStructBufferPointer { ptr_metadata in
                vkSetHdrMetadataEXT(self.handle, UInt32(ptr_swapchains.count), ptr_swapchains.baseAddress?.cast(), ptr_metadata.baseAddress)
            }
        }
    }

    public func setHdrMetadataEXT(swapchains: Array<SwapchainKHR>, metadata: Array<HdrMetadataEXT>) -> Void {
        let vkSetHdrMetadataEXT = self.table.pointee.vkSetHdrMetadataEXT!
        return swapchains.map{ $0.handle }.withUnsafeBufferPointer { ptr_swapchains in
            metadata.withCStructBufferPointer { ptr_metadata in
                vkSetHdrMetadataEXT(self.handle, UInt32(ptr_swapchains.count), ptr_swapchains.baseAddress?.cast(), ptr_metadata.baseAddress)
            }
        }
    }

    public func getSwapchainStatusKHR(swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkGetSwapchainStatusKHR = self.table.pointee.vkGetSwapchainStatusKHR!
        try checkResult(
            vkGetSwapchainStatusKHR(self.handle, swapchain.handle)
        )
    }

    public func getRefreshCycleDurationGOOGLE(swapchain: SwapchainKHR) throws(Result) -> RefreshCycleDurationGOOGLE {
        let vkGetRefreshCycleDurationGOOGLE = self.table.pointee.vkGetRefreshCycleDurationGOOGLE!
        var out = VkRefreshCycleDurationGOOGLE()
        try checkResult(
            vkGetRefreshCycleDurationGOOGLE(self.handle, swapchain.handle, &out)
        )
        return RefreshCycleDurationGOOGLE(cStruct: out)
    }

    public func getPastPresentationTimingGOOGLE(swapchain: SwapchainKHR) throws(Result) -> Array<PastPresentationTimingGOOGLE> {
        let vkGetPastPresentationTimingGOOGLE = self.table.pointee.vkGetPastPresentationTimingGOOGLE!
        return try enumerate { pPresentationTimings, pPresentationTimingCount in
            vkGetPastPresentationTimingGOOGLE(self.handle, swapchain.handle, pPresentationTimingCount, pPresentationTimings)
        }.map { PastPresentationTimingGOOGLE(cStruct: $0) }
    }

    public func getBufferMemoryRequirements2(_ info: (some Chainable<BufferMemoryRequirementsInfo2>)) -> MemoryRequirements2 {
        let vkGetBufferMemoryRequirements2 = self.table.pointee.vkGetBufferMemoryRequirements2!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetBufferMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getBufferMemoryRequirements2(_ info: BufferMemoryRequirementsInfo2) -> MemoryRequirements2 {
        let vkGetBufferMemoryRequirements2 = self.table.pointee.vkGetBufferMemoryRequirements2!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetBufferMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements2(_ info: (some Chainable<ImageMemoryRequirementsInfo2>)) -> MemoryRequirements2 {
        let vkGetImageMemoryRequirements2 = self.table.pointee.vkGetImageMemoryRequirements2!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetImageMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements2(_ info: ImageMemoryRequirementsInfo2) -> MemoryRequirements2 {
        let vkGetImageMemoryRequirements2 = self.table.pointee.vkGetImageMemoryRequirements2!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetImageMemoryRequirements2(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageSparseMemoryRequirements2(_ info: (some Chainable<ImageSparseMemoryRequirementsInfo2>)) -> Array<SparseImageMemoryRequirements2> {
        let vkGetImageSparseMemoryRequirements2 = self.table.pointee.vkGetImageSparseMemoryRequirements2!
        return info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                vkGetImageSparseMemoryRequirements2(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getImageSparseMemoryRequirements2(_ info: ImageSparseMemoryRequirementsInfo2) -> Array<SparseImageMemoryRequirements2> {
        let vkGetImageSparseMemoryRequirements2 = self.table.pointee.vkGetImageSparseMemoryRequirements2!
        return info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                vkGetImageSparseMemoryRequirements2(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getBufferMemoryRequirements(_ info: (some Chainable<DeviceBufferMemoryRequirements>)) -> MemoryRequirements2 {
        let vkGetDeviceBufferMemoryRequirements = self.table.pointee.vkGetDeviceBufferMemoryRequirements!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDeviceBufferMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getBufferMemoryRequirements(_ info: DeviceBufferMemoryRequirements) -> MemoryRequirements2 {
        let vkGetDeviceBufferMemoryRequirements = self.table.pointee.vkGetDeviceBufferMemoryRequirements!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDeviceBufferMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements(_ info: (some Chainable<DeviceImageMemoryRequirements>)) -> MemoryRequirements2 {
        let vkGetDeviceImageMemoryRequirements = self.table.pointee.vkGetDeviceImageMemoryRequirements!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDeviceImageMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageMemoryRequirements(_ info: DeviceImageMemoryRequirements) -> MemoryRequirements2 {
        let vkGetDeviceImageMemoryRequirements = self.table.pointee.vkGetDeviceImageMemoryRequirements!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDeviceImageMemoryRequirements(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getImageSparseMemoryRequirements(_ info: (some Chainable<DeviceImageMemoryRequirements>)) -> Array<SparseImageMemoryRequirements2> {
        let vkGetDeviceImageSparseMemoryRequirements = self.table.pointee.vkGetDeviceImageSparseMemoryRequirements!
        return info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                vkGetDeviceImageSparseMemoryRequirements(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func getImageSparseMemoryRequirements(_ info: DeviceImageMemoryRequirements) -> Array<SparseImageMemoryRequirements2> {
        let vkGetDeviceImageSparseMemoryRequirements = self.table.pointee.vkGetDeviceImageSparseMemoryRequirements!
        return info.withCStruct { ptr_info in
            enumerate { pSparseMemoryRequirements, pSparseMemoryRequirementCount in
                vkGetDeviceImageSparseMemoryRequirements(self.handle, ptr_info, pSparseMemoryRequirementCount, pSparseMemoryRequirements)
            }.map { SparseImageMemoryRequirements2(cStruct: $0) }
        }
    }

    public func createSamplerYcbcrConversion(_ createInfo: (some Chainable<SamplerYcbcrConversionCreateInfo>)) throws(Result) -> SamplerYcbcrConversion {
        let vkCreateSamplerYcbcrConversion = self.table.pointee.vkCreateSamplerYcbcrConversion!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSamplerYcbcrConversion!
            try checkResult(
                vkCreateSamplerYcbcrConversion(self.handle, ptr_createInfo, nil, &out)
            )
            return SamplerYcbcrConversion(handle: out)
        }
    }

    public func createSamplerYcbcrConversion(_ createInfo: SamplerYcbcrConversionCreateInfo) throws(Result) -> SamplerYcbcrConversion {
        let vkCreateSamplerYcbcrConversion = self.table.pointee.vkCreateSamplerYcbcrConversion!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkSamplerYcbcrConversion!
            try checkResult(
                vkCreateSamplerYcbcrConversion(self.handle, ptr_createInfo, nil, &out)
            )
            return SamplerYcbcrConversion(handle: out)
        }
    }

    public func destroySamplerYcbcrConversion(ycbcrConversion: SamplerYcbcrConversion? = nil) -> Void {
        let vkDestroySamplerYcbcrConversion = self.table.pointee.vkDestroySamplerYcbcrConversion!
        vkDestroySamplerYcbcrConversion(self.handle, ycbcrConversion?.handle, nil)
    }

    public func getQueue2(_ queueInfo: (some Chainable<DeviceQueueInfo2>)) -> Queue {
        let vkGetDeviceQueue2 = self.table.pointee.vkGetDeviceQueue2!
        return queueInfo.withCStruct { ptr_queueInfo in
            var out: VkQueue!
            vkGetDeviceQueue2(self.handle, ptr_queueInfo, &out)
            return Queue(handle: out, table: self.table)
        }
    }

    public func getQueue2(_ queueInfo: DeviceQueueInfo2) -> Queue {
        let vkGetDeviceQueue2 = self.table.pointee.vkGetDeviceQueue2!
        return queueInfo.withCStruct { ptr_queueInfo in
            var out: VkQueue!
            vkGetDeviceQueue2(self.handle, ptr_queueInfo, &out)
            return Queue(handle: out, table: self.table)
        }
    }

    public func createValidationCacheEXT(_ createInfo: (some Chainable<ValidationCacheCreateInfoEXT>)) throws(Result) -> ValidationCacheEXT {
        let vkCreateValidationCacheEXT = self.table.pointee.vkCreateValidationCacheEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkValidationCacheEXT!
            try checkResult(
                vkCreateValidationCacheEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return ValidationCacheEXT(handle: out)
        }
    }

    public func createValidationCacheEXT(_ createInfo: ValidationCacheCreateInfoEXT) throws(Result) -> ValidationCacheEXT {
        let vkCreateValidationCacheEXT = self.table.pointee.vkCreateValidationCacheEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkValidationCacheEXT!
            try checkResult(
                vkCreateValidationCacheEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return ValidationCacheEXT(handle: out)
        }
    }

    public func destroyValidationCacheEXT(validationCache: ValidationCacheEXT? = nil) -> Void {
        let vkDestroyValidationCacheEXT = self.table.pointee.vkDestroyValidationCacheEXT!
        vkDestroyValidationCacheEXT(self.handle, validationCache?.handle, nil)
    }

    public func getValidationCacheDataEXT(validationCache: ValidationCacheEXT) throws(Result) -> Array<UInt8> {
        let vkGetValidationCacheDataEXT = self.table.pointee.vkGetValidationCacheDataEXT!
        return try enumerateBytes { pData, pDataSize in
            vkGetValidationCacheDataEXT(self.handle, validationCache.handle, pDataSize, pData)
        }
    }

    public func mergeValidationCachesEXT(dstCache: ValidationCacheEXT, srcCaches: Array<ValidationCacheEXT>) throws(Result) -> Void {
        let vkMergeValidationCachesEXT = self.table.pointee.vkMergeValidationCachesEXT!
        return try srcCaches.map{ $0.handle }.withUnsafeBufferPointer { ptr_srcCaches throws(Result) in
            try checkResult(
                vkMergeValidationCachesEXT(self.handle, dstCache.handle, UInt32(ptr_srcCaches.count), ptr_srcCaches.baseAddress?.cast())
            )
        }
    }

    public func getDescriptorSetLayoutSupport(_ createInfo: (some Chainable<DescriptorSetLayoutCreateInfo>)) -> DescriptorSetLayoutSupport {
        let vkGetDescriptorSetLayoutSupport = self.table.pointee.vkGetDescriptorSetLayoutSupport!
        return createInfo.withCStruct { ptr_createInfo in
            var out = VkDescriptorSetLayoutSupport()
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT
            vkGetDescriptorSetLayoutSupport(self.handle, ptr_createInfo, &out)
            return DescriptorSetLayoutSupport(cStruct: out)
        }
    }

    public func getDescriptorSetLayoutSupport(_ createInfo: DescriptorSetLayoutCreateInfo = DescriptorSetLayoutCreateInfo()) -> DescriptorSetLayoutSupport {
        let vkGetDescriptorSetLayoutSupport = self.table.pointee.vkGetDescriptorSetLayoutSupport!
        return createInfo.withCStruct { ptr_createInfo in
            var out = VkDescriptorSetLayoutSupport()
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_SUPPORT
            vkGetDescriptorSetLayoutSupport(self.handle, ptr_createInfo, &out)
            return DescriptorSetLayoutSupport(cStruct: out)
        }
    }

    public func getShaderInfoAMD(infoType: ShaderInfoTypeAMD, pipeline: Pipeline, shaderStage: ShaderStageFlags) throws(Result) -> Array<UInt8> {
        let vkGetShaderInfoAMD = self.table.pointee.vkGetShaderInfoAMD!
        return try enumerateBytes { pInfo, pInfoSize in
            vkGetShaderInfoAMD(self.handle, pipeline.handle, VkShaderStageFlagBits(rawValue: VkShaderStageFlagBits.RawValue(shaderStage.rawValue)), VkShaderInfoTypeAMD(rawValue: VkShaderInfoTypeAMD.RawValue(infoType.rawValue)), pInfoSize, pInfo)
        }
    }

    public func setLocalDimmingAMD(swapChain: SwapchainKHR, localDimmingEnable: Bool) -> Void {
        let vkSetLocalDimmingAMD = self.table.pointee.vkSetLocalDimmingAMD!
        vkSetLocalDimmingAMD(self.handle, swapChain.handle, VkBool32(localDimmingEnable ? VK_TRUE : VK_FALSE))
    }

    public func getCalibratedTimestampsKHR(_ timestampInfos: (AnyChainableArray<CalibratedTimestampInfoKHR>), timestamps: UnsafeMutablePointer<UInt64>, maxDeviation: UnsafeMutablePointer<UInt64>) throws(Result) -> Void {
        let vkGetCalibratedTimestampsKHR = self.table.pointee.vkGetCalibratedTimestampsKHR!
        return try timestampInfos.withCStructBufferPointer { ptr_timestampInfos throws(Result) in
            try checkResult(
                vkGetCalibratedTimestampsKHR(self.handle, UInt32(ptr_timestampInfos.count), ptr_timestampInfos.baseAddress, timestamps, maxDeviation)
            )
        }
    }

    public func getCalibratedTimestampsKHR(_ timestampInfos: Array<CalibratedTimestampInfoKHR>, timestamps: UnsafeMutablePointer<UInt64>, maxDeviation: UnsafeMutablePointer<UInt64>) throws(Result) -> Void {
        let vkGetCalibratedTimestampsKHR = self.table.pointee.vkGetCalibratedTimestampsKHR!
        return try timestampInfos.withCStructBufferPointer { ptr_timestampInfos throws(Result) in
            try checkResult(
                vkGetCalibratedTimestampsKHR(self.handle, UInt32(ptr_timestampInfos.count), ptr_timestampInfos.baseAddress, timestamps, maxDeviation)
            )
        }
    }

    public func setDebugUtilsObjectNameEXT(_ nameInfo: (some Chainable<DebugUtilsObjectNameInfoEXT>)) throws(Result) -> Void {
        let vkSetDebugUtilsObjectNameEXT = self.table.pointee.vkSetDebugUtilsObjectNameEXT!
        return try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                vkSetDebugUtilsObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func setDebugUtilsObjectNameEXT(_ nameInfo: DebugUtilsObjectNameInfoEXT) throws(Result) -> Void {
        let vkSetDebugUtilsObjectNameEXT = self.table.pointee.vkSetDebugUtilsObjectNameEXT!
        return try nameInfo.withCStruct { ptr_nameInfo throws(Result) in
            try checkResult(
                vkSetDebugUtilsObjectNameEXT(self.handle, ptr_nameInfo)
            )
        }
    }

    public func setDebugUtilsObjectTagEXT(_ tagInfo: (some Chainable<DebugUtilsObjectTagInfoEXT>)) throws(Result) -> Void {
        let vkSetDebugUtilsObjectTagEXT = self.table.pointee.vkSetDebugUtilsObjectTagEXT!
        return try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                vkSetDebugUtilsObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func setDebugUtilsObjectTagEXT(_ tagInfo: DebugUtilsObjectTagInfoEXT) throws(Result) -> Void {
        let vkSetDebugUtilsObjectTagEXT = self.table.pointee.vkSetDebugUtilsObjectTagEXT!
        return try tagInfo.withCStruct { ptr_tagInfo throws(Result) in
            try checkResult(
                vkSetDebugUtilsObjectTagEXT(self.handle, ptr_tagInfo)
            )
        }
    }

    public func getMemoryHostPointerPropertiesEXT(handleType: ExternalMemoryHandleTypeFlags, hostPointer: UnsafeRawPointer) throws(Result) -> MemoryHostPointerPropertiesEXT {
        let vkGetMemoryHostPointerPropertiesEXT = self.table.pointee.vkGetMemoryHostPointerPropertiesEXT!
        var out = VkMemoryHostPointerPropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT
        try checkResult(
            vkGetMemoryHostPointerPropertiesEXT(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), hostPointer, &out)
        )
        return MemoryHostPointerPropertiesEXT(cStruct: out)
    }

    public func createRenderPass2(_ createInfo: (some Chainable<RenderPassCreateInfo2>)) throws(Result) -> RenderPass {
        let vkCreateRenderPass2 = self.table.pointee.vkCreateRenderPass2!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                vkCreateRenderPass2(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out)
        }
    }

    public func createRenderPass2(_ createInfo: RenderPassCreateInfo2) throws(Result) -> RenderPass {
        let vkCreateRenderPass2 = self.table.pointee.vkCreateRenderPass2!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkRenderPass!
            try checkResult(
                vkCreateRenderPass2(self.handle, ptr_createInfo, nil, &out)
            )
            return RenderPass(handle: out)
        }
    }

    public func getSemaphoreCounterValue(semaphore: Semaphore) throws(Result) -> UInt64 {
        let vkGetSemaphoreCounterValue = self.table.pointee.vkGetSemaphoreCounterValue!
        var out = UInt64()
        try checkResult(
            vkGetSemaphoreCounterValue(self.handle, semaphore.handle, &out)
        )
        return out
    }

    public func waitSemaphores(_ waitInfo: (some Chainable<SemaphoreWaitInfo>), timeout: UInt64) throws(Result) -> Void {
        let vkWaitSemaphores = self.table.pointee.vkWaitSemaphores!
        return try waitInfo.withCStruct { ptr_waitInfo throws(Result) in
            try checkResult(
                vkWaitSemaphores(self.handle, ptr_waitInfo, timeout)
            )
        }
    }

    public func waitSemaphores(_ waitInfo: SemaphoreWaitInfo, timeout: UInt64) throws(Result) -> Void {
        let vkWaitSemaphores = self.table.pointee.vkWaitSemaphores!
        return try waitInfo.withCStruct { ptr_waitInfo throws(Result) in
            try checkResult(
                vkWaitSemaphores(self.handle, ptr_waitInfo, timeout)
            )
        }
    }

    public func signalSemaphore(_ signalInfo: (some Chainable<SemaphoreSignalInfo>)) throws(Result) -> Void {
        let vkSignalSemaphore = self.table.pointee.vkSignalSemaphore!
        return try signalInfo.withCStruct { ptr_signalInfo throws(Result) in
            try checkResult(
                vkSignalSemaphore(self.handle, ptr_signalInfo)
            )
        }
    }

    public func signalSemaphore(_ signalInfo: SemaphoreSignalInfo) throws(Result) -> Void {
        let vkSignalSemaphore = self.table.pointee.vkSignalSemaphore!
        return try signalInfo.withCStruct { ptr_signalInfo throws(Result) in
            try checkResult(
                vkSignalSemaphore(self.handle, ptr_signalInfo)
            )
        }
    }

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getAndroidHardwareBufferPropertiesANDROID(buffer: UnsafePointer<AHardwareBuffer>) throws(Result) -> AndroidHardwareBufferPropertiesANDROID {
        let vkGetAndroidHardwareBufferPropertiesANDROID = self.table.pointee.vkGetAndroidHardwareBufferPropertiesANDROID!
        var out = VkAndroidHardwareBufferPropertiesANDROID()
        out.sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID
        try checkResult(
            vkGetAndroidHardwareBufferPropertiesANDROID(self.handle, buffer, &out)
        )
        return AndroidHardwareBufferPropertiesANDROID(cStruct: out)
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getMemoryAndroidHardwareBufferANDROID(_ info: (some Chainable<MemoryGetAndroidHardwareBufferInfoANDROID>)) throws(Result) -> UnsafeMutablePointer<AHardwareBuffer> {
        let vkGetMemoryAndroidHardwareBufferANDROID = self.table.pointee.vkGetMemoryAndroidHardwareBufferANDROID!
        return try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<AHardwareBuffer>!
            try checkResult(
                vkGetMemoryAndroidHardwareBufferANDROID(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_ANDROID_KHR
    public func getMemoryAndroidHardwareBufferANDROID(_ info: MemoryGetAndroidHardwareBufferInfoANDROID) throws(Result) -> UnsafeMutablePointer<AHardwareBuffer> {
        let vkGetMemoryAndroidHardwareBufferANDROID = self.table.pointee.vkGetMemoryAndroidHardwareBufferANDROID!
        return try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<AHardwareBuffer>!
            try checkResult(
                vkGetMemoryAndroidHardwareBufferANDROID(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    public func compileDeferredNV(pipeline: Pipeline, shader: UInt32) throws(Result) -> Void {
        let vkCompileDeferredNV = self.table.pointee.vkCompileDeferredNV!
        try checkResult(
            vkCompileDeferredNV(self.handle, pipeline.handle, shader)
        )
    }

    public func createAccelerationStructureNV(_ createInfo: (some Chainable<AccelerationStructureCreateInfoNV>)) throws(Result) -> AccelerationStructureNV {
        let vkCreateAccelerationStructureNV = self.table.pointee.vkCreateAccelerationStructureNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureNV!
            try checkResult(
                vkCreateAccelerationStructureNV(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureNV(handle: out)
        }
    }

    public func createAccelerationStructureNV(_ createInfo: AccelerationStructureCreateInfoNV) throws(Result) -> AccelerationStructureNV {
        let vkCreateAccelerationStructureNV = self.table.pointee.vkCreateAccelerationStructureNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureNV!
            try checkResult(
                vkCreateAccelerationStructureNV(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureNV(handle: out)
        }
    }

    public func destroyAccelerationStructureKHR(accelerationStructure: AccelerationStructureKHR? = nil) -> Void {
        let vkDestroyAccelerationStructureKHR = self.table.pointee.vkDestroyAccelerationStructureKHR!
        vkDestroyAccelerationStructureKHR(self.handle, accelerationStructure?.handle, nil)
    }

    public func destroyAccelerationStructureNV(accelerationStructure: AccelerationStructureNV? = nil) -> Void {
        let vkDestroyAccelerationStructureNV = self.table.pointee.vkDestroyAccelerationStructureNV!
        vkDestroyAccelerationStructureNV(self.handle, accelerationStructure?.handle, nil)
    }

    public func getAccelerationStructureMemoryRequirementsNV(_ info: (some Chainable<AccelerationStructureMemoryRequirementsInfoNV>)) -> MemoryRequirements2 {
        let vkGetAccelerationStructureMemoryRequirementsNV = self.table.pointee.vkGetAccelerationStructureMemoryRequirementsNV!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetAccelerationStructureMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getAccelerationStructureMemoryRequirementsNV(_ info: AccelerationStructureMemoryRequirementsInfoNV) -> MemoryRequirements2 {
        let vkGetAccelerationStructureMemoryRequirementsNV = self.table.pointee.vkGetAccelerationStructureMemoryRequirementsNV!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetAccelerationStructureMemoryRequirementsNV(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindAccelerationStructureMemoryNV(_ bindInfos: (AnyChainableArray<BindAccelerationStructureMemoryInfoNV>)) throws(Result) -> Void {
        let vkBindAccelerationStructureMemoryNV = self.table.pointee.vkBindAccelerationStructureMemoryNV!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindAccelerationStructureMemoryNV(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindAccelerationStructureMemoryNV(_ bindInfos: Array<BindAccelerationStructureMemoryInfoNV>) throws(Result) -> Void {
        let vkBindAccelerationStructureMemoryNV = self.table.pointee.vkBindAccelerationStructureMemoryNV!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindAccelerationStructureMemoryNV(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func copyAccelerationStructureKHR(_ info: (some Chainable<CopyAccelerationStructureInfoKHR>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyAccelerationStructureKHR = self.table.pointee.vkCopyAccelerationStructureKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureKHR(_ info: CopyAccelerationStructureInfoKHR, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyAccelerationStructureKHR = self.table.pointee.vkCopyAccelerationStructureKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: (some Chainable<CopyAccelerationStructureToMemoryInfoKHR>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyAccelerationStructureToMemoryKHR = self.table.pointee.vkCopyAccelerationStructureToMemoryKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyAccelerationStructureToMemoryKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: CopyAccelerationStructureToMemoryInfoKHR, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyAccelerationStructureToMemoryKHR = self.table.pointee.vkCopyAccelerationStructureToMemoryKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyAccelerationStructureToMemoryKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: (some Chainable<CopyMemoryToAccelerationStructureInfoKHR>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMemoryToAccelerationStructureKHR = self.table.pointee.vkCopyMemoryToAccelerationStructureKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMemoryToAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: CopyMemoryToAccelerationStructureInfoKHR, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMemoryToAccelerationStructureKHR = self.table.pointee.vkCopyMemoryToAccelerationStructureKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMemoryToAccelerationStructureKHR(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func writeAccelerationStructuresPropertiesKHR(accelerationStructures: Array<AccelerationStructureKHR>, queryType: QueryType, dataSize: Int, data: UnsafeMutableRawPointer, stride: Int) throws(Result) -> Void {
        let vkWriteAccelerationStructuresPropertiesKHR = self.table.pointee.vkWriteAccelerationStructuresPropertiesKHR!
        return try accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures throws(Result) in
            try checkResult(
                vkWriteAccelerationStructuresPropertiesKHR(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress?.cast(), VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), dataSize, data, stride)
            )
        }
    }

    public func getRayTracingShaderGroupHandlesKHR(pipeline: Pipeline, firstGroup: UInt32, groupCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetRayTracingShaderGroupHandlesKHR = self.table.pointee.vkGetRayTracingShaderGroupHandlesKHR!
        try checkResult(
            vkGetRayTracingShaderGroupHandlesKHR(self.handle, pipeline.handle, firstGroup, groupCount, dataSize, data)
        )
    }

    public func getRayTracingCaptureReplayShaderGroupHandlesKHR(pipeline: Pipeline, firstGroup: UInt32, groupCount: UInt32, dataSize: Int, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetRayTracingCaptureReplayShaderGroupHandlesKHR = self.table.pointee.vkGetRayTracingCaptureReplayShaderGroupHandlesKHR!
        try checkResult(
            vkGetRayTracingCaptureReplayShaderGroupHandlesKHR(self.handle, pipeline.handle, firstGroup, groupCount, dataSize, data)
        )
    }

    public func getAccelerationStructureHandleNV(accelerationStructure: AccelerationStructureNV, dataSize: Int, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetAccelerationStructureHandleNV = self.table.pointee.vkGetAccelerationStructureHandleNV!
        try checkResult(
            vkGetAccelerationStructureHandleNV(self.handle, accelerationStructure.handle, dataSize, data)
        )
    }

    public func createRayTracingPipelinesNV(_ createInfos: (AnyChainableArray<RayTracingPipelineCreateInfoNV>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateRayTracingPipelinesNV = self.table.pointee.vkCreateRayTracingPipelinesNV!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateRayTracingPipelinesNV(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createRayTracingPipelinesNV(_ createInfos: Array<RayTracingPipelineCreateInfoNV>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateRayTracingPipelinesNV = self.table.pointee.vkCreateRayTracingPipelinesNV!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateRayTracingPipelinesNV(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createRayTracingPipelinesKHR(_ createInfos: (AnyChainableArray<RayTracingPipelineCreateInfoKHR>), deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateRayTracingPipelinesKHR = self.table.pointee.vkCreateRayTracingPipelinesKHR!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateRayTracingPipelinesKHR(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createRayTracingPipelinesKHR(_ createInfos: Array<RayTracingPipelineCreateInfoKHR>, deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateRayTracingPipelinesKHR = self.table.pointee.vkCreateRayTracingPipelinesKHR!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateRayTracingPipelinesKHR(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func getClusterAccelerationStructureBuildSizesNV(_ info: (some Chainable<ClusterAccelerationStructureInputInfoNV>)) -> AccelerationStructureBuildSizesInfoKHR {
        let vkGetClusterAccelerationStructureBuildSizesNV = self.table.pointee.vkGetClusterAccelerationStructureBuildSizesNV!
        return info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            vkGetClusterAccelerationStructureBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getClusterAccelerationStructureBuildSizesNV(_ info: ClusterAccelerationStructureInputInfoNV) -> AccelerationStructureBuildSizesInfoKHR {
        let vkGetClusterAccelerationStructureBuildSizesNV = self.table.pointee.vkGetClusterAccelerationStructureBuildSizesNV!
        return info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            vkGetClusterAccelerationStructureBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getAccelerationStructureCompatibilityKHR(_ versionInfo: (some Chainable<AccelerationStructureVersionInfoKHR>)) -> AccelerationStructureCompatibilityKHR {
        let vkGetDeviceAccelerationStructureCompatibilityKHR = self.table.pointee.vkGetDeviceAccelerationStructureCompatibilityKHR!
        return versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            vkGetDeviceAccelerationStructureCompatibilityKHR(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out.rawValue))!
        }
    }

    public func getAccelerationStructureCompatibilityKHR(_ versionInfo: AccelerationStructureVersionInfoKHR) -> AccelerationStructureCompatibilityKHR {
        let vkGetDeviceAccelerationStructureCompatibilityKHR = self.table.pointee.vkGetDeviceAccelerationStructureCompatibilityKHR!
        return versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            vkGetDeviceAccelerationStructureCompatibilityKHR(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out.rawValue))!
        }
    }

    public func getRayTracingShaderGroupStackSizeKHR(pipeline: Pipeline, group: UInt32, groupShader: ShaderGroupShaderKHR) -> VkDeviceSize {
        let vkGetRayTracingShaderGroupStackSizeKHR = self.table.pointee.vkGetRayTracingShaderGroupStackSizeKHR!
        return vkGetRayTracingShaderGroupStackSizeKHR(self.handle, pipeline.handle, group, VkShaderGroupShaderKHR(rawValue: VkShaderGroupShaderKHR.RawValue(groupShader.rawValue)))
    }

    public func getImageViewHandleNVX(_ info: (some Chainable<ImageViewHandleInfoNVX>)) -> UInt32 {
        let vkGetImageViewHandleNVX = self.table.pointee.vkGetImageViewHandleNVX!
        return info.withCStruct { ptr_info in
            vkGetImageViewHandleNVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandleNVX(_ info: ImageViewHandleInfoNVX) -> UInt32 {
        let vkGetImageViewHandleNVX = self.table.pointee.vkGetImageViewHandleNVX!
        return info.withCStruct { ptr_info in
            vkGetImageViewHandleNVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandle64NVX(_ info: (some Chainable<ImageViewHandleInfoNVX>)) -> UInt64 {
        let vkGetImageViewHandle64NVX = self.table.pointee.vkGetImageViewHandle64NVX!
        return info.withCStruct { ptr_info in
            vkGetImageViewHandle64NVX(self.handle, ptr_info)
        }
    }

    public func getImageViewHandle64NVX(_ info: ImageViewHandleInfoNVX) -> UInt64 {
        let vkGetImageViewHandle64NVX = self.table.pointee.vkGetImageViewHandle64NVX!
        return info.withCStruct { ptr_info in
            vkGetImageViewHandle64NVX(self.handle, ptr_info)
        }
    }

    public func getImageViewAddressNVX(imageView: ImageView) throws(Result) -> ImageViewAddressPropertiesNVX {
        let vkGetImageViewAddressNVX = self.table.pointee.vkGetImageViewAddressNVX!
        var out = VkImageViewAddressPropertiesNVX()
        out.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_ADDRESS_PROPERTIES_NVX
        try checkResult(
            vkGetImageViewAddressNVX(self.handle, imageView.handle, &out)
        )
        return ImageViewAddressPropertiesNVX(cStruct: out)
    }

    public func getCombinedImageSamplerIndexNVX(imageViewIndex: UInt64, samplerIndex: UInt64) -> UInt64 {
        let vkGetDeviceCombinedImageSamplerIndexNVX = self.table.pointee.vkGetDeviceCombinedImageSamplerIndexNVX!
        return vkGetDeviceCombinedImageSamplerIndexNVX(self.handle, imageViewIndex, samplerIndex)
    }

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getGroupSurfacePresentModes2EXT(_ surfaceInfo: (some Chainable<PhysicalDeviceSurfaceInfo2KHR>)) throws(Result) -> DeviceGroupPresentModeFlagsKHR {
        let vkGetDeviceGroupSurfacePresentModes2EXT = self.table.pointee.vkGetDeviceGroupSurfacePresentModes2EXT!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkDeviceGroupPresentModeFlagsKHR()
            try checkResult(
                vkGetDeviceGroupSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, &out)
            )
            return DeviceGroupPresentModeFlagsKHR(rawValue: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func getGroupSurfacePresentModes2EXT(_ surfaceInfo: PhysicalDeviceSurfaceInfo2KHR = PhysicalDeviceSurfaceInfo2KHR()) throws(Result) -> DeviceGroupPresentModeFlagsKHR {
        let vkGetDeviceGroupSurfacePresentModes2EXT = self.table.pointee.vkGetDeviceGroupSurfacePresentModes2EXT!
        return try surfaceInfo.withCStruct { ptr_surfaceInfo throws(Result) in
            var out = VkDeviceGroupPresentModeFlagsKHR()
            try checkResult(
                vkGetDeviceGroupSurfacePresentModes2EXT(self.handle, ptr_surfaceInfo, &out)
            )
            return DeviceGroupPresentModeFlagsKHR(rawValue: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func acquireFullScreenExclusiveModeEXT(swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkAcquireFullScreenExclusiveModeEXT = self.table.pointee.vkAcquireFullScreenExclusiveModeEXT!
        try checkResult(
            vkAcquireFullScreenExclusiveModeEXT(self.handle, swapchain.handle)
        )
    }
    #endif

    #if VK_USE_PLATFORM_WIN32_KHR
    public func releaseFullScreenExclusiveModeEXT(swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkReleaseFullScreenExclusiveModeEXT = self.table.pointee.vkReleaseFullScreenExclusiveModeEXT!
        try checkResult(
            vkReleaseFullScreenExclusiveModeEXT(self.handle, swapchain.handle)
        )
    }
    #endif

    public func acquireProfilingLockKHR(_ info: (some Chainable<AcquireProfilingLockInfoKHR>)) throws(Result) -> Void {
        let vkAcquireProfilingLockKHR = self.table.pointee.vkAcquireProfilingLockKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkAcquireProfilingLockKHR(self.handle, ptr_info)
            )
        }
    }

    public func acquireProfilingLockKHR(_ info: AcquireProfilingLockInfoKHR) throws(Result) -> Void {
        let vkAcquireProfilingLockKHR = self.table.pointee.vkAcquireProfilingLockKHR!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkAcquireProfilingLockKHR(self.handle, ptr_info)
            )
        }
    }

    public func releaseProfilingLockKHR() -> Void {
        let vkReleaseProfilingLockKHR = self.table.pointee.vkReleaseProfilingLockKHR!
        vkReleaseProfilingLockKHR(self.handle)
    }

    public func getImageDrmFormatModifierPropertiesEXT(image: Image) throws(Result) -> ImageDrmFormatModifierPropertiesEXT {
        let vkGetImageDrmFormatModifierPropertiesEXT = self.table.pointee.vkGetImageDrmFormatModifierPropertiesEXT!
        var out = VkImageDrmFormatModifierPropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT
        try checkResult(
            vkGetImageDrmFormatModifierPropertiesEXT(self.handle, image.handle, &out)
        )
        return ImageDrmFormatModifierPropertiesEXT(cStruct: out)
    }

    public func getBufferOpaqueCaptureAddress(_ info: (some Chainable<BufferDeviceAddressInfo>)) -> UInt64 {
        let vkGetBufferOpaqueCaptureAddress = self.table.pointee.vkGetBufferOpaqueCaptureAddress!
        return info.withCStruct { ptr_info in
            vkGetBufferOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getBufferOpaqueCaptureAddress(_ info: BufferDeviceAddressInfo) -> UInt64 {
        let vkGetBufferOpaqueCaptureAddress = self.table.pointee.vkGetBufferOpaqueCaptureAddress!
        return info.withCStruct { ptr_info in
            vkGetBufferOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getBufferAddress(_ info: (some Chainable<BufferDeviceAddressInfo>)) -> VkDeviceAddress {
        let vkGetBufferDeviceAddress = self.table.pointee.vkGetBufferDeviceAddress!
        return info.withCStruct { ptr_info in
            vkGetBufferDeviceAddress(self.handle, ptr_info)
        }
    }

    public func getBufferAddress(_ info: BufferDeviceAddressInfo) -> VkDeviceAddress {
        let vkGetBufferDeviceAddress = self.table.pointee.vkGetBufferDeviceAddress!
        return info.withCStruct { ptr_info in
            vkGetBufferDeviceAddress(self.handle, ptr_info)
        }
    }

    public func initializePerformanceApiINTEL(_ initializeInfo: (some Chainable<InitializePerformanceApiInfoINTEL>)) throws(Result) -> Void {
        let vkInitializePerformanceApiINTEL = self.table.pointee.vkInitializePerformanceApiINTEL!
        return try initializeInfo.withCStruct { ptr_initializeInfo throws(Result) in
            try checkResult(
                vkInitializePerformanceApiINTEL(self.handle, ptr_initializeInfo)
            )
        }
    }

    public func initializePerformanceApiINTEL(_ initializeInfo: InitializePerformanceApiInfoINTEL = InitializePerformanceApiInfoINTEL()) throws(Result) -> Void {
        let vkInitializePerformanceApiINTEL = self.table.pointee.vkInitializePerformanceApiINTEL!
        return try initializeInfo.withCStruct { ptr_initializeInfo throws(Result) in
            try checkResult(
                vkInitializePerformanceApiINTEL(self.handle, ptr_initializeInfo)
            )
        }
    }

    public func uninitializePerformanceApiINTEL() -> Void {
        let vkUninitializePerformanceApiINTEL = self.table.pointee.vkUninitializePerformanceApiINTEL!
        vkUninitializePerformanceApiINTEL(self.handle)
    }

    public func acquirePerformanceConfigurationINTEL(_ acquireInfo: (some Chainable<PerformanceConfigurationAcquireInfoINTEL>)) throws(Result) -> PerformanceConfigurationINTEL {
        let vkAcquirePerformanceConfigurationINTEL = self.table.pointee.vkAcquirePerformanceConfigurationINTEL!
        return try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out: VkPerformanceConfigurationINTEL!
            try checkResult(
                vkAcquirePerformanceConfigurationINTEL(self.handle, ptr_acquireInfo, &out)
            )
            return PerformanceConfigurationINTEL(handle: out)
        }
    }

    public func acquirePerformanceConfigurationINTEL(_ acquireInfo: PerformanceConfigurationAcquireInfoINTEL) throws(Result) -> PerformanceConfigurationINTEL {
        let vkAcquirePerformanceConfigurationINTEL = self.table.pointee.vkAcquirePerformanceConfigurationINTEL!
        return try acquireInfo.withCStruct { ptr_acquireInfo throws(Result) in
            var out: VkPerformanceConfigurationINTEL!
            try checkResult(
                vkAcquirePerformanceConfigurationINTEL(self.handle, ptr_acquireInfo, &out)
            )
            return PerformanceConfigurationINTEL(handle: out)
        }
    }

    public func releasePerformanceConfigurationINTEL(configuration: PerformanceConfigurationINTEL? = nil) throws(Result) -> Void {
        let vkReleasePerformanceConfigurationINTEL = self.table.pointee.vkReleasePerformanceConfigurationINTEL!
        try checkResult(
            vkReleasePerformanceConfigurationINTEL(self.handle, configuration?.handle)
        )
    }

    public func getPerformanceParameterINTEL(parameter: PerformanceParameterTypeINTEL) throws(Result) -> PerformanceValueINTEL {
        let vkGetPerformanceParameterINTEL = self.table.pointee.vkGetPerformanceParameterINTEL!
        var out = VkPerformanceValueINTEL()
        try checkResult(
            vkGetPerformanceParameterINTEL(self.handle, VkPerformanceParameterTypeINTEL(rawValue: VkPerformanceParameterTypeINTEL.RawValue(parameter.rawValue)), &out)
        )
        return PerformanceValueINTEL(cStruct: out)
    }

    public func getMemoryOpaqueCaptureAddress(_ info: (some Chainable<DeviceMemoryOpaqueCaptureAddressInfo>)) -> UInt64 {
        let vkGetDeviceMemoryOpaqueCaptureAddress = self.table.pointee.vkGetDeviceMemoryOpaqueCaptureAddress!
        return info.withCStruct { ptr_info in
            vkGetDeviceMemoryOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getMemoryOpaqueCaptureAddress(_ info: DeviceMemoryOpaqueCaptureAddressInfo) -> UInt64 {
        let vkGetDeviceMemoryOpaqueCaptureAddress = self.table.pointee.vkGetDeviceMemoryOpaqueCaptureAddress!
        return info.withCStruct { ptr_info in
            vkGetDeviceMemoryOpaqueCaptureAddress(self.handle, ptr_info)
        }
    }

    public func getPipelineExecutablePropertiesKHR(_ pipelineInfo: (some Chainable<PipelineInfoKHR>)) throws(Result) -> Array<PipelineExecutablePropertiesKHR> {
        let vkGetPipelineExecutablePropertiesKHR = self.table.pointee.vkGetPipelineExecutablePropertiesKHR!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pExecutableCount in
                vkGetPipelineExecutablePropertiesKHR(self.handle, ptr_pipelineInfo, pExecutableCount, pProperties)
            }.map { PipelineExecutablePropertiesKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutablePropertiesKHR(_ pipelineInfo: PipelineInfoKHR) throws(Result) -> Array<PipelineExecutablePropertiesKHR> {
        let vkGetPipelineExecutablePropertiesKHR = self.table.pointee.vkGetPipelineExecutablePropertiesKHR!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pExecutableCount in
                vkGetPipelineExecutablePropertiesKHR(self.handle, ptr_pipelineInfo, pExecutableCount, pProperties)
            }.map { PipelineExecutablePropertiesKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableStatisticsKHR(_ executableInfo: (some Chainable<PipelineExecutableInfoKHR>)) throws(Result) -> Array<PipelineExecutableStatisticKHR> {
        let vkGetPipelineExecutableStatisticsKHR = self.table.pointee.vkGetPipelineExecutableStatisticsKHR!
        return try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pStatistics, pStatisticCount in
                vkGetPipelineExecutableStatisticsKHR(self.handle, ptr_executableInfo, pStatisticCount, pStatistics)
            }.map { PipelineExecutableStatisticKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableStatisticsKHR(_ executableInfo: PipelineExecutableInfoKHR) throws(Result) -> Array<PipelineExecutableStatisticKHR> {
        let vkGetPipelineExecutableStatisticsKHR = self.table.pointee.vkGetPipelineExecutableStatisticsKHR!
        return try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pStatistics, pStatisticCount in
                vkGetPipelineExecutableStatisticsKHR(self.handle, ptr_executableInfo, pStatisticCount, pStatistics)
            }.map { PipelineExecutableStatisticKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableInternalRepresentationsKHR(_ executableInfo: (some Chainable<PipelineExecutableInfoKHR>)) throws(Result) -> Array<PipelineExecutableInternalRepresentationKHR> {
        let vkGetPipelineExecutableInternalRepresentationsKHR = self.table.pointee.vkGetPipelineExecutableInternalRepresentationsKHR!
        return try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pInternalRepresentations, pInternalRepresentationCount in
                vkGetPipelineExecutableInternalRepresentationsKHR(self.handle, ptr_executableInfo, pInternalRepresentationCount, pInternalRepresentations)
            }.map { PipelineExecutableInternalRepresentationKHR(cStruct: $0) }
        }
    }

    public func getPipelineExecutableInternalRepresentationsKHR(_ executableInfo: PipelineExecutableInfoKHR) throws(Result) -> Array<PipelineExecutableInternalRepresentationKHR> {
        let vkGetPipelineExecutableInternalRepresentationsKHR = self.table.pointee.vkGetPipelineExecutableInternalRepresentationsKHR!
        return try executableInfo.withCStruct { ptr_executableInfo throws(Result) in
            try enumerate { pInternalRepresentations, pInternalRepresentationCount in
                vkGetPipelineExecutableInternalRepresentationsKHR(self.handle, ptr_executableInfo, pInternalRepresentationCount, pInternalRepresentations)
            }.map { PipelineExecutableInternalRepresentationKHR(cStruct: $0) }
        }
    }

    public func createAccelerationStructureKHR(_ createInfo: (some Chainable<AccelerationStructureCreateInfoKHR>)) throws(Result) -> AccelerationStructureKHR {
        let vkCreateAccelerationStructureKHR = self.table.pointee.vkCreateAccelerationStructureKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                vkCreateAccelerationStructureKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out)
        }
    }

    public func createAccelerationStructureKHR(_ createInfo: AccelerationStructureCreateInfoKHR) throws(Result) -> AccelerationStructureKHR {
        let vkCreateAccelerationStructureKHR = self.table.pointee.vkCreateAccelerationStructureKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                vkCreateAccelerationStructureKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out)
        }
    }

    public func buildAccelerationStructuresKHR(_ infos: (AnyChainableArray<AccelerationStructureBuildGeometryInfoKHR>), _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkBuildAccelerationStructuresKHR = self.table.pointee.vkBuildAccelerationStructuresKHR!
        return try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                vkBuildAccelerationStructuresKHR(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
            )
        }
    }

    public func buildAccelerationStructuresKHR(_ infos: Array<AccelerationStructureBuildGeometryInfoKHR>, _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkBuildAccelerationStructuresKHR = self.table.pointee.vkBuildAccelerationStructuresKHR!
        return try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                vkBuildAccelerationStructuresKHR(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
            )
        }
    }

    public func getAccelerationStructureAddressKHR(_ info: (some Chainable<AccelerationStructureDeviceAddressInfoKHR>)) -> VkDeviceAddress {
        let vkGetAccelerationStructureDeviceAddressKHR = self.table.pointee.vkGetAccelerationStructureDeviceAddressKHR!
        return info.withCStruct { ptr_info in
            vkGetAccelerationStructureDeviceAddressKHR(self.handle, ptr_info)
        }
    }

    public func getAccelerationStructureAddressKHR(_ info: AccelerationStructureDeviceAddressInfoKHR) -> VkDeviceAddress {
        let vkGetAccelerationStructureDeviceAddressKHR = self.table.pointee.vkGetAccelerationStructureDeviceAddressKHR!
        return info.withCStruct { ptr_info in
            vkGetAccelerationStructureDeviceAddressKHR(self.handle, ptr_info)
        }
    }

    public func createDeferredOperationKHR() throws(Result) -> DeferredOperationKHR {
        let vkCreateDeferredOperationKHR = self.table.pointee.vkCreateDeferredOperationKHR!
        var out: VkDeferredOperationKHR!
        try checkResult(
            vkCreateDeferredOperationKHR(self.handle, nil, &out)
        )
        return DeferredOperationKHR(handle: out)
    }

    public func destroyDeferredOperationKHR(operation: DeferredOperationKHR? = nil) -> Void {
        let vkDestroyDeferredOperationKHR = self.table.pointee.vkDestroyDeferredOperationKHR!
        vkDestroyDeferredOperationKHR(self.handle, operation?.handle, nil)
    }

    public func getDeferredOperationMaxConcurrencyKHR(operation: DeferredOperationKHR) -> UInt32 {
        let vkGetDeferredOperationMaxConcurrencyKHR = self.table.pointee.vkGetDeferredOperationMaxConcurrencyKHR!
        return vkGetDeferredOperationMaxConcurrencyKHR(self.handle, operation.handle)
    }

    public func getDeferredOperationResultKHR(operation: DeferredOperationKHR) throws(Result) -> Void {
        let vkGetDeferredOperationResultKHR = self.table.pointee.vkGetDeferredOperationResultKHR!
        try checkResult(
            vkGetDeferredOperationResultKHR(self.handle, operation.handle)
        )
    }

    public func deferredOperationJoinKHR(operation: DeferredOperationKHR) throws(Result) -> Void {
        let vkDeferredOperationJoinKHR = self.table.pointee.vkDeferredOperationJoinKHR!
        try checkResult(
            vkDeferredOperationJoinKHR(self.handle, operation.handle)
        )
    }

    public func getPipelineIndirectMemoryRequirementsNV(_ createInfo: (some Chainable<ComputePipelineCreateInfo>)) -> MemoryRequirements2 {
        let vkGetPipelineIndirectMemoryRequirementsNV = self.table.pointee.vkGetPipelineIndirectMemoryRequirementsNV!
        return createInfo.withCStruct { ptr_createInfo in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetPipelineIndirectMemoryRequirementsNV(self.handle, ptr_createInfo, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getPipelineIndirectMemoryRequirementsNV(_ createInfo: ComputePipelineCreateInfo) -> MemoryRequirements2 {
        let vkGetPipelineIndirectMemoryRequirementsNV = self.table.pointee.vkGetPipelineIndirectMemoryRequirementsNV!
        return createInfo.withCStruct { ptr_createInfo in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetPipelineIndirectMemoryRequirementsNV(self.handle, ptr_createInfo, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getPipelineIndirectAddressNV(_ info: (some Chainable<PipelineIndirectDeviceAddressInfoNV>)) -> VkDeviceAddress {
        let vkGetPipelineIndirectDeviceAddressNV = self.table.pointee.vkGetPipelineIndirectDeviceAddressNV!
        return info.withCStruct { ptr_info in
            vkGetPipelineIndirectDeviceAddressNV(self.handle, ptr_info)
        }
    }

    public func getPipelineIndirectAddressNV(_ info: PipelineIndirectDeviceAddressInfoNV) -> VkDeviceAddress {
        let vkGetPipelineIndirectDeviceAddressNV = self.table.pointee.vkGetPipelineIndirectDeviceAddressNV!
        return info.withCStruct { ptr_info in
            vkGetPipelineIndirectDeviceAddressNV(self.handle, ptr_info)
        }
    }

    public func antiLagUpdateAMD(data: (some Chainable<AntiLagDataAMD>)) -> Void {
        let vkAntiLagUpdateAMD = self.table.pointee.vkAntiLagUpdateAMD!
        return data.withCStruct { ptr_data in
            vkAntiLagUpdateAMD(self.handle, ptr_data)
        }
    }

    public func antiLagUpdateAMD(data: AntiLagDataAMD) -> Void {
        let vkAntiLagUpdateAMD = self.table.pointee.vkAntiLagUpdateAMD!
        return data.withCStruct { ptr_data in
            vkAntiLagUpdateAMD(self.handle, ptr_data)
        }
    }

    public func createPrivateDataSlot(_ createInfo: (some Chainable<PrivateDataSlotCreateInfo>)) throws(Result) -> PrivateDataSlot {
        let vkCreatePrivateDataSlot = self.table.pointee.vkCreatePrivateDataSlot!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPrivateDataSlot!
            try checkResult(
                vkCreatePrivateDataSlot(self.handle, ptr_createInfo, nil, &out)
            )
            return PrivateDataSlot(handle: out)
        }
    }

    public func createPrivateDataSlot(_ createInfo: PrivateDataSlotCreateInfo) throws(Result) -> PrivateDataSlot {
        let vkCreatePrivateDataSlot = self.table.pointee.vkCreatePrivateDataSlot!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkPrivateDataSlot!
            try checkResult(
                vkCreatePrivateDataSlot(self.handle, ptr_createInfo, nil, &out)
            )
            return PrivateDataSlot(handle: out)
        }
    }

    public func destroyPrivateDataSlot(privateDataSlot: PrivateDataSlot? = nil) -> Void {
        let vkDestroyPrivateDataSlot = self.table.pointee.vkDestroyPrivateDataSlot!
        vkDestroyPrivateDataSlot(self.handle, privateDataSlot?.handle, nil)
    }

    public func setPrivateData(objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot, data: UInt64) throws(Result) -> Void {
        let vkSetPrivateData = self.table.pointee.vkSetPrivateData!
        try checkResult(
            vkSetPrivateData(self.handle, VkObjectType(rawValue: VkObjectType.RawValue(objectType.rawValue)), objectHandle, privateDataSlot.handle, data)
        )
    }

    public func getPrivateData(objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot) -> UInt64 {
        let vkGetPrivateData = self.table.pointee.vkGetPrivateData!
        var out = UInt64()
        vkGetPrivateData(self.handle, VkObjectType(rawValue: VkObjectType.RawValue(objectType.rawValue)), objectHandle, privateDataSlot.handle, &out)
        return out
    }

    public func getAccelerationStructureBuildSizesKHR(_ buildInfo: (some Chainable<AccelerationStructureBuildGeometryInfoKHR>), buildType: AccelerationStructureBuildTypeKHR, maxPrimitiveCounts: Array<UInt32>? = nil) -> AccelerationStructureBuildSizesInfoKHR {
        let vkGetAccelerationStructureBuildSizesKHR = self.table.pointee.vkGetAccelerationStructureBuildSizesKHR!
        return buildInfo.withCStruct { ptr_buildInfo in
            maxPrimitiveCounts.withOptionalUnsafeBufferPointer { ptr_maxPrimitiveCounts in
                var out = VkAccelerationStructureBuildSizesInfoKHR()
                out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
                vkGetAccelerationStructureBuildSizesKHR(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, ptr_maxPrimitiveCounts.baseAddress, &out)
                return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
            }
        }
    }

    public func getAccelerationStructureBuildSizesKHR(_ buildInfo: AccelerationStructureBuildGeometryInfoKHR, buildType: AccelerationStructureBuildTypeKHR, maxPrimitiveCounts: Array<UInt32>? = nil) -> AccelerationStructureBuildSizesInfoKHR {
        let vkGetAccelerationStructureBuildSizesKHR = self.table.pointee.vkGetAccelerationStructureBuildSizesKHR!
        return buildInfo.withCStruct { ptr_buildInfo in
            maxPrimitiveCounts.withOptionalUnsafeBufferPointer { ptr_maxPrimitiveCounts in
                var out = VkAccelerationStructureBuildSizesInfoKHR()
                out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
                vkGetAccelerationStructureBuildSizesKHR(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, ptr_maxPrimitiveCounts.baseAddress, &out)
                return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
            }
        }
    }

    public func copyMemoryToImage(_ copyMemoryToImageInfo: (some Chainable<CopyMemoryToImageInfo>)) throws(Result) -> Void {
        let vkCopyMemoryToImage = self.table.pointee.vkCopyMemoryToImage!
        return try copyMemoryToImageInfo.withCStruct { ptr_copyMemoryToImageInfo throws(Result) in
            try checkResult(
                vkCopyMemoryToImage(self.handle, ptr_copyMemoryToImageInfo)
            )
        }
    }

    public func copyMemoryToImage(_ copyMemoryToImageInfo: CopyMemoryToImageInfo) throws(Result) -> Void {
        let vkCopyMemoryToImage = self.table.pointee.vkCopyMemoryToImage!
        return try copyMemoryToImageInfo.withCStruct { ptr_copyMemoryToImageInfo throws(Result) in
            try checkResult(
                vkCopyMemoryToImage(self.handle, ptr_copyMemoryToImageInfo)
            )
        }
    }

    public func copyImageToMemory(_ copyImageToMemoryInfo: (some Chainable<CopyImageToMemoryInfo>)) throws(Result) -> Void {
        let vkCopyImageToMemory = self.table.pointee.vkCopyImageToMemory!
        return try copyImageToMemoryInfo.withCStruct { ptr_copyImageToMemoryInfo throws(Result) in
            try checkResult(
                vkCopyImageToMemory(self.handle, ptr_copyImageToMemoryInfo)
            )
        }
    }

    public func copyImageToMemory(_ copyImageToMemoryInfo: CopyImageToMemoryInfo) throws(Result) -> Void {
        let vkCopyImageToMemory = self.table.pointee.vkCopyImageToMemory!
        return try copyImageToMemoryInfo.withCStruct { ptr_copyImageToMemoryInfo throws(Result) in
            try checkResult(
                vkCopyImageToMemory(self.handle, ptr_copyImageToMemoryInfo)
            )
        }
    }

    public func copyImageToImage(_ copyImageToImageInfo: (some Chainable<CopyImageToImageInfo>)) throws(Result) -> Void {
        let vkCopyImageToImage = self.table.pointee.vkCopyImageToImage!
        return try copyImageToImageInfo.withCStruct { ptr_copyImageToImageInfo throws(Result) in
            try checkResult(
                vkCopyImageToImage(self.handle, ptr_copyImageToImageInfo)
            )
        }
    }

    public func copyImageToImage(_ copyImageToImageInfo: CopyImageToImageInfo) throws(Result) -> Void {
        let vkCopyImageToImage = self.table.pointee.vkCopyImageToImage!
        return try copyImageToImageInfo.withCStruct { ptr_copyImageToImageInfo throws(Result) in
            try checkResult(
                vkCopyImageToImage(self.handle, ptr_copyImageToImageInfo)
            )
        }
    }

    public func transitionImageLayout(transitions: (AnyChainableArray<HostImageLayoutTransitionInfo>)) throws(Result) -> Void {
        let vkTransitionImageLayout = self.table.pointee.vkTransitionImageLayout!
        return try transitions.withCStructBufferPointer { ptr_transitions throws(Result) in
            try checkResult(
                vkTransitionImageLayout(self.handle, UInt32(ptr_transitions.count), ptr_transitions.baseAddress)
            )
        }
    }

    public func transitionImageLayout(transitions: Array<HostImageLayoutTransitionInfo>) throws(Result) -> Void {
        let vkTransitionImageLayout = self.table.pointee.vkTransitionImageLayout!
        return try transitions.withCStructBufferPointer { ptr_transitions throws(Result) in
            try checkResult(
                vkTransitionImageLayout(self.handle, UInt32(ptr_transitions.count), ptr_transitions.baseAddress)
            )
        }
    }

    public func createVideoSessionKHR(_ createInfo: (some Chainable<VideoSessionCreateInfoKHR>)) throws(Result) -> VideoSessionKHR {
        let vkCreateVideoSessionKHR = self.table.pointee.vkCreateVideoSessionKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionKHR!
            try checkResult(
                vkCreateVideoSessionKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionKHR(handle: out)
        }
    }

    public func createVideoSessionKHR(_ createInfo: VideoSessionCreateInfoKHR) throws(Result) -> VideoSessionKHR {
        let vkCreateVideoSessionKHR = self.table.pointee.vkCreateVideoSessionKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionKHR!
            try checkResult(
                vkCreateVideoSessionKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionKHR(handle: out)
        }
    }

    public func destroyVideoSessionKHR(videoSession: VideoSessionKHR? = nil) -> Void {
        let vkDestroyVideoSessionKHR = self.table.pointee.vkDestroyVideoSessionKHR!
        vkDestroyVideoSessionKHR(self.handle, videoSession?.handle, nil)
    }

    public func createVideoSessionParametersKHR(_ createInfo: (some Chainable<VideoSessionParametersCreateInfoKHR>)) throws(Result) -> VideoSessionParametersKHR {
        let vkCreateVideoSessionParametersKHR = self.table.pointee.vkCreateVideoSessionParametersKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionParametersKHR!
            try checkResult(
                vkCreateVideoSessionParametersKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionParametersKHR(handle: out)
        }
    }

    public func createVideoSessionParametersKHR(_ createInfo: VideoSessionParametersCreateInfoKHR) throws(Result) -> VideoSessionParametersKHR {
        let vkCreateVideoSessionParametersKHR = self.table.pointee.vkCreateVideoSessionParametersKHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkVideoSessionParametersKHR!
            try checkResult(
                vkCreateVideoSessionParametersKHR(self.handle, ptr_createInfo, nil, &out)
            )
            return VideoSessionParametersKHR(handle: out)
        }
    }

    public func updateVideoSessionParametersKHR(_ updateInfo: (some Chainable<VideoSessionParametersUpdateInfoKHR>), videoSessionParameters: VideoSessionParametersKHR) throws(Result) -> Void {
        let vkUpdateVideoSessionParametersKHR = self.table.pointee.vkUpdateVideoSessionParametersKHR!
        return try updateInfo.withCStruct { ptr_updateInfo throws(Result) in
            try checkResult(
                vkUpdateVideoSessionParametersKHR(self.handle, videoSessionParameters.handle, ptr_updateInfo)
            )
        }
    }

    public func updateVideoSessionParametersKHR(_ updateInfo: VideoSessionParametersUpdateInfoKHR, videoSessionParameters: VideoSessionParametersKHR) throws(Result) -> Void {
        let vkUpdateVideoSessionParametersKHR = self.table.pointee.vkUpdateVideoSessionParametersKHR!
        return try updateInfo.withCStruct { ptr_updateInfo throws(Result) in
            try checkResult(
                vkUpdateVideoSessionParametersKHR(self.handle, videoSessionParameters.handle, ptr_updateInfo)
            )
        }
    }

    public func getEncodedVideoSessionParametersKHR(_ videoSessionParametersInfo: (some Chainable<VideoEncodeSessionParametersGetInfoKHR>), _ feedbackInfo: UnsafeMutablePointer<VkVideoEncodeSessionParametersFeedbackInfoKHR>? = nil, dataSize: UnsafeMutablePointer<Int>, data: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        let vkGetEncodedVideoSessionParametersKHR = self.table.pointee.vkGetEncodedVideoSessionParametersKHR!
        return try videoSessionParametersInfo.withCStruct { ptr_videoSessionParametersInfo throws(Result) in
            try checkResult(
                vkGetEncodedVideoSessionParametersKHR(self.handle, ptr_videoSessionParametersInfo, feedbackInfo, dataSize, data)
            )
        }
    }

    public func getEncodedVideoSessionParametersKHR(_ videoSessionParametersInfo: VideoEncodeSessionParametersGetInfoKHR, _ feedbackInfo: UnsafeMutablePointer<VkVideoEncodeSessionParametersFeedbackInfoKHR>? = nil, dataSize: UnsafeMutablePointer<Int>, data: UnsafeMutableRawPointer? = nil) throws(Result) -> Void {
        let vkGetEncodedVideoSessionParametersKHR = self.table.pointee.vkGetEncodedVideoSessionParametersKHR!
        return try videoSessionParametersInfo.withCStruct { ptr_videoSessionParametersInfo throws(Result) in
            try checkResult(
                vkGetEncodedVideoSessionParametersKHR(self.handle, ptr_videoSessionParametersInfo, feedbackInfo, dataSize, data)
            )
        }
    }

    public func destroyVideoSessionParametersKHR(videoSessionParameters: VideoSessionParametersKHR? = nil) -> Void {
        let vkDestroyVideoSessionParametersKHR = self.table.pointee.vkDestroyVideoSessionParametersKHR!
        vkDestroyVideoSessionParametersKHR(self.handle, videoSessionParameters?.handle, nil)
    }

    public func getVideoSessionMemoryRequirementsKHR(videoSession: VideoSessionKHR) throws(Result) -> Array<VideoSessionMemoryRequirementsKHR> {
        let vkGetVideoSessionMemoryRequirementsKHR = self.table.pointee.vkGetVideoSessionMemoryRequirementsKHR!
        return try enumerate { pMemoryRequirements, pMemoryRequirementsCount in
            vkGetVideoSessionMemoryRequirementsKHR(self.handle, videoSession.handle, pMemoryRequirementsCount, pMemoryRequirements)
        }.map { VideoSessionMemoryRequirementsKHR(cStruct: $0) }
    }

    public func bindVideoSessionMemoryKHR(_ bindSessionMemoryInfos: (AnyChainableArray<BindVideoSessionMemoryInfoKHR>), videoSession: VideoSessionKHR) throws(Result) -> Void {
        let vkBindVideoSessionMemoryKHR = self.table.pointee.vkBindVideoSessionMemoryKHR!
        return try bindSessionMemoryInfos.withCStructBufferPointer { ptr_bindSessionMemoryInfos throws(Result) in
            try checkResult(
                vkBindVideoSessionMemoryKHR(self.handle, videoSession.handle, UInt32(ptr_bindSessionMemoryInfos.count), ptr_bindSessionMemoryInfos.baseAddress)
            )
        }
    }

    public func bindVideoSessionMemoryKHR(_ bindSessionMemoryInfos: Array<BindVideoSessionMemoryInfoKHR>, videoSession: VideoSessionKHR) throws(Result) -> Void {
        let vkBindVideoSessionMemoryKHR = self.table.pointee.vkBindVideoSessionMemoryKHR!
        return try bindSessionMemoryInfos.withCStructBufferPointer { ptr_bindSessionMemoryInfos throws(Result) in
            try checkResult(
                vkBindVideoSessionMemoryKHR(self.handle, videoSession.handle, UInt32(ptr_bindSessionMemoryInfos.count), ptr_bindSessionMemoryInfos.baseAddress)
            )
        }
    }

    public func getPartitionedAccelerationStructuresBuildSizesNV(_ info: (some Chainable<PartitionedAccelerationStructureInstancesInputNV>)) -> AccelerationStructureBuildSizesInfoKHR {
        let vkGetPartitionedAccelerationStructuresBuildSizesNV = self.table.pointee.vkGetPartitionedAccelerationStructuresBuildSizesNV!
        return info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            vkGetPartitionedAccelerationStructuresBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func getPartitionedAccelerationStructuresBuildSizesNV(_ info: PartitionedAccelerationStructureInstancesInputNV) -> AccelerationStructureBuildSizesInfoKHR {
        let vkGetPartitionedAccelerationStructuresBuildSizesNV = self.table.pointee.vkGetPartitionedAccelerationStructuresBuildSizesNV!
        return info.withCStruct { ptr_info in
            var out = VkAccelerationStructureBuildSizesInfoKHR()
            out.sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR
            vkGetPartitionedAccelerationStructuresBuildSizesNV(self.handle, ptr_info, &out)
            return AccelerationStructureBuildSizesInfoKHR(cStruct: out)
        }
    }

    public func createCuModuleNVX(_ createInfo: (some Chainable<CuModuleCreateInfoNVX>)) throws(Result) -> CuModuleNVX {
        let vkCreateCuModuleNVX = self.table.pointee.vkCreateCuModuleNVX!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuModuleNVX!
            try checkResult(
                vkCreateCuModuleNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuModuleNVX(handle: out)
        }
    }

    public func createCuModuleNVX(_ createInfo: CuModuleCreateInfoNVX) throws(Result) -> CuModuleNVX {
        let vkCreateCuModuleNVX = self.table.pointee.vkCreateCuModuleNVX!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuModuleNVX!
            try checkResult(
                vkCreateCuModuleNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuModuleNVX(handle: out)
        }
    }

    public func createCuFunctionNVX(_ createInfo: (some Chainable<CuFunctionCreateInfoNVX>)) throws(Result) -> CuFunctionNVX {
        let vkCreateCuFunctionNVX = self.table.pointee.vkCreateCuFunctionNVX!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuFunctionNVX!
            try checkResult(
                vkCreateCuFunctionNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuFunctionNVX(handle: out)
        }
    }

    public func createCuFunctionNVX(_ createInfo: CuFunctionCreateInfoNVX) throws(Result) -> CuFunctionNVX {
        let vkCreateCuFunctionNVX = self.table.pointee.vkCreateCuFunctionNVX!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCuFunctionNVX!
            try checkResult(
                vkCreateCuFunctionNVX(self.handle, ptr_createInfo, nil, &out)
            )
            return CuFunctionNVX(handle: out)
        }
    }

    public func destroyCuModuleNVX(module: CuModuleNVX) -> Void {
        let vkDestroyCuModuleNVX = self.table.pointee.vkDestroyCuModuleNVX!
        vkDestroyCuModuleNVX(self.handle, module.handle, nil)
    }

    public func destroyCuFunctionNVX(function: CuFunctionNVX) -> Void {
        let vkDestroyCuFunctionNVX = self.table.pointee.vkDestroyCuFunctionNVX!
        vkDestroyCuFunctionNVX(self.handle, function.handle, nil)
    }

    public func getDescriptorSetLayoutSizeEXT(layout: DescriptorSetLayout) -> VkDeviceSize {
        let vkGetDescriptorSetLayoutSizeEXT = self.table.pointee.vkGetDescriptorSetLayoutSizeEXT!
        var out = VkDeviceSize()
        vkGetDescriptorSetLayoutSizeEXT(self.handle, layout.handle, &out)
        return out
    }

    public func getDescriptorSetLayoutBindingOffsetEXT(layout: DescriptorSetLayout, binding: UInt32) -> VkDeviceSize {
        let vkGetDescriptorSetLayoutBindingOffsetEXT = self.table.pointee.vkGetDescriptorSetLayoutBindingOffsetEXT!
        var out = VkDeviceSize()
        vkGetDescriptorSetLayoutBindingOffsetEXT(self.handle, layout.handle, binding, &out)
        return out
    }

    public func getDescriptorEXT(_ descriptorInfo: (some Chainable<DescriptorGetInfoEXT>), dataSize: Int, descriptor: UnsafeMutableRawPointer) -> Void {
        let vkGetDescriptorEXT = self.table.pointee.vkGetDescriptorEXT!
        return descriptorInfo.withCStruct { ptr_descriptorInfo in
            vkGetDescriptorEXT(self.handle, ptr_descriptorInfo, dataSize, descriptor)
        }
    }

    public func getDescriptorEXT(_ descriptorInfo: DescriptorGetInfoEXT, dataSize: Int, descriptor: UnsafeMutableRawPointer) -> Void {
        let vkGetDescriptorEXT = self.table.pointee.vkGetDescriptorEXT!
        return descriptorInfo.withCStruct { ptr_descriptorInfo in
            vkGetDescriptorEXT(self.handle, ptr_descriptorInfo, dataSize, descriptor)
        }
    }

    public func getBufferOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<BufferCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetBufferOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetBufferOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetBufferOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getBufferOpaqueCaptureDescriptorDataEXT(_ info: BufferCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetBufferOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetBufferOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetBufferOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<ImageCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetImageOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetImageOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetImageOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageOpaqueCaptureDescriptorDataEXT(_ info: ImageCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetImageOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetImageOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetImageOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageViewOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<ImageViewCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetImageViewOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetImageViewOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetImageViewOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getImageViewOpaqueCaptureDescriptorDataEXT(_ info: ImageViewCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetImageViewOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetImageViewOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetImageViewOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getSamplerOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<SamplerCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetSamplerOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetSamplerOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetSamplerOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getSamplerOpaqueCaptureDescriptorDataEXT(_ info: SamplerCaptureDescriptorDataInfoEXT, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetSamplerOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetSamplerOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetSamplerOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getAccelerationStructureOpaqueCaptureDescriptorDataEXT(_ info: (some Chainable<AccelerationStructureCaptureDescriptorDataInfoEXT>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func getAccelerationStructureOpaqueCaptureDescriptorDataEXT(_ info: AccelerationStructureCaptureDescriptorDataInfoEXT = AccelerationStructureCaptureDescriptorDataInfoEXT(), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT = self.table.pointee.vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT(self.handle, ptr_info, data)
            )
        }
    }

    public func setMemoryPriorityEXT(memory: DeviceMemory, priority: Float) -> Void {
        let vkSetDeviceMemoryPriorityEXT = self.table.pointee.vkSetDeviceMemoryPriorityEXT!
        vkSetDeviceMemoryPriorityEXT(self.handle, memory.handle, priority)
    }

    public func waitForPresent2KHR(_ presentWait2Info: (some Chainable<PresentWait2InfoKHR>), swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkWaitForPresent2KHR = self.table.pointee.vkWaitForPresent2KHR!
        return try presentWait2Info.withCStruct { ptr_presentWait2Info throws(Result) in
            try checkResult(
                vkWaitForPresent2KHR(self.handle, swapchain.handle, ptr_presentWait2Info)
            )
        }
    }

    public func waitForPresent2KHR(_ presentWait2Info: PresentWait2InfoKHR, swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkWaitForPresent2KHR = self.table.pointee.vkWaitForPresent2KHR!
        return try presentWait2Info.withCStruct { ptr_presentWait2Info throws(Result) in
            try checkResult(
                vkWaitForPresent2KHR(self.handle, swapchain.handle, ptr_presentWait2Info)
            )
        }
    }

    public func waitForPresentKHR(swapchain: SwapchainKHR, presentId: UInt64, timeout: UInt64) throws(Result) -> Void {
        let vkWaitForPresentKHR = self.table.pointee.vkWaitForPresentKHR!
        try checkResult(
            vkWaitForPresentKHR(self.handle, swapchain.handle, presentId, timeout)
        )
    }

    #if VK_USE_PLATFORM_FUCHSIA
    public func createBufferCollectionFUCHSIA(_ createInfo: (some Chainable<BufferCollectionCreateInfoFUCHSIA>)) throws(Result) -> BufferCollectionFUCHSIA {
        let vkCreateBufferCollectionFUCHSIA = self.table.pointee.vkCreateBufferCollectionFUCHSIA!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferCollectionFUCHSIA!
            try checkResult(
                vkCreateBufferCollectionFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferCollectionFUCHSIA(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func createBufferCollectionFUCHSIA(_ createInfo: BufferCollectionCreateInfoFUCHSIA) throws(Result) -> BufferCollectionFUCHSIA {
        let vkCreateBufferCollectionFUCHSIA = self.table.pointee.vkCreateBufferCollectionFUCHSIA!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkBufferCollectionFUCHSIA!
            try checkResult(
                vkCreateBufferCollectionFUCHSIA(self.handle, ptr_createInfo, nil, &out)
            )
            return BufferCollectionFUCHSIA(handle: out)
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferCollectionBufferConstraintsFUCHSIA(_ bufferConstraintsInfo: (some Chainable<BufferConstraintsInfoFUCHSIA>), collection: BufferCollectionFUCHSIA) throws(Result) -> Void {
        let vkSetBufferCollectionBufferConstraintsFUCHSIA = self.table.pointee.vkSetBufferCollectionBufferConstraintsFUCHSIA!
        return try bufferConstraintsInfo.withCStruct { ptr_bufferConstraintsInfo throws(Result) in
            try checkResult(
                vkSetBufferCollectionBufferConstraintsFUCHSIA(self.handle, collection.handle, ptr_bufferConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferCollectionBufferConstraintsFUCHSIA(_ bufferConstraintsInfo: BufferConstraintsInfoFUCHSIA, collection: BufferCollectionFUCHSIA) throws(Result) -> Void {
        let vkSetBufferCollectionBufferConstraintsFUCHSIA = self.table.pointee.vkSetBufferCollectionBufferConstraintsFUCHSIA!
        return try bufferConstraintsInfo.withCStruct { ptr_bufferConstraintsInfo throws(Result) in
            try checkResult(
                vkSetBufferCollectionBufferConstraintsFUCHSIA(self.handle, collection.handle, ptr_bufferConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferCollectionImageConstraintsFUCHSIA(_ imageConstraintsInfo: (some Chainable<ImageConstraintsInfoFUCHSIA>), collection: BufferCollectionFUCHSIA) throws(Result) -> Void {
        let vkSetBufferCollectionImageConstraintsFUCHSIA = self.table.pointee.vkSetBufferCollectionImageConstraintsFUCHSIA!
        return try imageConstraintsInfo.withCStruct { ptr_imageConstraintsInfo throws(Result) in
            try checkResult(
                vkSetBufferCollectionImageConstraintsFUCHSIA(self.handle, collection.handle, ptr_imageConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func setBufferCollectionImageConstraintsFUCHSIA(_ imageConstraintsInfo: ImageConstraintsInfoFUCHSIA, collection: BufferCollectionFUCHSIA) throws(Result) -> Void {
        let vkSetBufferCollectionImageConstraintsFUCHSIA = self.table.pointee.vkSetBufferCollectionImageConstraintsFUCHSIA!
        return try imageConstraintsInfo.withCStruct { ptr_imageConstraintsInfo throws(Result) in
            try checkResult(
                vkSetBufferCollectionImageConstraintsFUCHSIA(self.handle, collection.handle, ptr_imageConstraintsInfo)
            )
        }
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func destroyBufferCollectionFUCHSIA(collection: BufferCollectionFUCHSIA) -> Void {
        let vkDestroyBufferCollectionFUCHSIA = self.table.pointee.vkDestroyBufferCollectionFUCHSIA!
        vkDestroyBufferCollectionFUCHSIA(self.handle, collection.handle, nil)
    }
    #endif

    #if VK_USE_PLATFORM_FUCHSIA
    public func getBufferCollectionPropertiesFUCHSIA(collection: BufferCollectionFUCHSIA) throws(Result) -> BufferCollectionPropertiesFUCHSIA {
        let vkGetBufferCollectionPropertiesFUCHSIA = self.table.pointee.vkGetBufferCollectionPropertiesFUCHSIA!
        var out = VkBufferCollectionPropertiesFUCHSIA()
        out.sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA
        try checkResult(
            vkGetBufferCollectionPropertiesFUCHSIA(self.handle, collection.handle, &out)
        )
        return BufferCollectionPropertiesFUCHSIA(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaModuleNV(_ createInfo: (some Chainable<CudaModuleCreateInfoNV>)) throws(Result) -> CudaModuleNV {
        let vkCreateCudaModuleNV = self.table.pointee.vkCreateCudaModuleNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaModuleNV!
            try checkResult(
                vkCreateCudaModuleNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaModuleNV(handle: out)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaModuleNV(_ createInfo: CudaModuleCreateInfoNV) throws(Result) -> CudaModuleNV {
        let vkCreateCudaModuleNV = self.table.pointee.vkCreateCudaModuleNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaModuleNV!
            try checkResult(
                vkCreateCudaModuleNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaModuleNV(handle: out)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getCudaModuleCacheNV(module: CudaModuleNV) throws(Result) -> Array<UInt8> {
        let vkGetCudaModuleCacheNV = self.table.pointee.vkGetCudaModuleCacheNV!
        return try enumerateBytes { pCacheData, pCacheSize in
            vkGetCudaModuleCacheNV(self.handle, module.handle, pCacheSize, pCacheData)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaFunctionNV(_ createInfo: (some Chainable<CudaFunctionCreateInfoNV>)) throws(Result) -> CudaFunctionNV {
        let vkCreateCudaFunctionNV = self.table.pointee.vkCreateCudaFunctionNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaFunctionNV!
            try checkResult(
                vkCreateCudaFunctionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaFunctionNV(handle: out)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createCudaFunctionNV(_ createInfo: CudaFunctionCreateInfoNV) throws(Result) -> CudaFunctionNV {
        let vkCreateCudaFunctionNV = self.table.pointee.vkCreateCudaFunctionNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkCudaFunctionNV!
            try checkResult(
                vkCreateCudaFunctionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return CudaFunctionNV(handle: out)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func destroyCudaModuleNV(module: CudaModuleNV) -> Void {
        let vkDestroyCudaModuleNV = self.table.pointee.vkDestroyCudaModuleNV!
        vkDestroyCudaModuleNV(self.handle, module.handle, nil)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func destroyCudaFunctionNV(function: CudaFunctionNV) -> Void {
        let vkDestroyCudaFunctionNV = self.table.pointee.vkDestroyCudaFunctionNV!
        vkDestroyCudaFunctionNV(self.handle, function.handle, nil)
    }
    #endif

    public func getDescriptorSetLayoutHostMappingInfoVALVE(bindingReference: (some Chainable<DescriptorSetBindingReferenceVALVE>)) -> DescriptorSetLayoutHostMappingInfoVALVE {
        let vkGetDescriptorSetLayoutHostMappingInfoVALVE = self.table.pointee.vkGetDescriptorSetLayoutHostMappingInfoVALVE!
        return bindingReference.withCStruct { ptr_bindingReference in
            var out = VkDescriptorSetLayoutHostMappingInfoVALVE()
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE
            vkGetDescriptorSetLayoutHostMappingInfoVALVE(self.handle, ptr_bindingReference, &out)
            return DescriptorSetLayoutHostMappingInfoVALVE(cStruct: out)
        }
    }

    public func getDescriptorSetLayoutHostMappingInfoVALVE(bindingReference: DescriptorSetBindingReferenceVALVE) -> DescriptorSetLayoutHostMappingInfoVALVE {
        let vkGetDescriptorSetLayoutHostMappingInfoVALVE = self.table.pointee.vkGetDescriptorSetLayoutHostMappingInfoVALVE!
        return bindingReference.withCStruct { ptr_bindingReference in
            var out = VkDescriptorSetLayoutHostMappingInfoVALVE()
            out.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE
            vkGetDescriptorSetLayoutHostMappingInfoVALVE(self.handle, ptr_bindingReference, &out)
            return DescriptorSetLayoutHostMappingInfoVALVE(cStruct: out)
        }
    }

    public func getDescriptorSetHostMappingVALVE(descriptorSet: DescriptorSet) -> UnsafeMutableRawPointer {
        let vkGetDescriptorSetHostMappingVALVE = self.table.pointee.vkGetDescriptorSetHostMappingVALVE!
        var out: UnsafeMutableRawPointer!
        vkGetDescriptorSetHostMappingVALVE(self.handle, descriptorSet.handle, &out)
        return out
    }

    public func createMicromapEXT(_ createInfo: (some Chainable<MicromapCreateInfoEXT>)) throws(Result) -> MicromapEXT {
        let vkCreateMicromapEXT = self.table.pointee.vkCreateMicromapEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkMicromapEXT!
            try checkResult(
                vkCreateMicromapEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return MicromapEXT(handle: out)
        }
    }

    public func createMicromapEXT(_ createInfo: MicromapCreateInfoEXT) throws(Result) -> MicromapEXT {
        let vkCreateMicromapEXT = self.table.pointee.vkCreateMicromapEXT!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkMicromapEXT!
            try checkResult(
                vkCreateMicromapEXT(self.handle, ptr_createInfo, nil, &out)
            )
            return MicromapEXT(handle: out)
        }
    }

    public func buildMicromapsEXT(_ infos: (AnyChainableArray<MicromapBuildInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkBuildMicromapsEXT = self.table.pointee.vkBuildMicromapsEXT!
        return try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                vkBuildMicromapsEXT(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
            )
        }
    }

    public func buildMicromapsEXT(_ infos: Array<MicromapBuildInfoEXT>, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkBuildMicromapsEXT = self.table.pointee.vkBuildMicromapsEXT!
        return try infos.withCStructBufferPointer { ptr_infos throws(Result) in
            try checkResult(
                vkBuildMicromapsEXT(self.handle, deferredOperation?.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
            )
        }
    }

    public func destroyMicromapEXT(micromap: MicromapEXT? = nil) -> Void {
        let vkDestroyMicromapEXT = self.table.pointee.vkDestroyMicromapEXT!
        vkDestroyMicromapEXT(self.handle, micromap?.handle, nil)
    }

    public func copyMicromapEXT(_ info: (some Chainable<CopyMicromapInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMicromapEXT = self.table.pointee.vkCopyMicromapEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMicromapEXT(_ info: CopyMicromapInfoEXT, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMicromapEXT = self.table.pointee.vkCopyMicromapEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMicromapToMemoryEXT(_ info: (some Chainable<CopyMicromapToMemoryInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMicromapToMemoryEXT = self.table.pointee.vkCopyMicromapToMemoryEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMicromapToMemoryEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMicromapToMemoryEXT(_ info: CopyMicromapToMemoryInfoEXT, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMicromapToMemoryEXT = self.table.pointee.vkCopyMicromapToMemoryEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMicromapToMemoryEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToMicromapEXT(_ info: (some Chainable<CopyMemoryToMicromapInfoEXT>), deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMemoryToMicromapEXT = self.table.pointee.vkCopyMemoryToMicromapEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMemoryToMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func copyMemoryToMicromapEXT(_ info: CopyMemoryToMicromapInfoEXT, deferredOperation: DeferredOperationKHR? = nil) throws(Result) -> Void {
        let vkCopyMemoryToMicromapEXT = self.table.pointee.vkCopyMemoryToMicromapEXT!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkCopyMemoryToMicromapEXT(self.handle, deferredOperation?.handle, ptr_info)
            )
        }
    }

    public func writeMicromapsPropertiesEXT(micromaps: Array<MicromapEXT>, queryType: QueryType, dataSize: Int, data: UnsafeMutableRawPointer, stride: Int) throws(Result) -> Void {
        let vkWriteMicromapsPropertiesEXT = self.table.pointee.vkWriteMicromapsPropertiesEXT!
        return try micromaps.map{ $0.handle }.withUnsafeBufferPointer { ptr_micromaps throws(Result) in
            try checkResult(
                vkWriteMicromapsPropertiesEXT(self.handle, UInt32(ptr_micromaps.count), ptr_micromaps.baseAddress?.cast(), VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), dataSize, data, stride)
            )
        }
    }

    public func getMicromapCompatibilityEXT(_ versionInfo: (some Chainable<MicromapVersionInfoEXT>)) -> AccelerationStructureCompatibilityKHR {
        let vkGetDeviceMicromapCompatibilityEXT = self.table.pointee.vkGetDeviceMicromapCompatibilityEXT!
        return versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            vkGetDeviceMicromapCompatibilityEXT(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out.rawValue))!
        }
    }

    public func getMicromapCompatibilityEXT(_ versionInfo: MicromapVersionInfoEXT) -> AccelerationStructureCompatibilityKHR {
        let vkGetDeviceMicromapCompatibilityEXT = self.table.pointee.vkGetDeviceMicromapCompatibilityEXT!
        return versionInfo.withCStruct { ptr_versionInfo in
            var out = VkAccelerationStructureCompatibilityKHR(rawValue: 0)
            vkGetDeviceMicromapCompatibilityEXT(self.handle, ptr_versionInfo, &out)
            return AccelerationStructureCompatibilityKHR(rawValue: numericBitCast(out.rawValue))!
        }
    }

    public func getMicromapBuildSizesEXT(_ buildInfo: (some Chainable<MicromapBuildInfoEXT>), buildType: AccelerationStructureBuildTypeKHR) -> MicromapBuildSizesInfoEXT {
        let vkGetMicromapBuildSizesEXT = self.table.pointee.vkGetMicromapBuildSizesEXT!
        return buildInfo.withCStruct { ptr_buildInfo in
            var out = VkMicromapBuildSizesInfoEXT()
            out.sType = VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT
            vkGetMicromapBuildSizesEXT(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, &out)
            return MicromapBuildSizesInfoEXT(cStruct: out)
        }
    }

    public func getMicromapBuildSizesEXT(_ buildInfo: MicromapBuildInfoEXT, buildType: AccelerationStructureBuildTypeKHR) -> MicromapBuildSizesInfoEXT {
        let vkGetMicromapBuildSizesEXT = self.table.pointee.vkGetMicromapBuildSizesEXT!
        return buildInfo.withCStruct { ptr_buildInfo in
            var out = VkMicromapBuildSizesInfoEXT()
            out.sType = VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT
            vkGetMicromapBuildSizesEXT(self.handle, VkAccelerationStructureBuildTypeKHR(rawValue: VkAccelerationStructureBuildTypeKHR.RawValue(buildType.rawValue)), ptr_buildInfo, &out)
            return MicromapBuildSizesInfoEXT(cStruct: out)
        }
    }

    public func getShaderModuleIdentifierEXT(shaderModule: ShaderModule) -> ShaderModuleIdentifierEXT {
        let vkGetShaderModuleIdentifierEXT = self.table.pointee.vkGetShaderModuleIdentifierEXT!
        var out = VkShaderModuleIdentifierEXT()
        out.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT
        vkGetShaderModuleIdentifierEXT(self.handle, shaderModule.handle, &out)
        return ShaderModuleIdentifierEXT(cStruct: out)
    }

    public func getShaderModuleCreateInfoIdentifierEXT(_ createInfo: (some Chainable<ShaderModuleCreateInfo>)) -> ShaderModuleIdentifierEXT {
        let vkGetShaderModuleCreateInfoIdentifierEXT = self.table.pointee.vkGetShaderModuleCreateInfoIdentifierEXT!
        return createInfo.withCStruct { ptr_createInfo in
            var out = VkShaderModuleIdentifierEXT()
            out.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT
            vkGetShaderModuleCreateInfoIdentifierEXT(self.handle, ptr_createInfo, &out)
            return ShaderModuleIdentifierEXT(cStruct: out)
        }
    }

    public func getShaderModuleCreateInfoIdentifierEXT(_ createInfo: ShaderModuleCreateInfo) -> ShaderModuleIdentifierEXT {
        let vkGetShaderModuleCreateInfoIdentifierEXT = self.table.pointee.vkGetShaderModuleCreateInfoIdentifierEXT!
        return createInfo.withCStruct { ptr_createInfo in
            var out = VkShaderModuleIdentifierEXT()
            out.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT
            vkGetShaderModuleCreateInfoIdentifierEXT(self.handle, ptr_createInfo, &out)
            return ShaderModuleIdentifierEXT(cStruct: out)
        }
    }

    public func getImageSubresourceLayout2(image: Image, subresource: (some Chainable<ImageSubresource2>)) -> SubresourceLayout2 {
        let vkGetImageSubresourceLayout2 = self.table.pointee.vkGetImageSubresourceLayout2!
        return subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            vkGetImageSubresourceLayout2(self.handle, image.handle, ptr_subresource, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getImageSubresourceLayout2(image: Image, subresource: ImageSubresource2) -> SubresourceLayout2 {
        let vkGetImageSubresourceLayout2 = self.table.pointee.vkGetImageSubresourceLayout2!
        return subresource.withCStruct { ptr_subresource in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            vkGetImageSubresourceLayout2(self.handle, image.handle, ptr_subresource, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getPipelinePropertiesEXT(_ pipelineInfo: (some Chainable<PipelineInfoKHR>)) throws(Result) -> VkBaseOutStructure {
        let vkGetPipelinePropertiesEXT = self.table.pointee.vkGetPipelinePropertiesEXT!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                vkGetPipelinePropertiesEXT(self.handle, ptr_pipelineInfo, &out)
            )
            return out
        }
    }

    public func getPipelinePropertiesEXT(_ pipelineInfo: PipelineInfoKHR) throws(Result) -> VkBaseOutStructure {
        let vkGetPipelinePropertiesEXT = self.table.pointee.vkGetPipelinePropertiesEXT!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            var out = VkBaseOutStructure()
            try checkResult(
                vkGetPipelinePropertiesEXT(self.handle, ptr_pipelineInfo, &out)
            )
            return out
        }
    }

    #if VK_USE_PLATFORM_METAL_EXT
    public func exportMetalObjectsEXT() -> ExportMetalObjectsInfoEXT {
        let vkExportMetalObjectsEXT = self.table.pointee.vkExportMetalObjectsEXT!
        var out = VkExportMetalObjectsInfoEXT()
        out.sType = VK_STRUCTURE_TYPE_EXPORT_METAL_OBJECTS_INFO_EXT
        vkExportMetalObjectsEXT(self.handle, &out)
        return ExportMetalObjectsInfoEXT(cStruct: out)
    }
    #endif

    public func getFramebufferTilePropertiesQCOM(framebuffer: Framebuffer) throws(Result) -> Array<TilePropertiesQCOM> {
        let vkGetFramebufferTilePropertiesQCOM = self.table.pointee.vkGetFramebufferTilePropertiesQCOM!
        return try enumerate { pProperties, pPropertiesCount in
            vkGetFramebufferTilePropertiesQCOM(self.handle, framebuffer.handle, pPropertiesCount, pProperties)
        }.map { TilePropertiesQCOM(cStruct: $0) }
    }

    public func getDynamicRenderingTilePropertiesQCOM(_ renderingInfo: (some Chainable<RenderingInfo>)) throws(Result) -> TilePropertiesQCOM {
        let vkGetDynamicRenderingTilePropertiesQCOM = self.table.pointee.vkGetDynamicRenderingTilePropertiesQCOM!
        return try renderingInfo.withCStruct { ptr_renderingInfo throws(Result) in
            var out = VkTilePropertiesQCOM()
            out.sType = VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM
            try checkResult(
                vkGetDynamicRenderingTilePropertiesQCOM(self.handle, ptr_renderingInfo, &out)
            )
            return TilePropertiesQCOM(cStruct: out)
        }
    }

    public func getDynamicRenderingTilePropertiesQCOM(_ renderingInfo: RenderingInfo) throws(Result) -> TilePropertiesQCOM {
        let vkGetDynamicRenderingTilePropertiesQCOM = self.table.pointee.vkGetDynamicRenderingTilePropertiesQCOM!
        return try renderingInfo.withCStruct { ptr_renderingInfo throws(Result) in
            var out = VkTilePropertiesQCOM()
            out.sType = VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM
            try checkResult(
                vkGetDynamicRenderingTilePropertiesQCOM(self.handle, ptr_renderingInfo, &out)
            )
            return TilePropertiesQCOM(cStruct: out)
        }
    }

    public func createOpticalFlowSessionNV(_ createInfo: (some Chainable<OpticalFlowSessionCreateInfoNV>)) throws(Result) -> OpticalFlowSessionNV {
        let vkCreateOpticalFlowSessionNV = self.table.pointee.vkCreateOpticalFlowSessionNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkOpticalFlowSessionNV!
            try checkResult(
                vkCreateOpticalFlowSessionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return OpticalFlowSessionNV(handle: out)
        }
    }

    public func createOpticalFlowSessionNV(_ createInfo: OpticalFlowSessionCreateInfoNV) throws(Result) -> OpticalFlowSessionNV {
        let vkCreateOpticalFlowSessionNV = self.table.pointee.vkCreateOpticalFlowSessionNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkOpticalFlowSessionNV!
            try checkResult(
                vkCreateOpticalFlowSessionNV(self.handle, ptr_createInfo, nil, &out)
            )
            return OpticalFlowSessionNV(handle: out)
        }
    }

    public func destroyOpticalFlowSessionNV(session: OpticalFlowSessionNV) -> Void {
        let vkDestroyOpticalFlowSessionNV = self.table.pointee.vkDestroyOpticalFlowSessionNV!
        vkDestroyOpticalFlowSessionNV(self.handle, session.handle, nil)
    }

    public func bindOpticalFlowSessionImageNV(session: OpticalFlowSessionNV, bindingPoint: OpticalFlowSessionBindingPointNV, view: ImageView? = nil, layout: ImageLayout) throws(Result) -> Void {
        let vkBindOpticalFlowSessionImageNV = self.table.pointee.vkBindOpticalFlowSessionImageNV!
        try checkResult(
            vkBindOpticalFlowSessionImageNV(self.handle, session.handle, VkOpticalFlowSessionBindingPointNV(rawValue: VkOpticalFlowSessionBindingPointNV.RawValue(bindingPoint.rawValue)), view?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(layout.rawValue)))
        )
    }

    public func getFaultInfoEXT(_ faultInfo: UnsafeMutablePointer<VkDeviceFaultInfoEXT>? = nil, faultCounts: UnsafeMutablePointer<VkDeviceFaultCountsEXT>) throws(Result) -> Void {
        let vkGetDeviceFaultInfoEXT = self.table.pointee.vkGetDeviceFaultInfoEXT!
        try checkResult(
            vkGetDeviceFaultInfoEXT(self.handle, faultCounts, faultInfo)
        )
    }

    public func getFaultReportsKHR(timeout: UInt64) throws(Result) -> Array<DeviceFaultInfoKHR> {
        let vkGetDeviceFaultReportsKHR = self.table.pointee.vkGetDeviceFaultReportsKHR!
        return try enumerate { pFaultInfo, pFaultCounts in
            vkGetDeviceFaultReportsKHR(self.handle, timeout, pFaultCounts, pFaultInfo)
        }.map { DeviceFaultInfoKHR(cStruct: $0) }
    }

    public func getFaultDebugInfoKHR() throws(Result) -> DeviceFaultDebugInfoKHR {
        let vkGetDeviceFaultDebugInfoKHR = self.table.pointee.vkGetDeviceFaultDebugInfoKHR!
        var out = VkDeviceFaultDebugInfoKHR()
        out.sType = VK_STRUCTURE_TYPE_DEVICE_FAULT_DEBUG_INFO_KHR
        try checkResult(
            vkGetDeviceFaultDebugInfoKHR(self.handle, &out)
        )
        return DeviceFaultDebugInfoKHR(cStruct: out)
    }

    public func releaseSwapchainImagesKHR(_ releaseInfo: (some Chainable<ReleaseSwapchainImagesInfoKHR>)) throws(Result) -> Void {
        let vkReleaseSwapchainImagesKHR = self.table.pointee.vkReleaseSwapchainImagesKHR!
        return try releaseInfo.withCStruct { ptr_releaseInfo throws(Result) in
            try checkResult(
                vkReleaseSwapchainImagesKHR(self.handle, ptr_releaseInfo)
            )
        }
    }

    public func releaseSwapchainImagesKHR(_ releaseInfo: ReleaseSwapchainImagesInfoKHR) throws(Result) -> Void {
        let vkReleaseSwapchainImagesKHR = self.table.pointee.vkReleaseSwapchainImagesKHR!
        return try releaseInfo.withCStruct { ptr_releaseInfo throws(Result) in
            try checkResult(
                vkReleaseSwapchainImagesKHR(self.handle, ptr_releaseInfo)
            )
        }
    }

    public func getImageSubresourceLayout(_ info: (some Chainable<DeviceImageSubresourceInfo>)) -> SubresourceLayout2 {
        let vkGetDeviceImageSubresourceLayout = self.table.pointee.vkGetDeviceImageSubresourceLayout!
        return info.withCStruct { ptr_info in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            vkGetDeviceImageSubresourceLayout(self.handle, ptr_info, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func getImageSubresourceLayout(_ info: DeviceImageSubresourceInfo) -> SubresourceLayout2 {
        let vkGetDeviceImageSubresourceLayout = self.table.pointee.vkGetDeviceImageSubresourceLayout!
        return info.withCStruct { ptr_info in
            var out = VkSubresourceLayout2()
            out.sType = VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2
            vkGetDeviceImageSubresourceLayout(self.handle, ptr_info, &out)
            return SubresourceLayout2(cStruct: out)
        }
    }

    public func mapMemory2(_ memoryMapInfo: (some Chainable<MemoryMapInfo>)) throws(Result) -> UnsafeMutableRawPointer {
        let vkMapMemory2 = self.table.pointee.vkMapMemory2!
        return try memoryMapInfo.withCStruct { ptr_memoryMapInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                vkMapMemory2(self.handle, ptr_memoryMapInfo, &out)
            )
            return out
        }
    }

    public func mapMemory2(_ memoryMapInfo: MemoryMapInfo) throws(Result) -> UnsafeMutableRawPointer {
        let vkMapMemory2 = self.table.pointee.vkMapMemory2!
        return try memoryMapInfo.withCStruct { ptr_memoryMapInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                vkMapMemory2(self.handle, ptr_memoryMapInfo, &out)
            )
            return out
        }
    }

    public func unmapMemory2(_ memoryUnmapInfo: (some Chainable<MemoryUnmapInfo>)) throws(Result) -> Void {
        let vkUnmapMemory2 = self.table.pointee.vkUnmapMemory2!
        return try memoryUnmapInfo.withCStruct { ptr_memoryUnmapInfo throws(Result) in
            try checkResult(
                vkUnmapMemory2(self.handle, ptr_memoryUnmapInfo)
            )
        }
    }

    public func unmapMemory2(_ memoryUnmapInfo: MemoryUnmapInfo) throws(Result) -> Void {
        let vkUnmapMemory2 = self.table.pointee.vkUnmapMemory2!
        return try memoryUnmapInfo.withCStruct { ptr_memoryUnmapInfo throws(Result) in
            try checkResult(
                vkUnmapMemory2(self.handle, ptr_memoryUnmapInfo)
            )
        }
    }

    public func createShadersEXT(_ createInfos: (AnyChainableArray<ShaderCreateInfoEXT>)) throws(Result) -> Array<ShaderEXT> {
        let vkCreateShadersEXT = self.table.pointee.vkCreateShadersEXT!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkShaderEXT?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateShadersEXT(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { ShaderEXT(handle: $0) }
        }
    }

    public func createShadersEXT(_ createInfos: Array<ShaderCreateInfoEXT>) throws(Result) -> Array<ShaderEXT> {
        let vkCreateShadersEXT = self.table.pointee.vkCreateShadersEXT!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkShaderEXT?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateShadersEXT(self.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { ShaderEXT(handle: $0) }
        }
    }

    public func destroyShaderEXT(shader: ShaderEXT? = nil) -> Void {
        let vkDestroyShaderEXT = self.table.pointee.vkDestroyShaderEXT!
        vkDestroyShaderEXT(self.handle, shader?.handle, nil)
    }

    public func getShaderBinaryDataEXT(shader: ShaderEXT) throws(Result) -> Array<UInt8> {
        let vkGetShaderBinaryDataEXT = self.table.pointee.vkGetShaderBinaryDataEXT!
        return try enumerateBytes { pData, pDataSize in
            vkGetShaderBinaryDataEXT(self.handle, shader.handle, pDataSize, pData)
        }
    }

    public func setSwapchainPresentTimingQueueSizeEXT(swapchain: SwapchainKHR, size: UInt32) throws(Result) -> Void {
        let vkSetSwapchainPresentTimingQueueSizeEXT = self.table.pointee.vkSetSwapchainPresentTimingQueueSizeEXT!
        try checkResult(
            vkSetSwapchainPresentTimingQueueSizeEXT(self.handle, swapchain.handle, size)
        )
    }

    public func getSwapchainTimingPropertiesEXT(swapchain: SwapchainKHR, swapchainTimingProperties: UnsafeMutablePointer<VkSwapchainTimingPropertiesEXT>, swapchainTimingPropertiesCounter: UnsafeMutablePointer<UInt64>? = nil) throws(Result) -> Void {
        let vkGetSwapchainTimingPropertiesEXT = self.table.pointee.vkGetSwapchainTimingPropertiesEXT!
        try checkResult(
            vkGetSwapchainTimingPropertiesEXT(self.handle, swapchain.handle, swapchainTimingProperties, swapchainTimingPropertiesCounter)
        )
    }

    public func getSwapchainTimeDomainPropertiesEXT(swapchain: SwapchainKHR, swapchainTimeDomainProperties: UnsafeMutablePointer<VkSwapchainTimeDomainPropertiesEXT>, timeDomainsCounter: UnsafeMutablePointer<UInt64>? = nil) throws(Result) -> Void {
        let vkGetSwapchainTimeDomainPropertiesEXT = self.table.pointee.vkGetSwapchainTimeDomainPropertiesEXT!
        try checkResult(
            vkGetSwapchainTimeDomainPropertiesEXT(self.handle, swapchain.handle, swapchainTimeDomainProperties, timeDomainsCounter)
        )
    }

    public func getPastPresentationTimingEXT(_ pastPresentationTimingInfo: (some Chainable<PastPresentationTimingInfoEXT>)) throws(Result) -> PastPresentationTimingPropertiesEXT {
        let vkGetPastPresentationTimingEXT = self.table.pointee.vkGetPastPresentationTimingEXT!
        return try pastPresentationTimingInfo.withCStruct { ptr_pastPresentationTimingInfo throws(Result) in
            var out = VkPastPresentationTimingPropertiesEXT()
            out.sType = VK_STRUCTURE_TYPE_PAST_PRESENTATION_TIMING_PROPERTIES_EXT
            try checkResult(
                vkGetPastPresentationTimingEXT(self.handle, ptr_pastPresentationTimingInfo, &out)
            )
            return PastPresentationTimingPropertiesEXT(cStruct: out)
        }
    }

    public func getPastPresentationTimingEXT(_ pastPresentationTimingInfo: PastPresentationTimingInfoEXT) throws(Result) -> PastPresentationTimingPropertiesEXT {
        let vkGetPastPresentationTimingEXT = self.table.pointee.vkGetPastPresentationTimingEXT!
        return try pastPresentationTimingInfo.withCStruct { ptr_pastPresentationTimingInfo throws(Result) in
            var out = VkPastPresentationTimingPropertiesEXT()
            out.sType = VK_STRUCTURE_TYPE_PAST_PRESENTATION_TIMING_PROPERTIES_EXT
            try checkResult(
                vkGetPastPresentationTimingEXT(self.handle, ptr_pastPresentationTimingInfo, &out)
            )
            return PastPresentationTimingPropertiesEXT(cStruct: out)
        }
    }

    #if VK_USE_PLATFORM_SCREEN_QNX
    public func getScreenBufferPropertiesQNX(buffer: UnsafePointer<_screen_buffer>) throws(Result) -> ScreenBufferPropertiesQNX {
        let vkGetScreenBufferPropertiesQNX = self.table.pointee.vkGetScreenBufferPropertiesQNX!
        var out = VkScreenBufferPropertiesQNX()
        out.sType = VK_STRUCTURE_TYPE_SCREEN_BUFFER_PROPERTIES_QNX
        try checkResult(
            vkGetScreenBufferPropertiesQNX(self.handle, buffer, &out)
        )
        return ScreenBufferPropertiesQNX(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphPipelineScratchSizeAMDX(executionGraph: Pipeline) throws(Result) -> ExecutionGraphPipelineScratchSizeAMDX {
        let vkGetExecutionGraphPipelineScratchSizeAMDX = self.table.pointee.vkGetExecutionGraphPipelineScratchSizeAMDX!
        var out = VkExecutionGraphPipelineScratchSizeAMDX()
        out.sType = VK_STRUCTURE_TYPE_EXECUTION_GRAPH_PIPELINE_SCRATCH_SIZE_AMDX
        try checkResult(
            vkGetExecutionGraphPipelineScratchSizeAMDX(self.handle, executionGraph.handle, &out)
        )
        return ExecutionGraphPipelineScratchSizeAMDX(cStruct: out)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphPipelineNodeIndexAMDX(_ nodeInfo: (some Chainable<PipelineShaderStageNodeCreateInfoAMDX>), executionGraph: Pipeline) throws(Result) -> UInt32 {
        let vkGetExecutionGraphPipelineNodeIndexAMDX = self.table.pointee.vkGetExecutionGraphPipelineNodeIndexAMDX!
        return try nodeInfo.withCStruct { ptr_nodeInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                vkGetExecutionGraphPipelineNodeIndexAMDX(self.handle, executionGraph.handle, ptr_nodeInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func getExecutionGraphPipelineNodeIndexAMDX(_ nodeInfo: PipelineShaderStageNodeCreateInfoAMDX, executionGraph: Pipeline) throws(Result) -> UInt32 {
        let vkGetExecutionGraphPipelineNodeIndexAMDX = self.table.pointee.vkGetExecutionGraphPipelineNodeIndexAMDX!
        return try nodeInfo.withCStruct { ptr_nodeInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                vkGetExecutionGraphPipelineNodeIndexAMDX(self.handle, executionGraph.handle, ptr_nodeInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createExecutionGraphPipelinesAMDX(_ createInfos: (AnyChainableArray<ExecutionGraphPipelineCreateInfoAMDX>), pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateExecutionGraphPipelinesAMDX = self.table.pointee.vkCreateExecutionGraphPipelinesAMDX!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateExecutionGraphPipelinesAMDX(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func createExecutionGraphPipelinesAMDX(_ createInfos: Array<ExecutionGraphPipelineCreateInfoAMDX>, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateExecutionGraphPipelinesAMDX = self.table.pointee.vkCreateExecutionGraphPipelinesAMDX!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateExecutionGraphPipelinesAMDX(self.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }
    #endif

    public func createGpaSessionAMD(_ createInfo: (some Chainable<GpaSessionCreateInfoAMD>)) throws(Result) -> GpaSessionAMD {
        let vkCreateGpaSessionAMD = self.table.pointee.vkCreateGpaSessionAMD!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkGpaSessionAMD!
            try checkResult(
                vkCreateGpaSessionAMD(self.handle, ptr_createInfo, nil, &out)
            )
            return GpaSessionAMD(handle: out)
        }
    }

    public func createGpaSessionAMD(_ createInfo: GpaSessionCreateInfoAMD = GpaSessionCreateInfoAMD()) throws(Result) -> GpaSessionAMD {
        let vkCreateGpaSessionAMD = self.table.pointee.vkCreateGpaSessionAMD!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkGpaSessionAMD!
            try checkResult(
                vkCreateGpaSessionAMD(self.handle, ptr_createInfo, nil, &out)
            )
            return GpaSessionAMD(handle: out)
        }
    }

    public func destroyGpaSessionAMD(gpaSession: GpaSessionAMD? = nil) -> Void {
        let vkDestroyGpaSessionAMD = self.table.pointee.vkDestroyGpaSessionAMD!
        vkDestroyGpaSessionAMD(self.handle, gpaSession?.handle, nil)
    }

    public func setGpaClockModeAMD() throws(Result) -> GpaDeviceClockModeInfoAMD {
        let vkSetGpaDeviceClockModeAMD = self.table.pointee.vkSetGpaDeviceClockModeAMD!
        var out = VkGpaDeviceClockModeInfoAMD()
        out.sType = VK_STRUCTURE_TYPE_GPA_DEVICE_CLOCK_MODE_INFO_AMD
        try checkResult(
            vkSetGpaDeviceClockModeAMD(self.handle, &out)
        )
        return GpaDeviceClockModeInfoAMD(cStruct: out)
    }

    public func getGpaClockInfoAMD() throws(Result) -> GpaDeviceGetClockInfoAMD {
        let vkGetGpaDeviceClockInfoAMD = self.table.pointee.vkGetGpaDeviceClockInfoAMD!
        var out = VkGpaDeviceGetClockInfoAMD()
        out.sType = VK_STRUCTURE_TYPE_GPA_DEVICE_GET_CLOCK_INFO_AMD
        try checkResult(
            vkGetGpaDeviceClockInfoAMD(self.handle, &out)
        )
        return GpaDeviceGetClockInfoAMD(cStruct: out)
    }

    public func getGpaSessionStatusAMD(gpaSession: GpaSessionAMD) throws(Result) -> Void {
        let vkGetGpaSessionStatusAMD = self.table.pointee.vkGetGpaSessionStatusAMD!
        try checkResult(
            vkGetGpaSessionStatusAMD(self.handle, gpaSession.handle)
        )
    }

    public func getGpaSessionResultsAMD(gpaSession: GpaSessionAMD, sampleID: UInt32) throws(Result) -> Array<UInt8> {
        let vkGetGpaSessionResultsAMD = self.table.pointee.vkGetGpaSessionResultsAMD!
        return try enumerateBytes { pData, pSizeInBytes in
            vkGetGpaSessionResultsAMD(self.handle, gpaSession.handle, sampleID, pSizeInBytes, pData)
        }
    }

    public func resetGpaSessionAMD(gpaSession: GpaSessionAMD) throws(Result) -> Void {
        let vkResetGpaSessionAMD = self.table.pointee.vkResetGpaSessionAMD!
        try checkResult(
            vkResetGpaSessionAMD(self.handle, gpaSession.handle)
        )
    }

    public func setLatencySleepModeNV(_ sleepModeInfo: (some Chainable<LatencySleepModeInfoNV>), swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkSetLatencySleepModeNV = self.table.pointee.vkSetLatencySleepModeNV!
        return try sleepModeInfo.withCStruct { ptr_sleepModeInfo throws(Result) in
            try checkResult(
                vkSetLatencySleepModeNV(self.handle, swapchain.handle, ptr_sleepModeInfo)
            )
        }
    }

    public func setLatencySleepModeNV(_ sleepModeInfo: LatencySleepModeInfoNV, swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkSetLatencySleepModeNV = self.table.pointee.vkSetLatencySleepModeNV!
        return try sleepModeInfo.withCStruct { ptr_sleepModeInfo throws(Result) in
            try checkResult(
                vkSetLatencySleepModeNV(self.handle, swapchain.handle, ptr_sleepModeInfo)
            )
        }
    }

    public func latencySleepNV(_ sleepInfo: (some Chainable<LatencySleepInfoNV>), swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkLatencySleepNV = self.table.pointee.vkLatencySleepNV!
        return try sleepInfo.withCStruct { ptr_sleepInfo throws(Result) in
            try checkResult(
                vkLatencySleepNV(self.handle, swapchain.handle, ptr_sleepInfo)
            )
        }
    }

    public func latencySleepNV(_ sleepInfo: LatencySleepInfoNV, swapchain: SwapchainKHR) throws(Result) -> Void {
        let vkLatencySleepNV = self.table.pointee.vkLatencySleepNV!
        return try sleepInfo.withCStruct { ptr_sleepInfo throws(Result) in
            try checkResult(
                vkLatencySleepNV(self.handle, swapchain.handle, ptr_sleepInfo)
            )
        }
    }

    public func setLatencyMarkerNV(_ latencyMarkerInfo: (some Chainable<SetLatencyMarkerInfoNV>), swapchain: SwapchainKHR) -> Void {
        let vkSetLatencyMarkerNV = self.table.pointee.vkSetLatencyMarkerNV!
        return latencyMarkerInfo.withCStruct { ptr_latencyMarkerInfo in
            vkSetLatencyMarkerNV(self.handle, swapchain.handle, ptr_latencyMarkerInfo)
        }
    }

    public func setLatencyMarkerNV(_ latencyMarkerInfo: SetLatencyMarkerInfoNV, swapchain: SwapchainKHR) -> Void {
        let vkSetLatencyMarkerNV = self.table.pointee.vkSetLatencyMarkerNV!
        return latencyMarkerInfo.withCStruct { ptr_latencyMarkerInfo in
            vkSetLatencyMarkerNV(self.handle, swapchain.handle, ptr_latencyMarkerInfo)
        }
    }

    public func getLatencyTimingsNV(swapchain: SwapchainKHR) -> GetLatencyMarkerInfoNV {
        let vkGetLatencyTimingsNV = self.table.pointee.vkGetLatencyTimingsNV!
        var out = VkGetLatencyMarkerInfoNV()
        out.sType = VK_STRUCTURE_TYPE_GET_LATENCY_MARKER_INFO_NV
        vkGetLatencyTimingsNV(self.handle, swapchain.handle, &out)
        return GetLatencyMarkerInfoNV(cStruct: out)
    }

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandleEXT(_ getMetalHandleInfo: (some Chainable<MemoryGetMetalHandleInfoEXT>)) throws(Result) -> UnsafeMutableRawPointer {
        let vkGetMemoryMetalHandleEXT = self.table.pointee.vkGetMemoryMetalHandleEXT!
        return try getMetalHandleInfo.withCStruct { ptr_getMetalHandleInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                vkGetMemoryMetalHandleEXT(self.handle, ptr_getMetalHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandleEXT(_ getMetalHandleInfo: MemoryGetMetalHandleInfoEXT) throws(Result) -> UnsafeMutableRawPointer {
        let vkGetMemoryMetalHandleEXT = self.table.pointee.vkGetMemoryMetalHandleEXT!
        return try getMetalHandleInfo.withCStruct { ptr_getMetalHandleInfo throws(Result) in
            var out: UnsafeMutableRawPointer!
            try checkResult(
                vkGetMemoryMetalHandleEXT(self.handle, ptr_getMetalHandleInfo, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_METAL_EXT
    public func getMemoryMetalHandlePropertiesEXT(handleType: ExternalMemoryHandleTypeFlags, handle: UnsafeRawPointer) throws(Result) -> MemoryMetalHandlePropertiesEXT {
        let vkGetMemoryMetalHandlePropertiesEXT = self.table.pointee.vkGetMemoryMetalHandlePropertiesEXT!
        var out = VkMemoryMetalHandlePropertiesEXT()
        out.sType = VK_STRUCTURE_TYPE_MEMORY_METAL_HANDLE_PROPERTIES_EXT
        try checkResult(
            vkGetMemoryMetalHandlePropertiesEXT(self.handle, VkExternalMemoryHandleTypeFlagBits(rawValue: VkExternalMemoryHandleTypeFlagBits.RawValue(handleType.rawValue)), handle, &out)
        )
        return MemoryMetalHandlePropertiesEXT(cStruct: out)
    }
    #endif

    public func convertCooperativeVectorMatrixNV(_ info: (some Chainable<ConvertCooperativeVectorMatrixInfoNV>)) throws(Result) -> Void {
        let vkConvertCooperativeVectorMatrixNV = self.table.pointee.vkConvertCooperativeVectorMatrixNV!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkConvertCooperativeVectorMatrixNV(self.handle, ptr_info)
            )
        }
    }

    public func convertCooperativeVectorMatrixNV(_ info: ConvertCooperativeVectorMatrixInfoNV) throws(Result) -> Void {
        let vkConvertCooperativeVectorMatrixNV = self.table.pointee.vkConvertCooperativeVectorMatrixNV!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkConvertCooperativeVectorMatrixNV(self.handle, ptr_info)
            )
        }
    }

    public func createExternalComputeQueueNV(_ createInfo: (some Chainable<ExternalComputeQueueCreateInfoNV>)) throws(Result) -> ExternalComputeQueueNV {
        let vkCreateExternalComputeQueueNV = self.table.pointee.vkCreateExternalComputeQueueNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkExternalComputeQueueNV!
            try checkResult(
                vkCreateExternalComputeQueueNV(self.handle, ptr_createInfo, nil, &out)
            )
            return ExternalComputeQueueNV(handle: out, table: self.table)
        }
    }

    public func createExternalComputeQueueNV(_ createInfo: ExternalComputeQueueCreateInfoNV) throws(Result) -> ExternalComputeQueueNV {
        let vkCreateExternalComputeQueueNV = self.table.pointee.vkCreateExternalComputeQueueNV!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkExternalComputeQueueNV!
            try checkResult(
                vkCreateExternalComputeQueueNV(self.handle, ptr_createInfo, nil, &out)
            )
            return ExternalComputeQueueNV(handle: out, table: self.table)
        }
    }

    public func destroyExternalComputeQueueNV(externalQueue: ExternalComputeQueueNV) -> Void {
        let vkDestroyExternalComputeQueueNV = self.table.pointee.vkDestroyExternalComputeQueueNV!
        vkDestroyExternalComputeQueueNV(self.handle, externalQueue.handle, nil)
    }

    public func createShaderInstrumentationARM(_ createInfo: (some Chainable<ShaderInstrumentationCreateInfoARM>)) throws(Result) -> ShaderInstrumentationARM {
        let vkCreateShaderInstrumentationARM = self.table.pointee.vkCreateShaderInstrumentationARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderInstrumentationARM!
            try checkResult(
                vkCreateShaderInstrumentationARM(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderInstrumentationARM(handle: out)
        }
    }

    public func createShaderInstrumentationARM(_ createInfo: ShaderInstrumentationCreateInfoARM = ShaderInstrumentationCreateInfoARM()) throws(Result) -> ShaderInstrumentationARM {
        let vkCreateShaderInstrumentationARM = self.table.pointee.vkCreateShaderInstrumentationARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkShaderInstrumentationARM!
            try checkResult(
                vkCreateShaderInstrumentationARM(self.handle, ptr_createInfo, nil, &out)
            )
            return ShaderInstrumentationARM(handle: out)
        }
    }

    public func destroyShaderInstrumentationARM(instrumentation: ShaderInstrumentationARM? = nil) -> Void {
        let vkDestroyShaderInstrumentationARM = self.table.pointee.vkDestroyShaderInstrumentationARM!
        vkDestroyShaderInstrumentationARM(self.handle, instrumentation?.handle, nil)
    }

    public func getShaderInstrumentationValuesARM(instrumentation: ShaderInstrumentationARM, metricValues: UnsafeMutableRawPointer, flags: ShaderInstrumentationValuesFlagsARM = []) throws(Result) -> UInt32 {
        let vkGetShaderInstrumentationValuesARM = self.table.pointee.vkGetShaderInstrumentationValuesARM!
        var out = UInt32()
        try checkResult(
            vkGetShaderInstrumentationValuesARM(self.handle, instrumentation.handle, &out, metricValues, flags.rawValue)
        )
        return out
    }

    public func clearShaderInstrumentationMetricsARM(instrumentation: ShaderInstrumentationARM) -> Void {
        let vkClearShaderInstrumentationMetricsARM = self.table.pointee.vkClearShaderInstrumentationMetricsARM!
        vkClearShaderInstrumentationMetricsARM(self.handle, instrumentation.handle)
    }

    public func createTensorARM(_ createInfo: (some Chainable<TensorCreateInfoARM>)) throws(Result) -> TensorARM {
        let vkCreateTensorARM = self.table.pointee.vkCreateTensorARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorARM!
            try checkResult(
                vkCreateTensorARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorARM(handle: out)
        }
    }

    public func createTensorARM(_ createInfo: TensorCreateInfoARM) throws(Result) -> TensorARM {
        let vkCreateTensorARM = self.table.pointee.vkCreateTensorARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorARM!
            try checkResult(
                vkCreateTensorARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorARM(handle: out)
        }
    }

    public func destroyTensorARM(tensor: TensorARM? = nil) -> Void {
        let vkDestroyTensorARM = self.table.pointee.vkDestroyTensorARM!
        vkDestroyTensorARM(self.handle, tensor?.handle, nil)
    }

    public func createTensorViewARM(_ createInfo: (some Chainable<TensorViewCreateInfoARM>)) throws(Result) -> TensorViewARM {
        let vkCreateTensorViewARM = self.table.pointee.vkCreateTensorViewARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorViewARM!
            try checkResult(
                vkCreateTensorViewARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorViewARM(handle: out)
        }
    }

    public func createTensorViewARM(_ createInfo: TensorViewCreateInfoARM) throws(Result) -> TensorViewARM {
        let vkCreateTensorViewARM = self.table.pointee.vkCreateTensorViewARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkTensorViewARM!
            try checkResult(
                vkCreateTensorViewARM(self.handle, ptr_createInfo, nil, &out)
            )
            return TensorViewARM(handle: out)
        }
    }

    public func destroyTensorViewARM(tensorView: TensorViewARM? = nil) -> Void {
        let vkDestroyTensorViewARM = self.table.pointee.vkDestroyTensorViewARM!
        vkDestroyTensorViewARM(self.handle, tensorView?.handle, nil)
    }

    public func getTensorMemoryRequirementsARM(_ info: (some Chainable<TensorMemoryRequirementsInfoARM>)) -> MemoryRequirements2 {
        let vkGetTensorMemoryRequirementsARM = self.table.pointee.vkGetTensorMemoryRequirementsARM!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: TensorMemoryRequirementsInfoARM) -> MemoryRequirements2 {
        let vkGetTensorMemoryRequirementsARM = self.table.pointee.vkGetTensorMemoryRequirementsARM!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindTensorMemoryARM(_ bindInfos: (AnyChainableArray<BindTensorMemoryInfoARM>)) throws(Result) -> Void {
        let vkBindTensorMemoryARM = self.table.pointee.vkBindTensorMemoryARM!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindTensorMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindTensorMemoryARM(_ bindInfos: Array<BindTensorMemoryInfoARM>) throws(Result) -> Void {
        let vkBindTensorMemoryARM = self.table.pointee.vkBindTensorMemoryARM!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindTensorMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: (some Chainable<DeviceTensorMemoryRequirementsARM>)) -> MemoryRequirements2 {
        let vkGetDeviceTensorMemoryRequirementsARM = self.table.pointee.vkGetDeviceTensorMemoryRequirementsARM!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDeviceTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorMemoryRequirementsARM(_ info: DeviceTensorMemoryRequirementsARM) -> MemoryRequirements2 {
        let vkGetDeviceTensorMemoryRequirementsARM = self.table.pointee.vkGetDeviceTensorMemoryRequirementsARM!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDeviceTensorMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getTensorOpaqueCaptureDescriptorDataARM(_ info: (some Chainable<TensorCaptureDescriptorDataInfoARM>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetTensorOpaqueCaptureDescriptorDataARM = self.table.pointee.vkGetTensorOpaqueCaptureDescriptorDataARM!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetTensorOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorOpaqueCaptureDescriptorDataARM(_ info: TensorCaptureDescriptorDataInfoARM, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetTensorOpaqueCaptureDescriptorDataARM = self.table.pointee.vkGetTensorOpaqueCaptureDescriptorDataARM!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetTensorOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorViewOpaqueCaptureDescriptorDataARM(_ info: (some Chainable<TensorViewCaptureDescriptorDataInfoARM>), data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetTensorViewOpaqueCaptureDescriptorDataARM = self.table.pointee.vkGetTensorViewOpaqueCaptureDescriptorDataARM!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetTensorViewOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func getTensorViewOpaqueCaptureDescriptorDataARM(_ info: TensorViewCaptureDescriptorDataInfoARM, data: UnsafeMutableRawPointer) throws(Result) -> Void {
        let vkGetTensorViewOpaqueCaptureDescriptorDataARM = self.table.pointee.vkGetTensorViewOpaqueCaptureDescriptorDataARM!
        return try info.withCStruct { ptr_info throws(Result) in
            try checkResult(
                vkGetTensorViewOpaqueCaptureDescriptorDataARM(self.handle, ptr_info, data)
            )
        }
    }

    public func createDataGraphPipelinesARM(_ createInfos: (AnyChainableArray<DataGraphPipelineCreateInfoARM>), deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateDataGraphPipelinesARM = self.table.pointee.vkCreateDataGraphPipelinesARM!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateDataGraphPipelinesARM(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createDataGraphPipelinesARM(_ createInfos: Array<DataGraphPipelineCreateInfoARM>, deferredOperation: DeferredOperationKHR? = nil, pipelineCache: PipelineCache? = nil) throws(Result) -> Array<Pipeline> {
        let vkCreateDataGraphPipelinesARM = self.table.pointee.vkCreateDataGraphPipelinesARM!
        return try createInfos.withCStructBufferPointer { ptr_createInfos throws(Result) in
            try Array<VkPipeline?>(unsafeUninitializedCapacity: Int(UInt32(ptr_createInfos.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkCreateDataGraphPipelinesARM(self.handle, deferredOperation?.handle, pipelineCache?.handle, UInt32(ptr_createInfos.count), ptr_createInfos.baseAddress, nil, out.baseAddress)
                )
                initializedCount = out.count
            }.map { Pipeline(handle: $0) }
        }
    }

    public func createDataGraphPipelineSessionARM(_ createInfo: (some Chainable<DataGraphPipelineSessionCreateInfoARM>)) throws(Result) -> DataGraphPipelineSessionARM {
        let vkCreateDataGraphPipelineSessionARM = self.table.pointee.vkCreateDataGraphPipelineSessionARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDataGraphPipelineSessionARM!
            try checkResult(
                vkCreateDataGraphPipelineSessionARM(self.handle, ptr_createInfo, nil, &out)
            )
            return DataGraphPipelineSessionARM(handle: out)
        }
    }

    public func createDataGraphPipelineSessionARM(_ createInfo: DataGraphPipelineSessionCreateInfoARM) throws(Result) -> DataGraphPipelineSessionARM {
        let vkCreateDataGraphPipelineSessionARM = self.table.pointee.vkCreateDataGraphPipelineSessionARM!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkDataGraphPipelineSessionARM!
            try checkResult(
                vkCreateDataGraphPipelineSessionARM(self.handle, ptr_createInfo, nil, &out)
            )
            return DataGraphPipelineSessionARM(handle: out)
        }
    }

    public func getDataGraphPipelineSessionBindPointRequirementsARM(_ info: (some Chainable<DataGraphPipelineSessionBindPointRequirementsInfoARM>)) throws(Result) -> Array<DataGraphPipelineSessionBindPointRequirementARM> {
        let vkGetDataGraphPipelineSessionBindPointRequirementsARM = self.table.pointee.vkGetDataGraphPipelineSessionBindPointRequirementsARM!
        return try info.withCStruct { ptr_info throws(Result) in
            try enumerate { pBindPointRequirements, pBindPointRequirementCount in
                vkGetDataGraphPipelineSessionBindPointRequirementsARM(self.handle, ptr_info, pBindPointRequirementCount, pBindPointRequirements)
            }.map { DataGraphPipelineSessionBindPointRequirementARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelineSessionBindPointRequirementsARM(_ info: DataGraphPipelineSessionBindPointRequirementsInfoARM) throws(Result) -> Array<DataGraphPipelineSessionBindPointRequirementARM> {
        let vkGetDataGraphPipelineSessionBindPointRequirementsARM = self.table.pointee.vkGetDataGraphPipelineSessionBindPointRequirementsARM!
        return try info.withCStruct { ptr_info throws(Result) in
            try enumerate { pBindPointRequirements, pBindPointRequirementCount in
                vkGetDataGraphPipelineSessionBindPointRequirementsARM(self.handle, ptr_info, pBindPointRequirementCount, pBindPointRequirements)
            }.map { DataGraphPipelineSessionBindPointRequirementARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelineSessionMemoryRequirementsARM(_ info: (some Chainable<DataGraphPipelineSessionMemoryRequirementsInfoARM>)) -> MemoryRequirements2 {
        let vkGetDataGraphPipelineSessionMemoryRequirementsARM = self.table.pointee.vkGetDataGraphPipelineSessionMemoryRequirementsARM!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDataGraphPipelineSessionMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func getDataGraphPipelineSessionMemoryRequirementsARM(_ info: DataGraphPipelineSessionMemoryRequirementsInfoARM) -> MemoryRequirements2 {
        let vkGetDataGraphPipelineSessionMemoryRequirementsARM = self.table.pointee.vkGetDataGraphPipelineSessionMemoryRequirementsARM!
        return info.withCStruct { ptr_info in
            var out = VkMemoryRequirements2()
            out.sType = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
            vkGetDataGraphPipelineSessionMemoryRequirementsARM(self.handle, ptr_info, &out)
            return MemoryRequirements2(cStruct: out)
        }
    }

    public func bindDataGraphPipelineSessionMemoryARM(_ bindInfos: (AnyChainableArray<BindDataGraphPipelineSessionMemoryInfoARM>)) throws(Result) -> Void {
        let vkBindDataGraphPipelineSessionMemoryARM = self.table.pointee.vkBindDataGraphPipelineSessionMemoryARM!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindDataGraphPipelineSessionMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func bindDataGraphPipelineSessionMemoryARM(_ bindInfos: Array<BindDataGraphPipelineSessionMemoryInfoARM>) throws(Result) -> Void {
        let vkBindDataGraphPipelineSessionMemoryARM = self.table.pointee.vkBindDataGraphPipelineSessionMemoryARM!
        return try bindInfos.withCStructBufferPointer { ptr_bindInfos throws(Result) in
            try checkResult(
                vkBindDataGraphPipelineSessionMemoryARM(self.handle, UInt32(ptr_bindInfos.count), ptr_bindInfos.baseAddress)
            )
        }
    }

    public func destroyDataGraphPipelineSessionARM(session: DataGraphPipelineSessionARM) -> Void {
        let vkDestroyDataGraphPipelineSessionARM = self.table.pointee.vkDestroyDataGraphPipelineSessionARM!
        vkDestroyDataGraphPipelineSessionARM(self.handle, session.handle, nil)
    }

    public func getDataGraphPipelineAvailablePropertiesARM(_ pipelineInfo: (some Chainable<DataGraphPipelineInfoARM>)) throws(Result) -> Array<DataGraphPipelinePropertyARM> {
        let vkGetDataGraphPipelineAvailablePropertiesARM = self.table.pointee.vkGetDataGraphPipelineAvailablePropertiesARM!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pPropertiesCount in
                vkGetDataGraphPipelineAvailablePropertiesARM(self.handle, ptr_pipelineInfo, pPropertiesCount, pProperties)
            }.map { DataGraphPipelinePropertyARM(rawValue: numericBitCast($0.rawValue))! }
        }
    }

    public func getDataGraphPipelineAvailablePropertiesARM(_ pipelineInfo: DataGraphPipelineInfoARM) throws(Result) -> Array<DataGraphPipelinePropertyARM> {
        let vkGetDataGraphPipelineAvailablePropertiesARM = self.table.pointee.vkGetDataGraphPipelineAvailablePropertiesARM!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try enumerate { pProperties, pPropertiesCount in
                vkGetDataGraphPipelineAvailablePropertiesARM(self.handle, ptr_pipelineInfo, pPropertiesCount, pProperties)
            }.map { DataGraphPipelinePropertyARM(rawValue: numericBitCast($0.rawValue))! }
        }
    }

    public func getDataGraphPipelinePropertiesARM(_ pipelineInfo: (some Chainable<DataGraphPipelineInfoARM>), propertiesCount: UInt32) throws(Result) -> Array<DataGraphPipelinePropertyQueryResultARM> {
        let vkGetDataGraphPipelinePropertiesARM = self.table.pointee.vkGetDataGraphPipelinePropertiesARM!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try Array<VkDataGraphPipelinePropertyQueryResultARM>(unsafeUninitializedCapacity: Int(propertiesCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    vkGetDataGraphPipelinePropertiesARM(self.handle, ptr_pipelineInfo, propertiesCount, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DataGraphPipelinePropertyQueryResultARM(cStruct: $0) }
        }
    }

    public func getDataGraphPipelinePropertiesARM(_ pipelineInfo: DataGraphPipelineInfoARM, propertiesCount: UInt32) throws(Result) -> Array<DataGraphPipelinePropertyQueryResultARM> {
        let vkGetDataGraphPipelinePropertiesARM = self.table.pointee.vkGetDataGraphPipelinePropertiesARM!
        return try pipelineInfo.withCStruct { ptr_pipelineInfo throws(Result) in
            try Array<VkDataGraphPipelinePropertyQueryResultARM>(unsafeUninitializedCapacity: Int(propertiesCount)) { out, initializedCount throws(Result) in
                try checkResult(
                    vkGetDataGraphPipelinePropertiesARM(self.handle, ptr_pipelineInfo, propertiesCount, out.baseAddress)
                )
                initializedCount = out.count
            }.map { DataGraphPipelinePropertyQueryResultARM(cStruct: $0) }
        }
    }

    #if VK_USE_PLATFORM_OHOS
    public func getNativeBufferPropertiesOHOS(buffer: UnsafePointer<OH_NativeBuffer>) throws(Result) -> NativeBufferPropertiesOHOS {
        let vkGetNativeBufferPropertiesOHOS = self.table.pointee.vkGetNativeBufferPropertiesOHOS!
        var out = VkNativeBufferPropertiesOHOS()
        out.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS
        try checkResult(
            vkGetNativeBufferPropertiesOHOS(self.handle, buffer, &out)
        )
        return NativeBufferPropertiesOHOS(cStruct: out)
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func getMemoryNativeBufferOHOS(_ info: (some Chainable<MemoryGetNativeBufferInfoOHOS>)) throws(Result) -> UnsafeMutablePointer<OH_NativeBuffer> {
        let vkGetMemoryNativeBufferOHOS = self.table.pointee.vkGetMemoryNativeBufferOHOS!
        return try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<OH_NativeBuffer>!
            try checkResult(
                vkGetMemoryNativeBufferOHOS(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    #if VK_USE_PLATFORM_OHOS
    public func getMemoryNativeBufferOHOS(_ info: MemoryGetNativeBufferInfoOHOS) throws(Result) -> UnsafeMutablePointer<OH_NativeBuffer> {
        let vkGetMemoryNativeBufferOHOS = self.table.pointee.vkGetMemoryNativeBufferOHOS!
        return try info.withCStruct { ptr_info throws(Result) in
            var out: UnsafeMutablePointer<OH_NativeBuffer>!
            try checkResult(
                vkGetMemoryNativeBufferOHOS(self.handle, ptr_info, &out)
            )
            return out
        }
    }
    #endif

    public func writeSamplerDescriptorsEXT(samplers: (AnyChainableArray<SamplerCreateInfo>), descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        let vkWriteSamplerDescriptorsEXT = self.table.pointee.vkWriteSamplerDescriptorsEXT!
        return try samplers.withCStructBufferPointer { ptr_samplers throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    vkWriteSamplerDescriptorsEXT(self.handle, UInt32(ptr_samplers.count), ptr_samplers.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeSamplerDescriptorsEXT(samplers: Array<SamplerCreateInfo>, descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        let vkWriteSamplerDescriptorsEXT = self.table.pointee.vkWriteSamplerDescriptorsEXT!
        return try samplers.withCStructBufferPointer { ptr_samplers throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    vkWriteSamplerDescriptorsEXT(self.handle, UInt32(ptr_samplers.count), ptr_samplers.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeResourceDescriptorsEXT(resources: (AnyChainableArray<ResourceDescriptorInfoEXT>), descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        let vkWriteResourceDescriptorsEXT = self.table.pointee.vkWriteResourceDescriptorsEXT!
        return try resources.withCStructBufferPointer { ptr_resources throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    vkWriteResourceDescriptorsEXT(self.handle, UInt32(ptr_resources.count), ptr_resources.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func writeResourceDescriptorsEXT(resources: Array<ResourceDescriptorInfoEXT>, descriptors: Array<HostAddressRangeEXT>) throws(Result) -> Void {
        let vkWriteResourceDescriptorsEXT = self.table.pointee.vkWriteResourceDescriptorsEXT!
        return try resources.withCStructBufferPointer { ptr_resources throws(Result) in
            try descriptors.withCStructBufferPointer { ptr_descriptors throws(Result) in
                try checkResult(
                    vkWriteResourceDescriptorsEXT(self.handle, UInt32(ptr_resources.count), ptr_resources.baseAddress, ptr_descriptors.baseAddress)
                )
            }
        }
    }

    public func registerCustomBorderColorEXT(borderColor: (some Chainable<SamplerCustomBorderColorCreateInfoEXT>), requestIndex: Bool) throws(Result) -> UInt32 {
        let vkRegisterCustomBorderColorEXT = self.table.pointee.vkRegisterCustomBorderColorEXT!
        return try borderColor.withCStruct { ptr_borderColor throws(Result) in
            var out = UInt32()
            try checkResult(
                vkRegisterCustomBorderColorEXT(self.handle, ptr_borderColor, VkBool32(requestIndex ? VK_TRUE : VK_FALSE), &out)
            )
            return out
        }
    }

    public func registerCustomBorderColorEXT(borderColor: SamplerCustomBorderColorCreateInfoEXT, requestIndex: Bool) throws(Result) -> UInt32 {
        let vkRegisterCustomBorderColorEXT = self.table.pointee.vkRegisterCustomBorderColorEXT!
        return try borderColor.withCStruct { ptr_borderColor throws(Result) in
            var out = UInt32()
            try checkResult(
                vkRegisterCustomBorderColorEXT(self.handle, ptr_borderColor, VkBool32(requestIndex ? VK_TRUE : VK_FALSE), &out)
            )
            return out
        }
    }

    public func unregisterCustomBorderColorEXT(index: UInt32) -> Void {
        let vkUnregisterCustomBorderColorEXT = self.table.pointee.vkUnregisterCustomBorderColorEXT!
        vkUnregisterCustomBorderColorEXT(self.handle, index)
    }

    public func getImageOpaqueCaptureDataEXT(images: Array<Image>) throws(Result) -> Array<HostAddressRangeEXT> {
        let vkGetImageOpaqueCaptureDataEXT = self.table.pointee.vkGetImageOpaqueCaptureDataEXT!
        return try images.map{ $0.handle }.withUnsafeBufferPointer { ptr_images throws(Result) in
            try Array<VkHostAddressRangeEXT>(unsafeUninitializedCapacity: Int(UInt32(ptr_images.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkGetImageOpaqueCaptureDataEXT(self.handle, UInt32(ptr_images.count), ptr_images.baseAddress?.cast(), out.baseAddress)
                )
                initializedCount = out.count
            }.map { HostAddressRangeEXT(cStruct: $0) }
        }
    }

    public func getTensorOpaqueCaptureDataARM(tensors: Array<TensorARM>) throws(Result) -> Array<HostAddressRangeEXT> {
        let vkGetTensorOpaqueCaptureDataARM = self.table.pointee.vkGetTensorOpaqueCaptureDataARM!
        return try tensors.map{ $0.handle }.withUnsafeBufferPointer { ptr_tensors throws(Result) in
            try Array<VkHostAddressRangeEXT>(unsafeUninitializedCapacity: Int(UInt32(ptr_tensors.count))) { out, initializedCount throws(Result) in
                try checkResult(
                    vkGetTensorOpaqueCaptureDataARM(self.handle, UInt32(ptr_tensors.count), ptr_tensors.baseAddress?.cast(), out.baseAddress)
                )
                initializedCount = out.count
            }.map { HostAddressRangeEXT(cStruct: $0) }
        }
    }

    public func createAccelerationStructure2KHR(_ createInfo: (some Chainable<AccelerationStructureCreateInfo2KHR>)) throws(Result) -> AccelerationStructureKHR {
        let vkCreateAccelerationStructure2KHR = self.table.pointee.vkCreateAccelerationStructure2KHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                vkCreateAccelerationStructure2KHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out)
        }
    }

    public func createAccelerationStructure2KHR(_ createInfo: AccelerationStructureCreateInfo2KHR) throws(Result) -> AccelerationStructureKHR {
        let vkCreateAccelerationStructure2KHR = self.table.pointee.vkCreateAccelerationStructure2KHR!
        return try createInfo.withCStruct { ptr_createInfo throws(Result) in
            var out: VkAccelerationStructureKHR!
            try checkResult(
                vkCreateAccelerationStructure2KHR(self.handle, ptr_createInfo, nil, &out)
            )
            return AccelerationStructureKHR(handle: out)
        }
    }
}

