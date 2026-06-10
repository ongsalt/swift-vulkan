import CVulkan

public struct WriteDescriptorSet: ChainableBase {
    public typealias CStruct = VkWriteDescriptorSet

    public let dstSet: DescriptorSet
    public let dstBinding: UInt32
    public let dstArrayElement: UInt32
    public let descriptorCount: UInt32
    public let descriptorType: DescriptorType
    public let imageInfo: Array<DescriptorImageInfo>
    public let bufferInfo: Array<DescriptorBufferInfo>
    public let texelBufferView: Array<BufferView>

    public init(dstSet: DescriptorSet, dstBinding: UInt32, dstArrayElement: UInt32, descriptorCount: UInt32, descriptorType: DescriptorType, imageInfo: Array<DescriptorImageInfo>, bufferInfo: Array<DescriptorBufferInfo>, texelBufferView: Array<BufferView>) {
        self.dstSet = dstSet
        self.dstBinding = dstBinding
        self.dstArrayElement = dstArrayElement
        self.descriptorCount = descriptorCount
        self.descriptorType = descriptorType
        self.imageInfo = imageInfo
        self.bufferInfo = bufferInfo
        self.texelBufferView = texelBufferView
    }

    init(cStruct: VkWriteDescriptorSet, descriptorPool: DescriptorPool, device: Device) {
        self.dstSet = DescriptorSet(handle: cStruct.dstSet, descriptorPool: descriptorPool)
        self.dstBinding = cStruct.dstBinding
        self.dstArrayElement = cStruct.dstArrayElement
        self.descriptorCount = cStruct.descriptorCount
        self.descriptorType = DescriptorType(rawValue: unsafeBitCast(cStruct.descriptorType, to: UInt32.self))!
        self.imageInfo = UnsafeBufferPointer(start: cStruct.pImageInfo, count: Int(cStruct.descriptorCount)).map{ DescriptorImageInfo(cStruct: $0, device: device) }
        self.bufferInfo = UnsafeBufferPointer(start: cStruct.pBufferInfo, count: Int(cStruct.descriptorCount)).map{ DescriptorBufferInfo(cStruct: $0, device: device) }
        self.texelBufferView = UnsafeBufferPointer(start: cStruct.pTexelBufferView, count: Int(cStruct.descriptorCount)).map{ BufferView(handle: $0, device: device) }
    }

    public func withCStruct<R, E: Error>(pNext: UnsafeRawPointer?, _ body: (UnsafePointer<VkWriteDescriptorSet>) throws(E) -> R) throws(E) -> R {
        try self.imageInfo.withCStructBufferPointer { ptr_imageInfo throws(E) in
            try self.bufferInfo.withCStructBufferPointer { ptr_bufferInfo throws(E) in
                try self.texelBufferView.map{ $0.handle }.withUnsafeBufferPointer { ptr_texelBufferView throws(E) in
                    var cStruct = VkWriteDescriptorSet()
                    cStruct.sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET
                    cStruct.pNext = maybeMutable(pNext)
                    cStruct.dstSet = self.dstSet.handle
                    cStruct.dstBinding = self.dstBinding
                    cStruct.dstArrayElement = self.dstArrayElement
                    cStruct.descriptorCount = descriptorCount
                    cStruct.descriptorType = VkDescriptorType(rawValue: VkDescriptorType.RawValue(self.descriptorType.rawValue))
                    cStruct.pImageInfo = ptr_imageInfo.baseAddress
                    cStruct.pBufferInfo = ptr_bufferInfo.baseAddress
                    cStruct.pTexelBufferView = ptr_texelBufferView.baseAddress
                    return try body(&cStruct)
                }
            }
        }
    }

    public func push<Extension: WriteDescriptorSetExtension>(_ ext: Extension) -> Chain<Self, Extension> {
        Chain(base: base, next: ext)
    }
}

public protocol WriteDescriptorSetExtension: Chainable {}
