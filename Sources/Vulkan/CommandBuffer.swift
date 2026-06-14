import CVulkan

public final class CommandBuffer: _HandleContainer {
    public let handle: VkCommandBuffer?
    public let commandPool: CommandPool!

    public init(handle: VkCommandBuffer?, commandPool: CommandPool!) {
        self.handle = handle
        self.commandPool = commandPool
    }

    public func begin(_ beginInfo: (some Chainable<CommandBufferBeginInfo>)) throws(Result) -> Void {
        try beginInfo.withCStruct { ptr_beginInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkBeginCommandBuffer(self.handle, ptr_beginInfo)
            )
        }
    }

    public func begin(_ beginInfo: CommandBufferBeginInfo = CommandBufferBeginInfo()) throws(Result) -> Void {
        try beginInfo.withCStruct { ptr_beginInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkBeginCommandBuffer(self.handle, ptr_beginInfo)
            )
        }
    }

    public func end() throws(Result) -> Void {
        try checkResult(
            self.commandPool.device.dispatchTable.vkEndCommandBuffer(self.handle)
        )
    }

    public func reset(flags: CommandBufferResetFlags = []) throws(Result) -> Void {
        try checkResult(
            self.commandPool.device.dispatchTable.vkResetCommandBuffer(self.handle, flags.rawValue)
        )
    }

    public func bindPipeline(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindPipeline(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle)
    }

    public func setPrimitiveRestartIndexEXT(primitiveRestartIndex: UInt32 = 0) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPrimitiveRestartIndexEXT(self.handle, primitiveRestartIndex)
    }

    public func setAttachmentFeedbackLoopEnableEXT(aspectMask: ImageAspectFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetAttachmentFeedbackLoopEnableEXT(self.handle, aspectMask.rawValue)
    }

    public func setViewport(firstViewport: UInt32, viewports: Array<Viewport>) -> Void {
        viewports.withCStructBufferPointer { ptr_viewports in
            self.commandPool.device.dispatchTable.vkCmdSetViewport(self.handle, firstViewport, UInt32(ptr_viewports.count), ptr_viewports.baseAddress)
        }
    }

    public func setScissor(firstScissor: UInt32, scissors: Array<Rect2D>) -> Void {
        scissors.withCStructBufferPointer { ptr_scissors in
            self.commandPool.device.dispatchTable.vkCmdSetScissor(self.handle, firstScissor, UInt32(ptr_scissors.count), ptr_scissors.baseAddress)
        }
    }

    public func setLineWidth(lineWidth: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineWidth(self.handle, lineWidth)
    }

    public func setDepthBias(depthBiasConstantFactor: Float, depthBiasClamp: Float, depthBiasSlopeFactor: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBias(self.handle, depthBiasConstantFactor, depthBiasClamp, depthBiasSlopeFactor)
    }

    public func setBlendConstants(blendConstants: (Float, Float, Float, Float)) -> Void {
        withUnsafeBytes(of: blendConstants) { ptr_blendConstants in
            self.commandPool.device.dispatchTable.vkCmdSetBlendConstants(self.handle, ptr_blendConstants.bindMemory(to: Float.self).baseAddress)
        }
    }

    public func setDepthBounds(minDepthBounds: Float, maxDepthBounds: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBounds(self.handle, minDepthBounds, maxDepthBounds)
    }

    public func setStencilCompareMask(faceMask: StencilFaceFlags, compareMask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilCompareMask(self.handle, faceMask.rawValue, compareMask)
    }

    public func setStencilWriteMask(faceMask: StencilFaceFlags, writeMask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilWriteMask(self.handle, faceMask.rawValue, writeMask)
    }

    public func setStencilReference(faceMask: StencilFaceFlags, reference: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilReference(self.handle, faceMask.rawValue, reference)
    }

    public func bindDescriptorSets(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, descriptorSets: Array<DescriptorSet?>, dynamicOffsets: Array<UInt32> = []) -> Void {
        descriptorSets.map{ $0?.handle }.withUnsafeBufferPointer { ptr_descriptorSets in
            dynamicOffsets.withUnsafeBufferPointer { ptr_dynamicOffsets in
                self.commandPool.device.dispatchTable.vkCmdBindDescriptorSets(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, firstSet, UInt32(ptr_descriptorSets.count), ptr_descriptorSets.baseAddress, UInt32(ptr_dynamicOffsets.count), ptr_dynamicOffsets.baseAddress)
            }
        }
    }

    public func bindIndexBuffer(buffer: Buffer? = nil, offset: VkDeviceSize, indexType: IndexType) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer(self.handle, buffer?.handle, offset, VkIndexType(rawValue: VkIndexType.RawValue(indexType.rawValue)))
    }

    public func bindVertexBuffers(firstBinding: UInt32, buffers: Array<Buffer?>, offsets: Array<VkDeviceSize>) -> Void {
        buffers.map{ $0?.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                self.commandPool.device.dispatchTable.vkCmdBindVertexBuffers(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress, ptr_offsets.baseAddress)
            }
        }
    }

    public func draw(vertexCount: UInt32, instanceCount: UInt32, firstVertex: UInt32, firstInstance: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDraw(self.handle, vertexCount, instanceCount, firstVertex, firstInstance)
    }

    public func drawIndexed(indexCount: UInt32, instanceCount: UInt32, firstIndex: UInt32, vertexOffset: Int32, firstInstance: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndexed(self.handle, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance)
    }

    public func drawMultiEXT(_ vertexInfo: Array<MultiDrawInfoEXT> = [], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32) -> Void {
        vertexInfo.withCStructBufferPointer { ptr_vertexInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawMultiEXT(self.handle, UInt32(ptr_vertexInfo.count), ptr_vertexInfo.baseAddress, instanceCount, firstInstance, stride)
        }
    }

    public func drawMultiIndexedEXT(_ indexInfo: Array<MultiDrawIndexedInfoEXT> = [], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32, vertexOffset: UnsafePointer<Int32>? = nil) -> Void {
        indexInfo.withCStructBufferPointer { ptr_indexInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawMultiIndexedEXT(self.handle, UInt32(ptr_indexInfo.count), ptr_indexInfo.baseAddress, instanceCount, firstInstance, stride, vertexOffset)
        }
    }

    public func drawIndirect(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndirect(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func drawIndexedIndirect(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirect(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func dispatch(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatch(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func dispatchIndirect(buffer: Buffer, offset: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatchIndirect(self.handle, buffer.handle, offset)
    }

    public func subpassShadingHUAWEI() -> Void {
        self.commandPool.device.dispatchTable.vkCmdSubpassShadingHUAWEI(self.handle)
    }

    public func drawClusterHUAWEI(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawClusterHUAWEI(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func drawClusterIndirectHUAWEI(buffer: Buffer, offset: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawClusterIndirectHUAWEI(self.handle, buffer.handle, offset)
    }

    public func updatePipelineIndirectBufferNV(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) -> Void {
        self.commandPool.device.dispatchTable.vkCmdUpdatePipelineIndirectBufferNV(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle)
    }

    public func copyBuffer(srcBuffer: Buffer, dstBuffer: Buffer, regions: Array<BufferCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyBuffer(self.handle, srcBuffer.handle, dstBuffer.handle, UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func copyImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func blitImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageBlit>, filter: Filter) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdBlitImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress, VkFilter(rawValue: VkFilter.RawValue(filter.rawValue)))
        }
    }

    public func copyBufferToImage(srcBuffer: Buffer, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<BufferImageCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyBufferToImage(self.handle, srcBuffer.handle, dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func copyImageToBuffer(srcImage: Image, srcImageLayout: ImageLayout, dstBuffer: Buffer, regions: Array<BufferImageCopy>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToBuffer(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstBuffer.handle, UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func copyMemoryIndirectNV(copyBufferAddress: VkDeviceAddress, copyCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyMemoryIndirectNV(self.handle, copyBufferAddress, copyCount, stride)
    }

    public func copyMemoryIndirectKHR(_ copyMemoryIndirectInfo: (some Chainable<CopyMemoryIndirectInfoKHR>)) -> Void {
        copyMemoryIndirectInfo.withCStruct { ptr_copyMemoryIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryIndirectKHR(self.handle, ptr_copyMemoryIndirectInfo)
        }
    }

    public func copyMemoryIndirectKHR(_ copyMemoryIndirectInfo: CopyMemoryIndirectInfoKHR) -> Void {
        copyMemoryIndirectInfo.withCStruct { ptr_copyMemoryIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryIndirectKHR(self.handle, ptr_copyMemoryIndirectInfo)
        }
    }

    public func copyMemoryToImageIndirectNV(copyBufferAddress: VkDeviceAddress, stride: UInt32, dstImage: Image, dstImageLayout: ImageLayout, imageSubresources: Array<ImageSubresourceLayers>) -> Void {
        imageSubresources.withCStructBufferPointer { ptr_imageSubresources in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageIndirectNV(self.handle, copyBufferAddress, UInt32(ptr_imageSubresources.count), stride, dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), ptr_imageSubresources.baseAddress)
        }
    }

    public func copyMemoryToImageIndirectKHR(_ copyMemoryToImageIndirectInfo: (some Chainable<CopyMemoryToImageIndirectInfoKHR>)) -> Void {
        copyMemoryToImageIndirectInfo.withCStruct { ptr_copyMemoryToImageIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageIndirectKHR(self.handle, ptr_copyMemoryToImageIndirectInfo)
        }
    }

    public func copyMemoryToImageIndirectKHR(_ copyMemoryToImageIndirectInfo: CopyMemoryToImageIndirectInfoKHR) -> Void {
        copyMemoryToImageIndirectInfo.withCStruct { ptr_copyMemoryToImageIndirectInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageIndirectKHR(self.handle, ptr_copyMemoryToImageIndirectInfo)
        }
    }

    public func updateBuffer(dstBuffer: Buffer, dstOffset: VkDeviceSize, dataSize: VkDeviceSize, data: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdUpdateBuffer(self.handle, dstBuffer.handle, dstOffset, dataSize, data)
    }

    public func fillBuffer(dstBuffer: Buffer, dstOffset: VkDeviceSize, size: VkDeviceSize, data: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdFillBuffer(self.handle, dstBuffer.handle, dstOffset, size, data)
    }

    public func clearColorImage(image: Image, imageLayout: ImageLayout, color: UnsafePointer<VkClearColorValue>, ranges: Array<ImageSubresourceRange>) -> Void {
        ranges.withCStructBufferPointer { ptr_ranges in
            self.commandPool.device.dispatchTable.vkCmdClearColorImage(self.handle, image.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)), color, UInt32(ptr_ranges.count), ptr_ranges.baseAddress)
        }
    }

    public func clearDepthStencilImage(image: Image, imageLayout: ImageLayout, depthStencil: ClearDepthStencilValue, ranges: Array<ImageSubresourceRange>) -> Void {
        depthStencil.withCStruct { ptr_depthStencil in
            ranges.withCStructBufferPointer { ptr_ranges in
                self.commandPool.device.dispatchTable.vkCmdClearDepthStencilImage(self.handle, image.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)), ptr_depthStencil, UInt32(ptr_ranges.count), ptr_ranges.baseAddress)
            }
        }
    }

    public func clearAttachments(attachments: Array<ClearAttachment>, rects: Array<ClearRect>) -> Void {
        attachments.withCStructBufferPointer { ptr_attachments in
            rects.withCStructBufferPointer { ptr_rects in
                self.commandPool.device.dispatchTable.vkCmdClearAttachments(self.handle, UInt32(ptr_attachments.count), ptr_attachments.baseAddress, UInt32(ptr_rects.count), ptr_rects.baseAddress)
            }
        }
    }

    public func resolveImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageResolve>) -> Void {
        regions.withCStructBufferPointer { ptr_regions in
            self.commandPool.device.dispatchTable.vkCmdResolveImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func setEvent(event: Event, stageMask: PipelineStageFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetEvent(self.handle, event.handle, stageMask.rawValue)
    }

    public func resetEvent(event: Event, stageMask: PipelineStageFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdResetEvent(self.handle, event.handle, stageMask.rawValue)
    }

    public func waitEvents(events: Array<Event>, srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], memoryBarriers: (AnyChainableArray<MemoryBarrier>), bufferMemoryBarriers: (AnyChainableArray<BufferMemoryBarrier>), imageMemoryBarriers: (AnyChainableArray<ImageMemoryBarrier>)) -> Void {
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

    public func waitEvents(events: Array<Event>, srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], memoryBarriers: Array<MemoryBarrier> = [], bufferMemoryBarriers: Array<BufferMemoryBarrier> = [], imageMemoryBarriers: Array<ImageMemoryBarrier> = []) -> Void {
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

    public func pipelineBarrier(srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], dependencyFlags: DependencyFlags = [], memoryBarriers: (AnyChainableArray<MemoryBarrier>), bufferMemoryBarriers: (AnyChainableArray<BufferMemoryBarrier>), imageMemoryBarriers: (AnyChainableArray<ImageMemoryBarrier>)) -> Void {
        memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
            bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                    self.commandPool.device.dispatchTable.vkCmdPipelineBarrier(self.handle, srcStageMask.rawValue, dstStageMask.rawValue, dependencyFlags.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                }
            }
        }
    }

    public func pipelineBarrier(srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], dependencyFlags: DependencyFlags = [], memoryBarriers: Array<MemoryBarrier> = [], bufferMemoryBarriers: Array<BufferMemoryBarrier> = [], imageMemoryBarriers: Array<ImageMemoryBarrier> = []) -> Void {
        memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
            bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                    self.commandPool.device.dispatchTable.vkCmdPipelineBarrier(self.handle, srcStageMask.rawValue, dstStageMask.rawValue, dependencyFlags.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                }
            }
        }
    }

    public func beginQuery(queryPool: QueryPool, query: UInt32, flags: QueryControlFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBeginQuery(self.handle, queryPool.handle, query, flags.rawValue)
    }

    public func endQuery(queryPool: QueryPool, query: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndQuery(self.handle, queryPool.handle, query)
    }

    public func beginConditionalRenderingEXT(conditionalRenderingBegin: (some Chainable<ConditionalRenderingBeginInfoEXT>)) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRenderingEXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func beginConditionalRenderingEXT(conditionalRenderingBegin: ConditionalRenderingBeginInfoEXT) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRenderingEXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func endConditionalRenderingEXT() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndConditionalRenderingEXT(self.handle)
    }

    public func beginCustomResolveEXT(_ beginCustomResolveInfo: (some Chainable<BeginCustomResolveInfoEXT>)) -> Void {
        beginCustomResolveInfo.withCStruct { ptr_beginCustomResolveInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginCustomResolveEXT(self.handle, ptr_beginCustomResolveInfo)
        }
    }

    public func beginCustomResolveEXT(_ beginCustomResolveInfo: BeginCustomResolveInfoEXT? = nil) -> Void {
        beginCustomResolveInfo.withOptionalCStruct { ptr_beginCustomResolveInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginCustomResolveEXT(self.handle, ptr_beginCustomResolveInfo)
        }
    }

    public func resetQueryPool(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdResetQueryPool(self.handle, queryPool.handle, firstQuery, queryCount)
    }

    public func writeTimestamp(pipelineStage: PipelineStageFlags, queryPool: QueryPool, query: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteTimestamp(self.handle, VkPipelineStageFlagBits(rawValue: VkPipelineStageFlagBits.RawValue(pipelineStage.rawValue)), queryPool.handle, query)
    }

    public func copyQueryPoolResults(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dstBuffer: Buffer, dstOffset: VkDeviceSize, stride: VkDeviceSize, flags: QueryResultFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyQueryPoolResults(self.handle, queryPool.handle, firstQuery, queryCount, dstBuffer.handle, dstOffset, stride, flags.rawValue)
    }

    public func pushConstants(layout: PipelineLayout, stageFlags: ShaderStageFlags, offset: UInt32, size: UInt32, values: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdPushConstants(self.handle, layout.handle, stageFlags.rawValue, offset, size, values)
    }

    public func beginRenderPass(renderPassBegin: (some Chainable<RenderPassBeginInfo>), contents: SubpassContents) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginRenderPass(self.handle, ptr_renderPassBegin, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
        }
    }

    public func beginRenderPass(renderPassBegin: RenderPassBeginInfo, contents: SubpassContents) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginRenderPass(self.handle, ptr_renderPassBegin, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
        }
    }

    public func nextSubpass(contents: SubpassContents) -> Void {
        self.commandPool.device.dispatchTable.vkCmdNextSubpass(self.handle, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
    }

    public func endRenderPass() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndRenderPass(self.handle)
    }

    public func executeCommands(commandBuffers: Array<CommandBuffer>) -> Void {
        commandBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_commandBuffers in
            self.commandPool.device.dispatchTable.vkCmdExecuteCommands(self.handle, UInt32(ptr_commandBuffers.count), ptr_commandBuffers.baseAddress)
        }
    }

    public func debugMarkerBeginEXT(_ markerInfo: (some Chainable<DebugMarkerMarkerInfoEXT>)) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerBeginEXT(self.handle, ptr_markerInfo)
        }
    }

    public func debugMarkerBeginEXT(_ markerInfo: DebugMarkerMarkerInfoEXT) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerBeginEXT(self.handle, ptr_markerInfo)
        }
    }

    public func debugMarkerEndEXT() -> Void {
        self.commandPool.device.dispatchTable.vkCmdDebugMarkerEndEXT(self.handle)
    }

    public func debugMarkerInsertEXT(_ markerInfo: (some Chainable<DebugMarkerMarkerInfoEXT>)) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerInsertEXT(self.handle, ptr_markerInfo)
        }
    }

    public func debugMarkerInsertEXT(_ markerInfo: DebugMarkerMarkerInfoEXT) -> Void {
        markerInfo.withCStruct { ptr_markerInfo in
            self.commandPool.device.dispatchTable.vkCmdDebugMarkerInsertEXT(self.handle, ptr_markerInfo)
        }
    }

    public func executeGeneratedCommandsNV(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoNV>), isPreprocessed: Bool) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsNV(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func executeGeneratedCommandsNV(_ generatedCommandsInfo: GeneratedCommandsInfoNV, isPreprocessed: Bool) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsNV(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func preprocessGeneratedCommandsNV(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoNV>)) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsNV(self.handle, ptr_generatedCommandsInfo)
        }
    }

    public func preprocessGeneratedCommandsNV(_ generatedCommandsInfo: GeneratedCommandsInfoNV) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsNV(self.handle, ptr_generatedCommandsInfo)
        }
    }

    public func bindPipelineShaderGroupNV(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline, groupIndex: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindPipelineShaderGroupNV(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle, groupIndex)
    }

    public func executeGeneratedCommandsEXT(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoEXT>), isPreprocessed: Bool) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsEXT(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func executeGeneratedCommandsEXT(_ generatedCommandsInfo: GeneratedCommandsInfoEXT, isPreprocessed: Bool) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdExecuteGeneratedCommandsEXT(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func preprocessGeneratedCommandsEXT(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoEXT>), stateCommandBuffer: CommandBuffer) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsEXT(self.handle, ptr_generatedCommandsInfo, stateCommandBuffer.handle)
        }
    }

    public func preprocessGeneratedCommandsEXT(_ generatedCommandsInfo: GeneratedCommandsInfoEXT, stateCommandBuffer: CommandBuffer) -> Void {
        generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            self.commandPool.device.dispatchTable.vkCmdPreprocessGeneratedCommandsEXT(self.handle, ptr_generatedCommandsInfo, stateCommandBuffer.handle)
        }
    }

    public func pushDescriptorSet(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32, descriptorWrites: (AnyChainableArray<WriteDescriptorSet>)) -> Void {
        descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress)
        }
    }

    public func pushDescriptorSet(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32, descriptorWrites: Array<WriteDescriptorSet>) -> Void {
        descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress)
        }
    }

    public func setDeviceMask(deviceMask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDeviceMask(self.handle, deviceMask)
    }

    public func dispatchBase(baseGroupX: UInt32, baseGroupY: UInt32, baseGroupZ: UInt32, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatchBase(self.handle, baseGroupX, baseGroupY, baseGroupZ, groupCountX, groupCountY, groupCountZ)
    }

    public func pushDescriptorSetWithTemplate(descriptorUpdateTemplate: DescriptorUpdateTemplate, layout: PipelineLayout, set: UInt32, data: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdPushDescriptorSetWithTemplate(self.handle, descriptorUpdateTemplate.handle, layout.handle, set, data)
    }

    public func setViewportWScalingNV(firstViewport: UInt32, viewportWScalings: Array<ViewportWScalingNV>) -> Void {
        viewportWScalings.withCStructBufferPointer { ptr_viewportWScalings in
            self.commandPool.device.dispatchTable.vkCmdSetViewportWScalingNV(self.handle, firstViewport, UInt32(ptr_viewportWScalings.count), ptr_viewportWScalings.baseAddress)
        }
    }

    public func setDiscardRectangleEXT(firstDiscardRectangle: UInt32, discardRectangles: Array<Rect2D>) -> Void {
        discardRectangles.withCStructBufferPointer { ptr_discardRectangles in
            self.commandPool.device.dispatchTable.vkCmdSetDiscardRectangleEXT(self.handle, firstDiscardRectangle, UInt32(ptr_discardRectangles.count), ptr_discardRectangles.baseAddress)
        }
    }

    public func setDiscardRectangleEnableEXT(discardRectangleEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDiscardRectangleEnableEXT(self.handle, VkBool32(discardRectangleEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDiscardRectangleModeEXT(discardRectangleMode: DiscardRectangleModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDiscardRectangleModeEXT(self.handle, VkDiscardRectangleModeEXT(rawValue: VkDiscardRectangleModeEXT.RawValue(discardRectangleMode.rawValue)))
    }

    public func setSampleLocationsEXT(_ sampleLocationsInfo: (some Chainable<SampleLocationsInfoEXT>)) -> Void {
        sampleLocationsInfo.withCStruct { ptr_sampleLocationsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetSampleLocationsEXT(self.handle, ptr_sampleLocationsInfo)
        }
    }

    public func setSampleLocationsEXT(_ sampleLocationsInfo: SampleLocationsInfoEXT) -> Void {
        sampleLocationsInfo.withCStruct { ptr_sampleLocationsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetSampleLocationsEXT(self.handle, ptr_sampleLocationsInfo)
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func endDebugUtilsLabelEXT() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndDebugUtilsLabelEXT(self.handle)
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        labelInfo.withCStruct { ptr_labelInfo in
            self.commandPool.device.dispatchTable.vkCmdInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func writeBufferMarkerAMD(pipelineStage: PipelineStageFlags, dstBuffer: Buffer, dstOffset: VkDeviceSize, marker: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteBufferMarkerAMD(self.handle, VkPipelineStageFlagBits(rawValue: VkPipelineStageFlagBits.RawValue(pipelineStage.rawValue)), dstBuffer.handle, dstOffset, marker)
    }

    public func beginRenderPass2(_ subpassBeginInfo: (some Chainable<SubpassBeginInfo>), renderPassBegin: (some Chainable<RenderPassBeginInfo>)) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
                self.commandPool.device.dispatchTable.vkCmdBeginRenderPass2(self.handle, ptr_renderPassBegin, ptr_subpassBeginInfo)
            }
        }
    }

    public func beginRenderPass2(_ subpassBeginInfo: SubpassBeginInfo, renderPassBegin: RenderPassBeginInfo) -> Void {
        renderPassBegin.withCStruct { ptr_renderPassBegin in
            subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
                self.commandPool.device.dispatchTable.vkCmdBeginRenderPass2(self.handle, ptr_renderPassBegin, ptr_subpassBeginInfo)
            }
        }
    }

    public func nextSubpass2(_ subpassBeginInfo: (some Chainable<SubpassBeginInfo>), _ subpassEndInfo: (some Chainable<SubpassEndInfo>)) -> Void {
        subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
            subpassEndInfo.withCStruct { ptr_subpassEndInfo in
                self.commandPool.device.dispatchTable.vkCmdNextSubpass2(self.handle, ptr_subpassBeginInfo, ptr_subpassEndInfo)
            }
        }
    }

    public func nextSubpass2(_ subpassBeginInfo: SubpassBeginInfo, _ subpassEndInfo: SubpassEndInfo = SubpassEndInfo()) -> Void {
        subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
            subpassEndInfo.withCStruct { ptr_subpassEndInfo in
                self.commandPool.device.dispatchTable.vkCmdNextSubpass2(self.handle, ptr_subpassBeginInfo, ptr_subpassEndInfo)
            }
        }
    }

    public func endRenderPass2(_ subpassEndInfo: (some Chainable<SubpassEndInfo>)) -> Void {
        subpassEndInfo.withCStruct { ptr_subpassEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRenderPass2(self.handle, ptr_subpassEndInfo)
        }
    }

    public func endRenderPass2(_ subpassEndInfo: SubpassEndInfo = SubpassEndInfo()) -> Void {
        subpassEndInfo.withCStruct { ptr_subpassEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRenderPass2(self.handle, ptr_subpassEndInfo)
        }
    }

    public func drawIndirectCount(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndirectCount(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func drawIndexedIndirectCount(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirectCount(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func setCheckpointNV(checkpointMarker: UnsafeRawPointer) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCheckpointNV(self.handle, checkpointMarker)
    }

    public func bindTransformFeedbackBuffersEXT(firstBinding: UInt32, buffers: Array<Buffer>, offsets: Array<VkDeviceSize>, sizes: Array<VkDeviceSize>? = nil) -> Void {
        buffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                sizes.withOptionalUnsafeBufferPointer { ptr_sizes in
                    self.commandPool.device.dispatchTable.vkCmdBindTransformFeedbackBuffersEXT(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress, ptr_offsets.baseAddress, ptr_sizes.baseAddress)
                }
            }
        }
    }

    public func beginTransformFeedbackEXT(firstCounterBuffer: UInt32, counterBuffers: Array<Buffer> = [], counterBufferOffsets: Array<VkDeviceSize>? = nil) -> Void {
        counterBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_counterBuffers in
            counterBufferOffsets.withOptionalUnsafeBufferPointer { ptr_counterBufferOffsets in
                self.commandPool.device.dispatchTable.vkCmdBeginTransformFeedbackEXT(self.handle, firstCounterBuffer, UInt32(ptr_counterBuffers.count), ptr_counterBuffers.baseAddress, ptr_counterBufferOffsets.baseAddress)
            }
        }
    }

    public func endTransformFeedbackEXT(firstCounterBuffer: UInt32, counterBuffers: Array<Buffer> = [], counterBufferOffsets: Array<VkDeviceSize>? = nil) -> Void {
        counterBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_counterBuffers in
            counterBufferOffsets.withOptionalUnsafeBufferPointer { ptr_counterBufferOffsets in
                self.commandPool.device.dispatchTable.vkCmdEndTransformFeedbackEXT(self.handle, firstCounterBuffer, UInt32(ptr_counterBuffers.count), ptr_counterBuffers.baseAddress, ptr_counterBufferOffsets.baseAddress)
            }
        }
    }

    public func beginQueryIndexedEXT(queryPool: QueryPool, query: UInt32, flags: QueryControlFlags = [], index: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBeginQueryIndexedEXT(self.handle, queryPool.handle, query, flags.rawValue, index)
    }

    public func endQueryIndexedEXT(queryPool: QueryPool, query: UInt32, index: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndQueryIndexedEXT(self.handle, queryPool.handle, query, index)
    }

    public func drawIndirectByteCountEXT(instanceCount: UInt32, firstInstance: UInt32, counterBuffer: Buffer, counterBufferOffset: VkDeviceSize, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawIndirectByteCountEXT(self.handle, instanceCount, firstInstance, counterBuffer.handle, counterBufferOffset, counterOffset, vertexStride)
    }

    public func setExclusiveScissorNV(firstExclusiveScissor: UInt32, exclusiveScissors: Array<Rect2D>) -> Void {
        exclusiveScissors.withCStructBufferPointer { ptr_exclusiveScissors in
            self.commandPool.device.dispatchTable.vkCmdSetExclusiveScissorNV(self.handle, firstExclusiveScissor, UInt32(ptr_exclusiveScissors.count), ptr_exclusiveScissors.baseAddress)
        }
    }

    public func setExclusiveScissorEnableNV(firstExclusiveScissor: UInt32, exclusiveScissorEnables: Array<Bool>) -> Void {
        exclusiveScissorEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_exclusiveScissorEnables in
            self.commandPool.device.dispatchTable.vkCmdSetExclusiveScissorEnableNV(self.handle, firstExclusiveScissor, UInt32(ptr_exclusiveScissorEnables.count), ptr_exclusiveScissorEnables.baseAddress)
        }
    }

    public func bindShadingRateImageNV(imageView: ImageView? = nil, imageLayout: ImageLayout) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindShadingRateImageNV(self.handle, imageView?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)))
    }

    public func setViewportShadingRatePaletteNV(firstViewport: UInt32, shadingRatePalettes: Array<ShadingRatePaletteNV>) -> Void {
        shadingRatePalettes.withCStructBufferPointer { ptr_shadingRatePalettes in
            self.commandPool.device.dispatchTable.vkCmdSetViewportShadingRatePaletteNV(self.handle, firstViewport, UInt32(ptr_shadingRatePalettes.count), ptr_shadingRatePalettes.baseAddress)
        }
    }

    public func setCoarseSampleOrderNV(sampleOrderType: CoarseSampleOrderTypeNV, customSampleOrders: Array<CoarseSampleOrderCustomNV> = []) -> Void {
        customSampleOrders.withCStructBufferPointer { ptr_customSampleOrders in
            self.commandPool.device.dispatchTable.vkCmdSetCoarseSampleOrderNV(self.handle, VkCoarseSampleOrderTypeNV(rawValue: VkCoarseSampleOrderTypeNV.RawValue(sampleOrderType.rawValue)), UInt32(ptr_customSampleOrders.count), ptr_customSampleOrders.baseAddress)
        }
    }

    public func drawMeshTasksNV(taskCount: UInt32, firstTask: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksNV(self.handle, taskCount, firstTask)
    }

    public func drawMeshTasksIndirectNV(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectNV(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func drawMeshTasksIndirectCountNV(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCountNV(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func drawMeshTasksEXT(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksEXT(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func drawMeshTasksIndirectEXT(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectEXT(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func drawMeshTasksIndirectCountEXT(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCountEXT(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func bindInvocationMaskHUAWEI(imageView: ImageView? = nil, imageLayout: ImageLayout) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindInvocationMaskHUAWEI(self.handle, imageView?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)))
    }

    public func copyAccelerationStructureNV(dst: AccelerationStructureNV, src: AccelerationStructureNV, mode: CopyAccelerationStructureModeKHR) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureNV(self.handle, dst.handle, src.handle, VkCopyAccelerationStructureModeKHR(rawValue: VkCopyAccelerationStructureModeKHR.RawValue(mode.rawValue)))
    }

    public func copyAccelerationStructureKHR(_ info: (some Chainable<CopyAccelerationStructureInfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func copyAccelerationStructureKHR(_ info: CopyAccelerationStructureInfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: (some Chainable<CopyAccelerationStructureToMemoryInfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureToMemoryKHR(self.handle, ptr_info)
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: CopyAccelerationStructureToMemoryInfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyAccelerationStructureToMemoryKHR(self.handle, ptr_info)
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: (some Chainable<CopyMemoryToAccelerationStructureInfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: CopyMemoryToAccelerationStructureInfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func writeAccelerationStructuresPropertiesKHR(accelerationStructures: Array<AccelerationStructureKHR>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            self.commandPool.device.dispatchTable.vkCmdWriteAccelerationStructuresPropertiesKHR(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func writeAccelerationStructuresPropertiesNV(accelerationStructures: Array<AccelerationStructureNV>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            self.commandPool.device.dispatchTable.vkCmdWriteAccelerationStructuresPropertiesNV(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func buildAccelerationStructureNV(_ info: (some Chainable<AccelerationStructureInfoNV>), instanceData: Buffer? = nil, instanceOffset: VkDeviceSize, update: Bool, dst: AccelerationStructureNV, src: AccelerationStructureNV? = nil, scratch: Buffer, scratchOffset: VkDeviceSize) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructureNV(self.handle, ptr_info, instanceData?.handle, instanceOffset, VkBool32(update ? VK_TRUE : VK_FALSE), dst.handle, src?.handle, scratch.handle, scratchOffset)
        }
    }

    public func buildAccelerationStructureNV(_ info: AccelerationStructureInfoNV, instanceData: Buffer? = nil, instanceOffset: VkDeviceSize, update: Bool, dst: AccelerationStructureNV, src: AccelerationStructureNV? = nil, scratch: Buffer, scratchOffset: VkDeviceSize) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructureNV(self.handle, ptr_info, instanceData?.handle, instanceOffset, VkBool32(update ? VK_TRUE : VK_FALSE), dst.handle, src?.handle, scratch.handle, scratchOffset)
        }
    }

    public func traceRaysKHR(raygenShaderBindingTable: StridedDeviceAddressRegionKHR, missShaderBindingTable: StridedDeviceAddressRegionKHR, hitShaderBindingTable: StridedDeviceAddressRegionKHR, callableShaderBindingTable: StridedDeviceAddressRegionKHR, width: UInt32, height: UInt32, depth: UInt32) -> Void {
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

    public func traceRaysNV(raygenShaderBindingTableBuffer: Buffer, raygenShaderBindingOffset: VkDeviceSize, missShaderBindingTableBuffer: Buffer? = nil, missShaderBindingOffset: VkDeviceSize, missShaderBindingStride: VkDeviceSize, hitShaderBindingTableBuffer: Buffer? = nil, hitShaderBindingOffset: VkDeviceSize, hitShaderBindingStride: VkDeviceSize, callableShaderBindingTableBuffer: Buffer? = nil, callableShaderBindingOffset: VkDeviceSize, callableShaderBindingStride: VkDeviceSize, width: UInt32, height: UInt32, depth: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdTraceRaysNV(self.handle, raygenShaderBindingTableBuffer.handle, raygenShaderBindingOffset, missShaderBindingTableBuffer?.handle, missShaderBindingOffset, missShaderBindingStride, hitShaderBindingTableBuffer?.handle, hitShaderBindingOffset, hitShaderBindingStride, callableShaderBindingTableBuffer?.handle, callableShaderBindingOffset, callableShaderBindingStride, width, height, depth)
    }

    public func traceRaysIndirectKHR(raygenShaderBindingTable: StridedDeviceAddressRegionKHR, missShaderBindingTable: StridedDeviceAddressRegionKHR, hitShaderBindingTable: StridedDeviceAddressRegionKHR, callableShaderBindingTable: StridedDeviceAddressRegionKHR, indirectDeviceAddress: VkDeviceAddress) -> Void {
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

    public func traceRaysIndirect2KHR(indirectDeviceAddress: VkDeviceAddress) -> Void {
        self.commandPool.device.dispatchTable.vkCmdTraceRaysIndirect2KHR(self.handle, indirectDeviceAddress)
    }

    public func buildClusterAccelerationStructureIndirectNV(_ commandInfos: (some Chainable<ClusterAccelerationStructureCommandsInfoNV>)) -> Void {
        commandInfos.withCStruct { ptr_commandInfos in
            self.commandPool.device.dispatchTable.vkCmdBuildClusterAccelerationStructureIndirectNV(self.handle, ptr_commandInfos)
        }
    }

    public func buildClusterAccelerationStructureIndirectNV(_ commandInfos: ClusterAccelerationStructureCommandsInfoNV) -> Void {
        commandInfos.withCStruct { ptr_commandInfos in
            self.commandPool.device.dispatchTable.vkCmdBuildClusterAccelerationStructureIndirectNV(self.handle, ptr_commandInfos)
        }
    }

    public func setRayTracingPipelineStackSizeKHR(pipelineStackSize: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRayTracingPipelineStackSizeKHR(self.handle, pipelineStackSize)
    }

    public func setPerformanceMarkerINTEL(_ markerInfo: (some Chainable<PerformanceMarkerInfoINTEL>)) throws(Result) -> Void {
        try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceMarkerINTEL(_ markerInfo: PerformanceMarkerInfoINTEL) throws(Result) -> Void {
        try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceStreamMarkerINTEL(_ markerInfo: (some Chainable<PerformanceStreamMarkerInfoINTEL>)) throws(Result) -> Void {
        try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceStreamMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceStreamMarkerINTEL(_ markerInfo: PerformanceStreamMarkerInfoINTEL) throws(Result) -> Void {
        try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceStreamMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceOverrideINTEL(_ overrideInfo: (some Chainable<PerformanceOverrideInfoINTEL>)) throws(Result) -> Void {
        try overrideInfo.withCStruct { ptr_overrideInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceOverrideINTEL(self.handle, ptr_overrideInfo)
            )
        }
    }

    public func setPerformanceOverrideINTEL(_ overrideInfo: PerformanceOverrideInfoINTEL) throws(Result) -> Void {
        try overrideInfo.withCStruct { ptr_overrideInfo throws(Result) in
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdSetPerformanceOverrideINTEL(self.handle, ptr_overrideInfo)
            )
        }
    }

    public func setLineStipple(lineStippleFactor: UInt32, lineStipplePattern: UInt16) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineStipple(self.handle, lineStippleFactor, lineStipplePattern)
    }

    public func buildAccelerationStructuresKHR(_ infos: (AnyChainableArray<AccelerationStructureBuildGeometryInfoKHR>), _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructuresKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
        }
    }

    public func buildAccelerationStructuresKHR(_ infos: Array<AccelerationStructureBuildGeometryInfoKHR>, _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructuresKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
        }
    }

    public func buildAccelerationStructuresIndirectKHR(_ infos: (AnyChainableArray<AccelerationStructureBuildGeometryInfoKHR>), indirectDeviceAddresses: Array<VkDeviceAddress>, indirectStrides: Array<UInt32>, maxPrimitiveCounts: UnsafePointer<UnsafePointer<UInt32>?>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            indirectDeviceAddresses.withUnsafeBufferPointer { ptr_indirectDeviceAddresses in
                indirectStrides.withUnsafeBufferPointer { ptr_indirectStrides in
                    self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructuresIndirectKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, ptr_indirectDeviceAddresses.baseAddress, ptr_indirectStrides.baseAddress, maxPrimitiveCounts)
                }
            }
        }
    }

    public func buildAccelerationStructuresIndirectKHR(_ infos: Array<AccelerationStructureBuildGeometryInfoKHR>, indirectDeviceAddresses: Array<VkDeviceAddress>, indirectStrides: Array<UInt32>, maxPrimitiveCounts: UnsafePointer<UnsafePointer<UInt32>?>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            indirectDeviceAddresses.withUnsafeBufferPointer { ptr_indirectDeviceAddresses in
                indirectStrides.withUnsafeBufferPointer { ptr_indirectStrides in
                    self.commandPool.device.dispatchTable.vkCmdBuildAccelerationStructuresIndirectKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, ptr_indirectDeviceAddresses.baseAddress, ptr_indirectStrides.baseAddress, maxPrimitiveCounts)
                }
            }
        }
    }

    public func setCullMode(cullMode: CullModeFlags = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCullMode(self.handle, cullMode.rawValue)
    }

    public func setFrontFace(frontFace: FrontFace) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetFrontFace(self.handle, VkFrontFace(rawValue: VkFrontFace.RawValue(frontFace.rawValue)))
    }

    public func setPrimitiveTopology(primitiveTopology: PrimitiveTopology) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPrimitiveTopology(self.handle, VkPrimitiveTopology(rawValue: VkPrimitiveTopology.RawValue(primitiveTopology.rawValue)))
    }

    public func setViewportWithCount(viewports: Array<Viewport>) -> Void {
        viewports.withCStructBufferPointer { ptr_viewports in
            self.commandPool.device.dispatchTable.vkCmdSetViewportWithCount(self.handle, UInt32(ptr_viewports.count), ptr_viewports.baseAddress)
        }
    }

    public func setScissorWithCount(scissors: Array<Rect2D>) -> Void {
        scissors.withCStructBufferPointer { ptr_scissors in
            self.commandPool.device.dispatchTable.vkCmdSetScissorWithCount(self.handle, UInt32(ptr_scissors.count), ptr_scissors.baseAddress)
        }
    }

    public func bindIndexBuffer2(buffer: Buffer? = nil, offset: VkDeviceSize, size: VkDeviceSize, indexType: IndexType) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer2(self.handle, buffer?.handle, offset, size, VkIndexType(rawValue: VkIndexType.RawValue(indexType.rawValue)))
    }

    public func bindVertexBuffers2(firstBinding: UInt32, buffers: Array<Buffer?>, offsets: Array<VkDeviceSize>, sizes: Array<VkDeviceSize>? = nil, strides: Array<VkDeviceSize>? = nil) -> Void {
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

    public func setDepthTestEnable(depthTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthTestEnable(self.handle, VkBool32(depthTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthWriteEnable(depthWriteEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthWriteEnable(self.handle, VkBool32(depthWriteEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthCompareOp(depthCompareOp: CompareOp) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthCompareOp(self.handle, VkCompareOp(rawValue: VkCompareOp.RawValue(depthCompareOp.rawValue)))
    }

    public func setDepthBoundsTestEnable(depthBoundsTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBoundsTestEnable(self.handle, VkBool32(depthBoundsTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func setStencilTestEnable(stencilTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilTestEnable(self.handle, VkBool32(stencilTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func setStencilOp(faceMask: StencilFaceFlags, failOp: StencilOp, passOp: StencilOp, depthFailOp: StencilOp, compareOp: CompareOp) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetStencilOp(self.handle, faceMask.rawValue, VkStencilOp(rawValue: VkStencilOp.RawValue(failOp.rawValue)), VkStencilOp(rawValue: VkStencilOp.RawValue(passOp.rawValue)), VkStencilOp(rawValue: VkStencilOp.RawValue(depthFailOp.rawValue)), VkCompareOp(rawValue: VkCompareOp.RawValue(compareOp.rawValue)))
    }

    public func setPatchControlPointsEXT(patchControlPoints: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPatchControlPointsEXT(self.handle, patchControlPoints)
    }

    public func setRasterizerDiscardEnable(rasterizerDiscardEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRasterizerDiscardEnable(self.handle, VkBool32(rasterizerDiscardEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthBiasEnable(depthBiasEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthBiasEnable(self.handle, VkBool32(depthBiasEnable ? VK_TRUE : VK_FALSE))
    }

    public func setLogicOpEXT(logicOp: LogicOp) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLogicOpEXT(self.handle, VkLogicOp(rawValue: VkLogicOp.RawValue(logicOp.rawValue)))
    }

    public func setPrimitiveRestartEnable(primitiveRestartEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPrimitiveRestartEnable(self.handle, VkBool32(primitiveRestartEnable ? VK_TRUE : VK_FALSE))
    }

    public func setTessellationDomainOriginEXT(domainOrigin: TessellationDomainOrigin) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetTessellationDomainOriginEXT(self.handle, VkTessellationDomainOrigin(rawValue: VkTessellationDomainOrigin.RawValue(domainOrigin.rawValue)))
    }

    public func setDepthClampEnableEXT(depthClampEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthClampEnableEXT(self.handle, VkBool32(depthClampEnable ? VK_TRUE : VK_FALSE))
    }

    public func setPolygonModeEXT(polygonMode: PolygonMode) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetPolygonModeEXT(self.handle, VkPolygonMode(rawValue: VkPolygonMode.RawValue(polygonMode.rawValue)))
    }

    public func setRasterizationSamplesEXT(rasterizationSamples: SampleCountFlags) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRasterizationSamplesEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(rasterizationSamples.rawValue)))
    }

    public func setSampleMaskEXT(samples: SampleCountFlags, sampleMask: UnsafePointer<VkSampleMask>? = nil) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetSampleMaskEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), sampleMask)
    }

    public func setAlphaToCoverageEnableEXT(alphaToCoverageEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetAlphaToCoverageEnableEXT(self.handle, VkBool32(alphaToCoverageEnable ? VK_TRUE : VK_FALSE))
    }

    public func setAlphaToOneEnableEXT(alphaToOneEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetAlphaToOneEnableEXT(self.handle, VkBool32(alphaToOneEnable ? VK_TRUE : VK_FALSE))
    }

    public func setLogicOpEnableEXT(logicOpEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLogicOpEnableEXT(self.handle, VkBool32(logicOpEnable ? VK_TRUE : VK_FALSE))
    }

    public func setColorBlendEnableEXT(firstAttachment: UInt32, colorBlendEnables: Array<Bool>) -> Void {
        colorBlendEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_colorBlendEnables in
            self.commandPool.device.dispatchTable.vkCmdSetColorBlendEnableEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendEnables.count), ptr_colorBlendEnables.baseAddress)
        }
    }

    public func setColorBlendEquationEXT(firstAttachment: UInt32, colorBlendEquations: Array<ColorBlendEquationEXT>) -> Void {
        colorBlendEquations.withCStructBufferPointer { ptr_colorBlendEquations in
            self.commandPool.device.dispatchTable.vkCmdSetColorBlendEquationEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendEquations.count), ptr_colorBlendEquations.baseAddress)
        }
    }

    public func setColorWriteMaskEXT(firstAttachment: UInt32, colorWriteMasks: Array<ColorComponentFlags>) -> Void {
        colorWriteMasks.map{ $0.rawValue }.withUnsafeBufferPointer { ptr_colorWriteMasks in
            self.commandPool.device.dispatchTable.vkCmdSetColorWriteMaskEXT(self.handle, firstAttachment, UInt32(ptr_colorWriteMasks.count), ptr_colorWriteMasks.baseAddress)
        }
    }

    public func setRasterizationStreamEXT(rasterizationStream: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRasterizationStreamEXT(self.handle, rasterizationStream)
    }

    public func setConservativeRasterizationModeEXT(conservativeRasterizationMode: ConservativeRasterizationModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetConservativeRasterizationModeEXT(self.handle, VkConservativeRasterizationModeEXT(rawValue: VkConservativeRasterizationModeEXT.RawValue(conservativeRasterizationMode.rawValue)))
    }

    public func setExtraPrimitiveOverestimationSizeEXT(extraPrimitiveOverestimationSize: Float) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetExtraPrimitiveOverestimationSizeEXT(self.handle, extraPrimitiveOverestimationSize)
    }

    public func setDepthClipEnableEXT(depthClipEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthClipEnableEXT(self.handle, VkBool32(depthClipEnable ? VK_TRUE : VK_FALSE))
    }

    public func setSampleLocationsEnableEXT(sampleLocationsEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetSampleLocationsEnableEXT(self.handle, VkBool32(sampleLocationsEnable ? VK_TRUE : VK_FALSE))
    }

    public func setColorBlendAdvancedEXT(firstAttachment: UInt32, colorBlendAdvanced: Array<ColorBlendAdvancedEXT>) -> Void {
        colorBlendAdvanced.withCStructBufferPointer { ptr_colorBlendAdvanced in
            self.commandPool.device.dispatchTable.vkCmdSetColorBlendAdvancedEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendAdvanced.count), ptr_colorBlendAdvanced.baseAddress)
        }
    }

    public func setProvokingVertexModeEXT(provokingVertexMode: ProvokingVertexModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetProvokingVertexModeEXT(self.handle, VkProvokingVertexModeEXT(rawValue: VkProvokingVertexModeEXT.RawValue(provokingVertexMode.rawValue)))
    }

    public func setLineRasterizationModeEXT(lineRasterizationMode: VkLineRasterizationModeEXT) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineRasterizationModeEXT(self.handle, lineRasterizationMode)
    }

    public func setLineStippleEnableEXT(stippledLineEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetLineStippleEnableEXT(self.handle, VkBool32(stippledLineEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthClipNegativeOneToOneEXT(negativeOneToOne: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetDepthClipNegativeOneToOneEXT(self.handle, VkBool32(negativeOneToOne ? VK_TRUE : VK_FALSE))
    }

    public func setViewportWScalingEnableNV(viewportWScalingEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetViewportWScalingEnableNV(self.handle, VkBool32(viewportWScalingEnable ? VK_TRUE : VK_FALSE))
    }

    public func setViewportSwizzleNV(firstViewport: UInt32, viewportSwizzles: Array<ViewportSwizzleNV>) -> Void {
        viewportSwizzles.withCStructBufferPointer { ptr_viewportSwizzles in
            self.commandPool.device.dispatchTable.vkCmdSetViewportSwizzleNV(self.handle, firstViewport, UInt32(ptr_viewportSwizzles.count), ptr_viewportSwizzles.baseAddress)
        }
    }

    public func setCoverageToColorEnableNV(coverageToColorEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageToColorEnableNV(self.handle, VkBool32(coverageToColorEnable ? VK_TRUE : VK_FALSE))
    }

    public func setCoverageToColorLocationNV(coverageToColorLocation: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageToColorLocationNV(self.handle, coverageToColorLocation)
    }

    public func setCoverageModulationModeNV(coverageModulationMode: CoverageModulationModeNV) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageModulationModeNV(self.handle, VkCoverageModulationModeNV(rawValue: VkCoverageModulationModeNV.RawValue(coverageModulationMode.rawValue)))
    }

    public func setCoverageModulationTableEnableNV(coverageModulationTableEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageModulationTableEnableNV(self.handle, VkBool32(coverageModulationTableEnable ? VK_TRUE : VK_FALSE))
    }

    public func setCoverageModulationTableNV(coverageModulationTable: Array<Float>) -> Void {
        coverageModulationTable.withUnsafeBufferPointer { ptr_coverageModulationTable in
            self.commandPool.device.dispatchTable.vkCmdSetCoverageModulationTableNV(self.handle, UInt32(ptr_coverageModulationTable.count), ptr_coverageModulationTable.baseAddress)
        }
    }

    public func setShadingRateImageEnableNV(shadingRateImageEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetShadingRateImageEnableNV(self.handle, VkBool32(shadingRateImageEnable ? VK_TRUE : VK_FALSE))
    }

    public func setCoverageReductionModeNV(coverageReductionMode: CoverageReductionModeNV) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetCoverageReductionModeNV(self.handle, VkCoverageReductionModeNV(rawValue: VkCoverageReductionModeNV.RawValue(coverageReductionMode.rawValue)))
    }

    public func setRepresentativeFragmentTestEnableNV(representativeFragmentTestEnable: Bool) -> Void {
        self.commandPool.device.dispatchTable.vkCmdSetRepresentativeFragmentTestEnableNV(self.handle, VkBool32(representativeFragmentTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func copyBuffer2(_ copyBufferInfo: (some Chainable<CopyBufferInfo2>)) -> Void {
        copyBufferInfo.withCStruct { ptr_copyBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBuffer2(self.handle, ptr_copyBufferInfo)
        }
    }

    public func copyBuffer2(_ copyBufferInfo: CopyBufferInfo2) -> Void {
        copyBufferInfo.withCStruct { ptr_copyBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBuffer2(self.handle, ptr_copyBufferInfo)
        }
    }

    public func copyImage2(_ copyImageInfo: (some Chainable<CopyImageInfo2>)) -> Void {
        copyImageInfo.withCStruct { ptr_copyImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImage2(self.handle, ptr_copyImageInfo)
        }
    }

    public func copyImage2(_ copyImageInfo: CopyImageInfo2) -> Void {
        copyImageInfo.withCStruct { ptr_copyImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImage2(self.handle, ptr_copyImageInfo)
        }
    }

    public func blitImage2(_ blitImageInfo: (some Chainable<BlitImageInfo2>)) -> Void {
        blitImageInfo.withCStruct { ptr_blitImageInfo in
            self.commandPool.device.dispatchTable.vkCmdBlitImage2(self.handle, ptr_blitImageInfo)
        }
    }

    public func blitImage2(_ blitImageInfo: BlitImageInfo2) -> Void {
        blitImageInfo.withCStruct { ptr_blitImageInfo in
            self.commandPool.device.dispatchTable.vkCmdBlitImage2(self.handle, ptr_blitImageInfo)
        }
    }

    public func copyBufferToImage2(_ copyBufferToImageInfo: (some Chainable<CopyBufferToImageInfo2>)) -> Void {
        copyBufferToImageInfo.withCStruct { ptr_copyBufferToImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBufferToImage2(self.handle, ptr_copyBufferToImageInfo)
        }
    }

    public func copyBufferToImage2(_ copyBufferToImageInfo: CopyBufferToImageInfo2) -> Void {
        copyBufferToImageInfo.withCStruct { ptr_copyBufferToImageInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyBufferToImage2(self.handle, ptr_copyBufferToImageInfo)
        }
    }

    public func copyImageToBuffer2(_ copyImageToBufferInfo: (some Chainable<CopyImageToBufferInfo2>)) -> Void {
        copyImageToBufferInfo.withCStruct { ptr_copyImageToBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToBuffer2(self.handle, ptr_copyImageToBufferInfo)
        }
    }

    public func copyImageToBuffer2(_ copyImageToBufferInfo: CopyImageToBufferInfo2) -> Void {
        copyImageToBufferInfo.withCStruct { ptr_copyImageToBufferInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToBuffer2(self.handle, ptr_copyImageToBufferInfo)
        }
    }

    public func resolveImage2(_ resolveImageInfo: (some Chainable<ResolveImageInfo2>)) -> Void {
        resolveImageInfo.withCStruct { ptr_resolveImageInfo in
            self.commandPool.device.dispatchTable.vkCmdResolveImage2(self.handle, ptr_resolveImageInfo)
        }
    }

    public func resolveImage2(_ resolveImageInfo: ResolveImageInfo2) -> Void {
        resolveImageInfo.withCStruct { ptr_resolveImageInfo in
            self.commandPool.device.dispatchTable.vkCmdResolveImage2(self.handle, ptr_resolveImageInfo)
        }
    }

    public func setFragmentShadingRateKHR(fragmentSize: Extent2D, combinerOps: (VkFragmentShadingRateCombinerOpKHR, VkFragmentShadingRateCombinerOpKHR)) -> Void {
        fragmentSize.withCStruct { ptr_fragmentSize in
            withUnsafeBytes(of: combinerOps) { ptr_combinerOps in
                self.commandPool.device.dispatchTable.vkCmdSetFragmentShadingRateKHR(self.handle, ptr_fragmentSize, ptr_combinerOps.bindMemory(to: VkFragmentShadingRateCombinerOpKHR.self).baseAddress)
            }
        }
    }

    public func setFragmentShadingRateEnumNV(shadingRate: FragmentShadingRateNV, combinerOps: (VkFragmentShadingRateCombinerOpKHR, VkFragmentShadingRateCombinerOpKHR)) -> Void {
        withUnsafeBytes(of: combinerOps) { ptr_combinerOps in
            self.commandPool.device.dispatchTable.vkCmdSetFragmentShadingRateEnumNV(self.handle, VkFragmentShadingRateNV(rawValue: VkFragmentShadingRateNV.RawValue(shadingRate.rawValue)), ptr_combinerOps.bindMemory(to: VkFragmentShadingRateCombinerOpKHR.self).baseAddress)
        }
    }

    public func setVertexInputEXT(vertexBindingDescriptions: (AnyChainableArray<VertexInputBindingDescription2EXT>), vertexAttributeDescriptions: (AnyChainableArray<VertexInputAttributeDescription2EXT>)) -> Void {
        vertexBindingDescriptions.withCStructBufferPointer { ptr_vertexBindingDescriptions in
            vertexAttributeDescriptions.withCStructBufferPointer { ptr_vertexAttributeDescriptions in
                self.commandPool.device.dispatchTable.vkCmdSetVertexInputEXT(self.handle, UInt32(ptr_vertexBindingDescriptions.count), ptr_vertexBindingDescriptions.baseAddress, UInt32(ptr_vertexAttributeDescriptions.count), ptr_vertexAttributeDescriptions.baseAddress)
            }
        }
    }

    public func setVertexInputEXT(vertexBindingDescriptions: Array<VertexInputBindingDescription2EXT> = [], vertexAttributeDescriptions: Array<VertexInputAttributeDescription2EXT> = []) -> Void {
        vertexBindingDescriptions.withCStructBufferPointer { ptr_vertexBindingDescriptions in
            vertexAttributeDescriptions.withCStructBufferPointer { ptr_vertexAttributeDescriptions in
                self.commandPool.device.dispatchTable.vkCmdSetVertexInputEXT(self.handle, UInt32(ptr_vertexBindingDescriptions.count), ptr_vertexBindingDescriptions.baseAddress, UInt32(ptr_vertexAttributeDescriptions.count), ptr_vertexAttributeDescriptions.baseAddress)
            }
        }
    }

    public func setColorWriteEnableEXT(colorWriteEnables: Array<Bool>) -> Void {
        colorWriteEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_colorWriteEnables in
            self.commandPool.device.dispatchTable.vkCmdSetColorWriteEnableEXT(self.handle, UInt32(ptr_colorWriteEnables.count), ptr_colorWriteEnables.baseAddress)
        }
    }

    public func setEvent2(_ dependencyInfo: (some Chainable<DependencyInfo>), event: Event) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdSetEvent2(self.handle, event.handle, ptr_dependencyInfo)
        }
    }

    public func setEvent2(_ dependencyInfo: DependencyInfo = DependencyInfo(), event: Event) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdSetEvent2(self.handle, event.handle, ptr_dependencyInfo)
        }
    }

    public func resetEvent2(event: Event, stageMask: PipelineStageFlags2 = []) -> Void {
        self.commandPool.device.dispatchTable.vkCmdResetEvent2(self.handle, event.handle, stageMask.rawValue)
    }

    public func waitEvents2(_ dependencyInfos: (AnyChainableArray<DependencyInfo>), events: Array<Event>) -> Void {
        events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            dependencyInfos.withCStructBufferPointer { ptr_dependencyInfos in
                self.commandPool.device.dispatchTable.vkCmdWaitEvents2(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress, ptr_dependencyInfos.baseAddress)
            }
        }
    }

    public func waitEvents2(_ dependencyInfos: Array<DependencyInfo>, events: Array<Event>) -> Void {
        events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            dependencyInfos.withCStructBufferPointer { ptr_dependencyInfos in
                self.commandPool.device.dispatchTable.vkCmdWaitEvents2(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress, ptr_dependencyInfos.baseAddress)
            }
        }
    }

    public func pipelineBarrier2(_ dependencyInfo: (some Chainable<DependencyInfo>)) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdPipelineBarrier2(self.handle, ptr_dependencyInfo)
        }
    }

    public func pipelineBarrier2(_ dependencyInfo: DependencyInfo = DependencyInfo()) -> Void {
        dependencyInfo.withCStruct { ptr_dependencyInfo in
            self.commandPool.device.dispatchTable.vkCmdPipelineBarrier2(self.handle, ptr_dependencyInfo)
        }
    }

    public func writeTimestamp2(stage: PipelineStageFlags2 = [], queryPool: QueryPool, query: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteTimestamp2(self.handle, stage.rawValue, queryPool.handle, query)
    }

    public func writeBufferMarker2AMD(stage: PipelineStageFlags2 = [], dstBuffer: Buffer, dstOffset: VkDeviceSize, marker: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdWriteBufferMarker2AMD(self.handle, stage.rawValue, dstBuffer.handle, dstOffset, marker)
    }

    public func decodeVideoKHR(_ decodeInfo: (some Chainable<VideoDecodeInfoKHR>)) -> Void {
        decodeInfo.withCStruct { ptr_decodeInfo in
            self.commandPool.device.dispatchTable.vkCmdDecodeVideoKHR(self.handle, ptr_decodeInfo)
        }
    }

    public func decodeVideoKHR(_ decodeInfo: VideoDecodeInfoKHR) -> Void {
        decodeInfo.withCStruct { ptr_decodeInfo in
            self.commandPool.device.dispatchTable.vkCmdDecodeVideoKHR(self.handle, ptr_decodeInfo)
        }
    }

    public func beginVideoCodingKHR(_ beginInfo: (some Chainable<VideoBeginCodingInfoKHR>)) -> Void {
        beginInfo.withCStruct { ptr_beginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginVideoCodingKHR(self.handle, ptr_beginInfo)
        }
    }

    public func beginVideoCodingKHR(_ beginInfo: VideoBeginCodingInfoKHR) -> Void {
        beginInfo.withCStruct { ptr_beginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginVideoCodingKHR(self.handle, ptr_beginInfo)
        }
    }

    public func controlVideoCodingKHR(_ codingControlInfo: (some Chainable<VideoCodingControlInfoKHR>)) -> Void {
        codingControlInfo.withCStruct { ptr_codingControlInfo in
            self.commandPool.device.dispatchTable.vkCmdControlVideoCodingKHR(self.handle, ptr_codingControlInfo)
        }
    }

    public func controlVideoCodingKHR(_ codingControlInfo: VideoCodingControlInfoKHR) -> Void {
        codingControlInfo.withCStruct { ptr_codingControlInfo in
            self.commandPool.device.dispatchTable.vkCmdControlVideoCodingKHR(self.handle, ptr_codingControlInfo)
        }
    }

    public func endVideoCodingKHR(_ endCodingInfo: (some Chainable<VideoEndCodingInfoKHR>)) -> Void {
        endCodingInfo.withCStruct { ptr_endCodingInfo in
            self.commandPool.device.dispatchTable.vkCmdEndVideoCodingKHR(self.handle, ptr_endCodingInfo)
        }
    }

    public func endVideoCodingKHR(_ endCodingInfo: VideoEndCodingInfoKHR = VideoEndCodingInfoKHR()) -> Void {
        endCodingInfo.withCStruct { ptr_endCodingInfo in
            self.commandPool.device.dispatchTable.vkCmdEndVideoCodingKHR(self.handle, ptr_endCodingInfo)
        }
    }

    public func encodeVideoKHR(_ encodeInfo: (some Chainable<VideoEncodeInfoKHR>)) -> Void {
        encodeInfo.withCStruct { ptr_encodeInfo in
            self.commandPool.device.dispatchTable.vkCmdEncodeVideoKHR(self.handle, ptr_encodeInfo)
        }
    }

    public func encodeVideoKHR(_ encodeInfo: VideoEncodeInfoKHR) -> Void {
        encodeInfo.withCStruct { ptr_encodeInfo in
            self.commandPool.device.dispatchTable.vkCmdEncodeVideoKHR(self.handle, ptr_encodeInfo)
        }
    }

    public func decompressMemoryNV(decompressMemoryRegions: Array<DecompressMemoryRegionNV>) -> Void {
        decompressMemoryRegions.withCStructBufferPointer { ptr_decompressMemoryRegions in
            self.commandPool.device.dispatchTable.vkCmdDecompressMemoryNV(self.handle, UInt32(ptr_decompressMemoryRegions.count), ptr_decompressMemoryRegions.baseAddress)
        }
    }

    public func decompressMemoryIndirectCountNV(indirectCommandsAddress: VkDeviceAddress, indirectCommandsCountAddress: VkDeviceAddress, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDecompressMemoryIndirectCountNV(self.handle, indirectCommandsAddress, indirectCommandsCountAddress, stride)
    }

    public func buildPartitionedAccelerationStructuresNV(_ buildInfo: (some Chainable<BuildPartitionedAccelerationStructureInfoNV>)) -> Void {
        buildInfo.withCStruct { ptr_buildInfo in
            self.commandPool.device.dispatchTable.vkCmdBuildPartitionedAccelerationStructuresNV(self.handle, ptr_buildInfo)
        }
    }

    public func buildPartitionedAccelerationStructuresNV(_ buildInfo: BuildPartitionedAccelerationStructureInfoNV) -> Void {
        buildInfo.withCStruct { ptr_buildInfo in
            self.commandPool.device.dispatchTable.vkCmdBuildPartitionedAccelerationStructuresNV(self.handle, ptr_buildInfo)
        }
    }

    public func decompressMemoryEXT(decompressMemoryInfoEXT: (some Chainable<DecompressMemoryInfoEXT>)) -> Void {
        decompressMemoryInfoEXT.withCStruct { ptr_decompressMemoryInfoEXT in
            self.commandPool.device.dispatchTable.vkCmdDecompressMemoryEXT(self.handle, ptr_decompressMemoryInfoEXT)
        }
    }

    public func decompressMemoryEXT(decompressMemoryInfoEXT: DecompressMemoryInfoEXT) -> Void {
        decompressMemoryInfoEXT.withCStruct { ptr_decompressMemoryInfoEXT in
            self.commandPool.device.dispatchTable.vkCmdDecompressMemoryEXT(self.handle, ptr_decompressMemoryInfoEXT)
        }
    }

    public func decompressMemoryIndirectCountEXT(decompressionMethod: MemoryDecompressionMethodFlagsEXT, indirectCommandsAddress: VkDeviceAddress, indirectCommandsCountAddress: VkDeviceAddress, maxDecompressionCount: UInt32, stride: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDecompressMemoryIndirectCountEXT(self.handle, decompressionMethod.rawValue, indirectCommandsAddress, indirectCommandsCountAddress, maxDecompressionCount, stride)
    }

    public func cuLaunchKernelNVX(_ launchInfo: (some Chainable<CuLaunchInfoNVX>)) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCuLaunchKernelNVX(self.handle, ptr_launchInfo)
        }
    }

    public func cuLaunchKernelNVX(_ launchInfo: CuLaunchInfoNVX) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCuLaunchKernelNVX(self.handle, ptr_launchInfo)
        }
    }

    public func bindDescriptorBuffersEXT(_ bindingInfos: (AnyChainableArray<DescriptorBufferBindingInfoEXT>)) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBuffersEXT(self.handle, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func bindDescriptorBuffersEXT(_ bindingInfos: Array<DescriptorBufferBindingInfoEXT>) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBuffersEXT(self.handle, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func setDescriptorBufferOffsetsEXT(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, bufferIndices: Array<UInt32>, offsets: Array<VkDeviceSize>) -> Void {
        bufferIndices.withUnsafeBufferPointer { ptr_bufferIndices in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                self.commandPool.device.dispatchTable.vkCmdSetDescriptorBufferOffsetsEXT(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, firstSet, UInt32(ptr_bufferIndices.count), ptr_bufferIndices.baseAddress, ptr_offsets.baseAddress)
            }
        }
    }

    public func bindDescriptorBufferEmbeddedSamplersEXT(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBindDescriptorBufferEmbeddedSamplersEXT(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set)
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cudaLaunchKernelNV(_ launchInfo: (some Chainable<CudaLaunchInfoNV>)) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCudaLaunchKernelNV(self.handle, ptr_launchInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cudaLaunchKernelNV(_ launchInfo: CudaLaunchInfoNV) -> Void {
        launchInfo.withCStruct { ptr_launchInfo in
            self.commandPool.device.dispatchTable.vkCmdCudaLaunchKernelNV(self.handle, ptr_launchInfo)
        }
    }
    #endif

    public func beginRendering(_ renderingInfo: (some Chainable<RenderingInfo>)) -> Void {
        renderingInfo.withCStruct { ptr_renderingInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginRendering(self.handle, ptr_renderingInfo)
        }
    }

    public func beginRendering(_ renderingInfo: RenderingInfo) -> Void {
        renderingInfo.withCStruct { ptr_renderingInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginRendering(self.handle, ptr_renderingInfo)
        }
    }

    public func endRendering() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndRendering(self.handle)
    }

    public func endRendering2KHR(_ renderingEndInfo: (some Chainable<RenderingEndInfoKHR>)) -> Void {
        renderingEndInfo.withCStruct { ptr_renderingEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRendering2KHR(self.handle, ptr_renderingEndInfo)
        }
    }

    public func endRendering2KHR(_ renderingEndInfo: RenderingEndInfoKHR? = nil) -> Void {
        renderingEndInfo.withOptionalCStruct { ptr_renderingEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndRendering2KHR(self.handle, ptr_renderingEndInfo)
        }
    }

    public func buildMicromapsEXT(_ infos: (AnyChainableArray<MicromapBuildInfoEXT>)) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdBuildMicromapsEXT(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func buildMicromapsEXT(_ infos: Array<MicromapBuildInfoEXT>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdBuildMicromapsEXT(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func copyMicromapEXT(_ info: (some Chainable<CopyMicromapInfoEXT>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMicromapEXT(self.handle, ptr_info)
        }
    }

    public func copyMicromapEXT(_ info: CopyMicromapInfoEXT) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMicromapEXT(self.handle, ptr_info)
        }
    }

    public func copyMicromapToMemoryEXT(_ info: (some Chainable<CopyMicromapToMemoryInfoEXT>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMicromapToMemoryEXT(self.handle, ptr_info)
        }
    }

    public func copyMicromapToMemoryEXT(_ info: CopyMicromapToMemoryInfoEXT) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMicromapToMemoryEXT(self.handle, ptr_info)
        }
    }

    public func copyMemoryToMicromapEXT(_ info: (some Chainable<CopyMemoryToMicromapInfoEXT>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToMicromapEXT(self.handle, ptr_info)
        }
    }

    public func copyMemoryToMicromapEXT(_ info: CopyMemoryToMicromapInfoEXT) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToMicromapEXT(self.handle, ptr_info)
        }
    }

    public func writeMicromapsPropertiesEXT(micromaps: Array<MicromapEXT>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        micromaps.map{ $0.handle }.withUnsafeBufferPointer { ptr_micromaps in
            self.commandPool.device.dispatchTable.vkCmdWriteMicromapsPropertiesEXT(self.handle, UInt32(ptr_micromaps.count), ptr_micromaps.baseAddress, VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func bindTileMemoryQCOM(_ tileMemoryBindInfo: (some Chainable<TileMemoryBindInfoQCOM>)) -> Void {
        tileMemoryBindInfo.withCStruct { ptr_tileMemoryBindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindTileMemoryQCOM(self.handle, ptr_tileMemoryBindInfo)
        }
    }

    public func bindTileMemoryQCOM(_ tileMemoryBindInfo: TileMemoryBindInfoQCOM? = nil) -> Void {
        tileMemoryBindInfo.withOptionalCStruct { ptr_tileMemoryBindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindTileMemoryQCOM(self.handle, ptr_tileMemoryBindInfo)
        }
    }

    public func opticalFlowExecuteNV(_ executeInfo: (some Chainable<OpticalFlowExecuteInfoNV>), session: OpticalFlowSessionNV) -> Void {
        executeInfo.withCStruct { ptr_executeInfo in
            self.commandPool.device.dispatchTable.vkCmdOpticalFlowExecuteNV(self.handle, session.handle, ptr_executeInfo)
        }
    }

    public func opticalFlowExecuteNV(_ executeInfo: OpticalFlowExecuteInfoNV = OpticalFlowExecuteInfoNV(), session: OpticalFlowSessionNV) -> Void {
        executeInfo.withCStruct { ptr_executeInfo in
            self.commandPool.device.dispatchTable.vkCmdOpticalFlowExecuteNV(self.handle, session.handle, ptr_executeInfo)
        }
    }

    public func setDepthBias2EXT(_ depthBiasInfo: (some Chainable<DepthBiasInfoEXT>)) -> Void {
        depthBiasInfo.withCStruct { ptr_depthBiasInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDepthBias2EXT(self.handle, ptr_depthBiasInfo)
        }
    }

    public func setDepthBias2EXT(_ depthBiasInfo: DepthBiasInfoEXT) -> Void {
        depthBiasInfo.withCStruct { ptr_depthBiasInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDepthBias2EXT(self.handle, ptr_depthBiasInfo)
        }
    }

    public func bindShadersEXT(stages: Array<ShaderStageFlags>, shaders: Array<ShaderEXT?>? = nil) -> Void {
        stages.map{ VkShaderStageFlagBits(rawValue: VkShaderStageFlagBits.RawValue($0.rawValue)) }.withUnsafeBufferPointer { ptr_stages in
            (shaders?.map{ $0?.handle }).withOptionalUnsafeBufferPointer { ptr_shaders in
                self.commandPool.device.dispatchTable.vkCmdBindShadersEXT(self.handle, UInt32(ptr_stages.count), ptr_stages.baseAddress, ptr_shaders.baseAddress)
            }
        }
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func initializeGraphScratchMemoryAMDX(executionGraph: Pipeline, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdInitializeGraphScratchMemoryAMDX(self.handle, executionGraph.handle, scratch, scratchSize)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func dispatchGraphAMDX(_ countInfo: DispatchGraphCountInfoAMDX, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        countInfo.withCStruct { ptr_countInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchGraphAMDX(self.handle, scratch, scratchSize, ptr_countInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func dispatchGraphIndirectAMDX(_ countInfo: DispatchGraphCountInfoAMDX, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        countInfo.withCStruct { ptr_countInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchGraphIndirectAMDX(self.handle, scratch, scratchSize, ptr_countInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func dispatchGraphIndirectCountAMDX(_ countInfo: VkDeviceAddress, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        self.commandPool.device.dispatchTable.vkCmdDispatchGraphIndirectCountAMDX(self.handle, scratch, scratchSize, countInfo)
    }
    #endif

    public func beginGpaSessionAMD(gpaSession: GpaSessionAMD) throws(Result) -> Void {
        try checkResult(
            self.commandPool.device.dispatchTable.vkCmdBeginGpaSessionAMD(self.handle, gpaSession.handle)
        )
    }

    public func endGpaSessionAMD(gpaSession: GpaSessionAMD) throws(Result) -> Void {
        try checkResult(
            self.commandPool.device.dispatchTable.vkCmdEndGpaSessionAMD(self.handle, gpaSession.handle)
        )
    }

    public func beginGpaSampleAMD(_ gpaSampleBeginInfo: (some Chainable<GpaSampleBeginInfoAMD>), gpaSession: GpaSessionAMD) throws(Result) -> UInt32 {
        try gpaSampleBeginInfo.withCStruct { ptr_gpaSampleBeginInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdBeginGpaSampleAMD(self.handle, gpaSession.handle, ptr_gpaSampleBeginInfo, &out)
            )
            return out
        }
    }

    public func beginGpaSampleAMD(_ gpaSampleBeginInfo: GpaSampleBeginInfoAMD, gpaSession: GpaSessionAMD) throws(Result) -> UInt32 {
        try gpaSampleBeginInfo.withCStruct { ptr_gpaSampleBeginInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                self.commandPool.device.dispatchTable.vkCmdBeginGpaSampleAMD(self.handle, gpaSession.handle, ptr_gpaSampleBeginInfo, &out)
            )
            return out
        }
    }

    public func endGpaSampleAMD(gpaSession: GpaSessionAMD, sampleID: UInt32) -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndGpaSampleAMD(self.handle, gpaSession.handle, sampleID)
    }

    public func copyGpaSessionResultsAMD(gpaSession: GpaSessionAMD) -> Void {
        self.commandPool.device.dispatchTable.vkCmdCopyGpaSessionResultsAMD(self.handle, gpaSession.handle)
    }

    public func bindDescriptorSets2(_ bindDescriptorSetsInfo: (some Chainable<BindDescriptorSetsInfo>)) -> Void {
        bindDescriptorSetsInfo.withCStruct { ptr_bindDescriptorSetsInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorSets2(self.handle, ptr_bindDescriptorSetsInfo)
        }
    }

    public func bindDescriptorSets2(_ bindDescriptorSetsInfo: BindDescriptorSetsInfo) -> Void {
        bindDescriptorSetsInfo.withCStruct { ptr_bindDescriptorSetsInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorSets2(self.handle, ptr_bindDescriptorSetsInfo)
        }
    }

    public func pushConstants2(_ pushConstantsInfo: (some Chainable<PushConstantsInfo>)) -> Void {
        pushConstantsInfo.withCStruct { ptr_pushConstantsInfo in
            self.commandPool.device.dispatchTable.vkCmdPushConstants2(self.handle, ptr_pushConstantsInfo)
        }
    }

    public func pushConstants2(_ pushConstantsInfo: PushConstantsInfo) -> Void {
        pushConstantsInfo.withCStruct { ptr_pushConstantsInfo in
            self.commandPool.device.dispatchTable.vkCmdPushConstants2(self.handle, ptr_pushConstantsInfo)
        }
    }

    public func pushDescriptorSet2(_ pushDescriptorSetInfo: (some Chainable<PushDescriptorSetInfo>)) -> Void {
        pushDescriptorSetInfo.withCStruct { ptr_pushDescriptorSetInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet2(self.handle, ptr_pushDescriptorSetInfo)
        }
    }

    public func pushDescriptorSet2(_ pushDescriptorSetInfo: PushDescriptorSetInfo) -> Void {
        pushDescriptorSetInfo.withCStruct { ptr_pushDescriptorSetInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSet2(self.handle, ptr_pushDescriptorSetInfo)
        }
    }

    public func pushDescriptorSetWithTemplate2(_ pushDescriptorSetWithTemplateInfo: (some Chainable<PushDescriptorSetWithTemplateInfo>)) -> Void {
        pushDescriptorSetWithTemplateInfo.withCStruct { ptr_pushDescriptorSetWithTemplateInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSetWithTemplate2(self.handle, ptr_pushDescriptorSetWithTemplateInfo)
        }
    }

    public func pushDescriptorSetWithTemplate2(_ pushDescriptorSetWithTemplateInfo: PushDescriptorSetWithTemplateInfo) -> Void {
        pushDescriptorSetWithTemplateInfo.withCStruct { ptr_pushDescriptorSetWithTemplateInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDescriptorSetWithTemplate2(self.handle, ptr_pushDescriptorSetWithTemplateInfo)
        }
    }

    public func setDescriptorBufferOffsets2EXT(_ setDescriptorBufferOffsetsInfo: (some Chainable<SetDescriptorBufferOffsetsInfoEXT>)) -> Void {
        setDescriptorBufferOffsetsInfo.withCStruct { ptr_setDescriptorBufferOffsetsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDescriptorBufferOffsets2EXT(self.handle, ptr_setDescriptorBufferOffsetsInfo)
        }
    }

    public func setDescriptorBufferOffsets2EXT(_ setDescriptorBufferOffsetsInfo: SetDescriptorBufferOffsetsInfoEXT) -> Void {
        setDescriptorBufferOffsetsInfo.withCStruct { ptr_setDescriptorBufferOffsetsInfo in
            self.commandPool.device.dispatchTable.vkCmdSetDescriptorBufferOffsets2EXT(self.handle, ptr_setDescriptorBufferOffsetsInfo)
        }
    }

    public func bindDescriptorBufferEmbeddedSamplers2EXT(_ bindDescriptorBufferEmbeddedSamplersInfo: (some Chainable<BindDescriptorBufferEmbeddedSamplersInfoEXT>)) -> Void {
        bindDescriptorBufferEmbeddedSamplersInfo.withCStruct { ptr_bindDescriptorBufferEmbeddedSamplersInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(self.handle, ptr_bindDescriptorBufferEmbeddedSamplersInfo)
        }
    }

    public func bindDescriptorBufferEmbeddedSamplers2EXT(_ bindDescriptorBufferEmbeddedSamplersInfo: BindDescriptorBufferEmbeddedSamplersInfoEXT) -> Void {
        bindDescriptorBufferEmbeddedSamplersInfo.withCStruct { ptr_bindDescriptorBufferEmbeddedSamplersInfo in
            self.commandPool.device.dispatchTable.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(self.handle, ptr_bindDescriptorBufferEmbeddedSamplersInfo)
        }
    }

    public func setRenderingAttachmentLocations(_ locationInfo: (some Chainable<RenderingAttachmentLocationInfo>)) -> Void {
        locationInfo.withCStruct { ptr_locationInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingAttachmentLocations(self.handle, ptr_locationInfo)
        }
    }

    public func setRenderingAttachmentLocations(_ locationInfo: RenderingAttachmentLocationInfo = RenderingAttachmentLocationInfo()) -> Void {
        locationInfo.withCStruct { ptr_locationInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingAttachmentLocations(self.handle, ptr_locationInfo)
        }
    }

    public func setRenderingInputAttachmentIndices(_ inputAttachmentIndexInfo: (some Chainable<RenderingInputAttachmentIndexInfo>)) -> Void {
        inputAttachmentIndexInfo.withCStruct { ptr_inputAttachmentIndexInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingInputAttachmentIndices(self.handle, ptr_inputAttachmentIndexInfo)
        }
    }

    public func setRenderingInputAttachmentIndices(_ inputAttachmentIndexInfo: RenderingInputAttachmentIndexInfo = RenderingInputAttachmentIndexInfo()) -> Void {
        inputAttachmentIndexInfo.withCStruct { ptr_inputAttachmentIndexInfo in
            self.commandPool.device.dispatchTable.vkCmdSetRenderingInputAttachmentIndices(self.handle, ptr_inputAttachmentIndexInfo)
        }
    }

    public func setDepthClampRangeEXT(depthClampMode: DepthClampModeEXT, depthClampRange: DepthClampRangeEXT? = nil) -> Void {
        depthClampRange.withOptionalCStruct { ptr_depthClampRange in
            self.commandPool.device.dispatchTable.vkCmdSetDepthClampRangeEXT(self.handle, VkDepthClampModeEXT(rawValue: VkDepthClampModeEXT.RawValue(depthClampMode.rawValue)), ptr_depthClampRange)
        }
    }

    public func convertCooperativeVectorMatrixNV(_ infos: (AnyChainableArray<ConvertCooperativeVectorMatrixInfoNV>)) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdConvertCooperativeVectorMatrixNV(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func convertCooperativeVectorMatrixNV(_ infos: Array<ConvertCooperativeVectorMatrixInfoNV>) -> Void {
        infos.withCStructBufferPointer { ptr_infos in
            self.commandPool.device.dispatchTable.vkCmdConvertCooperativeVectorMatrixNV(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func dispatchTileQCOM(_ dispatchTileInfo: (some Chainable<DispatchTileInfoQCOM>)) -> Void {
        dispatchTileInfo.withCStruct { ptr_dispatchTileInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchTileQCOM(self.handle, ptr_dispatchTileInfo)
        }
    }

    public func dispatchTileQCOM(_ dispatchTileInfo: DispatchTileInfoQCOM = DispatchTileInfoQCOM()) -> Void {
        dispatchTileInfo.withCStruct { ptr_dispatchTileInfo in
            self.commandPool.device.dispatchTable.vkCmdDispatchTileQCOM(self.handle, ptr_dispatchTileInfo)
        }
    }

    public func beginPerTileExecutionQCOM(_ perTileBeginInfo: (some Chainable<PerTileBeginInfoQCOM>)) -> Void {
        perTileBeginInfo.withCStruct { ptr_perTileBeginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginPerTileExecutionQCOM(self.handle, ptr_perTileBeginInfo)
        }
    }

    public func beginPerTileExecutionQCOM(_ perTileBeginInfo: PerTileBeginInfoQCOM = PerTileBeginInfoQCOM()) -> Void {
        perTileBeginInfo.withCStruct { ptr_perTileBeginInfo in
            self.commandPool.device.dispatchTable.vkCmdBeginPerTileExecutionQCOM(self.handle, ptr_perTileBeginInfo)
        }
    }

    public func endPerTileExecutionQCOM(_ perTileEndInfo: (some Chainable<PerTileEndInfoQCOM>)) -> Void {
        perTileEndInfo.withCStruct { ptr_perTileEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndPerTileExecutionQCOM(self.handle, ptr_perTileEndInfo)
        }
    }

    public func endPerTileExecutionQCOM(_ perTileEndInfo: PerTileEndInfoQCOM = PerTileEndInfoQCOM()) -> Void {
        perTileEndInfo.withCStruct { ptr_perTileEndInfo in
            self.commandPool.device.dispatchTable.vkCmdEndPerTileExecutionQCOM(self.handle, ptr_perTileEndInfo)
        }
    }

    public func beginShaderInstrumentationARM(instrumentation: ShaderInstrumentationARM) -> Void {
        self.commandPool.device.dispatchTable.vkCmdBeginShaderInstrumentationARM(self.handle, instrumentation.handle)
    }

    public func endShaderInstrumentationARM() -> Void {
        self.commandPool.device.dispatchTable.vkCmdEndShaderInstrumentationARM(self.handle)
    }

    public func copyTensorARM(_ copyTensorInfo: (some Chainable<CopyTensorInfoARM>)) -> Void {
        copyTensorInfo.withCStruct { ptr_copyTensorInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyTensorARM(self.handle, ptr_copyTensorInfo)
        }
    }

    public func copyTensorARM(_ copyTensorInfo: CopyTensorInfoARM) -> Void {
        copyTensorInfo.withCStruct { ptr_copyTensorInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyTensorARM(self.handle, ptr_copyTensorInfo)
        }
    }

    public func dispatchDataGraphARM(_ info: (some Chainable<DataGraphPipelineDispatchInfoARM>), session: DataGraphPipelineSessionARM) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchDataGraphARM(self.handle, session.handle, ptr_info)
        }
    }

    public func dispatchDataGraphARM(_ info: DataGraphPipelineDispatchInfoARM? = nil, session: DataGraphPipelineSessionARM) -> Void {
        info.withOptionalCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchDataGraphARM(self.handle, session.handle, ptr_info)
        }
    }

    public func setComputeOccupancyPriorityNV(parameters: (some Chainable<ComputeOccupancyPriorityParametersNV>)) -> Void {
        parameters.withCStruct { ptr_parameters in
            self.commandPool.device.dispatchTable.vkCmdSetComputeOccupancyPriorityNV(self.handle, ptr_parameters)
        }
    }

    public func setComputeOccupancyPriorityNV(parameters: ComputeOccupancyPriorityParametersNV) -> Void {
        parameters.withCStruct { ptr_parameters in
            self.commandPool.device.dispatchTable.vkCmdSetComputeOccupancyPriorityNV(self.handle, ptr_parameters)
        }
    }

    public func bindSamplerHeapEXT(_ bindInfo: (some Chainable<BindHeapInfoEXT>)) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindSamplerHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func bindSamplerHeapEXT(_ bindInfo: BindHeapInfoEXT) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindSamplerHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func bindResourceHeapEXT(_ bindInfo: (some Chainable<BindHeapInfoEXT>)) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindResourceHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func bindResourceHeapEXT(_ bindInfo: BindHeapInfoEXT) -> Void {
        bindInfo.withCStruct { ptr_bindInfo in
            self.commandPool.device.dispatchTable.vkCmdBindResourceHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func pushDataEXT(_ pushDataInfo: (some Chainable<PushDataInfoEXT>)) -> Void {
        pushDataInfo.withCStruct { ptr_pushDataInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDataEXT(self.handle, ptr_pushDataInfo)
        }
    }

    public func pushDataEXT(_ pushDataInfo: PushDataInfoEXT) -> Void {
        pushDataInfo.withCStruct { ptr_pushDataInfo in
            self.commandPool.device.dispatchTable.vkCmdPushDataEXT(self.handle, ptr_pushDataInfo)
        }
    }

    public func copyMemoryKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryInfoKHR>)) -> Void {
        copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyMemoryKHR(_ copyMemoryInfo: CopyDeviceMemoryInfoKHR? = nil) -> Void {
        copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyMemoryToImageKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryImageInfoKHR>)) -> Void {
        copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyMemoryToImageKHR(_ copyMemoryInfo: CopyDeviceMemoryImageInfoKHR? = nil) -> Void {
        copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyMemoryToImageKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyImageToMemoryKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryImageInfoKHR>)) -> Void {
        copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyImageToMemoryKHR(_ copyMemoryInfo: CopyDeviceMemoryImageInfoKHR? = nil) -> Void {
        copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            self.commandPool.device.dispatchTable.vkCmdCopyImageToMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func updateMemoryKHR(dstRange: DeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], dataSize: VkDeviceSize, data: UnsafeRawPointer) -> Void {
        dstRange.withCStruct { ptr_dstRange in
            self.commandPool.device.dispatchTable.vkCmdUpdateMemoryKHR(self.handle, ptr_dstRange, dstFlags.rawValue, dataSize, data)
        }
    }

    public func fillMemoryKHR(dstRange: DeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], data: UInt32) -> Void {
        dstRange.withCStruct { ptr_dstRange in
            self.commandPool.device.dispatchTable.vkCmdFillMemoryKHR(self.handle, ptr_dstRange, dstFlags.rawValue, data)
        }
    }

    public func copyQueryPoolResultsToMemoryKHR(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dstRange: StridedDeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], queryResultFlags: QueryResultFlags = []) -> Void {
        dstRange.withCStruct { ptr_dstRange in
            self.commandPool.device.dispatchTable.vkCmdCopyQueryPoolResultsToMemoryKHR(self.handle, queryPool.handle, firstQuery, queryCount, ptr_dstRange, dstFlags.rawValue, queryResultFlags.rawValue)
        }
    }

    public func beginConditionalRendering2EXT(conditionalRenderingBegin: (some Chainable<ConditionalRenderingBeginInfo2EXT>)) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRendering2EXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func beginConditionalRendering2EXT(conditionalRenderingBegin: ConditionalRenderingBeginInfo2EXT) -> Void {
        conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            self.commandPool.device.dispatchTable.vkCmdBeginConditionalRendering2EXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func bindTransformFeedbackBuffers2EXT(_ bindingInfos: (AnyChainableArray<BindTransformFeedbackBuffer2InfoEXT>), firstBinding: UInt32) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindTransformFeedbackBuffers2EXT(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func bindTransformFeedbackBuffers2EXT(_ bindingInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = nil, firstBinding: UInt32) -> Void {
        bindingInfos.withOptionalCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindTransformFeedbackBuffers2EXT(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func beginTransformFeedback2EXT(_ counterInfos: (AnyChainableArray<BindTransformFeedbackBuffer2InfoEXT>), firstCounterRange: UInt32) -> Void {
        counterInfos.withCStructBufferPointer { ptr_counterInfos in
            self.commandPool.device.dispatchTable.vkCmdBeginTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func beginTransformFeedback2EXT(_ counterInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = nil, firstCounterRange: UInt32) -> Void {
        counterInfos.withOptionalCStructBufferPointer { ptr_counterInfos in
            self.commandPool.device.dispatchTable.vkCmdBeginTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func endTransformFeedback2EXT(_ counterInfos: (AnyChainableArray<BindTransformFeedbackBuffer2InfoEXT>), firstCounterRange: UInt32) -> Void {
        counterInfos.withCStructBufferPointer { ptr_counterInfos in
            self.commandPool.device.dispatchTable.vkCmdEndTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func endTransformFeedback2EXT(_ counterInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = nil, firstCounterRange: UInt32) -> Void {
        counterInfos.withOptionalCStructBufferPointer { ptr_counterInfos in
            self.commandPool.device.dispatchTable.vkCmdEndTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func drawIndirectByteCount2EXT(_ counterInfo: (some Chainable<BindTransformFeedbackBuffer2InfoEXT>), instanceCount: UInt32, firstInstance: UInt32, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        counterInfo.withCStruct { ptr_counterInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectByteCount2EXT(self.handle, instanceCount, firstInstance, ptr_counterInfo, counterOffset, vertexStride)
        }
    }

    public func drawIndirectByteCount2EXT(_ counterInfo: BindTransformFeedbackBuffer2InfoEXT, instanceCount: UInt32, firstInstance: UInt32, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        counterInfo.withCStruct { ptr_counterInfo in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectByteCount2EXT(self.handle, instanceCount, firstInstance, ptr_counterInfo, counterOffset, vertexStride)
        }
    }

    public func writeMarkerToMemoryAMD(_ info: (some Chainable<MemoryMarkerInfoAMD>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdWriteMarkerToMemoryAMD(self.handle, ptr_info)
        }
    }

    public func writeMarkerToMemoryAMD(_ info: MemoryMarkerInfoAMD) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdWriteMarkerToMemoryAMD(self.handle, ptr_info)
        }
    }

    public func bindIndexBuffer3KHR(_ info: (some Chainable<BindIndexBuffer3InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer3KHR(self.handle, ptr_info)
        }
    }

    public func bindIndexBuffer3KHR(_ info: BindIndexBuffer3InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdBindIndexBuffer3KHR(self.handle, ptr_info)
        }
    }

    public func bindVertexBuffers3KHR(_ bindingInfos: (AnyChainableArray<BindVertexBuffer3InfoKHR>), firstBinding: UInt32) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindVertexBuffers3KHR(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func bindVertexBuffers3KHR(_ bindingInfos: Array<BindVertexBuffer3InfoKHR>, firstBinding: UInt32) -> Void {
        bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            self.commandPool.device.dispatchTable.vkCmdBindVertexBuffers3KHR(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func drawIndirect2KHR(_ info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndirect2KHR(_ info: DrawIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirect2KHR(_ info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirect2KHR(_ info: DrawIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndirectCount2KHR(_ info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndirectCount2KHR(_ info: DrawIndirectCount2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirectCount2KHR(_ info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirectCount2KHR(_ info: DrawIndirectCount2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawIndexedIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirect2EXT(_ info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirect2EXT(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirect2EXT(_ info: DrawIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirect2EXT(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirectCount2EXT(_ info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCount2EXT(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirectCount2EXT(_ info: DrawIndirectCount2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDrawMeshTasksIndirectCount2EXT(self.handle, ptr_info)
        }
    }

    public func dispatchIndirect2KHR(_ info: (some Chainable<DispatchIndirect2InfoKHR>)) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func dispatchIndirect2KHR(_ info: DispatchIndirect2InfoKHR) -> Void {
        info.withCStruct { ptr_info in
            self.commandPool.device.dispatchTable.vkCmdDispatchIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func setDispatchParametersARM(dispatchParameters: (some Chainable<DispatchParametersARM>)) -> Void {
        dispatchParameters.withCStruct { ptr_dispatchParameters in
            self.commandPool.device.dispatchTable.vkCmdSetDispatchParametersARM(self.handle, ptr_dispatchParameters)
        }
    }

    public func setDispatchParametersARM(dispatchParameters: DispatchParametersARM = DispatchParametersARM()) -> Void {
        dispatchParameters.withCStruct { ptr_dispatchParameters in
            self.commandPool.device.dispatchTable.vkCmdSetDispatchParametersARM(self.handle, ptr_dispatchParameters)
        }
    }
}

