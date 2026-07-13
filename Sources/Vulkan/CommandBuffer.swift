@preconcurrency import CVulkan

public struct CommandBuffer: Handle, @unchecked Sendable {
    public static let objectType: ObjectType = .commandBuffer
    public let handle: VkCommandBuffer
    public let table: UnsafePointer<DeviceDispatchTable>

    public init(handle: VkCommandBuffer!, table: UnsafePointer<DeviceDispatchTable>) {
        self.handle = handle
        self.table = table
    }

    public func begin(_ beginInfo: (some Chainable<CommandBufferBeginInfo>)) throws(Result) -> Void {
        let vkBeginCommandBuffer = self.table.pointee.vkBeginCommandBuffer!
        return try beginInfo.withCStruct { ptr_beginInfo throws(Result) in
            try checkResult(
                vkBeginCommandBuffer(self.handle, ptr_beginInfo)
            )
        }
    }

    public func begin(_ beginInfo: CommandBufferBeginInfo = CommandBufferBeginInfo()) throws(Result) -> Void {
        let vkBeginCommandBuffer = self.table.pointee.vkBeginCommandBuffer!
        return try beginInfo.withCStruct { ptr_beginInfo throws(Result) in
            try checkResult(
                vkBeginCommandBuffer(self.handle, ptr_beginInfo)
            )
        }
    }

    public func end() throws(Result) -> Void {
        let vkEndCommandBuffer = self.table.pointee.vkEndCommandBuffer!
        try checkResult(
            vkEndCommandBuffer(self.handle)
        )
    }

    public func reset(flags: CommandBufferResetFlags = []) throws(Result) -> Void {
        let vkResetCommandBuffer = self.table.pointee.vkResetCommandBuffer!
        try checkResult(
            vkResetCommandBuffer(self.handle, flags.rawValue)
        )
    }

    public func bindPipeline(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) -> Void {
        let vkCmdBindPipeline = self.table.pointee.vkCmdBindPipeline!
        vkCmdBindPipeline(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle)
    }

    public func setPrimitiveRestartIndexEXT(primitiveRestartIndex: UInt32 = 0) -> Void {
        let vkCmdSetPrimitiveRestartIndexEXT = self.table.pointee.vkCmdSetPrimitiveRestartIndexEXT!
        vkCmdSetPrimitiveRestartIndexEXT(self.handle, primitiveRestartIndex)
    }

    public func setAttachmentFeedbackLoopEnableEXT(aspectMask: ImageAspectFlags = []) -> Void {
        let vkCmdSetAttachmentFeedbackLoopEnableEXT = self.table.pointee.vkCmdSetAttachmentFeedbackLoopEnableEXT!
        vkCmdSetAttachmentFeedbackLoopEnableEXT(self.handle, aspectMask.rawValue)
    }

    public func setViewport(firstViewport: UInt32, viewports: Array<Viewport>) -> Void {
        let vkCmdSetViewport = self.table.pointee.vkCmdSetViewport!
        return viewports.withCStructBufferPointer { ptr_viewports in
            vkCmdSetViewport(self.handle, firstViewport, UInt32(ptr_viewports.count), ptr_viewports.baseAddress)
        }
    }

    public func setScissor(firstScissor: UInt32, scissors: Array<Rect2D>) -> Void {
        let vkCmdSetScissor = self.table.pointee.vkCmdSetScissor!
        return scissors.withCStructBufferPointer { ptr_scissors in
            vkCmdSetScissor(self.handle, firstScissor, UInt32(ptr_scissors.count), ptr_scissors.baseAddress)
        }
    }

    public func setLineWidth(lineWidth: Float) -> Void {
        let vkCmdSetLineWidth = self.table.pointee.vkCmdSetLineWidth!
        vkCmdSetLineWidth(self.handle, lineWidth)
    }

    public func setDepthBias(depthBiasConstantFactor: Float, depthBiasClamp: Float, depthBiasSlopeFactor: Float) -> Void {
        let vkCmdSetDepthBias = self.table.pointee.vkCmdSetDepthBias!
        vkCmdSetDepthBias(self.handle, depthBiasConstantFactor, depthBiasClamp, depthBiasSlopeFactor)
    }

    public func setBlendConstants(blendConstants: (Float, Float, Float, Float)) -> Void {
        let vkCmdSetBlendConstants = self.table.pointee.vkCmdSetBlendConstants!
        return withUnsafeBytes(of: blendConstants) { ptr_blendConstants in
            vkCmdSetBlendConstants(self.handle, ptr_blendConstants.bindMemory(to: Float.self).baseAddress)
        }
    }

    public func setDepthBounds(minDepthBounds: Float, maxDepthBounds: Float) -> Void {
        let vkCmdSetDepthBounds = self.table.pointee.vkCmdSetDepthBounds!
        vkCmdSetDepthBounds(self.handle, minDepthBounds, maxDepthBounds)
    }

    public func setStencilCompareMask(faceMask: StencilFaceFlags, compareMask: UInt32) -> Void {
        let vkCmdSetStencilCompareMask = self.table.pointee.vkCmdSetStencilCompareMask!
        vkCmdSetStencilCompareMask(self.handle, faceMask.rawValue, compareMask)
    }

    public func setStencilWriteMask(faceMask: StencilFaceFlags, writeMask: UInt32) -> Void {
        let vkCmdSetStencilWriteMask = self.table.pointee.vkCmdSetStencilWriteMask!
        vkCmdSetStencilWriteMask(self.handle, faceMask.rawValue, writeMask)
    }

    public func setStencilReference(faceMask: StencilFaceFlags, reference: UInt32) -> Void {
        let vkCmdSetStencilReference = self.table.pointee.vkCmdSetStencilReference!
        vkCmdSetStencilReference(self.handle, faceMask.rawValue, reference)
    }

    public func bindDescriptorSets(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, descriptorSets: Array<DescriptorSet>, dynamicOffsets: Array<UInt32> = []) -> Void {
        let vkCmdBindDescriptorSets = self.table.pointee.vkCmdBindDescriptorSets!
        return descriptorSets.map{ $0.handle }.withUnsafeBufferPointer { ptr_descriptorSets in
            dynamicOffsets.withUnsafeBufferPointer { ptr_dynamicOffsets in
                vkCmdBindDescriptorSets(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, firstSet, UInt32(ptr_descriptorSets.count), ptr_descriptorSets.baseAddress?.cast(), UInt32(ptr_dynamicOffsets.count), ptr_dynamicOffsets.baseAddress)
            }
        }
    }

    public func bindIndexBuffer(buffer: Buffer? = nil, offset: VkDeviceSize, indexType: IndexType) -> Void {
        let vkCmdBindIndexBuffer = self.table.pointee.vkCmdBindIndexBuffer!
        vkCmdBindIndexBuffer(self.handle, buffer?.handle, offset, VkIndexType(rawValue: VkIndexType.RawValue(indexType.rawValue)))
    }

    public func bindVertexBuffers(firstBinding: UInt32, buffers: Array<Buffer>, offsets: Array<VkDeviceSize>) -> Void {
        let vkCmdBindVertexBuffers = self.table.pointee.vkCmdBindVertexBuffers!
        return buffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                vkCmdBindVertexBuffers(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress?.cast(), ptr_offsets.baseAddress)
            }
        }
    }

    public func draw(vertexCount: UInt32, instanceCount: UInt32, firstVertex: UInt32, firstInstance: UInt32) -> Void {
        let vkCmdDraw = self.table.pointee.vkCmdDraw!
        vkCmdDraw(self.handle, vertexCount, instanceCount, firstVertex, firstInstance)
    }

    public func drawIndexed(indexCount: UInt32, instanceCount: UInt32, firstIndex: UInt32, vertexOffset: Int32, firstInstance: UInt32) -> Void {
        let vkCmdDrawIndexed = self.table.pointee.vkCmdDrawIndexed!
        vkCmdDrawIndexed(self.handle, indexCount, instanceCount, firstIndex, vertexOffset, firstInstance)
    }

    public func drawMultiEXT(_ vertexInfo: Array<MultiDrawInfoEXT> = [], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawMultiEXT = self.table.pointee.vkCmdDrawMultiEXT!
        return vertexInfo.withCStructBufferPointer { ptr_vertexInfo in
            vkCmdDrawMultiEXT(self.handle, UInt32(ptr_vertexInfo.count), ptr_vertexInfo.baseAddress, instanceCount, firstInstance, stride)
        }
    }

    public func drawMultiIndexedEXT(_ indexInfo: Array<MultiDrawIndexedInfoEXT> = [], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32, vertexOffset: UnsafePointer<Int32>? = nil) -> Void {
        let vkCmdDrawMultiIndexedEXT = self.table.pointee.vkCmdDrawMultiIndexedEXT!
        return indexInfo.withCStructBufferPointer { ptr_indexInfo in
            vkCmdDrawMultiIndexedEXT(self.handle, UInt32(ptr_indexInfo.count), ptr_indexInfo.baseAddress, instanceCount, firstInstance, stride, vertexOffset)
        }
    }

    public func drawIndirect(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawIndirect = self.table.pointee.vkCmdDrawIndirect!
        vkCmdDrawIndirect(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func drawIndexedIndirect(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawIndexedIndirect = self.table.pointee.vkCmdDrawIndexedIndirect!
        vkCmdDrawIndexedIndirect(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func dispatch(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        let vkCmdDispatch = self.table.pointee.vkCmdDispatch!
        vkCmdDispatch(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func dispatchIndirect(buffer: Buffer, offset: VkDeviceSize) -> Void {
        let vkCmdDispatchIndirect = self.table.pointee.vkCmdDispatchIndirect!
        vkCmdDispatchIndirect(self.handle, buffer.handle, offset)
    }

    public func subpassShadingHUAWEI() -> Void {
        let vkCmdSubpassShadingHUAWEI = self.table.pointee.vkCmdSubpassShadingHUAWEI!
        vkCmdSubpassShadingHUAWEI(self.handle)
    }

    public func drawClusterHUAWEI(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        let vkCmdDrawClusterHUAWEI = self.table.pointee.vkCmdDrawClusterHUAWEI!
        vkCmdDrawClusterHUAWEI(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func drawClusterIndirectHUAWEI(buffer: Buffer, offset: VkDeviceSize) -> Void {
        let vkCmdDrawClusterIndirectHUAWEI = self.table.pointee.vkCmdDrawClusterIndirectHUAWEI!
        vkCmdDrawClusterIndirectHUAWEI(self.handle, buffer.handle, offset)
    }

    public func updatePipelineIndirectBufferNV(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline) -> Void {
        let vkCmdUpdatePipelineIndirectBufferNV = self.table.pointee.vkCmdUpdatePipelineIndirectBufferNV!
        vkCmdUpdatePipelineIndirectBufferNV(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle)
    }

    public func copyBuffer(srcBuffer: Buffer, dstBuffer: Buffer, regions: Array<BufferCopy>) -> Void {
        let vkCmdCopyBuffer = self.table.pointee.vkCmdCopyBuffer!
        return regions.withCStructBufferPointer { ptr_regions in
            vkCmdCopyBuffer(self.handle, srcBuffer.handle, dstBuffer.handle, UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func copyImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageCopy>) -> Void {
        let vkCmdCopyImage = self.table.pointee.vkCmdCopyImage!
        return regions.withCStructBufferPointer { ptr_regions in
            vkCmdCopyImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func blitImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageBlit>, filter: Filter) -> Void {
        let vkCmdBlitImage = self.table.pointee.vkCmdBlitImage!
        return regions.withCStructBufferPointer { ptr_regions in
            vkCmdBlitImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress, VkFilter(rawValue: VkFilter.RawValue(filter.rawValue)))
        }
    }

    public func copyBufferToImage(srcBuffer: Buffer, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<BufferImageCopy>) -> Void {
        let vkCmdCopyBufferToImage = self.table.pointee.vkCmdCopyBufferToImage!
        return regions.withCStructBufferPointer { ptr_regions in
            vkCmdCopyBufferToImage(self.handle, srcBuffer.handle, dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func copyImageToBuffer(srcImage: Image, srcImageLayout: ImageLayout, dstBuffer: Buffer, regions: Array<BufferImageCopy>) -> Void {
        let vkCmdCopyImageToBuffer = self.table.pointee.vkCmdCopyImageToBuffer!
        return regions.withCStructBufferPointer { ptr_regions in
            vkCmdCopyImageToBuffer(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstBuffer.handle, UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func copyMemoryIndirectNV(copyBufferAddress: VkDeviceAddress, copyCount: UInt32, stride: UInt32) -> Void {
        let vkCmdCopyMemoryIndirectNV = self.table.pointee.vkCmdCopyMemoryIndirectNV!
        vkCmdCopyMemoryIndirectNV(self.handle, copyBufferAddress, copyCount, stride)
    }

    public func copyMemoryIndirectKHR(_ copyMemoryIndirectInfo: (some Chainable<CopyMemoryIndirectInfoKHR>)) -> Void {
        let vkCmdCopyMemoryIndirectKHR = self.table.pointee.vkCmdCopyMemoryIndirectKHR!
        return copyMemoryIndirectInfo.withCStruct { ptr_copyMemoryIndirectInfo in
            vkCmdCopyMemoryIndirectKHR(self.handle, ptr_copyMemoryIndirectInfo)
        }
    }

    public func copyMemoryIndirectKHR(_ copyMemoryIndirectInfo: CopyMemoryIndirectInfoKHR) -> Void {
        let vkCmdCopyMemoryIndirectKHR = self.table.pointee.vkCmdCopyMemoryIndirectKHR!
        return copyMemoryIndirectInfo.withCStruct { ptr_copyMemoryIndirectInfo in
            vkCmdCopyMemoryIndirectKHR(self.handle, ptr_copyMemoryIndirectInfo)
        }
    }

    public func copyMemoryToImageIndirectNV(copyBufferAddress: VkDeviceAddress, stride: UInt32, dstImage: Image, dstImageLayout: ImageLayout, imageSubresources: Array<ImageSubresourceLayers>) -> Void {
        let vkCmdCopyMemoryToImageIndirectNV = self.table.pointee.vkCmdCopyMemoryToImageIndirectNV!
        return imageSubresources.withCStructBufferPointer { ptr_imageSubresources in
            vkCmdCopyMemoryToImageIndirectNV(self.handle, copyBufferAddress, UInt32(ptr_imageSubresources.count), stride, dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), ptr_imageSubresources.baseAddress)
        }
    }

    public func copyMemoryToImageIndirectKHR(_ copyMemoryToImageIndirectInfo: (some Chainable<CopyMemoryToImageIndirectInfoKHR>)) -> Void {
        let vkCmdCopyMemoryToImageIndirectKHR = self.table.pointee.vkCmdCopyMemoryToImageIndirectKHR!
        return copyMemoryToImageIndirectInfo.withCStruct { ptr_copyMemoryToImageIndirectInfo in
            vkCmdCopyMemoryToImageIndirectKHR(self.handle, ptr_copyMemoryToImageIndirectInfo)
        }
    }

    public func copyMemoryToImageIndirectKHR(_ copyMemoryToImageIndirectInfo: CopyMemoryToImageIndirectInfoKHR) -> Void {
        let vkCmdCopyMemoryToImageIndirectKHR = self.table.pointee.vkCmdCopyMemoryToImageIndirectKHR!
        return copyMemoryToImageIndirectInfo.withCStruct { ptr_copyMemoryToImageIndirectInfo in
            vkCmdCopyMemoryToImageIndirectKHR(self.handle, ptr_copyMemoryToImageIndirectInfo)
        }
    }

    public func updateBuffer(dstBuffer: Buffer, dstOffset: VkDeviceSize, dataSize: VkDeviceSize, data: UnsafeRawPointer) -> Void {
        let vkCmdUpdateBuffer = self.table.pointee.vkCmdUpdateBuffer!
        vkCmdUpdateBuffer(self.handle, dstBuffer.handle, dstOffset, dataSize, data)
    }

    public func fillBuffer(dstBuffer: Buffer, dstOffset: VkDeviceSize, size: VkDeviceSize, data: UInt32) -> Void {
        let vkCmdFillBuffer = self.table.pointee.vkCmdFillBuffer!
        vkCmdFillBuffer(self.handle, dstBuffer.handle, dstOffset, size, data)
    }

    public func clearColorImage(image: Image, imageLayout: ImageLayout, color: UnsafePointer<VkClearColorValue>, ranges: Array<ImageSubresourceRange>) -> Void {
        let vkCmdClearColorImage = self.table.pointee.vkCmdClearColorImage!
        return ranges.withCStructBufferPointer { ptr_ranges in
            vkCmdClearColorImage(self.handle, image.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)), color, UInt32(ptr_ranges.count), ptr_ranges.baseAddress)
        }
    }

    public func clearDepthStencilImage(image: Image, imageLayout: ImageLayout, depthStencil: ClearDepthStencilValue, ranges: Array<ImageSubresourceRange>) -> Void {
        let vkCmdClearDepthStencilImage = self.table.pointee.vkCmdClearDepthStencilImage!
        return depthStencil.withCStruct { ptr_depthStencil in
            ranges.withCStructBufferPointer { ptr_ranges in
                vkCmdClearDepthStencilImage(self.handle, image.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)), ptr_depthStencil, UInt32(ptr_ranges.count), ptr_ranges.baseAddress)
            }
        }
    }

    public func clearAttachments(attachments: Array<ClearAttachment>, rects: Array<ClearRect>) -> Void {
        let vkCmdClearAttachments = self.table.pointee.vkCmdClearAttachments!
        return attachments.withCStructBufferPointer { ptr_attachments in
            rects.withCStructBufferPointer { ptr_rects in
                vkCmdClearAttachments(self.handle, UInt32(ptr_attachments.count), ptr_attachments.baseAddress, UInt32(ptr_rects.count), ptr_rects.baseAddress)
            }
        }
    }

    public func resolveImage(srcImage: Image, srcImageLayout: ImageLayout, dstImage: Image, dstImageLayout: ImageLayout, regions: Array<ImageResolve>) -> Void {
        let vkCmdResolveImage = self.table.pointee.vkCmdResolveImage!
        return regions.withCStructBufferPointer { ptr_regions in
            vkCmdResolveImage(self.handle, srcImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(srcImageLayout.rawValue)), dstImage.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(dstImageLayout.rawValue)), UInt32(ptr_regions.count), ptr_regions.baseAddress)
        }
    }

    public func setEvent(event: Event, stageMask: PipelineStageFlags = []) -> Void {
        let vkCmdSetEvent = self.table.pointee.vkCmdSetEvent!
        vkCmdSetEvent(self.handle, event.handle, stageMask.rawValue)
    }

    public func resetEvent(event: Event, stageMask: PipelineStageFlags = []) -> Void {
        let vkCmdResetEvent = self.table.pointee.vkCmdResetEvent!
        vkCmdResetEvent(self.handle, event.handle, stageMask.rawValue)
    }

    public func waitEvents(events: Array<Event>, srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], memoryBarriers: (AnyChainableArray<MemoryBarrier>), bufferMemoryBarriers: (AnyChainableArray<BufferMemoryBarrier>), imageMemoryBarriers: (AnyChainableArray<ImageMemoryBarrier>)) -> Void {
        let vkCmdWaitEvents = self.table.pointee.vkCmdWaitEvents!
        return events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
                bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                    imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                        vkCmdWaitEvents(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress?.cast(), srcStageMask.rawValue, dstStageMask.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                    }
                }
            }
        }
    }

    public func waitEvents(events: Array<Event>, srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], memoryBarriers: Array<MemoryBarrier> = [], bufferMemoryBarriers: Array<BufferMemoryBarrier> = [], imageMemoryBarriers: Array<ImageMemoryBarrier> = []) -> Void {
        let vkCmdWaitEvents = self.table.pointee.vkCmdWaitEvents!
        return events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
                bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                    imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                        vkCmdWaitEvents(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress?.cast(), srcStageMask.rawValue, dstStageMask.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                    }
                }
            }
        }
    }

    public func pipelineBarrier(srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], dependencyFlags: DependencyFlags = [], memoryBarriers: (AnyChainableArray<MemoryBarrier>), bufferMemoryBarriers: (AnyChainableArray<BufferMemoryBarrier>), imageMemoryBarriers: (AnyChainableArray<ImageMemoryBarrier>)) -> Void {
        let vkCmdPipelineBarrier = self.table.pointee.vkCmdPipelineBarrier!
        return memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
            bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                    vkCmdPipelineBarrier(self.handle, srcStageMask.rawValue, dstStageMask.rawValue, dependencyFlags.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                }
            }
        }
    }

    public func pipelineBarrier(srcStageMask: PipelineStageFlags = [], dstStageMask: PipelineStageFlags = [], dependencyFlags: DependencyFlags = [], memoryBarriers: Array<MemoryBarrier> = [], bufferMemoryBarriers: Array<BufferMemoryBarrier> = [], imageMemoryBarriers: Array<ImageMemoryBarrier> = []) -> Void {
        let vkCmdPipelineBarrier = self.table.pointee.vkCmdPipelineBarrier!
        return memoryBarriers.withCStructBufferPointer { ptr_memoryBarriers in
            bufferMemoryBarriers.withCStructBufferPointer { ptr_bufferMemoryBarriers in
                imageMemoryBarriers.withCStructBufferPointer { ptr_imageMemoryBarriers in
                    vkCmdPipelineBarrier(self.handle, srcStageMask.rawValue, dstStageMask.rawValue, dependencyFlags.rawValue, UInt32(ptr_memoryBarriers.count), ptr_memoryBarriers.baseAddress, UInt32(ptr_bufferMemoryBarriers.count), ptr_bufferMemoryBarriers.baseAddress, UInt32(ptr_imageMemoryBarriers.count), ptr_imageMemoryBarriers.baseAddress)
                }
            }
        }
    }

    public func beginQuery(queryPool: QueryPool, query: UInt32, flags: QueryControlFlags = []) -> Void {
        let vkCmdBeginQuery = self.table.pointee.vkCmdBeginQuery!
        vkCmdBeginQuery(self.handle, queryPool.handle, query, flags.rawValue)
    }

    public func endQuery(queryPool: QueryPool, query: UInt32) -> Void {
        let vkCmdEndQuery = self.table.pointee.vkCmdEndQuery!
        vkCmdEndQuery(self.handle, queryPool.handle, query)
    }

    public func beginConditionalRenderingEXT(conditionalRenderingBegin: (some Chainable<ConditionalRenderingBeginInfoEXT>)) -> Void {
        let vkCmdBeginConditionalRenderingEXT = self.table.pointee.vkCmdBeginConditionalRenderingEXT!
        return conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            vkCmdBeginConditionalRenderingEXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func beginConditionalRenderingEXT(conditionalRenderingBegin: ConditionalRenderingBeginInfoEXT) -> Void {
        let vkCmdBeginConditionalRenderingEXT = self.table.pointee.vkCmdBeginConditionalRenderingEXT!
        return conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            vkCmdBeginConditionalRenderingEXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func endConditionalRenderingEXT() -> Void {
        let vkCmdEndConditionalRenderingEXT = self.table.pointee.vkCmdEndConditionalRenderingEXT!
        vkCmdEndConditionalRenderingEXT(self.handle)
    }

    public func beginCustomResolveEXT(_ beginCustomResolveInfo: (some Chainable<BeginCustomResolveInfoEXT>)) -> Void {
        let vkCmdBeginCustomResolveEXT = self.table.pointee.vkCmdBeginCustomResolveEXT!
        return beginCustomResolveInfo.withCStruct { ptr_beginCustomResolveInfo in
            vkCmdBeginCustomResolveEXT(self.handle, ptr_beginCustomResolveInfo)
        }
    }

    public func beginCustomResolveEXT(_ beginCustomResolveInfo: BeginCustomResolveInfoEXT? = nil) -> Void {
        let vkCmdBeginCustomResolveEXT = self.table.pointee.vkCmdBeginCustomResolveEXT!
        return beginCustomResolveInfo.withOptionalCStruct { ptr_beginCustomResolveInfo in
            vkCmdBeginCustomResolveEXT(self.handle, ptr_beginCustomResolveInfo)
        }
    }

    public func resetQueryPool(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32) -> Void {
        let vkCmdResetQueryPool = self.table.pointee.vkCmdResetQueryPool!
        vkCmdResetQueryPool(self.handle, queryPool.handle, firstQuery, queryCount)
    }

    public func writeTimestamp(pipelineStage: PipelineStageFlags, queryPool: QueryPool, query: UInt32) -> Void {
        let vkCmdWriteTimestamp = self.table.pointee.vkCmdWriteTimestamp!
        vkCmdWriteTimestamp(self.handle, VkPipelineStageFlagBits(rawValue: VkPipelineStageFlagBits.RawValue(pipelineStage.rawValue)), queryPool.handle, query)
    }

    public func copyQueryPoolResults(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dstBuffer: Buffer, dstOffset: VkDeviceSize, stride: VkDeviceSize, flags: QueryResultFlags = []) -> Void {
        let vkCmdCopyQueryPoolResults = self.table.pointee.vkCmdCopyQueryPoolResults!
        vkCmdCopyQueryPoolResults(self.handle, queryPool.handle, firstQuery, queryCount, dstBuffer.handle, dstOffset, stride, flags.rawValue)
    }

    public func pushConstants(layout: PipelineLayout, stageFlags: ShaderStageFlags, offset: UInt32, size: UInt32, values: UnsafeRawPointer) -> Void {
        let vkCmdPushConstants = self.table.pointee.vkCmdPushConstants!
        vkCmdPushConstants(self.handle, layout.handle, stageFlags.rawValue, offset, size, values)
    }

    public func beginRenderPass(renderPassBegin: (some Chainable<RenderPassBeginInfo>), contents: SubpassContents) -> Void {
        let vkCmdBeginRenderPass = self.table.pointee.vkCmdBeginRenderPass!
        return renderPassBegin.withCStruct { ptr_renderPassBegin in
            vkCmdBeginRenderPass(self.handle, ptr_renderPassBegin, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
        }
    }

    public func beginRenderPass(renderPassBegin: RenderPassBeginInfo, contents: SubpassContents) -> Void {
        let vkCmdBeginRenderPass = self.table.pointee.vkCmdBeginRenderPass!
        return renderPassBegin.withCStruct { ptr_renderPassBegin in
            vkCmdBeginRenderPass(self.handle, ptr_renderPassBegin, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
        }
    }

    public func nextSubpass(contents: SubpassContents) -> Void {
        let vkCmdNextSubpass = self.table.pointee.vkCmdNextSubpass!
        vkCmdNextSubpass(self.handle, VkSubpassContents(rawValue: VkSubpassContents.RawValue(contents.rawValue)))
    }

    public func endRenderPass() -> Void {
        let vkCmdEndRenderPass = self.table.pointee.vkCmdEndRenderPass!
        vkCmdEndRenderPass(self.handle)
    }

    public func executeCommands(commandBuffers: Array<CommandBuffer>) -> Void {
        let vkCmdExecuteCommands = self.table.pointee.vkCmdExecuteCommands!
        return commandBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_commandBuffers in
            vkCmdExecuteCommands(self.handle, UInt32(ptr_commandBuffers.count), ptr_commandBuffers.baseAddress?.cast())
        }
    }

    public func debugMarkerBeginEXT(_ markerInfo: (some Chainable<DebugMarkerMarkerInfoEXT>)) -> Void {
        let vkCmdDebugMarkerBeginEXT = self.table.pointee.vkCmdDebugMarkerBeginEXT!
        return markerInfo.withCStruct { ptr_markerInfo in
            vkCmdDebugMarkerBeginEXT(self.handle, ptr_markerInfo)
        }
    }

    public func debugMarkerBeginEXT(_ markerInfo: DebugMarkerMarkerInfoEXT) -> Void {
        let vkCmdDebugMarkerBeginEXT = self.table.pointee.vkCmdDebugMarkerBeginEXT!
        return markerInfo.withCStruct { ptr_markerInfo in
            vkCmdDebugMarkerBeginEXT(self.handle, ptr_markerInfo)
        }
    }

    public func debugMarkerEndEXT() -> Void {
        let vkCmdDebugMarkerEndEXT = self.table.pointee.vkCmdDebugMarkerEndEXT!
        vkCmdDebugMarkerEndEXT(self.handle)
    }

    public func debugMarkerInsertEXT(_ markerInfo: (some Chainable<DebugMarkerMarkerInfoEXT>)) -> Void {
        let vkCmdDebugMarkerInsertEXT = self.table.pointee.vkCmdDebugMarkerInsertEXT!
        return markerInfo.withCStruct { ptr_markerInfo in
            vkCmdDebugMarkerInsertEXT(self.handle, ptr_markerInfo)
        }
    }

    public func debugMarkerInsertEXT(_ markerInfo: DebugMarkerMarkerInfoEXT) -> Void {
        let vkCmdDebugMarkerInsertEXT = self.table.pointee.vkCmdDebugMarkerInsertEXT!
        return markerInfo.withCStruct { ptr_markerInfo in
            vkCmdDebugMarkerInsertEXT(self.handle, ptr_markerInfo)
        }
    }

    public func executeGeneratedCommandsNV(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoNV>), isPreprocessed: Bool) -> Void {
        let vkCmdExecuteGeneratedCommandsNV = self.table.pointee.vkCmdExecuteGeneratedCommandsNV!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdExecuteGeneratedCommandsNV(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func executeGeneratedCommandsNV(_ generatedCommandsInfo: GeneratedCommandsInfoNV, isPreprocessed: Bool) -> Void {
        let vkCmdExecuteGeneratedCommandsNV = self.table.pointee.vkCmdExecuteGeneratedCommandsNV!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdExecuteGeneratedCommandsNV(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func preprocessGeneratedCommandsNV(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoNV>)) -> Void {
        let vkCmdPreprocessGeneratedCommandsNV = self.table.pointee.vkCmdPreprocessGeneratedCommandsNV!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdPreprocessGeneratedCommandsNV(self.handle, ptr_generatedCommandsInfo)
        }
    }

    public func preprocessGeneratedCommandsNV(_ generatedCommandsInfo: GeneratedCommandsInfoNV) -> Void {
        let vkCmdPreprocessGeneratedCommandsNV = self.table.pointee.vkCmdPreprocessGeneratedCommandsNV!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdPreprocessGeneratedCommandsNV(self.handle, ptr_generatedCommandsInfo)
        }
    }

    public func bindPipelineShaderGroupNV(pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline, groupIndex: UInt32) -> Void {
        let vkCmdBindPipelineShaderGroupNV = self.table.pointee.vkCmdBindPipelineShaderGroupNV!
        vkCmdBindPipelineShaderGroupNV(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), pipeline.handle, groupIndex)
    }

    public func executeGeneratedCommandsEXT(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoEXT>), isPreprocessed: Bool) -> Void {
        let vkCmdExecuteGeneratedCommandsEXT = self.table.pointee.vkCmdExecuteGeneratedCommandsEXT!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdExecuteGeneratedCommandsEXT(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func executeGeneratedCommandsEXT(_ generatedCommandsInfo: GeneratedCommandsInfoEXT, isPreprocessed: Bool) -> Void {
        let vkCmdExecuteGeneratedCommandsEXT = self.table.pointee.vkCmdExecuteGeneratedCommandsEXT!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdExecuteGeneratedCommandsEXT(self.handle, VkBool32(isPreprocessed ? VK_TRUE : VK_FALSE), ptr_generatedCommandsInfo)
        }
    }

    public func preprocessGeneratedCommandsEXT(_ generatedCommandsInfo: (some Chainable<GeneratedCommandsInfoEXT>), stateCommandBuffer: CommandBuffer) -> Void {
        let vkCmdPreprocessGeneratedCommandsEXT = self.table.pointee.vkCmdPreprocessGeneratedCommandsEXT!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdPreprocessGeneratedCommandsEXT(self.handle, ptr_generatedCommandsInfo, stateCommandBuffer.handle)
        }
    }

    public func preprocessGeneratedCommandsEXT(_ generatedCommandsInfo: GeneratedCommandsInfoEXT, stateCommandBuffer: CommandBuffer) -> Void {
        let vkCmdPreprocessGeneratedCommandsEXT = self.table.pointee.vkCmdPreprocessGeneratedCommandsEXT!
        return generatedCommandsInfo.withCStruct { ptr_generatedCommandsInfo in
            vkCmdPreprocessGeneratedCommandsEXT(self.handle, ptr_generatedCommandsInfo, stateCommandBuffer.handle)
        }
    }

    public func pushDescriptorSet(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32, descriptorWrites: (AnyChainableArray<WriteDescriptorSet>)) -> Void {
        let vkCmdPushDescriptorSet = self.table.pointee.vkCmdPushDescriptorSet!
        return descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            vkCmdPushDescriptorSet(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress)
        }
    }

    public func pushDescriptorSet(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32, descriptorWrites: Array<WriteDescriptorSet>) -> Void {
        let vkCmdPushDescriptorSet = self.table.pointee.vkCmdPushDescriptorSet!
        return descriptorWrites.withCStructBufferPointer { ptr_descriptorWrites in
            vkCmdPushDescriptorSet(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set, UInt32(ptr_descriptorWrites.count), ptr_descriptorWrites.baseAddress)
        }
    }

    public func setDeviceMask(deviceMask: UInt32) -> Void {
        let vkCmdSetDeviceMask = self.table.pointee.vkCmdSetDeviceMask!
        vkCmdSetDeviceMask(self.handle, deviceMask)
    }

    public func dispatchBase(baseGroupX: UInt32, baseGroupY: UInt32, baseGroupZ: UInt32, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        let vkCmdDispatchBase = self.table.pointee.vkCmdDispatchBase!
        vkCmdDispatchBase(self.handle, baseGroupX, baseGroupY, baseGroupZ, groupCountX, groupCountY, groupCountZ)
    }

    public func pushDescriptorSetWithTemplate(descriptorUpdateTemplate: DescriptorUpdateTemplate, layout: PipelineLayout, set: UInt32, data: UnsafeRawPointer) -> Void {
        let vkCmdPushDescriptorSetWithTemplate = self.table.pointee.vkCmdPushDescriptorSetWithTemplate!
        vkCmdPushDescriptorSetWithTemplate(self.handle, descriptorUpdateTemplate.handle, layout.handle, set, data)
    }

    public func setViewportWScalingNV(firstViewport: UInt32, viewportWScalings: Array<ViewportWScalingNV>) -> Void {
        let vkCmdSetViewportWScalingNV = self.table.pointee.vkCmdSetViewportWScalingNV!
        return viewportWScalings.withCStructBufferPointer { ptr_viewportWScalings in
            vkCmdSetViewportWScalingNV(self.handle, firstViewport, UInt32(ptr_viewportWScalings.count), ptr_viewportWScalings.baseAddress)
        }
    }

    public func setDiscardRectangleEXT(firstDiscardRectangle: UInt32, discardRectangles: Array<Rect2D>) -> Void {
        let vkCmdSetDiscardRectangleEXT = self.table.pointee.vkCmdSetDiscardRectangleEXT!
        return discardRectangles.withCStructBufferPointer { ptr_discardRectangles in
            vkCmdSetDiscardRectangleEXT(self.handle, firstDiscardRectangle, UInt32(ptr_discardRectangles.count), ptr_discardRectangles.baseAddress)
        }
    }

    public func setDiscardRectangleEnableEXT(discardRectangleEnable: Bool) -> Void {
        let vkCmdSetDiscardRectangleEnableEXT = self.table.pointee.vkCmdSetDiscardRectangleEnableEXT!
        vkCmdSetDiscardRectangleEnableEXT(self.handle, VkBool32(discardRectangleEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDiscardRectangleModeEXT(discardRectangleMode: DiscardRectangleModeEXT) -> Void {
        let vkCmdSetDiscardRectangleModeEXT = self.table.pointee.vkCmdSetDiscardRectangleModeEXT!
        vkCmdSetDiscardRectangleModeEXT(self.handle, VkDiscardRectangleModeEXT(rawValue: VkDiscardRectangleModeEXT.RawValue(discardRectangleMode.rawValue)))
    }

    public func setSampleLocationsEXT(_ sampleLocationsInfo: (some Chainable<SampleLocationsInfoEXT>)) -> Void {
        let vkCmdSetSampleLocationsEXT = self.table.pointee.vkCmdSetSampleLocationsEXT!
        return sampleLocationsInfo.withCStruct { ptr_sampleLocationsInfo in
            vkCmdSetSampleLocationsEXT(self.handle, ptr_sampleLocationsInfo)
        }
    }

    public func setSampleLocationsEXT(_ sampleLocationsInfo: SampleLocationsInfoEXT) -> Void {
        let vkCmdSetSampleLocationsEXT = self.table.pointee.vkCmdSetSampleLocationsEXT!
        return sampleLocationsInfo.withCStruct { ptr_sampleLocationsInfo in
            vkCmdSetSampleLocationsEXT(self.handle, ptr_sampleLocationsInfo)
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        let vkCmdBeginDebugUtilsLabelEXT = self.table.pointee.vkCmdBeginDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkCmdBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func beginDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        let vkCmdBeginDebugUtilsLabelEXT = self.table.pointee.vkCmdBeginDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkCmdBeginDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func endDebugUtilsLabelEXT() -> Void {
        let vkCmdEndDebugUtilsLabelEXT = self.table.pointee.vkCmdEndDebugUtilsLabelEXT!
        vkCmdEndDebugUtilsLabelEXT(self.handle)
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: (some Chainable<DebugUtilsLabelEXT>)) -> Void {
        let vkCmdInsertDebugUtilsLabelEXT = self.table.pointee.vkCmdInsertDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkCmdInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func insertDebugUtilsLabelEXT(_ labelInfo: DebugUtilsLabelEXT) -> Void {
        let vkCmdInsertDebugUtilsLabelEXT = self.table.pointee.vkCmdInsertDebugUtilsLabelEXT!
        return labelInfo.withCStruct { ptr_labelInfo in
            vkCmdInsertDebugUtilsLabelEXT(self.handle, ptr_labelInfo)
        }
    }

    public func writeBufferMarkerAMD(pipelineStage: PipelineStageFlags, dstBuffer: Buffer, dstOffset: VkDeviceSize, marker: UInt32) -> Void {
        let vkCmdWriteBufferMarkerAMD = self.table.pointee.vkCmdWriteBufferMarkerAMD!
        vkCmdWriteBufferMarkerAMD(self.handle, VkPipelineStageFlagBits(rawValue: VkPipelineStageFlagBits.RawValue(pipelineStage.rawValue)), dstBuffer.handle, dstOffset, marker)
    }

    public func beginRenderPass2(_ subpassBeginInfo: (some Chainable<SubpassBeginInfo>), renderPassBegin: (some Chainable<RenderPassBeginInfo>)) -> Void {
        let vkCmdBeginRenderPass2 = self.table.pointee.vkCmdBeginRenderPass2!
        return renderPassBegin.withCStruct { ptr_renderPassBegin in
            subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
                vkCmdBeginRenderPass2(self.handle, ptr_renderPassBegin, ptr_subpassBeginInfo)
            }
        }
    }

    public func beginRenderPass2(_ subpassBeginInfo: SubpassBeginInfo, renderPassBegin: RenderPassBeginInfo) -> Void {
        let vkCmdBeginRenderPass2 = self.table.pointee.vkCmdBeginRenderPass2!
        return renderPassBegin.withCStruct { ptr_renderPassBegin in
            subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
                vkCmdBeginRenderPass2(self.handle, ptr_renderPassBegin, ptr_subpassBeginInfo)
            }
        }
    }

    public func nextSubpass2(_ subpassBeginInfo: (some Chainable<SubpassBeginInfo>), _ subpassEndInfo: (some Chainable<SubpassEndInfo>)) -> Void {
        let vkCmdNextSubpass2 = self.table.pointee.vkCmdNextSubpass2!
        return subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
            subpassEndInfo.withCStruct { ptr_subpassEndInfo in
                vkCmdNextSubpass2(self.handle, ptr_subpassBeginInfo, ptr_subpassEndInfo)
            }
        }
    }

    public func nextSubpass2(_ subpassBeginInfo: SubpassBeginInfo, _ subpassEndInfo: SubpassEndInfo = SubpassEndInfo()) -> Void {
        let vkCmdNextSubpass2 = self.table.pointee.vkCmdNextSubpass2!
        return subpassBeginInfo.withCStruct { ptr_subpassBeginInfo in
            subpassEndInfo.withCStruct { ptr_subpassEndInfo in
                vkCmdNextSubpass2(self.handle, ptr_subpassBeginInfo, ptr_subpassEndInfo)
            }
        }
    }

    public func endRenderPass2(_ subpassEndInfo: (some Chainable<SubpassEndInfo>)) -> Void {
        let vkCmdEndRenderPass2 = self.table.pointee.vkCmdEndRenderPass2!
        return subpassEndInfo.withCStruct { ptr_subpassEndInfo in
            vkCmdEndRenderPass2(self.handle, ptr_subpassEndInfo)
        }
    }

    public func endRenderPass2(_ subpassEndInfo: SubpassEndInfo = SubpassEndInfo()) -> Void {
        let vkCmdEndRenderPass2 = self.table.pointee.vkCmdEndRenderPass2!
        return subpassEndInfo.withCStruct { ptr_subpassEndInfo in
            vkCmdEndRenderPass2(self.handle, ptr_subpassEndInfo)
        }
    }

    public func drawIndirectCount(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawIndirectCount = self.table.pointee.vkCmdDrawIndirectCount!
        vkCmdDrawIndirectCount(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func drawIndexedIndirectCount(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawIndexedIndirectCount = self.table.pointee.vkCmdDrawIndexedIndirectCount!
        vkCmdDrawIndexedIndirectCount(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func setCheckpointNV(checkpointMarker: UnsafeRawPointer) -> Void {
        let vkCmdSetCheckpointNV = self.table.pointee.vkCmdSetCheckpointNV!
        vkCmdSetCheckpointNV(self.handle, checkpointMarker)
    }

    public func bindTransformFeedbackBuffersEXT(firstBinding: UInt32, buffers: Array<Buffer>, offsets: Array<VkDeviceSize>, sizes: Array<VkDeviceSize>? = nil) -> Void {
        let vkCmdBindTransformFeedbackBuffersEXT = self.table.pointee.vkCmdBindTransformFeedbackBuffersEXT!
        return buffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                sizes.withOptionalUnsafeBufferPointer { ptr_sizes in
                    vkCmdBindTransformFeedbackBuffersEXT(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress?.cast(), ptr_offsets.baseAddress, ptr_sizes.baseAddress)
                }
            }
        }
    }

    public func beginTransformFeedbackEXT(firstCounterBuffer: UInt32, counterBuffers: Array<Buffer> = [], counterBufferOffsets: Array<VkDeviceSize>? = nil) -> Void {
        let vkCmdBeginTransformFeedbackEXT = self.table.pointee.vkCmdBeginTransformFeedbackEXT!
        return counterBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_counterBuffers in
            counterBufferOffsets.withOptionalUnsafeBufferPointer { ptr_counterBufferOffsets in
                vkCmdBeginTransformFeedbackEXT(self.handle, firstCounterBuffer, UInt32(ptr_counterBuffers.count), ptr_counterBuffers.baseAddress?.cast(), ptr_counterBufferOffsets.baseAddress)
            }
        }
    }

    public func endTransformFeedbackEXT(firstCounterBuffer: UInt32, counterBuffers: Array<Buffer> = [], counterBufferOffsets: Array<VkDeviceSize>? = nil) -> Void {
        let vkCmdEndTransformFeedbackEXT = self.table.pointee.vkCmdEndTransformFeedbackEXT!
        return counterBuffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_counterBuffers in
            counterBufferOffsets.withOptionalUnsafeBufferPointer { ptr_counterBufferOffsets in
                vkCmdEndTransformFeedbackEXT(self.handle, firstCounterBuffer, UInt32(ptr_counterBuffers.count), ptr_counterBuffers.baseAddress?.cast(), ptr_counterBufferOffsets.baseAddress)
            }
        }
    }

    public func beginQueryIndexedEXT(queryPool: QueryPool, query: UInt32, flags: QueryControlFlags = [], index: UInt32) -> Void {
        let vkCmdBeginQueryIndexedEXT = self.table.pointee.vkCmdBeginQueryIndexedEXT!
        vkCmdBeginQueryIndexedEXT(self.handle, queryPool.handle, query, flags.rawValue, index)
    }

    public func endQueryIndexedEXT(queryPool: QueryPool, query: UInt32, index: UInt32) -> Void {
        let vkCmdEndQueryIndexedEXT = self.table.pointee.vkCmdEndQueryIndexedEXT!
        vkCmdEndQueryIndexedEXT(self.handle, queryPool.handle, query, index)
    }

    public func drawIndirectByteCountEXT(instanceCount: UInt32, firstInstance: UInt32, counterBuffer: Buffer, counterBufferOffset: VkDeviceSize, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        let vkCmdDrawIndirectByteCountEXT = self.table.pointee.vkCmdDrawIndirectByteCountEXT!
        vkCmdDrawIndirectByteCountEXT(self.handle, instanceCount, firstInstance, counterBuffer.handle, counterBufferOffset, counterOffset, vertexStride)
    }

    public func setExclusiveScissorNV(firstExclusiveScissor: UInt32, exclusiveScissors: Array<Rect2D>) -> Void {
        let vkCmdSetExclusiveScissorNV = self.table.pointee.vkCmdSetExclusiveScissorNV!
        return exclusiveScissors.withCStructBufferPointer { ptr_exclusiveScissors in
            vkCmdSetExclusiveScissorNV(self.handle, firstExclusiveScissor, UInt32(ptr_exclusiveScissors.count), ptr_exclusiveScissors.baseAddress)
        }
    }

    public func setExclusiveScissorEnableNV(firstExclusiveScissor: UInt32, exclusiveScissorEnables: Array<Bool>) -> Void {
        let vkCmdSetExclusiveScissorEnableNV = self.table.pointee.vkCmdSetExclusiveScissorEnableNV!
        return exclusiveScissorEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_exclusiveScissorEnables in
            vkCmdSetExclusiveScissorEnableNV(self.handle, firstExclusiveScissor, UInt32(ptr_exclusiveScissorEnables.count), ptr_exclusiveScissorEnables.baseAddress)
        }
    }

    public func bindShadingRateImageNV(imageView: ImageView? = nil, imageLayout: ImageLayout) -> Void {
        let vkCmdBindShadingRateImageNV = self.table.pointee.vkCmdBindShadingRateImageNV!
        vkCmdBindShadingRateImageNV(self.handle, imageView?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)))
    }

    public func setViewportShadingRatePaletteNV(firstViewport: UInt32, shadingRatePalettes: Array<ShadingRatePaletteNV>) -> Void {
        let vkCmdSetViewportShadingRatePaletteNV = self.table.pointee.vkCmdSetViewportShadingRatePaletteNV!
        return shadingRatePalettes.withCStructBufferPointer { ptr_shadingRatePalettes in
            vkCmdSetViewportShadingRatePaletteNV(self.handle, firstViewport, UInt32(ptr_shadingRatePalettes.count), ptr_shadingRatePalettes.baseAddress)
        }
    }

    public func setCoarseSampleOrderNV(sampleOrderType: CoarseSampleOrderTypeNV, customSampleOrders: Array<CoarseSampleOrderCustomNV> = []) -> Void {
        let vkCmdSetCoarseSampleOrderNV = self.table.pointee.vkCmdSetCoarseSampleOrderNV!
        return customSampleOrders.withCStructBufferPointer { ptr_customSampleOrders in
            vkCmdSetCoarseSampleOrderNV(self.handle, VkCoarseSampleOrderTypeNV(rawValue: VkCoarseSampleOrderTypeNV.RawValue(sampleOrderType.rawValue)), UInt32(ptr_customSampleOrders.count), ptr_customSampleOrders.baseAddress)
        }
    }

    public func drawMeshTasksNV(taskCount: UInt32, firstTask: UInt32) -> Void {
        let vkCmdDrawMeshTasksNV = self.table.pointee.vkCmdDrawMeshTasksNV!
        vkCmdDrawMeshTasksNV(self.handle, taskCount, firstTask)
    }

    public func drawMeshTasksIndirectNV(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawMeshTasksIndirectNV = self.table.pointee.vkCmdDrawMeshTasksIndirectNV!
        vkCmdDrawMeshTasksIndirectNV(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func drawMeshTasksIndirectCountNV(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawMeshTasksIndirectCountNV = self.table.pointee.vkCmdDrawMeshTasksIndirectCountNV!
        vkCmdDrawMeshTasksIndirectCountNV(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func drawMeshTasksEXT(groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32) -> Void {
        let vkCmdDrawMeshTasksEXT = self.table.pointee.vkCmdDrawMeshTasksEXT!
        vkCmdDrawMeshTasksEXT(self.handle, groupCountX, groupCountY, groupCountZ)
    }

    public func drawMeshTasksIndirectEXT(buffer: Buffer, offset: VkDeviceSize, drawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawMeshTasksIndirectEXT = self.table.pointee.vkCmdDrawMeshTasksIndirectEXT!
        vkCmdDrawMeshTasksIndirectEXT(self.handle, buffer.handle, offset, drawCount, stride)
    }

    public func drawMeshTasksIndirectCountEXT(buffer: Buffer, offset: VkDeviceSize, countBuffer: Buffer, countBufferOffset: VkDeviceSize, maxDrawCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDrawMeshTasksIndirectCountEXT = self.table.pointee.vkCmdDrawMeshTasksIndirectCountEXT!
        vkCmdDrawMeshTasksIndirectCountEXT(self.handle, buffer.handle, offset, countBuffer.handle, countBufferOffset, maxDrawCount, stride)
    }

    public func bindInvocationMaskHUAWEI(imageView: ImageView? = nil, imageLayout: ImageLayout) -> Void {
        let vkCmdBindInvocationMaskHUAWEI = self.table.pointee.vkCmdBindInvocationMaskHUAWEI!
        vkCmdBindInvocationMaskHUAWEI(self.handle, imageView?.handle, VkImageLayout(rawValue: VkImageLayout.RawValue(imageLayout.rawValue)))
    }

    public func copyAccelerationStructureNV(dst: AccelerationStructureNV, src: AccelerationStructureNV, mode: CopyAccelerationStructureModeKHR) -> Void {
        let vkCmdCopyAccelerationStructureNV = self.table.pointee.vkCmdCopyAccelerationStructureNV!
        vkCmdCopyAccelerationStructureNV(self.handle, dst.handle, src.handle, VkCopyAccelerationStructureModeKHR(rawValue: VkCopyAccelerationStructureModeKHR.RawValue(mode.rawValue)))
    }

    public func copyAccelerationStructureKHR(_ info: (some Chainable<CopyAccelerationStructureInfoKHR>)) -> Void {
        let vkCmdCopyAccelerationStructureKHR = self.table.pointee.vkCmdCopyAccelerationStructureKHR!
        return info.withCStruct { ptr_info in
            vkCmdCopyAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func copyAccelerationStructureKHR(_ info: CopyAccelerationStructureInfoKHR) -> Void {
        let vkCmdCopyAccelerationStructureKHR = self.table.pointee.vkCmdCopyAccelerationStructureKHR!
        return info.withCStruct { ptr_info in
            vkCmdCopyAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: (some Chainable<CopyAccelerationStructureToMemoryInfoKHR>)) -> Void {
        let vkCmdCopyAccelerationStructureToMemoryKHR = self.table.pointee.vkCmdCopyAccelerationStructureToMemoryKHR!
        return info.withCStruct { ptr_info in
            vkCmdCopyAccelerationStructureToMemoryKHR(self.handle, ptr_info)
        }
    }

    public func copyAccelerationStructureToMemoryKHR(_ info: CopyAccelerationStructureToMemoryInfoKHR) -> Void {
        let vkCmdCopyAccelerationStructureToMemoryKHR = self.table.pointee.vkCmdCopyAccelerationStructureToMemoryKHR!
        return info.withCStruct { ptr_info in
            vkCmdCopyAccelerationStructureToMemoryKHR(self.handle, ptr_info)
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: (some Chainable<CopyMemoryToAccelerationStructureInfoKHR>)) -> Void {
        let vkCmdCopyMemoryToAccelerationStructureKHR = self.table.pointee.vkCmdCopyMemoryToAccelerationStructureKHR!
        return info.withCStruct { ptr_info in
            vkCmdCopyMemoryToAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func copyMemoryToAccelerationStructureKHR(_ info: CopyMemoryToAccelerationStructureInfoKHR) -> Void {
        let vkCmdCopyMemoryToAccelerationStructureKHR = self.table.pointee.vkCmdCopyMemoryToAccelerationStructureKHR!
        return info.withCStruct { ptr_info in
            vkCmdCopyMemoryToAccelerationStructureKHR(self.handle, ptr_info)
        }
    }

    public func writeAccelerationStructuresPropertiesKHR(accelerationStructures: Array<AccelerationStructureKHR>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        let vkCmdWriteAccelerationStructuresPropertiesKHR = self.table.pointee.vkCmdWriteAccelerationStructuresPropertiesKHR!
        return accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            vkCmdWriteAccelerationStructuresPropertiesKHR(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress?.cast(), VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func writeAccelerationStructuresPropertiesNV(accelerationStructures: Array<AccelerationStructureNV>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        let vkCmdWriteAccelerationStructuresPropertiesNV = self.table.pointee.vkCmdWriteAccelerationStructuresPropertiesNV!
        return accelerationStructures.map{ $0.handle }.withUnsafeBufferPointer { ptr_accelerationStructures in
            vkCmdWriteAccelerationStructuresPropertiesNV(self.handle, UInt32(ptr_accelerationStructures.count), ptr_accelerationStructures.baseAddress?.cast(), VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func buildAccelerationStructureNV(_ info: (some Chainable<AccelerationStructureInfoNV>), instanceData: Buffer? = nil, instanceOffset: VkDeviceSize, update: Bool, dst: AccelerationStructureNV, src: AccelerationStructureNV? = nil, scratch: Buffer, scratchOffset: VkDeviceSize) -> Void {
        let vkCmdBuildAccelerationStructureNV = self.table.pointee.vkCmdBuildAccelerationStructureNV!
        return info.withCStruct { ptr_info in
            vkCmdBuildAccelerationStructureNV(self.handle, ptr_info, instanceData?.handle, instanceOffset, VkBool32(update ? VK_TRUE : VK_FALSE), dst.handle, src?.handle, scratch.handle, scratchOffset)
        }
    }

    public func buildAccelerationStructureNV(_ info: AccelerationStructureInfoNV, instanceData: Buffer? = nil, instanceOffset: VkDeviceSize, update: Bool, dst: AccelerationStructureNV, src: AccelerationStructureNV? = nil, scratch: Buffer, scratchOffset: VkDeviceSize) -> Void {
        let vkCmdBuildAccelerationStructureNV = self.table.pointee.vkCmdBuildAccelerationStructureNV!
        return info.withCStruct { ptr_info in
            vkCmdBuildAccelerationStructureNV(self.handle, ptr_info, instanceData?.handle, instanceOffset, VkBool32(update ? VK_TRUE : VK_FALSE), dst.handle, src?.handle, scratch.handle, scratchOffset)
        }
    }

    public func traceRaysKHR(raygenShaderBindingTable: StridedDeviceAddressRegionKHR, missShaderBindingTable: StridedDeviceAddressRegionKHR, hitShaderBindingTable: StridedDeviceAddressRegionKHR, callableShaderBindingTable: StridedDeviceAddressRegionKHR, width: UInt32, height: UInt32, depth: UInt32) -> Void {
        let vkCmdTraceRaysKHR = self.table.pointee.vkCmdTraceRaysKHR!
        return raygenShaderBindingTable.withCStruct { ptr_raygenShaderBindingTable in
            missShaderBindingTable.withCStruct { ptr_missShaderBindingTable in
                hitShaderBindingTable.withCStruct { ptr_hitShaderBindingTable in
                    callableShaderBindingTable.withCStruct { ptr_callableShaderBindingTable in
                        vkCmdTraceRaysKHR(self.handle, ptr_raygenShaderBindingTable, ptr_missShaderBindingTable, ptr_hitShaderBindingTable, ptr_callableShaderBindingTable, width, height, depth)
                    }
                }
            }
        }
    }

    public func traceRaysNV(raygenShaderBindingTableBuffer: Buffer, raygenShaderBindingOffset: VkDeviceSize, missShaderBindingTableBuffer: Buffer? = nil, missShaderBindingOffset: VkDeviceSize, missShaderBindingStride: VkDeviceSize, hitShaderBindingTableBuffer: Buffer? = nil, hitShaderBindingOffset: VkDeviceSize, hitShaderBindingStride: VkDeviceSize, callableShaderBindingTableBuffer: Buffer? = nil, callableShaderBindingOffset: VkDeviceSize, callableShaderBindingStride: VkDeviceSize, width: UInt32, height: UInt32, depth: UInt32) -> Void {
        let vkCmdTraceRaysNV = self.table.pointee.vkCmdTraceRaysNV!
        vkCmdTraceRaysNV(self.handle, raygenShaderBindingTableBuffer.handle, raygenShaderBindingOffset, missShaderBindingTableBuffer?.handle, missShaderBindingOffset, missShaderBindingStride, hitShaderBindingTableBuffer?.handle, hitShaderBindingOffset, hitShaderBindingStride, callableShaderBindingTableBuffer?.handle, callableShaderBindingOffset, callableShaderBindingStride, width, height, depth)
    }

    public func traceRaysIndirectKHR(raygenShaderBindingTable: StridedDeviceAddressRegionKHR, missShaderBindingTable: StridedDeviceAddressRegionKHR, hitShaderBindingTable: StridedDeviceAddressRegionKHR, callableShaderBindingTable: StridedDeviceAddressRegionKHR, indirectDeviceAddress: VkDeviceAddress) -> Void {
        let vkCmdTraceRaysIndirectKHR = self.table.pointee.vkCmdTraceRaysIndirectKHR!
        return raygenShaderBindingTable.withCStruct { ptr_raygenShaderBindingTable in
            missShaderBindingTable.withCStruct { ptr_missShaderBindingTable in
                hitShaderBindingTable.withCStruct { ptr_hitShaderBindingTable in
                    callableShaderBindingTable.withCStruct { ptr_callableShaderBindingTable in
                        vkCmdTraceRaysIndirectKHR(self.handle, ptr_raygenShaderBindingTable, ptr_missShaderBindingTable, ptr_hitShaderBindingTable, ptr_callableShaderBindingTable, indirectDeviceAddress)
                    }
                }
            }
        }
    }

    public func traceRaysIndirect2KHR(indirectDeviceAddress: VkDeviceAddress) -> Void {
        let vkCmdTraceRaysIndirect2KHR = self.table.pointee.vkCmdTraceRaysIndirect2KHR!
        vkCmdTraceRaysIndirect2KHR(self.handle, indirectDeviceAddress)
    }

    public func buildClusterAccelerationStructureIndirectNV(_ commandInfos: (some Chainable<ClusterAccelerationStructureCommandsInfoNV>)) -> Void {
        let vkCmdBuildClusterAccelerationStructureIndirectNV = self.table.pointee.vkCmdBuildClusterAccelerationStructureIndirectNV!
        return commandInfos.withCStruct { ptr_commandInfos in
            vkCmdBuildClusterAccelerationStructureIndirectNV(self.handle, ptr_commandInfos)
        }
    }

    public func buildClusterAccelerationStructureIndirectNV(_ commandInfos: ClusterAccelerationStructureCommandsInfoNV) -> Void {
        let vkCmdBuildClusterAccelerationStructureIndirectNV = self.table.pointee.vkCmdBuildClusterAccelerationStructureIndirectNV!
        return commandInfos.withCStruct { ptr_commandInfos in
            vkCmdBuildClusterAccelerationStructureIndirectNV(self.handle, ptr_commandInfos)
        }
    }

    public func setRayTracingPipelineStackSizeKHR(pipelineStackSize: UInt32) -> Void {
        let vkCmdSetRayTracingPipelineStackSizeKHR = self.table.pointee.vkCmdSetRayTracingPipelineStackSizeKHR!
        vkCmdSetRayTracingPipelineStackSizeKHR(self.handle, pipelineStackSize)
    }

    public func setPerformanceMarkerINTEL(_ markerInfo: (some Chainable<PerformanceMarkerInfoINTEL>)) throws(Result) -> Void {
        let vkCmdSetPerformanceMarkerINTEL = self.table.pointee.vkCmdSetPerformanceMarkerINTEL!
        return try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                vkCmdSetPerformanceMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceMarkerINTEL(_ markerInfo: PerformanceMarkerInfoINTEL) throws(Result) -> Void {
        let vkCmdSetPerformanceMarkerINTEL = self.table.pointee.vkCmdSetPerformanceMarkerINTEL!
        return try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                vkCmdSetPerformanceMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceStreamMarkerINTEL(_ markerInfo: (some Chainable<PerformanceStreamMarkerInfoINTEL>)) throws(Result) -> Void {
        let vkCmdSetPerformanceStreamMarkerINTEL = self.table.pointee.vkCmdSetPerformanceStreamMarkerINTEL!
        return try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                vkCmdSetPerformanceStreamMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceStreamMarkerINTEL(_ markerInfo: PerformanceStreamMarkerInfoINTEL) throws(Result) -> Void {
        let vkCmdSetPerformanceStreamMarkerINTEL = self.table.pointee.vkCmdSetPerformanceStreamMarkerINTEL!
        return try markerInfo.withCStruct { ptr_markerInfo throws(Result) in
            try checkResult(
                vkCmdSetPerformanceStreamMarkerINTEL(self.handle, ptr_markerInfo)
            )
        }
    }

    public func setPerformanceOverrideINTEL(_ overrideInfo: (some Chainable<PerformanceOverrideInfoINTEL>)) throws(Result) -> Void {
        let vkCmdSetPerformanceOverrideINTEL = self.table.pointee.vkCmdSetPerformanceOverrideINTEL!
        return try overrideInfo.withCStruct { ptr_overrideInfo throws(Result) in
            try checkResult(
                vkCmdSetPerformanceOverrideINTEL(self.handle, ptr_overrideInfo)
            )
        }
    }

    public func setPerformanceOverrideINTEL(_ overrideInfo: PerformanceOverrideInfoINTEL) throws(Result) -> Void {
        let vkCmdSetPerformanceOverrideINTEL = self.table.pointee.vkCmdSetPerformanceOverrideINTEL!
        return try overrideInfo.withCStruct { ptr_overrideInfo throws(Result) in
            try checkResult(
                vkCmdSetPerformanceOverrideINTEL(self.handle, ptr_overrideInfo)
            )
        }
    }

    public func setLineStipple(lineStippleFactor: UInt32, lineStipplePattern: UInt16) -> Void {
        let vkCmdSetLineStipple = self.table.pointee.vkCmdSetLineStipple!
        vkCmdSetLineStipple(self.handle, lineStippleFactor, lineStipplePattern)
    }

    public func buildAccelerationStructuresKHR(_ infos: (AnyChainableArray<AccelerationStructureBuildGeometryInfoKHR>), _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>) -> Void {
        let vkCmdBuildAccelerationStructuresKHR = self.table.pointee.vkCmdBuildAccelerationStructuresKHR!
        return infos.withCStructBufferPointer { ptr_infos in
            vkCmdBuildAccelerationStructuresKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
        }
    }

    public func buildAccelerationStructuresKHR(_ infos: Array<AccelerationStructureBuildGeometryInfoKHR>, _ buildRangeInfos: UnsafePointer<UnsafePointer<VkAccelerationStructureBuildRangeInfoKHR>?>) -> Void {
        let vkCmdBuildAccelerationStructuresKHR = self.table.pointee.vkCmdBuildAccelerationStructuresKHR!
        return infos.withCStructBufferPointer { ptr_infos in
            vkCmdBuildAccelerationStructuresKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, buildRangeInfos)
        }
    }

    public func buildAccelerationStructuresIndirectKHR(_ infos: (AnyChainableArray<AccelerationStructureBuildGeometryInfoKHR>), indirectDeviceAddresses: Array<VkDeviceAddress>, indirectStrides: Array<UInt32>, maxPrimitiveCounts: UnsafePointer<UnsafePointer<UInt32>?>) -> Void {
        let vkCmdBuildAccelerationStructuresIndirectKHR = self.table.pointee.vkCmdBuildAccelerationStructuresIndirectKHR!
        return infos.withCStructBufferPointer { ptr_infos in
            indirectDeviceAddresses.withUnsafeBufferPointer { ptr_indirectDeviceAddresses in
                indirectStrides.withUnsafeBufferPointer { ptr_indirectStrides in
                    vkCmdBuildAccelerationStructuresIndirectKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, ptr_indirectDeviceAddresses.baseAddress, ptr_indirectStrides.baseAddress, maxPrimitiveCounts)
                }
            }
        }
    }

    public func buildAccelerationStructuresIndirectKHR(_ infos: Array<AccelerationStructureBuildGeometryInfoKHR>, indirectDeviceAddresses: Array<VkDeviceAddress>, indirectStrides: Array<UInt32>, maxPrimitiveCounts: UnsafePointer<UnsafePointer<UInt32>?>) -> Void {
        let vkCmdBuildAccelerationStructuresIndirectKHR = self.table.pointee.vkCmdBuildAccelerationStructuresIndirectKHR!
        return infos.withCStructBufferPointer { ptr_infos in
            indirectDeviceAddresses.withUnsafeBufferPointer { ptr_indirectDeviceAddresses in
                indirectStrides.withUnsafeBufferPointer { ptr_indirectStrides in
                    vkCmdBuildAccelerationStructuresIndirectKHR(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress, ptr_indirectDeviceAddresses.baseAddress, ptr_indirectStrides.baseAddress, maxPrimitiveCounts)
                }
            }
        }
    }

    public func setCullMode(cullMode: CullModeFlags = []) -> Void {
        let vkCmdSetCullMode = self.table.pointee.vkCmdSetCullMode!
        vkCmdSetCullMode(self.handle, cullMode.rawValue)
    }

    public func setFrontFace(frontFace: FrontFace) -> Void {
        let vkCmdSetFrontFace = self.table.pointee.vkCmdSetFrontFace!
        vkCmdSetFrontFace(self.handle, VkFrontFace(rawValue: VkFrontFace.RawValue(frontFace.rawValue)))
    }

    public func setPrimitiveTopology(primitiveTopology: PrimitiveTopology) -> Void {
        let vkCmdSetPrimitiveTopology = self.table.pointee.vkCmdSetPrimitiveTopology!
        vkCmdSetPrimitiveTopology(self.handle, VkPrimitiveTopology(rawValue: VkPrimitiveTopology.RawValue(primitiveTopology.rawValue)))
    }

    public func setViewportWithCount(viewports: Array<Viewport>) -> Void {
        let vkCmdSetViewportWithCount = self.table.pointee.vkCmdSetViewportWithCount!
        return viewports.withCStructBufferPointer { ptr_viewports in
            vkCmdSetViewportWithCount(self.handle, UInt32(ptr_viewports.count), ptr_viewports.baseAddress)
        }
    }

    public func setScissorWithCount(scissors: Array<Rect2D>) -> Void {
        let vkCmdSetScissorWithCount = self.table.pointee.vkCmdSetScissorWithCount!
        return scissors.withCStructBufferPointer { ptr_scissors in
            vkCmdSetScissorWithCount(self.handle, UInt32(ptr_scissors.count), ptr_scissors.baseAddress)
        }
    }

    public func bindIndexBuffer2(buffer: Buffer? = nil, offset: VkDeviceSize, size: VkDeviceSize, indexType: IndexType) -> Void {
        let vkCmdBindIndexBuffer2 = self.table.pointee.vkCmdBindIndexBuffer2!
        vkCmdBindIndexBuffer2(self.handle, buffer?.handle, offset, size, VkIndexType(rawValue: VkIndexType.RawValue(indexType.rawValue)))
    }

    public func bindVertexBuffers2(firstBinding: UInt32, buffers: Array<Buffer>, offsets: Array<VkDeviceSize>, sizes: Array<VkDeviceSize>? = nil, strides: Array<VkDeviceSize>? = nil) -> Void {
        let vkCmdBindVertexBuffers2 = self.table.pointee.vkCmdBindVertexBuffers2!
        return buffers.map{ $0.handle }.withUnsafeBufferPointer { ptr_buffers in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                sizes.withOptionalUnsafeBufferPointer { ptr_sizes in
                    strides.withOptionalUnsafeBufferPointer { ptr_strides in
                        vkCmdBindVertexBuffers2(self.handle, firstBinding, UInt32(ptr_buffers.count), ptr_buffers.baseAddress?.cast(), ptr_offsets.baseAddress, ptr_sizes.baseAddress, ptr_strides.baseAddress)
                    }
                }
            }
        }
    }

    public func setDepthTestEnable(depthTestEnable: Bool) -> Void {
        let vkCmdSetDepthTestEnable = self.table.pointee.vkCmdSetDepthTestEnable!
        vkCmdSetDepthTestEnable(self.handle, VkBool32(depthTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthWriteEnable(depthWriteEnable: Bool) -> Void {
        let vkCmdSetDepthWriteEnable = self.table.pointee.vkCmdSetDepthWriteEnable!
        vkCmdSetDepthWriteEnable(self.handle, VkBool32(depthWriteEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthCompareOp(depthCompareOp: CompareOp) -> Void {
        let vkCmdSetDepthCompareOp = self.table.pointee.vkCmdSetDepthCompareOp!
        vkCmdSetDepthCompareOp(self.handle, VkCompareOp(rawValue: VkCompareOp.RawValue(depthCompareOp.rawValue)))
    }

    public func setDepthBoundsTestEnable(depthBoundsTestEnable: Bool) -> Void {
        let vkCmdSetDepthBoundsTestEnable = self.table.pointee.vkCmdSetDepthBoundsTestEnable!
        vkCmdSetDepthBoundsTestEnable(self.handle, VkBool32(depthBoundsTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func setStencilTestEnable(stencilTestEnable: Bool) -> Void {
        let vkCmdSetStencilTestEnable = self.table.pointee.vkCmdSetStencilTestEnable!
        vkCmdSetStencilTestEnable(self.handle, VkBool32(stencilTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func setStencilOp(faceMask: StencilFaceFlags, failOp: StencilOp, passOp: StencilOp, depthFailOp: StencilOp, compareOp: CompareOp) -> Void {
        let vkCmdSetStencilOp = self.table.pointee.vkCmdSetStencilOp!
        vkCmdSetStencilOp(self.handle, faceMask.rawValue, VkStencilOp(rawValue: VkStencilOp.RawValue(failOp.rawValue)), VkStencilOp(rawValue: VkStencilOp.RawValue(passOp.rawValue)), VkStencilOp(rawValue: VkStencilOp.RawValue(depthFailOp.rawValue)), VkCompareOp(rawValue: VkCompareOp.RawValue(compareOp.rawValue)))
    }

    public func setPatchControlPointsEXT(patchControlPoints: UInt32) -> Void {
        let vkCmdSetPatchControlPointsEXT = self.table.pointee.vkCmdSetPatchControlPointsEXT!
        vkCmdSetPatchControlPointsEXT(self.handle, patchControlPoints)
    }

    public func setRasterizerDiscardEnable(rasterizerDiscardEnable: Bool) -> Void {
        let vkCmdSetRasterizerDiscardEnable = self.table.pointee.vkCmdSetRasterizerDiscardEnable!
        vkCmdSetRasterizerDiscardEnable(self.handle, VkBool32(rasterizerDiscardEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthBiasEnable(depthBiasEnable: Bool) -> Void {
        let vkCmdSetDepthBiasEnable = self.table.pointee.vkCmdSetDepthBiasEnable!
        vkCmdSetDepthBiasEnable(self.handle, VkBool32(depthBiasEnable ? VK_TRUE : VK_FALSE))
    }

    public func setLogicOpEXT(logicOp: LogicOp) -> Void {
        let vkCmdSetLogicOpEXT = self.table.pointee.vkCmdSetLogicOpEXT!
        vkCmdSetLogicOpEXT(self.handle, VkLogicOp(rawValue: VkLogicOp.RawValue(logicOp.rawValue)))
    }

    public func setPrimitiveRestartEnable(primitiveRestartEnable: Bool) -> Void {
        let vkCmdSetPrimitiveRestartEnable = self.table.pointee.vkCmdSetPrimitiveRestartEnable!
        vkCmdSetPrimitiveRestartEnable(self.handle, VkBool32(primitiveRestartEnable ? VK_TRUE : VK_FALSE))
    }

    public func setTessellationDomainOriginEXT(domainOrigin: TessellationDomainOrigin) -> Void {
        let vkCmdSetTessellationDomainOriginEXT = self.table.pointee.vkCmdSetTessellationDomainOriginEXT!
        vkCmdSetTessellationDomainOriginEXT(self.handle, VkTessellationDomainOrigin(rawValue: VkTessellationDomainOrigin.RawValue(domainOrigin.rawValue)))
    }

    public func setDepthClampEnableEXT(depthClampEnable: Bool) -> Void {
        let vkCmdSetDepthClampEnableEXT = self.table.pointee.vkCmdSetDepthClampEnableEXT!
        vkCmdSetDepthClampEnableEXT(self.handle, VkBool32(depthClampEnable ? VK_TRUE : VK_FALSE))
    }

    public func setPolygonModeEXT(polygonMode: PolygonMode) -> Void {
        let vkCmdSetPolygonModeEXT = self.table.pointee.vkCmdSetPolygonModeEXT!
        vkCmdSetPolygonModeEXT(self.handle, VkPolygonMode(rawValue: VkPolygonMode.RawValue(polygonMode.rawValue)))
    }

    public func setRasterizationSamplesEXT(rasterizationSamples: SampleCountFlags) -> Void {
        let vkCmdSetRasterizationSamplesEXT = self.table.pointee.vkCmdSetRasterizationSamplesEXT!
        vkCmdSetRasterizationSamplesEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(rasterizationSamples.rawValue)))
    }

    public func setSampleMaskEXT(samples: SampleCountFlags, sampleMask: UnsafePointer<VkSampleMask>? = nil) -> Void {
        let vkCmdSetSampleMaskEXT = self.table.pointee.vkCmdSetSampleMaskEXT!
        vkCmdSetSampleMaskEXT(self.handle, VkSampleCountFlagBits(rawValue: VkSampleCountFlagBits.RawValue(samples.rawValue)), sampleMask)
    }

    public func setAlphaToCoverageEnableEXT(alphaToCoverageEnable: Bool) -> Void {
        let vkCmdSetAlphaToCoverageEnableEXT = self.table.pointee.vkCmdSetAlphaToCoverageEnableEXT!
        vkCmdSetAlphaToCoverageEnableEXT(self.handle, VkBool32(alphaToCoverageEnable ? VK_TRUE : VK_FALSE))
    }

    public func setAlphaToOneEnableEXT(alphaToOneEnable: Bool) -> Void {
        let vkCmdSetAlphaToOneEnableEXT = self.table.pointee.vkCmdSetAlphaToOneEnableEXT!
        vkCmdSetAlphaToOneEnableEXT(self.handle, VkBool32(alphaToOneEnable ? VK_TRUE : VK_FALSE))
    }

    public func setLogicOpEnableEXT(logicOpEnable: Bool) -> Void {
        let vkCmdSetLogicOpEnableEXT = self.table.pointee.vkCmdSetLogicOpEnableEXT!
        vkCmdSetLogicOpEnableEXT(self.handle, VkBool32(logicOpEnable ? VK_TRUE : VK_FALSE))
    }

    public func setColorBlendEnableEXT(firstAttachment: UInt32, colorBlendEnables: Array<Bool>) -> Void {
        let vkCmdSetColorBlendEnableEXT = self.table.pointee.vkCmdSetColorBlendEnableEXT!
        return colorBlendEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_colorBlendEnables in
            vkCmdSetColorBlendEnableEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendEnables.count), ptr_colorBlendEnables.baseAddress)
        }
    }

    public func setColorBlendEquationEXT(firstAttachment: UInt32, colorBlendEquations: Array<ColorBlendEquationEXT>) -> Void {
        let vkCmdSetColorBlendEquationEXT = self.table.pointee.vkCmdSetColorBlendEquationEXT!
        return colorBlendEquations.withCStructBufferPointer { ptr_colorBlendEquations in
            vkCmdSetColorBlendEquationEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendEquations.count), ptr_colorBlendEquations.baseAddress)
        }
    }

    public func setColorWriteMaskEXT(firstAttachment: UInt32, colorWriteMasks: Array<ColorComponentFlags>) -> Void {
        let vkCmdSetColorWriteMaskEXT = self.table.pointee.vkCmdSetColorWriteMaskEXT!
        return colorWriteMasks.map{ $0.rawValue }.withUnsafeBufferPointer { ptr_colorWriteMasks in
            vkCmdSetColorWriteMaskEXT(self.handle, firstAttachment, UInt32(ptr_colorWriteMasks.count), ptr_colorWriteMasks.baseAddress)
        }
    }

    public func setRasterizationStreamEXT(rasterizationStream: UInt32) -> Void {
        let vkCmdSetRasterizationStreamEXT = self.table.pointee.vkCmdSetRasterizationStreamEXT!
        vkCmdSetRasterizationStreamEXT(self.handle, rasterizationStream)
    }

    public func setConservativeRasterizationModeEXT(conservativeRasterizationMode: ConservativeRasterizationModeEXT) -> Void {
        let vkCmdSetConservativeRasterizationModeEXT = self.table.pointee.vkCmdSetConservativeRasterizationModeEXT!
        vkCmdSetConservativeRasterizationModeEXT(self.handle, VkConservativeRasterizationModeEXT(rawValue: VkConservativeRasterizationModeEXT.RawValue(conservativeRasterizationMode.rawValue)))
    }

    public func setExtraPrimitiveOverestimationSizeEXT(extraPrimitiveOverestimationSize: Float) -> Void {
        let vkCmdSetExtraPrimitiveOverestimationSizeEXT = self.table.pointee.vkCmdSetExtraPrimitiveOverestimationSizeEXT!
        vkCmdSetExtraPrimitiveOverestimationSizeEXT(self.handle, extraPrimitiveOverestimationSize)
    }

    public func setDepthClipEnableEXT(depthClipEnable: Bool) -> Void {
        let vkCmdSetDepthClipEnableEXT = self.table.pointee.vkCmdSetDepthClipEnableEXT!
        vkCmdSetDepthClipEnableEXT(self.handle, VkBool32(depthClipEnable ? VK_TRUE : VK_FALSE))
    }

    public func setSampleLocationsEnableEXT(sampleLocationsEnable: Bool) -> Void {
        let vkCmdSetSampleLocationsEnableEXT = self.table.pointee.vkCmdSetSampleLocationsEnableEXT!
        vkCmdSetSampleLocationsEnableEXT(self.handle, VkBool32(sampleLocationsEnable ? VK_TRUE : VK_FALSE))
    }

    public func setColorBlendAdvancedEXT(firstAttachment: UInt32, colorBlendAdvanced: Array<ColorBlendAdvancedEXT>) -> Void {
        let vkCmdSetColorBlendAdvancedEXT = self.table.pointee.vkCmdSetColorBlendAdvancedEXT!
        return colorBlendAdvanced.withCStructBufferPointer { ptr_colorBlendAdvanced in
            vkCmdSetColorBlendAdvancedEXT(self.handle, firstAttachment, UInt32(ptr_colorBlendAdvanced.count), ptr_colorBlendAdvanced.baseAddress)
        }
    }

    public func setProvokingVertexModeEXT(provokingVertexMode: ProvokingVertexModeEXT) -> Void {
        let vkCmdSetProvokingVertexModeEXT = self.table.pointee.vkCmdSetProvokingVertexModeEXT!
        vkCmdSetProvokingVertexModeEXT(self.handle, VkProvokingVertexModeEXT(rawValue: VkProvokingVertexModeEXT.RawValue(provokingVertexMode.rawValue)))
    }

    public func setLineRasterizationModeEXT(lineRasterizationMode: VkLineRasterizationModeEXT) -> Void {
        let vkCmdSetLineRasterizationModeEXT = self.table.pointee.vkCmdSetLineRasterizationModeEXT!
        vkCmdSetLineRasterizationModeEXT(self.handle, lineRasterizationMode)
    }

    public func setLineStippleEnableEXT(stippledLineEnable: Bool) -> Void {
        let vkCmdSetLineStippleEnableEXT = self.table.pointee.vkCmdSetLineStippleEnableEXT!
        vkCmdSetLineStippleEnableEXT(self.handle, VkBool32(stippledLineEnable ? VK_TRUE : VK_FALSE))
    }

    public func setDepthClipNegativeOneToOneEXT(negativeOneToOne: Bool) -> Void {
        let vkCmdSetDepthClipNegativeOneToOneEXT = self.table.pointee.vkCmdSetDepthClipNegativeOneToOneEXT!
        vkCmdSetDepthClipNegativeOneToOneEXT(self.handle, VkBool32(negativeOneToOne ? VK_TRUE : VK_FALSE))
    }

    public func setViewportWScalingEnableNV(viewportWScalingEnable: Bool) -> Void {
        let vkCmdSetViewportWScalingEnableNV = self.table.pointee.vkCmdSetViewportWScalingEnableNV!
        vkCmdSetViewportWScalingEnableNV(self.handle, VkBool32(viewportWScalingEnable ? VK_TRUE : VK_FALSE))
    }

    public func setViewportSwizzleNV(firstViewport: UInt32, viewportSwizzles: Array<ViewportSwizzleNV>) -> Void {
        let vkCmdSetViewportSwizzleNV = self.table.pointee.vkCmdSetViewportSwizzleNV!
        return viewportSwizzles.withCStructBufferPointer { ptr_viewportSwizzles in
            vkCmdSetViewportSwizzleNV(self.handle, firstViewport, UInt32(ptr_viewportSwizzles.count), ptr_viewportSwizzles.baseAddress)
        }
    }

    public func setCoverageToColorEnableNV(coverageToColorEnable: Bool) -> Void {
        let vkCmdSetCoverageToColorEnableNV = self.table.pointee.vkCmdSetCoverageToColorEnableNV!
        vkCmdSetCoverageToColorEnableNV(self.handle, VkBool32(coverageToColorEnable ? VK_TRUE : VK_FALSE))
    }

    public func setCoverageToColorLocationNV(coverageToColorLocation: UInt32) -> Void {
        let vkCmdSetCoverageToColorLocationNV = self.table.pointee.vkCmdSetCoverageToColorLocationNV!
        vkCmdSetCoverageToColorLocationNV(self.handle, coverageToColorLocation)
    }

    public func setCoverageModulationModeNV(coverageModulationMode: CoverageModulationModeNV) -> Void {
        let vkCmdSetCoverageModulationModeNV = self.table.pointee.vkCmdSetCoverageModulationModeNV!
        vkCmdSetCoverageModulationModeNV(self.handle, VkCoverageModulationModeNV(rawValue: VkCoverageModulationModeNV.RawValue(coverageModulationMode.rawValue)))
    }

    public func setCoverageModulationTableEnableNV(coverageModulationTableEnable: Bool) -> Void {
        let vkCmdSetCoverageModulationTableEnableNV = self.table.pointee.vkCmdSetCoverageModulationTableEnableNV!
        vkCmdSetCoverageModulationTableEnableNV(self.handle, VkBool32(coverageModulationTableEnable ? VK_TRUE : VK_FALSE))
    }

    public func setCoverageModulationTableNV(coverageModulationTable: Array<Float>) -> Void {
        let vkCmdSetCoverageModulationTableNV = self.table.pointee.vkCmdSetCoverageModulationTableNV!
        return coverageModulationTable.withUnsafeBufferPointer { ptr_coverageModulationTable in
            vkCmdSetCoverageModulationTableNV(self.handle, UInt32(ptr_coverageModulationTable.count), ptr_coverageModulationTable.baseAddress)
        }
    }

    public func setShadingRateImageEnableNV(shadingRateImageEnable: Bool) -> Void {
        let vkCmdSetShadingRateImageEnableNV = self.table.pointee.vkCmdSetShadingRateImageEnableNV!
        vkCmdSetShadingRateImageEnableNV(self.handle, VkBool32(shadingRateImageEnable ? VK_TRUE : VK_FALSE))
    }

    public func setCoverageReductionModeNV(coverageReductionMode: CoverageReductionModeNV) -> Void {
        let vkCmdSetCoverageReductionModeNV = self.table.pointee.vkCmdSetCoverageReductionModeNV!
        vkCmdSetCoverageReductionModeNV(self.handle, VkCoverageReductionModeNV(rawValue: VkCoverageReductionModeNV.RawValue(coverageReductionMode.rawValue)))
    }

    public func setRepresentativeFragmentTestEnableNV(representativeFragmentTestEnable: Bool) -> Void {
        let vkCmdSetRepresentativeFragmentTestEnableNV = self.table.pointee.vkCmdSetRepresentativeFragmentTestEnableNV!
        vkCmdSetRepresentativeFragmentTestEnableNV(self.handle, VkBool32(representativeFragmentTestEnable ? VK_TRUE : VK_FALSE))
    }

    public func copyBuffer2(_ copyBufferInfo: (some Chainable<CopyBufferInfo2>)) -> Void {
        let vkCmdCopyBuffer2 = self.table.pointee.vkCmdCopyBuffer2!
        return copyBufferInfo.withCStruct { ptr_copyBufferInfo in
            vkCmdCopyBuffer2(self.handle, ptr_copyBufferInfo)
        }
    }

    public func copyBuffer2(_ copyBufferInfo: CopyBufferInfo2) -> Void {
        let vkCmdCopyBuffer2 = self.table.pointee.vkCmdCopyBuffer2!
        return copyBufferInfo.withCStruct { ptr_copyBufferInfo in
            vkCmdCopyBuffer2(self.handle, ptr_copyBufferInfo)
        }
    }

    public func copyImage2(_ copyImageInfo: (some Chainable<CopyImageInfo2>)) -> Void {
        let vkCmdCopyImage2 = self.table.pointee.vkCmdCopyImage2!
        return copyImageInfo.withCStruct { ptr_copyImageInfo in
            vkCmdCopyImage2(self.handle, ptr_copyImageInfo)
        }
    }

    public func copyImage2(_ copyImageInfo: CopyImageInfo2) -> Void {
        let vkCmdCopyImage2 = self.table.pointee.vkCmdCopyImage2!
        return copyImageInfo.withCStruct { ptr_copyImageInfo in
            vkCmdCopyImage2(self.handle, ptr_copyImageInfo)
        }
    }

    public func blitImage2(_ blitImageInfo: (some Chainable<BlitImageInfo2>)) -> Void {
        let vkCmdBlitImage2 = self.table.pointee.vkCmdBlitImage2!
        return blitImageInfo.withCStruct { ptr_blitImageInfo in
            vkCmdBlitImage2(self.handle, ptr_blitImageInfo)
        }
    }

    public func blitImage2(_ blitImageInfo: BlitImageInfo2) -> Void {
        let vkCmdBlitImage2 = self.table.pointee.vkCmdBlitImage2!
        return blitImageInfo.withCStruct { ptr_blitImageInfo in
            vkCmdBlitImage2(self.handle, ptr_blitImageInfo)
        }
    }

    public func copyBufferToImage2(_ copyBufferToImageInfo: (some Chainable<CopyBufferToImageInfo2>)) -> Void {
        let vkCmdCopyBufferToImage2 = self.table.pointee.vkCmdCopyBufferToImage2!
        return copyBufferToImageInfo.withCStruct { ptr_copyBufferToImageInfo in
            vkCmdCopyBufferToImage2(self.handle, ptr_copyBufferToImageInfo)
        }
    }

    public func copyBufferToImage2(_ copyBufferToImageInfo: CopyBufferToImageInfo2) -> Void {
        let vkCmdCopyBufferToImage2 = self.table.pointee.vkCmdCopyBufferToImage2!
        return copyBufferToImageInfo.withCStruct { ptr_copyBufferToImageInfo in
            vkCmdCopyBufferToImage2(self.handle, ptr_copyBufferToImageInfo)
        }
    }

    public func copyImageToBuffer2(_ copyImageToBufferInfo: (some Chainable<CopyImageToBufferInfo2>)) -> Void {
        let vkCmdCopyImageToBuffer2 = self.table.pointee.vkCmdCopyImageToBuffer2!
        return copyImageToBufferInfo.withCStruct { ptr_copyImageToBufferInfo in
            vkCmdCopyImageToBuffer2(self.handle, ptr_copyImageToBufferInfo)
        }
    }

    public func copyImageToBuffer2(_ copyImageToBufferInfo: CopyImageToBufferInfo2) -> Void {
        let vkCmdCopyImageToBuffer2 = self.table.pointee.vkCmdCopyImageToBuffer2!
        return copyImageToBufferInfo.withCStruct { ptr_copyImageToBufferInfo in
            vkCmdCopyImageToBuffer2(self.handle, ptr_copyImageToBufferInfo)
        }
    }

    public func resolveImage2(_ resolveImageInfo: (some Chainable<ResolveImageInfo2>)) -> Void {
        let vkCmdResolveImage2 = self.table.pointee.vkCmdResolveImage2!
        return resolveImageInfo.withCStruct { ptr_resolveImageInfo in
            vkCmdResolveImage2(self.handle, ptr_resolveImageInfo)
        }
    }

    public func resolveImage2(_ resolveImageInfo: ResolveImageInfo2) -> Void {
        let vkCmdResolveImage2 = self.table.pointee.vkCmdResolveImage2!
        return resolveImageInfo.withCStruct { ptr_resolveImageInfo in
            vkCmdResolveImage2(self.handle, ptr_resolveImageInfo)
        }
    }

    public func setFragmentShadingRateKHR(fragmentSize: Extent2D, combinerOps: (VkFragmentShadingRateCombinerOpKHR, VkFragmentShadingRateCombinerOpKHR)) -> Void {
        let vkCmdSetFragmentShadingRateKHR = self.table.pointee.vkCmdSetFragmentShadingRateKHR!
        return fragmentSize.withCStruct { ptr_fragmentSize in
            withUnsafeBytes(of: combinerOps) { ptr_combinerOps in
                vkCmdSetFragmentShadingRateKHR(self.handle, ptr_fragmentSize, ptr_combinerOps.bindMemory(to: VkFragmentShadingRateCombinerOpKHR.self).baseAddress)
            }
        }
    }

    public func setFragmentShadingRateEnumNV(shadingRate: FragmentShadingRateNV, combinerOps: (VkFragmentShadingRateCombinerOpKHR, VkFragmentShadingRateCombinerOpKHR)) -> Void {
        let vkCmdSetFragmentShadingRateEnumNV = self.table.pointee.vkCmdSetFragmentShadingRateEnumNV!
        return withUnsafeBytes(of: combinerOps) { ptr_combinerOps in
            vkCmdSetFragmentShadingRateEnumNV(self.handle, VkFragmentShadingRateNV(rawValue: VkFragmentShadingRateNV.RawValue(shadingRate.rawValue)), ptr_combinerOps.bindMemory(to: VkFragmentShadingRateCombinerOpKHR.self).baseAddress)
        }
    }

    public func setVertexInputEXT(vertexBindingDescriptions: (AnyChainableArray<VertexInputBindingDescription2EXT>), vertexAttributeDescriptions: (AnyChainableArray<VertexInputAttributeDescription2EXT>)) -> Void {
        let vkCmdSetVertexInputEXT = self.table.pointee.vkCmdSetVertexInputEXT!
        return vertexBindingDescriptions.withCStructBufferPointer { ptr_vertexBindingDescriptions in
            vertexAttributeDescriptions.withCStructBufferPointer { ptr_vertexAttributeDescriptions in
                vkCmdSetVertexInputEXT(self.handle, UInt32(ptr_vertexBindingDescriptions.count), ptr_vertexBindingDescriptions.baseAddress, UInt32(ptr_vertexAttributeDescriptions.count), ptr_vertexAttributeDescriptions.baseAddress)
            }
        }
    }

    public func setVertexInputEXT(vertexBindingDescriptions: Array<VertexInputBindingDescription2EXT> = [], vertexAttributeDescriptions: Array<VertexInputAttributeDescription2EXT> = []) -> Void {
        let vkCmdSetVertexInputEXT = self.table.pointee.vkCmdSetVertexInputEXT!
        return vertexBindingDescriptions.withCStructBufferPointer { ptr_vertexBindingDescriptions in
            vertexAttributeDescriptions.withCStructBufferPointer { ptr_vertexAttributeDescriptions in
                vkCmdSetVertexInputEXT(self.handle, UInt32(ptr_vertexBindingDescriptions.count), ptr_vertexBindingDescriptions.baseAddress, UInt32(ptr_vertexAttributeDescriptions.count), ptr_vertexAttributeDescriptions.baseAddress)
            }
        }
    }

    public func setColorWriteEnableEXT(colorWriteEnables: Array<Bool>) -> Void {
        let vkCmdSetColorWriteEnableEXT = self.table.pointee.vkCmdSetColorWriteEnableEXT!
        return colorWriteEnables.map{ VkBool32($0 ? VK_TRUE : VK_FALSE) }.withUnsafeBufferPointer { ptr_colorWriteEnables in
            vkCmdSetColorWriteEnableEXT(self.handle, UInt32(ptr_colorWriteEnables.count), ptr_colorWriteEnables.baseAddress)
        }
    }

    public func setEvent2(_ dependencyInfo: (some Chainable<DependencyInfo>), event: Event) -> Void {
        let vkCmdSetEvent2 = self.table.pointee.vkCmdSetEvent2!
        return dependencyInfo.withCStruct { ptr_dependencyInfo in
            vkCmdSetEvent2(self.handle, event.handle, ptr_dependencyInfo)
        }
    }

    public func setEvent2(_ dependencyInfo: DependencyInfo = DependencyInfo(), event: Event) -> Void {
        let vkCmdSetEvent2 = self.table.pointee.vkCmdSetEvent2!
        return dependencyInfo.withCStruct { ptr_dependencyInfo in
            vkCmdSetEvent2(self.handle, event.handle, ptr_dependencyInfo)
        }
    }

    public func resetEvent2(event: Event, stageMask: PipelineStageFlags2 = []) -> Void {
        let vkCmdResetEvent2 = self.table.pointee.vkCmdResetEvent2!
        vkCmdResetEvent2(self.handle, event.handle, stageMask.rawValue)
    }

    public func waitEvents2(_ dependencyInfos: (AnyChainableArray<DependencyInfo>), events: Array<Event>) -> Void {
        let vkCmdWaitEvents2 = self.table.pointee.vkCmdWaitEvents2!
        return events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            dependencyInfos.withCStructBufferPointer { ptr_dependencyInfos in
                vkCmdWaitEvents2(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress?.cast(), ptr_dependencyInfos.baseAddress)
            }
        }
    }

    public func waitEvents2(_ dependencyInfos: Array<DependencyInfo>, events: Array<Event>) -> Void {
        let vkCmdWaitEvents2 = self.table.pointee.vkCmdWaitEvents2!
        return events.map{ $0.handle }.withUnsafeBufferPointer { ptr_events in
            dependencyInfos.withCStructBufferPointer { ptr_dependencyInfos in
                vkCmdWaitEvents2(self.handle, UInt32(ptr_events.count), ptr_events.baseAddress?.cast(), ptr_dependencyInfos.baseAddress)
            }
        }
    }

    public func pipelineBarrier2(_ dependencyInfo: (some Chainable<DependencyInfo>)) -> Void {
        let vkCmdPipelineBarrier2 = self.table.pointee.vkCmdPipelineBarrier2!
        return dependencyInfo.withCStruct { ptr_dependencyInfo in
            vkCmdPipelineBarrier2(self.handle, ptr_dependencyInfo)
        }
    }

    public func pipelineBarrier2(_ dependencyInfo: DependencyInfo = DependencyInfo()) -> Void {
        let vkCmdPipelineBarrier2 = self.table.pointee.vkCmdPipelineBarrier2!
        return dependencyInfo.withCStruct { ptr_dependencyInfo in
            vkCmdPipelineBarrier2(self.handle, ptr_dependencyInfo)
        }
    }

    public func writeTimestamp2(stage: PipelineStageFlags2 = [], queryPool: QueryPool, query: UInt32) -> Void {
        let vkCmdWriteTimestamp2 = self.table.pointee.vkCmdWriteTimestamp2!
        vkCmdWriteTimestamp2(self.handle, stage.rawValue, queryPool.handle, query)
    }

    public func writeBufferMarker2AMD(stage: PipelineStageFlags2 = [], dstBuffer: Buffer, dstOffset: VkDeviceSize, marker: UInt32) -> Void {
        let vkCmdWriteBufferMarker2AMD = self.table.pointee.vkCmdWriteBufferMarker2AMD!
        vkCmdWriteBufferMarker2AMD(self.handle, stage.rawValue, dstBuffer.handle, dstOffset, marker)
    }

    public func decodeVideoKHR(_ decodeInfo: (some Chainable<VideoDecodeInfoKHR>)) -> Void {
        let vkCmdDecodeVideoKHR = self.table.pointee.vkCmdDecodeVideoKHR!
        return decodeInfo.withCStruct { ptr_decodeInfo in
            vkCmdDecodeVideoKHR(self.handle, ptr_decodeInfo)
        }
    }

    public func decodeVideoKHR(_ decodeInfo: VideoDecodeInfoKHR) -> Void {
        let vkCmdDecodeVideoKHR = self.table.pointee.vkCmdDecodeVideoKHR!
        return decodeInfo.withCStruct { ptr_decodeInfo in
            vkCmdDecodeVideoKHR(self.handle, ptr_decodeInfo)
        }
    }

    public func beginVideoCodingKHR(_ beginInfo: (some Chainable<VideoBeginCodingInfoKHR>)) -> Void {
        let vkCmdBeginVideoCodingKHR = self.table.pointee.vkCmdBeginVideoCodingKHR!
        return beginInfo.withCStruct { ptr_beginInfo in
            vkCmdBeginVideoCodingKHR(self.handle, ptr_beginInfo)
        }
    }

    public func beginVideoCodingKHR(_ beginInfo: VideoBeginCodingInfoKHR) -> Void {
        let vkCmdBeginVideoCodingKHR = self.table.pointee.vkCmdBeginVideoCodingKHR!
        return beginInfo.withCStruct { ptr_beginInfo in
            vkCmdBeginVideoCodingKHR(self.handle, ptr_beginInfo)
        }
    }

    public func controlVideoCodingKHR(_ codingControlInfo: (some Chainable<VideoCodingControlInfoKHR>)) -> Void {
        let vkCmdControlVideoCodingKHR = self.table.pointee.vkCmdControlVideoCodingKHR!
        return codingControlInfo.withCStruct { ptr_codingControlInfo in
            vkCmdControlVideoCodingKHR(self.handle, ptr_codingControlInfo)
        }
    }

    public func controlVideoCodingKHR(_ codingControlInfo: VideoCodingControlInfoKHR) -> Void {
        let vkCmdControlVideoCodingKHR = self.table.pointee.vkCmdControlVideoCodingKHR!
        return codingControlInfo.withCStruct { ptr_codingControlInfo in
            vkCmdControlVideoCodingKHR(self.handle, ptr_codingControlInfo)
        }
    }

    public func endVideoCodingKHR(_ endCodingInfo: (some Chainable<VideoEndCodingInfoKHR>)) -> Void {
        let vkCmdEndVideoCodingKHR = self.table.pointee.vkCmdEndVideoCodingKHR!
        return endCodingInfo.withCStruct { ptr_endCodingInfo in
            vkCmdEndVideoCodingKHR(self.handle, ptr_endCodingInfo)
        }
    }

    public func endVideoCodingKHR(_ endCodingInfo: VideoEndCodingInfoKHR = VideoEndCodingInfoKHR()) -> Void {
        let vkCmdEndVideoCodingKHR = self.table.pointee.vkCmdEndVideoCodingKHR!
        return endCodingInfo.withCStruct { ptr_endCodingInfo in
            vkCmdEndVideoCodingKHR(self.handle, ptr_endCodingInfo)
        }
    }

    public func encodeVideoKHR(_ encodeInfo: (some Chainable<VideoEncodeInfoKHR>)) -> Void {
        let vkCmdEncodeVideoKHR = self.table.pointee.vkCmdEncodeVideoKHR!
        return encodeInfo.withCStruct { ptr_encodeInfo in
            vkCmdEncodeVideoKHR(self.handle, ptr_encodeInfo)
        }
    }

    public func encodeVideoKHR(_ encodeInfo: VideoEncodeInfoKHR) -> Void {
        let vkCmdEncodeVideoKHR = self.table.pointee.vkCmdEncodeVideoKHR!
        return encodeInfo.withCStruct { ptr_encodeInfo in
            vkCmdEncodeVideoKHR(self.handle, ptr_encodeInfo)
        }
    }

    public func decompressMemoryNV(decompressMemoryRegions: Array<DecompressMemoryRegionNV>) -> Void {
        let vkCmdDecompressMemoryNV = self.table.pointee.vkCmdDecompressMemoryNV!
        return decompressMemoryRegions.withCStructBufferPointer { ptr_decompressMemoryRegions in
            vkCmdDecompressMemoryNV(self.handle, UInt32(ptr_decompressMemoryRegions.count), ptr_decompressMemoryRegions.baseAddress)
        }
    }

    public func decompressMemoryIndirectCountNV(indirectCommandsAddress: VkDeviceAddress, indirectCommandsCountAddress: VkDeviceAddress, stride: UInt32) -> Void {
        let vkCmdDecompressMemoryIndirectCountNV = self.table.pointee.vkCmdDecompressMemoryIndirectCountNV!
        vkCmdDecompressMemoryIndirectCountNV(self.handle, indirectCommandsAddress, indirectCommandsCountAddress, stride)
    }

    public func buildPartitionedAccelerationStructuresNV(_ buildInfo: (some Chainable<BuildPartitionedAccelerationStructureInfoNV>)) -> Void {
        let vkCmdBuildPartitionedAccelerationStructuresNV = self.table.pointee.vkCmdBuildPartitionedAccelerationStructuresNV!
        return buildInfo.withCStruct { ptr_buildInfo in
            vkCmdBuildPartitionedAccelerationStructuresNV(self.handle, ptr_buildInfo)
        }
    }

    public func buildPartitionedAccelerationStructuresNV(_ buildInfo: BuildPartitionedAccelerationStructureInfoNV) -> Void {
        let vkCmdBuildPartitionedAccelerationStructuresNV = self.table.pointee.vkCmdBuildPartitionedAccelerationStructuresNV!
        return buildInfo.withCStruct { ptr_buildInfo in
            vkCmdBuildPartitionedAccelerationStructuresNV(self.handle, ptr_buildInfo)
        }
    }

    public func decompressMemoryEXT(decompressMemoryInfoEXT: (some Chainable<DecompressMemoryInfoEXT>)) -> Void {
        let vkCmdDecompressMemoryEXT = self.table.pointee.vkCmdDecompressMemoryEXT!
        return decompressMemoryInfoEXT.withCStruct { ptr_decompressMemoryInfoEXT in
            vkCmdDecompressMemoryEXT(self.handle, ptr_decompressMemoryInfoEXT)
        }
    }

    public func decompressMemoryEXT(decompressMemoryInfoEXT: DecompressMemoryInfoEXT) -> Void {
        let vkCmdDecompressMemoryEXT = self.table.pointee.vkCmdDecompressMemoryEXT!
        return decompressMemoryInfoEXT.withCStruct { ptr_decompressMemoryInfoEXT in
            vkCmdDecompressMemoryEXT(self.handle, ptr_decompressMemoryInfoEXT)
        }
    }

    public func decompressMemoryIndirectCountEXT(decompressionMethod: MemoryDecompressionMethodFlagsEXT, indirectCommandsAddress: VkDeviceAddress, indirectCommandsCountAddress: VkDeviceAddress, maxDecompressionCount: UInt32, stride: UInt32) -> Void {
        let vkCmdDecompressMemoryIndirectCountEXT = self.table.pointee.vkCmdDecompressMemoryIndirectCountEXT!
        vkCmdDecompressMemoryIndirectCountEXT(self.handle, decompressionMethod.rawValue, indirectCommandsAddress, indirectCommandsCountAddress, maxDecompressionCount, stride)
    }

    public func cuLaunchKernelNVX(_ launchInfo: (some Chainable<CuLaunchInfoNVX>)) -> Void {
        let vkCmdCuLaunchKernelNVX = self.table.pointee.vkCmdCuLaunchKernelNVX!
        return launchInfo.withCStruct { ptr_launchInfo in
            vkCmdCuLaunchKernelNVX(self.handle, ptr_launchInfo)
        }
    }

    public func cuLaunchKernelNVX(_ launchInfo: CuLaunchInfoNVX) -> Void {
        let vkCmdCuLaunchKernelNVX = self.table.pointee.vkCmdCuLaunchKernelNVX!
        return launchInfo.withCStruct { ptr_launchInfo in
            vkCmdCuLaunchKernelNVX(self.handle, ptr_launchInfo)
        }
    }

    public func bindDescriptorBuffersEXT(_ bindingInfos: (AnyChainableArray<DescriptorBufferBindingInfoEXT>)) -> Void {
        let vkCmdBindDescriptorBuffersEXT = self.table.pointee.vkCmdBindDescriptorBuffersEXT!
        return bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            vkCmdBindDescriptorBuffersEXT(self.handle, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func bindDescriptorBuffersEXT(_ bindingInfos: Array<DescriptorBufferBindingInfoEXT>) -> Void {
        let vkCmdBindDescriptorBuffersEXT = self.table.pointee.vkCmdBindDescriptorBuffersEXT!
        return bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            vkCmdBindDescriptorBuffersEXT(self.handle, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func setDescriptorBufferOffsetsEXT(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, bufferIndices: Array<UInt32>, offsets: Array<VkDeviceSize>) -> Void {
        let vkCmdSetDescriptorBufferOffsetsEXT = self.table.pointee.vkCmdSetDescriptorBufferOffsetsEXT!
        return bufferIndices.withUnsafeBufferPointer { ptr_bufferIndices in
            offsets.withUnsafeBufferPointer { ptr_offsets in
                vkCmdSetDescriptorBufferOffsetsEXT(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, firstSet, UInt32(ptr_bufferIndices.count), ptr_bufferIndices.baseAddress, ptr_offsets.baseAddress)
            }
        }
    }

    public func bindDescriptorBufferEmbeddedSamplersEXT(pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32) -> Void {
        let vkCmdBindDescriptorBufferEmbeddedSamplersEXT = self.table.pointee.vkCmdBindDescriptorBufferEmbeddedSamplersEXT!
        vkCmdBindDescriptorBufferEmbeddedSamplersEXT(self.handle, VkPipelineBindPoint(rawValue: VkPipelineBindPoint.RawValue(pipelineBindPoint.rawValue)), layout.handle, set)
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cudaLaunchKernelNV(_ launchInfo: (some Chainable<CudaLaunchInfoNV>)) -> Void {
        let vkCmdCudaLaunchKernelNV = self.table.pointee.vkCmdCudaLaunchKernelNV!
        return launchInfo.withCStruct { ptr_launchInfo in
            vkCmdCudaLaunchKernelNV(self.handle, ptr_launchInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func cudaLaunchKernelNV(_ launchInfo: CudaLaunchInfoNV) -> Void {
        let vkCmdCudaLaunchKernelNV = self.table.pointee.vkCmdCudaLaunchKernelNV!
        return launchInfo.withCStruct { ptr_launchInfo in
            vkCmdCudaLaunchKernelNV(self.handle, ptr_launchInfo)
        }
    }
    #endif

    public func beginRendering(_ renderingInfo: (some Chainable<RenderingInfo>)) -> Void {
        let vkCmdBeginRendering = self.table.pointee.vkCmdBeginRendering!
        return renderingInfo.withCStruct { ptr_renderingInfo in
            vkCmdBeginRendering(self.handle, ptr_renderingInfo)
        }
    }

    public func beginRendering(_ renderingInfo: RenderingInfo) -> Void {
        let vkCmdBeginRendering = self.table.pointee.vkCmdBeginRendering!
        return renderingInfo.withCStruct { ptr_renderingInfo in
            vkCmdBeginRendering(self.handle, ptr_renderingInfo)
        }
    }

    public func endRendering() -> Void {
        let vkCmdEndRendering = self.table.pointee.vkCmdEndRendering!
        vkCmdEndRendering(self.handle)
    }

    public func endRendering2KHR(_ renderingEndInfo: (some Chainable<RenderingEndInfoKHR>)) -> Void {
        let vkCmdEndRendering2KHR = self.table.pointee.vkCmdEndRendering2KHR!
        return renderingEndInfo.withCStruct { ptr_renderingEndInfo in
            vkCmdEndRendering2KHR(self.handle, ptr_renderingEndInfo)
        }
    }

    public func endRendering2KHR(_ renderingEndInfo: RenderingEndInfoKHR? = nil) -> Void {
        let vkCmdEndRendering2KHR = self.table.pointee.vkCmdEndRendering2KHR!
        return renderingEndInfo.withOptionalCStruct { ptr_renderingEndInfo in
            vkCmdEndRendering2KHR(self.handle, ptr_renderingEndInfo)
        }
    }

    public func buildMicromapsEXT(_ infos: (AnyChainableArray<MicromapBuildInfoEXT>)) -> Void {
        let vkCmdBuildMicromapsEXT = self.table.pointee.vkCmdBuildMicromapsEXT!
        return infos.withCStructBufferPointer { ptr_infos in
            vkCmdBuildMicromapsEXT(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func buildMicromapsEXT(_ infos: Array<MicromapBuildInfoEXT>) -> Void {
        let vkCmdBuildMicromapsEXT = self.table.pointee.vkCmdBuildMicromapsEXT!
        return infos.withCStructBufferPointer { ptr_infos in
            vkCmdBuildMicromapsEXT(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func copyMicromapEXT(_ info: (some Chainable<CopyMicromapInfoEXT>)) -> Void {
        let vkCmdCopyMicromapEXT = self.table.pointee.vkCmdCopyMicromapEXT!
        return info.withCStruct { ptr_info in
            vkCmdCopyMicromapEXT(self.handle, ptr_info)
        }
    }

    public func copyMicromapEXT(_ info: CopyMicromapInfoEXT) -> Void {
        let vkCmdCopyMicromapEXT = self.table.pointee.vkCmdCopyMicromapEXT!
        return info.withCStruct { ptr_info in
            vkCmdCopyMicromapEXT(self.handle, ptr_info)
        }
    }

    public func copyMicromapToMemoryEXT(_ info: (some Chainable<CopyMicromapToMemoryInfoEXT>)) -> Void {
        let vkCmdCopyMicromapToMemoryEXT = self.table.pointee.vkCmdCopyMicromapToMemoryEXT!
        return info.withCStruct { ptr_info in
            vkCmdCopyMicromapToMemoryEXT(self.handle, ptr_info)
        }
    }

    public func copyMicromapToMemoryEXT(_ info: CopyMicromapToMemoryInfoEXT) -> Void {
        let vkCmdCopyMicromapToMemoryEXT = self.table.pointee.vkCmdCopyMicromapToMemoryEXT!
        return info.withCStruct { ptr_info in
            vkCmdCopyMicromapToMemoryEXT(self.handle, ptr_info)
        }
    }

    public func copyMemoryToMicromapEXT(_ info: (some Chainable<CopyMemoryToMicromapInfoEXT>)) -> Void {
        let vkCmdCopyMemoryToMicromapEXT = self.table.pointee.vkCmdCopyMemoryToMicromapEXT!
        return info.withCStruct { ptr_info in
            vkCmdCopyMemoryToMicromapEXT(self.handle, ptr_info)
        }
    }

    public func copyMemoryToMicromapEXT(_ info: CopyMemoryToMicromapInfoEXT) -> Void {
        let vkCmdCopyMemoryToMicromapEXT = self.table.pointee.vkCmdCopyMemoryToMicromapEXT!
        return info.withCStruct { ptr_info in
            vkCmdCopyMemoryToMicromapEXT(self.handle, ptr_info)
        }
    }

    public func writeMicromapsPropertiesEXT(micromaps: Array<MicromapEXT>, queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32) -> Void {
        let vkCmdWriteMicromapsPropertiesEXT = self.table.pointee.vkCmdWriteMicromapsPropertiesEXT!
        return micromaps.map{ $0.handle }.withUnsafeBufferPointer { ptr_micromaps in
            vkCmdWriteMicromapsPropertiesEXT(self.handle, UInt32(ptr_micromaps.count), ptr_micromaps.baseAddress?.cast(), VkQueryType(rawValue: VkQueryType.RawValue(queryType.rawValue)), queryPool.handle, firstQuery)
        }
    }

    public func bindTileMemoryQCOM(_ tileMemoryBindInfo: (some Chainable<TileMemoryBindInfoQCOM>)) -> Void {
        let vkCmdBindTileMemoryQCOM = self.table.pointee.vkCmdBindTileMemoryQCOM!
        return tileMemoryBindInfo.withCStruct { ptr_tileMemoryBindInfo in
            vkCmdBindTileMemoryQCOM(self.handle, ptr_tileMemoryBindInfo)
        }
    }

    public func bindTileMemoryQCOM(_ tileMemoryBindInfo: TileMemoryBindInfoQCOM? = nil) -> Void {
        let vkCmdBindTileMemoryQCOM = self.table.pointee.vkCmdBindTileMemoryQCOM!
        return tileMemoryBindInfo.withOptionalCStruct { ptr_tileMemoryBindInfo in
            vkCmdBindTileMemoryQCOM(self.handle, ptr_tileMemoryBindInfo)
        }
    }

    public func opticalFlowExecuteNV(_ executeInfo: (some Chainable<OpticalFlowExecuteInfoNV>), session: OpticalFlowSessionNV) -> Void {
        let vkCmdOpticalFlowExecuteNV = self.table.pointee.vkCmdOpticalFlowExecuteNV!
        return executeInfo.withCStruct { ptr_executeInfo in
            vkCmdOpticalFlowExecuteNV(self.handle, session.handle, ptr_executeInfo)
        }
    }

    public func opticalFlowExecuteNV(_ executeInfo: OpticalFlowExecuteInfoNV = OpticalFlowExecuteInfoNV(), session: OpticalFlowSessionNV) -> Void {
        let vkCmdOpticalFlowExecuteNV = self.table.pointee.vkCmdOpticalFlowExecuteNV!
        return executeInfo.withCStruct { ptr_executeInfo in
            vkCmdOpticalFlowExecuteNV(self.handle, session.handle, ptr_executeInfo)
        }
    }

    public func setDepthBias2EXT(_ depthBiasInfo: (some Chainable<DepthBiasInfoEXT>)) -> Void {
        let vkCmdSetDepthBias2EXT = self.table.pointee.vkCmdSetDepthBias2EXT!
        return depthBiasInfo.withCStruct { ptr_depthBiasInfo in
            vkCmdSetDepthBias2EXT(self.handle, ptr_depthBiasInfo)
        }
    }

    public func setDepthBias2EXT(_ depthBiasInfo: DepthBiasInfoEXT) -> Void {
        let vkCmdSetDepthBias2EXT = self.table.pointee.vkCmdSetDepthBias2EXT!
        return depthBiasInfo.withCStruct { ptr_depthBiasInfo in
            vkCmdSetDepthBias2EXT(self.handle, ptr_depthBiasInfo)
        }
    }

    public func bindShadersEXT(stages: Array<ShaderStageFlags>, shaders: Array<ShaderEXT>? = nil) -> Void {
        let vkCmdBindShadersEXT = self.table.pointee.vkCmdBindShadersEXT!
        return stages.map{ VkShaderStageFlagBits(rawValue: VkShaderStageFlagBits.RawValue($0.rawValue)) }.withUnsafeBufferPointer { ptr_stages in
            (shaders?.map{ $0.handle }).withOptionalUnsafeBufferPointer { ptr_shaders in
                vkCmdBindShadersEXT(self.handle, UInt32(ptr_stages.count), ptr_stages.baseAddress, ptr_shaders.baseAddress?.cast())
            }
        }
    }

    #if VK_ENABLE_BETA_EXTENSIONS
    public func initializeGraphScratchMemoryAMDX(executionGraph: Pipeline, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        let vkCmdInitializeGraphScratchMemoryAMDX = self.table.pointee.vkCmdInitializeGraphScratchMemoryAMDX!
        vkCmdInitializeGraphScratchMemoryAMDX(self.handle, executionGraph.handle, scratch, scratchSize)
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func dispatchGraphAMDX(_ countInfo: DispatchGraphCountInfoAMDX, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        let vkCmdDispatchGraphAMDX = self.table.pointee.vkCmdDispatchGraphAMDX!
        return countInfo.withCStruct { ptr_countInfo in
            vkCmdDispatchGraphAMDX(self.handle, scratch, scratchSize, ptr_countInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func dispatchGraphIndirectAMDX(_ countInfo: DispatchGraphCountInfoAMDX, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        let vkCmdDispatchGraphIndirectAMDX = self.table.pointee.vkCmdDispatchGraphIndirectAMDX!
        return countInfo.withCStruct { ptr_countInfo in
            vkCmdDispatchGraphIndirectAMDX(self.handle, scratch, scratchSize, ptr_countInfo)
        }
    }
    #endif

    #if VK_ENABLE_BETA_EXTENSIONS
    public func dispatchGraphIndirectCountAMDX(_ countInfo: VkDeviceAddress, scratch: VkDeviceAddress, scratchSize: VkDeviceSize) -> Void {
        let vkCmdDispatchGraphIndirectCountAMDX = self.table.pointee.vkCmdDispatchGraphIndirectCountAMDX!
        vkCmdDispatchGraphIndirectCountAMDX(self.handle, scratch, scratchSize, countInfo)
    }
    #endif

    public func beginGpaSessionAMD(gpaSession: GpaSessionAMD) throws(Result) -> Void {
        let vkCmdBeginGpaSessionAMD = self.table.pointee.vkCmdBeginGpaSessionAMD!
        try checkResult(
            vkCmdBeginGpaSessionAMD(self.handle, gpaSession.handle)
        )
    }

    public func endGpaSessionAMD(gpaSession: GpaSessionAMD) throws(Result) -> Void {
        let vkCmdEndGpaSessionAMD = self.table.pointee.vkCmdEndGpaSessionAMD!
        try checkResult(
            vkCmdEndGpaSessionAMD(self.handle, gpaSession.handle)
        )
    }

    public func beginGpaSampleAMD(_ gpaSampleBeginInfo: (some Chainable<GpaSampleBeginInfoAMD>), gpaSession: GpaSessionAMD) throws(Result) -> UInt32 {
        let vkCmdBeginGpaSampleAMD = self.table.pointee.vkCmdBeginGpaSampleAMD!
        return try gpaSampleBeginInfo.withCStruct { ptr_gpaSampleBeginInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                vkCmdBeginGpaSampleAMD(self.handle, gpaSession.handle, ptr_gpaSampleBeginInfo, &out)
            )
            return out
        }
    }

    public func beginGpaSampleAMD(_ gpaSampleBeginInfo: GpaSampleBeginInfoAMD, gpaSession: GpaSessionAMD) throws(Result) -> UInt32 {
        let vkCmdBeginGpaSampleAMD = self.table.pointee.vkCmdBeginGpaSampleAMD!
        return try gpaSampleBeginInfo.withCStruct { ptr_gpaSampleBeginInfo throws(Result) in
            var out = UInt32()
            try checkResult(
                vkCmdBeginGpaSampleAMD(self.handle, gpaSession.handle, ptr_gpaSampleBeginInfo, &out)
            )
            return out
        }
    }

    public func endGpaSampleAMD(gpaSession: GpaSessionAMD, sampleID: UInt32) -> Void {
        let vkCmdEndGpaSampleAMD = self.table.pointee.vkCmdEndGpaSampleAMD!
        vkCmdEndGpaSampleAMD(self.handle, gpaSession.handle, sampleID)
    }

    public func copyGpaSessionResultsAMD(gpaSession: GpaSessionAMD) -> Void {
        let vkCmdCopyGpaSessionResultsAMD = self.table.pointee.vkCmdCopyGpaSessionResultsAMD!
        vkCmdCopyGpaSessionResultsAMD(self.handle, gpaSession.handle)
    }

    public func bindDescriptorSets2(_ bindDescriptorSetsInfo: (some Chainable<BindDescriptorSetsInfo>)) -> Void {
        let vkCmdBindDescriptorSets2 = self.table.pointee.vkCmdBindDescriptorSets2!
        return bindDescriptorSetsInfo.withCStruct { ptr_bindDescriptorSetsInfo in
            vkCmdBindDescriptorSets2(self.handle, ptr_bindDescriptorSetsInfo)
        }
    }

    public func bindDescriptorSets2(_ bindDescriptorSetsInfo: BindDescriptorSetsInfo) -> Void {
        let vkCmdBindDescriptorSets2 = self.table.pointee.vkCmdBindDescriptorSets2!
        return bindDescriptorSetsInfo.withCStruct { ptr_bindDescriptorSetsInfo in
            vkCmdBindDescriptorSets2(self.handle, ptr_bindDescriptorSetsInfo)
        }
    }

    public func pushConstants2(_ pushConstantsInfo: (some Chainable<PushConstantsInfo>)) -> Void {
        let vkCmdPushConstants2 = self.table.pointee.vkCmdPushConstants2!
        return pushConstantsInfo.withCStruct { ptr_pushConstantsInfo in
            vkCmdPushConstants2(self.handle, ptr_pushConstantsInfo)
        }
    }

    public func pushConstants2(_ pushConstantsInfo: PushConstantsInfo) -> Void {
        let vkCmdPushConstants2 = self.table.pointee.vkCmdPushConstants2!
        return pushConstantsInfo.withCStruct { ptr_pushConstantsInfo in
            vkCmdPushConstants2(self.handle, ptr_pushConstantsInfo)
        }
    }

    public func pushDescriptorSet2(_ pushDescriptorSetInfo: (some Chainable<PushDescriptorSetInfo>)) -> Void {
        let vkCmdPushDescriptorSet2 = self.table.pointee.vkCmdPushDescriptorSet2!
        return pushDescriptorSetInfo.withCStruct { ptr_pushDescriptorSetInfo in
            vkCmdPushDescriptorSet2(self.handle, ptr_pushDescriptorSetInfo)
        }
    }

    public func pushDescriptorSet2(_ pushDescriptorSetInfo: PushDescriptorSetInfo) -> Void {
        let vkCmdPushDescriptorSet2 = self.table.pointee.vkCmdPushDescriptorSet2!
        return pushDescriptorSetInfo.withCStruct { ptr_pushDescriptorSetInfo in
            vkCmdPushDescriptorSet2(self.handle, ptr_pushDescriptorSetInfo)
        }
    }

    public func pushDescriptorSetWithTemplate2(_ pushDescriptorSetWithTemplateInfo: (some Chainable<PushDescriptorSetWithTemplateInfo>)) -> Void {
        let vkCmdPushDescriptorSetWithTemplate2 = self.table.pointee.vkCmdPushDescriptorSetWithTemplate2!
        return pushDescriptorSetWithTemplateInfo.withCStruct { ptr_pushDescriptorSetWithTemplateInfo in
            vkCmdPushDescriptorSetWithTemplate2(self.handle, ptr_pushDescriptorSetWithTemplateInfo)
        }
    }

    public func pushDescriptorSetWithTemplate2(_ pushDescriptorSetWithTemplateInfo: PushDescriptorSetWithTemplateInfo) -> Void {
        let vkCmdPushDescriptorSetWithTemplate2 = self.table.pointee.vkCmdPushDescriptorSetWithTemplate2!
        return pushDescriptorSetWithTemplateInfo.withCStruct { ptr_pushDescriptorSetWithTemplateInfo in
            vkCmdPushDescriptorSetWithTemplate2(self.handle, ptr_pushDescriptorSetWithTemplateInfo)
        }
    }

    public func setDescriptorBufferOffsets2EXT(_ setDescriptorBufferOffsetsInfo: (some Chainable<SetDescriptorBufferOffsetsInfoEXT>)) -> Void {
        let vkCmdSetDescriptorBufferOffsets2EXT = self.table.pointee.vkCmdSetDescriptorBufferOffsets2EXT!
        return setDescriptorBufferOffsetsInfo.withCStruct { ptr_setDescriptorBufferOffsetsInfo in
            vkCmdSetDescriptorBufferOffsets2EXT(self.handle, ptr_setDescriptorBufferOffsetsInfo)
        }
    }

    public func setDescriptorBufferOffsets2EXT(_ setDescriptorBufferOffsetsInfo: SetDescriptorBufferOffsetsInfoEXT) -> Void {
        let vkCmdSetDescriptorBufferOffsets2EXT = self.table.pointee.vkCmdSetDescriptorBufferOffsets2EXT!
        return setDescriptorBufferOffsetsInfo.withCStruct { ptr_setDescriptorBufferOffsetsInfo in
            vkCmdSetDescriptorBufferOffsets2EXT(self.handle, ptr_setDescriptorBufferOffsetsInfo)
        }
    }

    public func bindDescriptorBufferEmbeddedSamplers2EXT(_ bindDescriptorBufferEmbeddedSamplersInfo: (some Chainable<BindDescriptorBufferEmbeddedSamplersInfoEXT>)) -> Void {
        let vkCmdBindDescriptorBufferEmbeddedSamplers2EXT = self.table.pointee.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT!
        return bindDescriptorBufferEmbeddedSamplersInfo.withCStruct { ptr_bindDescriptorBufferEmbeddedSamplersInfo in
            vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(self.handle, ptr_bindDescriptorBufferEmbeddedSamplersInfo)
        }
    }

    public func bindDescriptorBufferEmbeddedSamplers2EXT(_ bindDescriptorBufferEmbeddedSamplersInfo: BindDescriptorBufferEmbeddedSamplersInfoEXT) -> Void {
        let vkCmdBindDescriptorBufferEmbeddedSamplers2EXT = self.table.pointee.vkCmdBindDescriptorBufferEmbeddedSamplers2EXT!
        return bindDescriptorBufferEmbeddedSamplersInfo.withCStruct { ptr_bindDescriptorBufferEmbeddedSamplersInfo in
            vkCmdBindDescriptorBufferEmbeddedSamplers2EXT(self.handle, ptr_bindDescriptorBufferEmbeddedSamplersInfo)
        }
    }

    public func setRenderingAttachmentLocations(_ locationInfo: (some Chainable<RenderingAttachmentLocationInfo>)) -> Void {
        let vkCmdSetRenderingAttachmentLocations = self.table.pointee.vkCmdSetRenderingAttachmentLocations!
        return locationInfo.withCStruct { ptr_locationInfo in
            vkCmdSetRenderingAttachmentLocations(self.handle, ptr_locationInfo)
        }
    }

    public func setRenderingAttachmentLocations(_ locationInfo: RenderingAttachmentLocationInfo = RenderingAttachmentLocationInfo()) -> Void {
        let vkCmdSetRenderingAttachmentLocations = self.table.pointee.vkCmdSetRenderingAttachmentLocations!
        return locationInfo.withCStruct { ptr_locationInfo in
            vkCmdSetRenderingAttachmentLocations(self.handle, ptr_locationInfo)
        }
    }

    public func setRenderingInputAttachmentIndices(_ inputAttachmentIndexInfo: (some Chainable<RenderingInputAttachmentIndexInfo>)) -> Void {
        let vkCmdSetRenderingInputAttachmentIndices = self.table.pointee.vkCmdSetRenderingInputAttachmentIndices!
        return inputAttachmentIndexInfo.withCStruct { ptr_inputAttachmentIndexInfo in
            vkCmdSetRenderingInputAttachmentIndices(self.handle, ptr_inputAttachmentIndexInfo)
        }
    }

    public func setRenderingInputAttachmentIndices(_ inputAttachmentIndexInfo: RenderingInputAttachmentIndexInfo = RenderingInputAttachmentIndexInfo()) -> Void {
        let vkCmdSetRenderingInputAttachmentIndices = self.table.pointee.vkCmdSetRenderingInputAttachmentIndices!
        return inputAttachmentIndexInfo.withCStruct { ptr_inputAttachmentIndexInfo in
            vkCmdSetRenderingInputAttachmentIndices(self.handle, ptr_inputAttachmentIndexInfo)
        }
    }

    public func setDepthClampRangeEXT(depthClampMode: DepthClampModeEXT, depthClampRange: DepthClampRangeEXT? = nil) -> Void {
        let vkCmdSetDepthClampRangeEXT = self.table.pointee.vkCmdSetDepthClampRangeEXT!
        return depthClampRange.withOptionalCStruct { ptr_depthClampRange in
            vkCmdSetDepthClampRangeEXT(self.handle, VkDepthClampModeEXT(rawValue: VkDepthClampModeEXT.RawValue(depthClampMode.rawValue)), ptr_depthClampRange)
        }
    }

    public func convertCooperativeVectorMatrixNV(_ infos: (AnyChainableArray<ConvertCooperativeVectorMatrixInfoNV>)) -> Void {
        let vkCmdConvertCooperativeVectorMatrixNV = self.table.pointee.vkCmdConvertCooperativeVectorMatrixNV!
        return infos.withCStructBufferPointer { ptr_infos in
            vkCmdConvertCooperativeVectorMatrixNV(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func convertCooperativeVectorMatrixNV(_ infos: Array<ConvertCooperativeVectorMatrixInfoNV>) -> Void {
        let vkCmdConvertCooperativeVectorMatrixNV = self.table.pointee.vkCmdConvertCooperativeVectorMatrixNV!
        return infos.withCStructBufferPointer { ptr_infos in
            vkCmdConvertCooperativeVectorMatrixNV(self.handle, UInt32(ptr_infos.count), ptr_infos.baseAddress)
        }
    }

    public func dispatchTileQCOM(_ dispatchTileInfo: (some Chainable<DispatchTileInfoQCOM>)) -> Void {
        let vkCmdDispatchTileQCOM = self.table.pointee.vkCmdDispatchTileQCOM!
        return dispatchTileInfo.withCStruct { ptr_dispatchTileInfo in
            vkCmdDispatchTileQCOM(self.handle, ptr_dispatchTileInfo)
        }
    }

    public func dispatchTileQCOM(_ dispatchTileInfo: DispatchTileInfoQCOM = DispatchTileInfoQCOM()) -> Void {
        let vkCmdDispatchTileQCOM = self.table.pointee.vkCmdDispatchTileQCOM!
        return dispatchTileInfo.withCStruct { ptr_dispatchTileInfo in
            vkCmdDispatchTileQCOM(self.handle, ptr_dispatchTileInfo)
        }
    }

    public func beginPerTileExecutionQCOM(_ perTileBeginInfo: (some Chainable<PerTileBeginInfoQCOM>)) -> Void {
        let vkCmdBeginPerTileExecutionQCOM = self.table.pointee.vkCmdBeginPerTileExecutionQCOM!
        return perTileBeginInfo.withCStruct { ptr_perTileBeginInfo in
            vkCmdBeginPerTileExecutionQCOM(self.handle, ptr_perTileBeginInfo)
        }
    }

    public func beginPerTileExecutionQCOM(_ perTileBeginInfo: PerTileBeginInfoQCOM = PerTileBeginInfoQCOM()) -> Void {
        let vkCmdBeginPerTileExecutionQCOM = self.table.pointee.vkCmdBeginPerTileExecutionQCOM!
        return perTileBeginInfo.withCStruct { ptr_perTileBeginInfo in
            vkCmdBeginPerTileExecutionQCOM(self.handle, ptr_perTileBeginInfo)
        }
    }

    public func endPerTileExecutionQCOM(_ perTileEndInfo: (some Chainable<PerTileEndInfoQCOM>)) -> Void {
        let vkCmdEndPerTileExecutionQCOM = self.table.pointee.vkCmdEndPerTileExecutionQCOM!
        return perTileEndInfo.withCStruct { ptr_perTileEndInfo in
            vkCmdEndPerTileExecutionQCOM(self.handle, ptr_perTileEndInfo)
        }
    }

    public func endPerTileExecutionQCOM(_ perTileEndInfo: PerTileEndInfoQCOM = PerTileEndInfoQCOM()) -> Void {
        let vkCmdEndPerTileExecutionQCOM = self.table.pointee.vkCmdEndPerTileExecutionQCOM!
        return perTileEndInfo.withCStruct { ptr_perTileEndInfo in
            vkCmdEndPerTileExecutionQCOM(self.handle, ptr_perTileEndInfo)
        }
    }

    public func beginShaderInstrumentationARM(instrumentation: ShaderInstrumentationARM) -> Void {
        let vkCmdBeginShaderInstrumentationARM = self.table.pointee.vkCmdBeginShaderInstrumentationARM!
        vkCmdBeginShaderInstrumentationARM(self.handle, instrumentation.handle)
    }

    public func endShaderInstrumentationARM() -> Void {
        let vkCmdEndShaderInstrumentationARM = self.table.pointee.vkCmdEndShaderInstrumentationARM!
        vkCmdEndShaderInstrumentationARM(self.handle)
    }

    public func copyTensorARM(_ copyTensorInfo: (some Chainable<CopyTensorInfoARM>)) -> Void {
        let vkCmdCopyTensorARM = self.table.pointee.vkCmdCopyTensorARM!
        return copyTensorInfo.withCStruct { ptr_copyTensorInfo in
            vkCmdCopyTensorARM(self.handle, ptr_copyTensorInfo)
        }
    }

    public func copyTensorARM(_ copyTensorInfo: CopyTensorInfoARM) -> Void {
        let vkCmdCopyTensorARM = self.table.pointee.vkCmdCopyTensorARM!
        return copyTensorInfo.withCStruct { ptr_copyTensorInfo in
            vkCmdCopyTensorARM(self.handle, ptr_copyTensorInfo)
        }
    }

    public func dispatchDataGraphARM(_ info: (some Chainable<DataGraphPipelineDispatchInfoARM>), session: DataGraphPipelineSessionARM) -> Void {
        let vkCmdDispatchDataGraphARM = self.table.pointee.vkCmdDispatchDataGraphARM!
        return info.withCStruct { ptr_info in
            vkCmdDispatchDataGraphARM(self.handle, session.handle, ptr_info)
        }
    }

    public func dispatchDataGraphARM(_ info: DataGraphPipelineDispatchInfoARM? = nil, session: DataGraphPipelineSessionARM) -> Void {
        let vkCmdDispatchDataGraphARM = self.table.pointee.vkCmdDispatchDataGraphARM!
        return info.withOptionalCStruct { ptr_info in
            vkCmdDispatchDataGraphARM(self.handle, session.handle, ptr_info)
        }
    }

    public func setComputeOccupancyPriorityNV(parameters: (some Chainable<ComputeOccupancyPriorityParametersNV>)) -> Void {
        let vkCmdSetComputeOccupancyPriorityNV = self.table.pointee.vkCmdSetComputeOccupancyPriorityNV!
        return parameters.withCStruct { ptr_parameters in
            vkCmdSetComputeOccupancyPriorityNV(self.handle, ptr_parameters)
        }
    }

    public func setComputeOccupancyPriorityNV(parameters: ComputeOccupancyPriorityParametersNV) -> Void {
        let vkCmdSetComputeOccupancyPriorityNV = self.table.pointee.vkCmdSetComputeOccupancyPriorityNV!
        return parameters.withCStruct { ptr_parameters in
            vkCmdSetComputeOccupancyPriorityNV(self.handle, ptr_parameters)
        }
    }

    public func bindSamplerHeapEXT(_ bindInfo: (some Chainable<BindHeapInfoEXT>)) -> Void {
        let vkCmdBindSamplerHeapEXT = self.table.pointee.vkCmdBindSamplerHeapEXT!
        return bindInfo.withCStruct { ptr_bindInfo in
            vkCmdBindSamplerHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func bindSamplerHeapEXT(_ bindInfo: BindHeapInfoEXT) -> Void {
        let vkCmdBindSamplerHeapEXT = self.table.pointee.vkCmdBindSamplerHeapEXT!
        return bindInfo.withCStruct { ptr_bindInfo in
            vkCmdBindSamplerHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func bindResourceHeapEXT(_ bindInfo: (some Chainable<BindHeapInfoEXT>)) -> Void {
        let vkCmdBindResourceHeapEXT = self.table.pointee.vkCmdBindResourceHeapEXT!
        return bindInfo.withCStruct { ptr_bindInfo in
            vkCmdBindResourceHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func bindResourceHeapEXT(_ bindInfo: BindHeapInfoEXT) -> Void {
        let vkCmdBindResourceHeapEXT = self.table.pointee.vkCmdBindResourceHeapEXT!
        return bindInfo.withCStruct { ptr_bindInfo in
            vkCmdBindResourceHeapEXT(self.handle, ptr_bindInfo)
        }
    }

    public func pushDataEXT(_ pushDataInfo: (some Chainable<PushDataInfoEXT>)) -> Void {
        let vkCmdPushDataEXT = self.table.pointee.vkCmdPushDataEXT!
        return pushDataInfo.withCStruct { ptr_pushDataInfo in
            vkCmdPushDataEXT(self.handle, ptr_pushDataInfo)
        }
    }

    public func pushDataEXT(_ pushDataInfo: PushDataInfoEXT) -> Void {
        let vkCmdPushDataEXT = self.table.pointee.vkCmdPushDataEXT!
        return pushDataInfo.withCStruct { ptr_pushDataInfo in
            vkCmdPushDataEXT(self.handle, ptr_pushDataInfo)
        }
    }

    public func copyMemoryKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryInfoKHR>)) -> Void {
        let vkCmdCopyMemoryKHR = self.table.pointee.vkCmdCopyMemoryKHR!
        return copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            vkCmdCopyMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyMemoryKHR(_ copyMemoryInfo: CopyDeviceMemoryInfoKHR? = nil) -> Void {
        let vkCmdCopyMemoryKHR = self.table.pointee.vkCmdCopyMemoryKHR!
        return copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            vkCmdCopyMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyMemoryToImageKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryImageInfoKHR>)) -> Void {
        let vkCmdCopyMemoryToImageKHR = self.table.pointee.vkCmdCopyMemoryToImageKHR!
        return copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            vkCmdCopyMemoryToImageKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyMemoryToImageKHR(_ copyMemoryInfo: CopyDeviceMemoryImageInfoKHR? = nil) -> Void {
        let vkCmdCopyMemoryToImageKHR = self.table.pointee.vkCmdCopyMemoryToImageKHR!
        return copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            vkCmdCopyMemoryToImageKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyImageToMemoryKHR(_ copyMemoryInfo: (some Chainable<CopyDeviceMemoryImageInfoKHR>)) -> Void {
        let vkCmdCopyImageToMemoryKHR = self.table.pointee.vkCmdCopyImageToMemoryKHR!
        return copyMemoryInfo.withCStruct { ptr_copyMemoryInfo in
            vkCmdCopyImageToMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func copyImageToMemoryKHR(_ copyMemoryInfo: CopyDeviceMemoryImageInfoKHR? = nil) -> Void {
        let vkCmdCopyImageToMemoryKHR = self.table.pointee.vkCmdCopyImageToMemoryKHR!
        return copyMemoryInfo.withOptionalCStruct { ptr_copyMemoryInfo in
            vkCmdCopyImageToMemoryKHR(self.handle, ptr_copyMemoryInfo)
        }
    }

    public func updateMemoryKHR(dstRange: DeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], dataSize: VkDeviceSize, data: UnsafeRawPointer) -> Void {
        let vkCmdUpdateMemoryKHR = self.table.pointee.vkCmdUpdateMemoryKHR!
        return dstRange.withCStruct { ptr_dstRange in
            vkCmdUpdateMemoryKHR(self.handle, ptr_dstRange, dstFlags.rawValue, dataSize, data)
        }
    }

    public func fillMemoryKHR(dstRange: DeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], data: UInt32) -> Void {
        let vkCmdFillMemoryKHR = self.table.pointee.vkCmdFillMemoryKHR!
        return dstRange.withCStruct { ptr_dstRange in
            vkCmdFillMemoryKHR(self.handle, ptr_dstRange, dstFlags.rawValue, data)
        }
    }

    public func copyQueryPoolResultsToMemoryKHR(queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32, dstRange: StridedDeviceAddressRangeKHR, dstFlags: AddressCommandFlagsKHR = [], queryResultFlags: QueryResultFlags = []) -> Void {
        let vkCmdCopyQueryPoolResultsToMemoryKHR = self.table.pointee.vkCmdCopyQueryPoolResultsToMemoryKHR!
        return dstRange.withCStruct { ptr_dstRange in
            vkCmdCopyQueryPoolResultsToMemoryKHR(self.handle, queryPool.handle, firstQuery, queryCount, ptr_dstRange, dstFlags.rawValue, queryResultFlags.rawValue)
        }
    }

    public func beginConditionalRendering2EXT(conditionalRenderingBegin: (some Chainable<ConditionalRenderingBeginInfo2EXT>)) -> Void {
        let vkCmdBeginConditionalRendering2EXT = self.table.pointee.vkCmdBeginConditionalRendering2EXT!
        return conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            vkCmdBeginConditionalRendering2EXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func beginConditionalRendering2EXT(conditionalRenderingBegin: ConditionalRenderingBeginInfo2EXT) -> Void {
        let vkCmdBeginConditionalRendering2EXT = self.table.pointee.vkCmdBeginConditionalRendering2EXT!
        return conditionalRenderingBegin.withCStruct { ptr_conditionalRenderingBegin in
            vkCmdBeginConditionalRendering2EXT(self.handle, ptr_conditionalRenderingBegin)
        }
    }

    public func bindTransformFeedbackBuffers2EXT(_ bindingInfos: (AnyChainableArray<BindTransformFeedbackBuffer2InfoEXT>), firstBinding: UInt32) -> Void {
        let vkCmdBindTransformFeedbackBuffers2EXT = self.table.pointee.vkCmdBindTransformFeedbackBuffers2EXT!
        return bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            vkCmdBindTransformFeedbackBuffers2EXT(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func bindTransformFeedbackBuffers2EXT(_ bindingInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = nil, firstBinding: UInt32) -> Void {
        let vkCmdBindTransformFeedbackBuffers2EXT = self.table.pointee.vkCmdBindTransformFeedbackBuffers2EXT!
        return bindingInfos.withOptionalCStructBufferPointer { ptr_bindingInfos in
            vkCmdBindTransformFeedbackBuffers2EXT(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func beginTransformFeedback2EXT(_ counterInfos: (AnyChainableArray<BindTransformFeedbackBuffer2InfoEXT>), firstCounterRange: UInt32) -> Void {
        let vkCmdBeginTransformFeedback2EXT = self.table.pointee.vkCmdBeginTransformFeedback2EXT!
        return counterInfos.withCStructBufferPointer { ptr_counterInfos in
            vkCmdBeginTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func beginTransformFeedback2EXT(_ counterInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = nil, firstCounterRange: UInt32) -> Void {
        let vkCmdBeginTransformFeedback2EXT = self.table.pointee.vkCmdBeginTransformFeedback2EXT!
        return counterInfos.withOptionalCStructBufferPointer { ptr_counterInfos in
            vkCmdBeginTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func endTransformFeedback2EXT(_ counterInfos: (AnyChainableArray<BindTransformFeedbackBuffer2InfoEXT>), firstCounterRange: UInt32) -> Void {
        let vkCmdEndTransformFeedback2EXT = self.table.pointee.vkCmdEndTransformFeedback2EXT!
        return counterInfos.withCStructBufferPointer { ptr_counterInfos in
            vkCmdEndTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func endTransformFeedback2EXT(_ counterInfos: Array<BindTransformFeedbackBuffer2InfoEXT>? = nil, firstCounterRange: UInt32) -> Void {
        let vkCmdEndTransformFeedback2EXT = self.table.pointee.vkCmdEndTransformFeedback2EXT!
        return counterInfos.withOptionalCStructBufferPointer { ptr_counterInfos in
            vkCmdEndTransformFeedback2EXT(self.handle, firstCounterRange, UInt32(ptr_counterInfos.count), ptr_counterInfos.baseAddress)
        }
    }

    public func drawIndirectByteCount2EXT(_ counterInfo: (some Chainable<BindTransformFeedbackBuffer2InfoEXT>), instanceCount: UInt32, firstInstance: UInt32, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        let vkCmdDrawIndirectByteCount2EXT = self.table.pointee.vkCmdDrawIndirectByteCount2EXT!
        return counterInfo.withCStruct { ptr_counterInfo in
            vkCmdDrawIndirectByteCount2EXT(self.handle, instanceCount, firstInstance, ptr_counterInfo, counterOffset, vertexStride)
        }
    }

    public func drawIndirectByteCount2EXT(_ counterInfo: BindTransformFeedbackBuffer2InfoEXT, instanceCount: UInt32, firstInstance: UInt32, counterOffset: UInt32, vertexStride: UInt32) -> Void {
        let vkCmdDrawIndirectByteCount2EXT = self.table.pointee.vkCmdDrawIndirectByteCount2EXT!
        return counterInfo.withCStruct { ptr_counterInfo in
            vkCmdDrawIndirectByteCount2EXT(self.handle, instanceCount, firstInstance, ptr_counterInfo, counterOffset, vertexStride)
        }
    }

    public func writeMarkerToMemoryAMD(_ info: (some Chainable<MemoryMarkerInfoAMD>)) -> Void {
        let vkCmdWriteMarkerToMemoryAMD = self.table.pointee.vkCmdWriteMarkerToMemoryAMD!
        return info.withCStruct { ptr_info in
            vkCmdWriteMarkerToMemoryAMD(self.handle, ptr_info)
        }
    }

    public func writeMarkerToMemoryAMD(_ info: MemoryMarkerInfoAMD) -> Void {
        let vkCmdWriteMarkerToMemoryAMD = self.table.pointee.vkCmdWriteMarkerToMemoryAMD!
        return info.withCStruct { ptr_info in
            vkCmdWriteMarkerToMemoryAMD(self.handle, ptr_info)
        }
    }

    public func bindIndexBuffer3KHR(_ info: (some Chainable<BindIndexBuffer3InfoKHR>)) -> Void {
        let vkCmdBindIndexBuffer3KHR = self.table.pointee.vkCmdBindIndexBuffer3KHR!
        return info.withCStruct { ptr_info in
            vkCmdBindIndexBuffer3KHR(self.handle, ptr_info)
        }
    }

    public func bindIndexBuffer3KHR(_ info: BindIndexBuffer3InfoKHR) -> Void {
        let vkCmdBindIndexBuffer3KHR = self.table.pointee.vkCmdBindIndexBuffer3KHR!
        return info.withCStruct { ptr_info in
            vkCmdBindIndexBuffer3KHR(self.handle, ptr_info)
        }
    }

    public func bindVertexBuffers3KHR(_ bindingInfos: (AnyChainableArray<BindVertexBuffer3InfoKHR>), firstBinding: UInt32) -> Void {
        let vkCmdBindVertexBuffers3KHR = self.table.pointee.vkCmdBindVertexBuffers3KHR!
        return bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            vkCmdBindVertexBuffers3KHR(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func bindVertexBuffers3KHR(_ bindingInfos: Array<BindVertexBuffer3InfoKHR>, firstBinding: UInt32) -> Void {
        let vkCmdBindVertexBuffers3KHR = self.table.pointee.vkCmdBindVertexBuffers3KHR!
        return bindingInfos.withCStructBufferPointer { ptr_bindingInfos in
            vkCmdBindVertexBuffers3KHR(self.handle, firstBinding, UInt32(ptr_bindingInfos.count), ptr_bindingInfos.baseAddress)
        }
    }

    public func drawIndirect2KHR(_ info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        let vkCmdDrawIndirect2KHR = self.table.pointee.vkCmdDrawIndirect2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndirect2KHR(_ info: DrawIndirect2InfoKHR) -> Void {
        let vkCmdDrawIndirect2KHR = self.table.pointee.vkCmdDrawIndirect2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirect2KHR(_ info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        let vkCmdDrawIndexedIndirect2KHR = self.table.pointee.vkCmdDrawIndexedIndirect2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndexedIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirect2KHR(_ info: DrawIndirect2InfoKHR) -> Void {
        let vkCmdDrawIndexedIndirect2KHR = self.table.pointee.vkCmdDrawIndexedIndirect2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndexedIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndirectCount2KHR(_ info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        let vkCmdDrawIndirectCount2KHR = self.table.pointee.vkCmdDrawIndirectCount2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndirectCount2KHR(_ info: DrawIndirectCount2InfoKHR) -> Void {
        let vkCmdDrawIndirectCount2KHR = self.table.pointee.vkCmdDrawIndirectCount2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirectCount2KHR(_ info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        let vkCmdDrawIndexedIndirectCount2KHR = self.table.pointee.vkCmdDrawIndexedIndirectCount2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndexedIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawIndexedIndirectCount2KHR(_ info: DrawIndirectCount2InfoKHR) -> Void {
        let vkCmdDrawIndexedIndirectCount2KHR = self.table.pointee.vkCmdDrawIndexedIndirectCount2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDrawIndexedIndirectCount2KHR(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirect2EXT(_ info: (some Chainable<DrawIndirect2InfoKHR>)) -> Void {
        let vkCmdDrawMeshTasksIndirect2EXT = self.table.pointee.vkCmdDrawMeshTasksIndirect2EXT!
        return info.withCStruct { ptr_info in
            vkCmdDrawMeshTasksIndirect2EXT(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirect2EXT(_ info: DrawIndirect2InfoKHR) -> Void {
        let vkCmdDrawMeshTasksIndirect2EXT = self.table.pointee.vkCmdDrawMeshTasksIndirect2EXT!
        return info.withCStruct { ptr_info in
            vkCmdDrawMeshTasksIndirect2EXT(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirectCount2EXT(_ info: (some Chainable<DrawIndirectCount2InfoKHR>)) -> Void {
        let vkCmdDrawMeshTasksIndirectCount2EXT = self.table.pointee.vkCmdDrawMeshTasksIndirectCount2EXT!
        return info.withCStruct { ptr_info in
            vkCmdDrawMeshTasksIndirectCount2EXT(self.handle, ptr_info)
        }
    }

    public func drawMeshTasksIndirectCount2EXT(_ info: DrawIndirectCount2InfoKHR) -> Void {
        let vkCmdDrawMeshTasksIndirectCount2EXT = self.table.pointee.vkCmdDrawMeshTasksIndirectCount2EXT!
        return info.withCStruct { ptr_info in
            vkCmdDrawMeshTasksIndirectCount2EXT(self.handle, ptr_info)
        }
    }

    public func dispatchIndirect2KHR(_ info: (some Chainable<DispatchIndirect2InfoKHR>)) -> Void {
        let vkCmdDispatchIndirect2KHR = self.table.pointee.vkCmdDispatchIndirect2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDispatchIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func dispatchIndirect2KHR(_ info: DispatchIndirect2InfoKHR) -> Void {
        let vkCmdDispatchIndirect2KHR = self.table.pointee.vkCmdDispatchIndirect2KHR!
        return info.withCStruct { ptr_info in
            vkCmdDispatchIndirect2KHR(self.handle, ptr_info)
        }
    }

    public func setDispatchParametersARM(dispatchParameters: (some Chainable<DispatchParametersARM>)) -> Void {
        let vkCmdSetDispatchParametersARM = self.table.pointee.vkCmdSetDispatchParametersARM!
        return dispatchParameters.withCStruct { ptr_dispatchParameters in
            vkCmdSetDispatchParametersARM(self.handle, ptr_dispatchParameters)
        }
    }

    public func setDispatchParametersARM(dispatchParameters: DispatchParametersARM = DispatchParametersARM()) -> Void {
        let vkCmdSetDispatchParametersARM = self.table.pointee.vkCmdSetDispatchParametersARM!
        return dispatchParameters.withCStruct { ptr_dispatchParameters in
            vkCmdSetDispatchParametersARM(self.handle, ptr_dispatchParameters)
        }
    }
}

