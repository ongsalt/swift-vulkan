public struct FramebufferCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let imageless = FramebufferCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.imageless, "imageless"),
    ]
}

public struct QueryPoolCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let resetKHR = QueryPoolCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.resetKHR, "resetKHR"),
    ]
}

public struct RenderPassCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let transformQCOM = RenderPassCreateFlags(rawValue: 2)
    public static let perLayerFragmentDensityVALVE = RenderPassCreateFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.transformQCOM, "transformQCOM"),
        (.perLayerFragmentDensityVALVE, "perLayerFragmentDensityVALVE"),
    ]
}

public struct SamplerCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let subsampledEXT = SamplerCreateFlags(rawValue: 1)
    public static let subsampledCoarseReconstructionEXT = SamplerCreateFlags(rawValue: 2)
    public static let descriptorBufferCaptureReplayEXT = SamplerCreateFlags(rawValue: 8)
    public static let nonSeamlessCubeMapEXT = SamplerCreateFlags(rawValue: 4)
    public static let imageProcessingQCOM = SamplerCreateFlags(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.subsampledEXT, "subsampledEXT"),
        (.subsampledCoarseReconstructionEXT, "subsampledCoarseReconstructionEXT"),
        (.descriptorBufferCaptureReplayEXT, "descriptorBufferCaptureReplayEXT"),
        (.nonSeamlessCubeMapEXT, "nonSeamlessCubeMapEXT"),
        (.imageProcessingQCOM, "imageProcessingQCOM"),
    ]
}

public struct PipelineLayoutCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let independentSetsEXT = PipelineLayoutCreateFlags(rawValue: 2)
    public static let noTaskShaderKHR = PipelineLayoutCreateFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.independentSetsEXT, "independentSetsEXT"),
        (.noTaskShaderKHR, "noTaskShaderKHR"),
    ]
}

public struct PipelineCacheCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let internallySynchronizedMergeKHR = PipelineCacheCreateFlags(rawValue: 8)
    public static let externallySynchronized = PipelineCacheCreateFlags(rawValue: 1)
    public static let readOnly = PipelineCacheCreateFlags(rawValue: 2)
    public static let useApplicationStorage = PipelineCacheCreateFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.internallySynchronizedMergeKHR, "internallySynchronizedMergeKHR"),
        (.externallySynchronized, "externallySynchronized"),
        (.readOnly, "readOnly"),
        (.useApplicationStorage, "useApplicationStorage"),
    ]
}

public struct PipelineDepthStencilStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let rasterizationOrderAttachmentDepthAccessEXT = PipelineDepthStencilStateCreateFlags(rawValue: 1)
    public static let rasterizationOrderAttachmentStencilAccessEXT = PipelineDepthStencilStateCreateFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.rasterizationOrderAttachmentDepthAccessEXT, "rasterizationOrderAttachmentDepthAccessEXT"),
        (.rasterizationOrderAttachmentStencilAccessEXT, "rasterizationOrderAttachmentStencilAccessEXT"),
    ]
}

public struct PipelineDynamicStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineColorBlendStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let rasterizationOrderAttachmentAccessEXT = PipelineColorBlendStateCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.rasterizationOrderAttachmentAccessEXT, "rasterizationOrderAttachmentAccessEXT"),
    ]
}

public struct PipelineMultisampleStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineRasterizationStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineViewportStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineTessellationStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineInputAssemblyStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineVertexInputStateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineShaderStageCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let allowVaryingSubgroupSize = PipelineShaderStageCreateFlags(rawValue: 1)
    public static let requireFullSubgroups = PipelineShaderStageCreateFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.allowVaryingSubgroupSize, "allowVaryingSubgroupSize"),
        (.requireFullSubgroups, "requireFullSubgroups"),
    ]
}

public struct DescriptorSetLayoutCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let descriptorBufferEXT = DescriptorSetLayoutCreateFlags(rawValue: 16)
    public static let embeddedImmutableSamplersEXT = DescriptorSetLayoutCreateFlags(rawValue: 32)
    public static let indirectBindableNV = DescriptorSetLayoutCreateFlags(rawValue: 128)
    public static let hostOnlyPoolEXT = DescriptorSetLayoutCreateFlags(rawValue: 4)
    public static let perStageNV = DescriptorSetLayoutCreateFlags(rawValue: 64)
    public static let updateAfterBindPool = DescriptorSetLayoutCreateFlags(rawValue: 2)
    public static let pushDescriptor = DescriptorSetLayoutCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.descriptorBufferEXT, "descriptorBufferEXT"),
        (.embeddedImmutableSamplersEXT, "embeddedImmutableSamplersEXT"),
        (.indirectBindableNV, "indirectBindableNV"),
        (.hostOnlyPoolEXT, "hostOnlyPoolEXT"),
        (.perStageNV, "perStageNV"),
        (.updateAfterBindPool, "updateAfterBindPool"),
        (.pushDescriptor, "pushDescriptor"),
    ]
}

public struct BufferViewCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct InstanceCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let enumeratePortabilityKHR = InstanceCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.enumeratePortabilityKHR, "enumeratePortabilityKHR"),
    ]
}

public struct DeviceCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DeviceQueueCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let internallySynchronizedKHR = DeviceQueueCreateFlags(rawValue: 4)
    public static let protected = DeviceQueueCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.internallySynchronizedKHR, "internallySynchronizedKHR"),
        (.protected, "protected"),
    ]
}

public struct QueueFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let graphics = QueueFlags(rawValue: 1)
    public static let compute = QueueFlags(rawValue: 2)
    public static let transfer = QueueFlags(rawValue: 4)
    public static let sparseBinding = QueueFlags(rawValue: 8)
    public static let videoDecodeKHR = QueueFlags(rawValue: 32)
    public static let videoEncodeKHR = QueueFlags(rawValue: 64)
    public static let opticalFlowNV = QueueFlags(rawValue: 256)
    public static let dataGraphARM = QueueFlags(rawValue: 1024)
    public static let protected = QueueFlags(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.graphics, "graphics"),
        (.compute, "compute"),
        (.transfer, "transfer"),
        (.sparseBinding, "sparseBinding"),
        (.videoDecodeKHR, "videoDecodeKHR"),
        (.videoEncodeKHR, "videoEncodeKHR"),
        (.opticalFlowNV, "opticalFlowNV"),
        (.dataGraphARM, "dataGraphARM"),
        (.protected, "protected"),
    ]
}

public struct MemoryPropertyFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceLocal = MemoryPropertyFlags(rawValue: 1)
    public static let hostVisible = MemoryPropertyFlags(rawValue: 2)
    public static let hostCoherent = MemoryPropertyFlags(rawValue: 4)
    public static let hostCached = MemoryPropertyFlags(rawValue: 8)
    public static let lazilyAllocated = MemoryPropertyFlags(rawValue: 16)
    public static let deviceCoherentAMD = MemoryPropertyFlags(rawValue: 64)
    public static let deviceUncachedAMD = MemoryPropertyFlags(rawValue: 128)
    public static let rdmaCapableNV = MemoryPropertyFlags(rawValue: 256)
    public static let protected = MemoryPropertyFlags(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceLocal, "deviceLocal"),
        (.hostVisible, "hostVisible"),
        (.hostCoherent, "hostCoherent"),
        (.hostCached, "hostCached"),
        (.lazilyAllocated, "lazilyAllocated"),
        (.deviceCoherentAMD, "deviceCoherentAMD"),
        (.deviceUncachedAMD, "deviceUncachedAMD"),
        (.rdmaCapableNV, "rdmaCapableNV"),
        (.protected, "protected"),
    ]
}

public struct MemoryHeapFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceLocal = MemoryHeapFlags(rawValue: 1)
    public static let tileMemoryQCOM = MemoryHeapFlags(rawValue: 8)
    public static let multiInstance = MemoryHeapFlags(rawValue: 2)
    public static let seuSafe = MemoryHeapFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceLocal, "deviceLocal"),
        (.tileMemoryQCOM, "tileMemoryQCOM"),
        (.multiInstance, "multiInstance"),
        (.seuSafe, "seuSafe"),
    ]
}

public struct AccessFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let indirectCommandRead = AccessFlags(rawValue: 1)
    public static let indexRead = AccessFlags(rawValue: 2)
    public static let vertexAttributeRead = AccessFlags(rawValue: 4)
    public static let uniformRead = AccessFlags(rawValue: 8)
    public static let inputAttachmentRead = AccessFlags(rawValue: 16)
    public static let shaderRead = AccessFlags(rawValue: 32)
    public static let shaderWrite = AccessFlags(rawValue: 64)
    public static let colorAttachmentRead = AccessFlags(rawValue: 128)
    public static let colorAttachmentWrite = AccessFlags(rawValue: 256)
    public static let depthStencilAttachmentRead = AccessFlags(rawValue: 512)
    public static let depthStencilAttachmentWrite = AccessFlags(rawValue: 1024)
    public static let transferRead = AccessFlags(rawValue: 2048)
    public static let transferWrite = AccessFlags(rawValue: 4096)
    public static let hostRead = AccessFlags(rawValue: 8192)
    public static let hostWrite = AccessFlags(rawValue: 16384)
    public static let memoryRead = AccessFlags(rawValue: 32768)
    public static let memoryWrite = AccessFlags(rawValue: 65536)
    public static let transformFeedbackWriteEXT = AccessFlags(rawValue: 33554432)
    public static let transformFeedbackCounterReadEXT = AccessFlags(rawValue: 67108864)
    public static let transformFeedbackCounterWriteEXT = AccessFlags(rawValue: 134217728)
    public static let conditionalRenderingReadEXT = AccessFlags(rawValue: 1048576)
    public static let colorAttachmentReadNoncoherentEXT = AccessFlags(rawValue: 524288)
    public static let accelerationStructureReadKHR = AccessFlags(rawValue: 2097152)
    public static let accelerationStructureWriteKHR = AccessFlags(rawValue: 4194304)
    public static let fragmentDensityMapReadEXT = AccessFlags(rawValue: 16777216)
    public static let fragmentShadingRateAttachmentReadKHR = AccessFlags(rawValue: 8388608)
    public static let commandPreprocessReadEXT = AccessFlags(rawValue: 131072)
    public static let commandPreprocessWriteEXT = AccessFlags(rawValue: 262144)
    public static let none: AccessFlags  = []

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.indirectCommandRead, "indirectCommandRead"),
        (.indexRead, "indexRead"),
        (.vertexAttributeRead, "vertexAttributeRead"),
        (.uniformRead, "uniformRead"),
        (.inputAttachmentRead, "inputAttachmentRead"),
        (.shaderRead, "shaderRead"),
        (.shaderWrite, "shaderWrite"),
        (.colorAttachmentRead, "colorAttachmentRead"),
        (.colorAttachmentWrite, "colorAttachmentWrite"),
        (.depthStencilAttachmentRead, "depthStencilAttachmentRead"),
        (.depthStencilAttachmentWrite, "depthStencilAttachmentWrite"),
        (.transferRead, "transferRead"),
        (.transferWrite, "transferWrite"),
        (.hostRead, "hostRead"),
        (.hostWrite, "hostWrite"),
        (.memoryRead, "memoryRead"),
        (.memoryWrite, "memoryWrite"),
        (.transformFeedbackWriteEXT, "transformFeedbackWriteEXT"),
        (.transformFeedbackCounterReadEXT, "transformFeedbackCounterReadEXT"),
        (.transformFeedbackCounterWriteEXT, "transformFeedbackCounterWriteEXT"),
        (.conditionalRenderingReadEXT, "conditionalRenderingReadEXT"),
        (.colorAttachmentReadNoncoherentEXT, "colorAttachmentReadNoncoherentEXT"),
        (.accelerationStructureReadKHR, "accelerationStructureReadKHR"),
        (.accelerationStructureWriteKHR, "accelerationStructureWriteKHR"),
        (.fragmentDensityMapReadEXT, "fragmentDensityMapReadEXT"),
        (.fragmentShadingRateAttachmentReadKHR, "fragmentShadingRateAttachmentReadKHR"),
        (.commandPreprocessReadEXT, "commandPreprocessReadEXT"),
        (.commandPreprocessWriteEXT, "commandPreprocessWriteEXT"),
        (.none, "none"),
    ]
}

public struct BufferUsageFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let transferSrc = BufferUsageFlags(rawValue: 1)
    public static let transferDst = BufferUsageFlags(rawValue: 2)
    public static let uniformTexelBuffer = BufferUsageFlags(rawValue: 4)
    public static let storageTexelBuffer = BufferUsageFlags(rawValue: 8)
    public static let uniformBuffer = BufferUsageFlags(rawValue: 16)
    public static let storageBuffer = BufferUsageFlags(rawValue: 32)
    public static let indexBuffer = BufferUsageFlags(rawValue: 64)
    public static let vertexBuffer = BufferUsageFlags(rawValue: 128)
    public static let indirectBuffer = BufferUsageFlags(rawValue: 256)
    public static let videoDecodeSrcKHR = BufferUsageFlags(rawValue: 8192)
    public static let videoDecodeDstKHR = BufferUsageFlags(rawValue: 16384)
    public static let transformFeedbackBufferEXT = BufferUsageFlags(rawValue: 2048)
    public static let transformFeedbackCounterBufferEXT = BufferUsageFlags(rawValue: 4096)
    public static let conditionalRenderingEXT = BufferUsageFlags(rawValue: 512)
    public static let descriptorHeapEXT = BufferUsageFlags(rawValue: 268435456)
    public static let accelerationStructureBuildInputReadOnlyKHR = BufferUsageFlags(rawValue: 524288)
    public static let accelerationStructureStorageKHR = BufferUsageFlags(rawValue: 1048576)
    public static let shaderBindingTableKHR = BufferUsageFlags(rawValue: 1024)
    public static let videoEncodeDstKHR = BufferUsageFlags(rawValue: 32768)
    public static let videoEncodeSrcKHR = BufferUsageFlags(rawValue: 65536)
    public static let samplerDescriptorBufferEXT = BufferUsageFlags(rawValue: 2097152)
    public static let resourceDescriptorBufferEXT = BufferUsageFlags(rawValue: 4194304)
    public static let pushDescriptorsDescriptorBufferEXT = BufferUsageFlags(rawValue: 67108864)
    public static let micromapBuildInputReadOnlyEXT = BufferUsageFlags(rawValue: 8388608)
    public static let micromapStorageEXT = BufferUsageFlags(rawValue: 16777216)
    public static let tileMemoryQCOM = BufferUsageFlags(rawValue: 134217728)
    public static let shaderDeviceAddress = BufferUsageFlags(rawValue: 131072)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.transferSrc, "transferSrc"),
        (.transferDst, "transferDst"),
        (.uniformTexelBuffer, "uniformTexelBuffer"),
        (.storageTexelBuffer, "storageTexelBuffer"),
        (.uniformBuffer, "uniformBuffer"),
        (.storageBuffer, "storageBuffer"),
        (.indexBuffer, "indexBuffer"),
        (.vertexBuffer, "vertexBuffer"),
        (.indirectBuffer, "indirectBuffer"),
        (.videoDecodeSrcKHR, "videoDecodeSrcKHR"),
        (.videoDecodeDstKHR, "videoDecodeDstKHR"),
        (.transformFeedbackBufferEXT, "transformFeedbackBufferEXT"),
        (.transformFeedbackCounterBufferEXT, "transformFeedbackCounterBufferEXT"),
        (.conditionalRenderingEXT, "conditionalRenderingEXT"),
        (.descriptorHeapEXT, "descriptorHeapEXT"),
        (.accelerationStructureBuildInputReadOnlyKHR, "accelerationStructureBuildInputReadOnlyKHR"),
        (.accelerationStructureStorageKHR, "accelerationStructureStorageKHR"),
        (.shaderBindingTableKHR, "shaderBindingTableKHR"),
        (.videoEncodeDstKHR, "videoEncodeDstKHR"),
        (.videoEncodeSrcKHR, "videoEncodeSrcKHR"),
        (.samplerDescriptorBufferEXT, "samplerDescriptorBufferEXT"),
        (.resourceDescriptorBufferEXT, "resourceDescriptorBufferEXT"),
        (.pushDescriptorsDescriptorBufferEXT, "pushDescriptorsDescriptorBufferEXT"),
        (.micromapBuildInputReadOnlyEXT, "micromapBuildInputReadOnlyEXT"),
        (.micromapStorageEXT, "micromapStorageEXT"),
        (.tileMemoryQCOM, "tileMemoryQCOM"),
        (.shaderDeviceAddress, "shaderDeviceAddress"),
    ]
}

public struct BufferCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let sparseBinding = BufferCreateFlags(rawValue: 1)
    public static let sparseResidency = BufferCreateFlags(rawValue: 2)
    public static let sparseAliased = BufferCreateFlags(rawValue: 4)
    public static let descriptorBufferCaptureReplayEXT = BufferCreateFlags(rawValue: 32)
    public static let videoProfileIndependentKHR = BufferCreateFlags(rawValue: 64)
    public static let protected = BufferCreateFlags(rawValue: 8)
    public static let deviceAddressCaptureReplay = BufferCreateFlags(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.sparseBinding, "sparseBinding"),
        (.sparseResidency, "sparseResidency"),
        (.sparseAliased, "sparseAliased"),
        (.descriptorBufferCaptureReplayEXT, "descriptorBufferCaptureReplayEXT"),
        (.videoProfileIndependentKHR, "videoProfileIndependentKHR"),
        (.protected, "protected"),
        (.deviceAddressCaptureReplay, "deviceAddressCaptureReplay"),
    ]
}

public struct ShaderStageFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let vertex = ShaderStageFlags(rawValue: 1)
    public static let tessellationControl = ShaderStageFlags(rawValue: 2)
    public static let tessellationEvaluation = ShaderStageFlags(rawValue: 4)
    public static let geometry = ShaderStageFlags(rawValue: 8)
    public static let fragment = ShaderStageFlags(rawValue: 16)
    public static let compute = ShaderStageFlags(rawValue: 32)
    public static let allGraphics = ShaderStageFlags(rawValue: 0x0000001F)
    public static let all = ShaderStageFlags(rawValue: 0x7FFFFFFF)
    public static let raygenKHR = ShaderStageFlags(rawValue: 256)
    public static let anyHitKHR = ShaderStageFlags(rawValue: 512)
    public static let closestHitKHR = ShaderStageFlags(rawValue: 1024)
    public static let missKHR = ShaderStageFlags(rawValue: 2048)
    public static let intersectionKHR = ShaderStageFlags(rawValue: 4096)
    public static let callableKHR = ShaderStageFlags(rawValue: 8192)
    public static let taskEXT = ShaderStageFlags(rawValue: 64)
    public static let meshEXT = ShaderStageFlags(rawValue: 128)
    public static let subpassShadingHUAWEI = ShaderStageFlags(rawValue: 16384)
    public static let clusterCullingHUAWEI = ShaderStageFlags(rawValue: 524288)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.vertex, "vertex"),
        (.tessellationControl, "tessellationControl"),
        (.tessellationEvaluation, "tessellationEvaluation"),
        (.geometry, "geometry"),
        (.fragment, "fragment"),
        (.compute, "compute"),
        (.allGraphics, "allGraphics"),
        (.all, "all"),
        (.raygenKHR, "raygenKHR"),
        (.anyHitKHR, "anyHitKHR"),
        (.closestHitKHR, "closestHitKHR"),
        (.missKHR, "missKHR"),
        (.intersectionKHR, "intersectionKHR"),
        (.callableKHR, "callableKHR"),
        (.taskEXT, "taskEXT"),
        (.meshEXT, "meshEXT"),
        (.subpassShadingHUAWEI, "subpassShadingHUAWEI"),
        (.clusterCullingHUAWEI, "clusterCullingHUAWEI"),
    ]
}

public struct ImageUsageFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let transferSrc = ImageUsageFlags(rawValue: 1)
    public static let transferDst = ImageUsageFlags(rawValue: 2)
    public static let sampled = ImageUsageFlags(rawValue: 4)
    public static let storage = ImageUsageFlags(rawValue: 8)
    public static let colorAttachment = ImageUsageFlags(rawValue: 16)
    public static let depthStencilAttachment = ImageUsageFlags(rawValue: 32)
    public static let transientAttachment = ImageUsageFlags(rawValue: 64)
    public static let inputAttachment = ImageUsageFlags(rawValue: 128)
    public static let videoDecodeDstKHR = ImageUsageFlags(rawValue: 1024)
    public static let videoDecodeSrcKHR = ImageUsageFlags(rawValue: 2048)
    public static let videoDecodeDpbKHR = ImageUsageFlags(rawValue: 4096)
    public static let fragmentDensityMapEXT = ImageUsageFlags(rawValue: 512)
    public static let fragmentShadingRateAttachmentKHR = ImageUsageFlags(rawValue: 256)
    public static let videoEncodeDstKHR = ImageUsageFlags(rawValue: 8192)
    public static let videoEncodeSrcKHR = ImageUsageFlags(rawValue: 16384)
    public static let videoEncodeDpbKHR = ImageUsageFlags(rawValue: 32768)
    public static let attachmentFeedbackLoopEXT = ImageUsageFlags(rawValue: 524288)
    public static let invocationMaskHUAWEI = ImageUsageFlags(rawValue: 262144)
    public static let sampleWeightQCOM = ImageUsageFlags(rawValue: 1048576)
    public static let sampleBlockMatchQCOM = ImageUsageFlags(rawValue: 2097152)
    public static let tensorAliasingARM = ImageUsageFlags(rawValue: 8388608)
    public static let tileMemoryQCOM = ImageUsageFlags(rawValue: 134217728)
    public static let videoEncodeQuantizationDeltaMapKHR = ImageUsageFlags(rawValue: 33554432)
    public static let videoEncodeEmphasisMapKHR = ImageUsageFlags(rawValue: 67108864)
    public static let hostTransfer = ImageUsageFlags(rawValue: 4194304)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.transferSrc, "transferSrc"),
        (.transferDst, "transferDst"),
        (.sampled, "sampled"),
        (.storage, "storage"),
        (.colorAttachment, "colorAttachment"),
        (.depthStencilAttachment, "depthStencilAttachment"),
        (.transientAttachment, "transientAttachment"),
        (.inputAttachment, "inputAttachment"),
        (.videoDecodeDstKHR, "videoDecodeDstKHR"),
        (.videoDecodeSrcKHR, "videoDecodeSrcKHR"),
        (.videoDecodeDpbKHR, "videoDecodeDpbKHR"),
        (.fragmentDensityMapEXT, "fragmentDensityMapEXT"),
        (.fragmentShadingRateAttachmentKHR, "fragmentShadingRateAttachmentKHR"),
        (.videoEncodeDstKHR, "videoEncodeDstKHR"),
        (.videoEncodeSrcKHR, "videoEncodeSrcKHR"),
        (.videoEncodeDpbKHR, "videoEncodeDpbKHR"),
        (.attachmentFeedbackLoopEXT, "attachmentFeedbackLoopEXT"),
        (.invocationMaskHUAWEI, "invocationMaskHUAWEI"),
        (.sampleWeightQCOM, "sampleWeightQCOM"),
        (.sampleBlockMatchQCOM, "sampleBlockMatchQCOM"),
        (.tensorAliasingARM, "tensorAliasingARM"),
        (.tileMemoryQCOM, "tileMemoryQCOM"),
        (.videoEncodeQuantizationDeltaMapKHR, "videoEncodeQuantizationDeltaMapKHR"),
        (.videoEncodeEmphasisMapKHR, "videoEncodeEmphasisMapKHR"),
        (.hostTransfer, "hostTransfer"),
    ]
}

public struct ImageCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeSparseBinding = ImageCreateFlags(rawValue: 1)
    public static let typeSparseResidency = ImageCreateFlags(rawValue: 2)
    public static let typeSparseAliased = ImageCreateFlags(rawValue: 4)
    public static let typeMutableFormat = ImageCreateFlags(rawValue: 8)
    public static let typeCubeCompatible = ImageCreateFlags(rawValue: 16)
    public static let typeCornerSampledNV = ImageCreateFlags(rawValue: 8192)
    public static let typeDescriptorHeapCaptureReplayEXT = ImageCreateFlags(rawValue: 65536)
    public static let typeSampleLocationsCompatibleDepthEXT = ImageCreateFlags(rawValue: 4096)
    public static let typeSubsampledEXT = ImageCreateFlags(rawValue: 16384)
    public static let typeMultisampledRenderToSingleSampledEXT = ImageCreateFlags(rawValue: 262144)
    public static let type2dViewCompatibleEXT = ImageCreateFlags(rawValue: 131072)
    public static let typeVideoProfileIndependentKHR = ImageCreateFlags(rawValue: 1048576)
    public static let typeFragmentDensityMapOffsetEXT = ImageCreateFlags(rawValue: 32768)
    public static let typeAliasSingleLayerDescriptorKHR = ImageCreateFlags(rawValue: 4194304)
    public static let typeAlias = ImageCreateFlags(rawValue: 1024)
    public static let typeSplitInstanceBindRegions = ImageCreateFlags(rawValue: 64)
    public static let type2dArrayCompatible = ImageCreateFlags(rawValue: 32)
    public static let typeBlockTexelViewCompatible = ImageCreateFlags(rawValue: 128)
    public static let typeExtendedUsage = ImageCreateFlags(rawValue: 256)
    public static let typeProtected = ImageCreateFlags(rawValue: 2048)
    public static let typeDisjoint = ImageCreateFlags(rawValue: 512)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeSparseBinding, "typeSparseBinding"),
        (.typeSparseResidency, "typeSparseResidency"),
        (.typeSparseAliased, "typeSparseAliased"),
        (.typeMutableFormat, "typeMutableFormat"),
        (.typeCubeCompatible, "typeCubeCompatible"),
        (.typeCornerSampledNV, "typeCornerSampledNV"),
        (.typeDescriptorHeapCaptureReplayEXT, "typeDescriptorHeapCaptureReplayEXT"),
        (.typeSampleLocationsCompatibleDepthEXT, "typeSampleLocationsCompatibleDepthEXT"),
        (.typeSubsampledEXT, "typeSubsampledEXT"),
        (.typeMultisampledRenderToSingleSampledEXT, "typeMultisampledRenderToSingleSampledEXT"),
        (.type2dViewCompatibleEXT, "type2dViewCompatibleEXT"),
        (.typeVideoProfileIndependentKHR, "typeVideoProfileIndependentKHR"),
        (.typeFragmentDensityMapOffsetEXT, "typeFragmentDensityMapOffsetEXT"),
        (.typeAliasSingleLayerDescriptorKHR, "typeAliasSingleLayerDescriptorKHR"),
        (.typeAlias, "typeAlias"),
        (.typeSplitInstanceBindRegions, "typeSplitInstanceBindRegions"),
        (.type2dArrayCompatible, "type2dArrayCompatible"),
        (.typeBlockTexelViewCompatible, "typeBlockTexelViewCompatible"),
        (.typeExtendedUsage, "typeExtendedUsage"),
        (.typeProtected, "typeProtected"),
        (.typeDisjoint, "typeDisjoint"),
    ]
}

public struct ImageViewCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let fragmentDensityMapDynamicEXT = ImageViewCreateFlags(rawValue: 1)
    public static let descriptorBufferCaptureReplayEXT = ImageViewCreateFlags(rawValue: 4)
    public static let fragmentDensityMapDeferredEXT = ImageViewCreateFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.fragmentDensityMapDynamicEXT, "fragmentDensityMapDynamicEXT"),
        (.descriptorBufferCaptureReplayEXT, "descriptorBufferCaptureReplayEXT"),
        (.fragmentDensityMapDeferredEXT, "fragmentDensityMapDeferredEXT"),
    ]
}

public struct PipelineCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let disableOptimization = PipelineCreateFlags(rawValue: 1)
    public static let allowDerivatives = PipelineCreateFlags(rawValue: 2)
    public static let derivative = PipelineCreateFlags(rawValue: 4)
    public static let rayTracingNoNullAnyHitShadersKHR = PipelineCreateFlags(rawValue: 16384)
    public static let rayTracingNoNullClosestHitShadersKHR = PipelineCreateFlags(rawValue: 32768)
    public static let rayTracingNoNullMissShadersKHR = PipelineCreateFlags(rawValue: 65536)
    public static let rayTracingNoNullIntersectionShadersKHR = PipelineCreateFlags(rawValue: 131072)
    public static let rayTracingSkipTrianglesKHR = PipelineCreateFlags(rawValue: 4096)
    public static let rayTracingSkipAabbsKHR = PipelineCreateFlags(rawValue: 8192)
    public static let rayTracingShaderGroupHandleCaptureReplayKHR = PipelineCreateFlags(rawValue: 524288)
    public static let deferCompileNV = PipelineCreateFlags(rawValue: 32)
    public static let renderingFragmentDensityMapAttachmentEXT = PipelineCreateFlags(rawValue: 4194304)
    public static let renderingFragmentShadingRateAttachmentKHR = PipelineCreateFlags(rawValue: 2097152)
    public static let captureStatisticsKHR = PipelineCreateFlags(rawValue: 64)
    public static let captureInternalRepresentationsKHR = PipelineCreateFlags(rawValue: 128)
    public static let indirectBindableNV = PipelineCreateFlags(rawValue: 262144)
    public static let libraryKHR = PipelineCreateFlags(rawValue: 2048)
    public static let descriptorBufferEXT = PipelineCreateFlags(rawValue: 536870912)
    public static let retainLinkTimeOptimizationInfoEXT = PipelineCreateFlags(rawValue: 8388608)
    public static let linkTimeOptimizationEXT = PipelineCreateFlags(rawValue: 1024)
    public static let rayTracingAllowMotionNV = PipelineCreateFlags(rawValue: 1048576)
    public static let colorAttachmentFeedbackLoopEXT = PipelineCreateFlags(rawValue: 33554432)
    public static let depthStencilAttachmentFeedbackLoopEXT = PipelineCreateFlags(rawValue: 67108864)
    public static let rayTracingOpacityMicromapKHR = PipelineCreateFlags(rawValue: 16777216)
    public static let dispatchBase = PipelineCreateFlags(rawValue: 16)
    public static let viewIndexFromDeviceIndex = PipelineCreateFlags(rawValue: 8)
    public static let failOnPipelineCompileRequired = PipelineCreateFlags(rawValue: 256)
    public static let earlyReturnOnFailure = PipelineCreateFlags(rawValue: 512)
    public static let noProtectedAccess = PipelineCreateFlags(rawValue: 134217728)
    public static let protectedAccessOnly = PipelineCreateFlags(rawValue: 1073741824)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.disableOptimization, "disableOptimization"),
        (.allowDerivatives, "allowDerivatives"),
        (.derivative, "derivative"),
        (.rayTracingNoNullAnyHitShadersKHR, "rayTracingNoNullAnyHitShadersKHR"),
        (.rayTracingNoNullClosestHitShadersKHR, "rayTracingNoNullClosestHitShadersKHR"),
        (.rayTracingNoNullMissShadersKHR, "rayTracingNoNullMissShadersKHR"),
        (.rayTracingNoNullIntersectionShadersKHR, "rayTracingNoNullIntersectionShadersKHR"),
        (.rayTracingSkipTrianglesKHR, "rayTracingSkipTrianglesKHR"),
        (.rayTracingSkipAabbsKHR, "rayTracingSkipAabbsKHR"),
        (.rayTracingShaderGroupHandleCaptureReplayKHR, "rayTracingShaderGroupHandleCaptureReplayKHR"),
        (.deferCompileNV, "deferCompileNV"),
        (.renderingFragmentDensityMapAttachmentEXT, "renderingFragmentDensityMapAttachmentEXT"),
        (.renderingFragmentShadingRateAttachmentKHR, "renderingFragmentShadingRateAttachmentKHR"),
        (.captureStatisticsKHR, "captureStatisticsKHR"),
        (.captureInternalRepresentationsKHR, "captureInternalRepresentationsKHR"),
        (.indirectBindableNV, "indirectBindableNV"),
        (.libraryKHR, "libraryKHR"),
        (.descriptorBufferEXT, "descriptorBufferEXT"),
        (.retainLinkTimeOptimizationInfoEXT, "retainLinkTimeOptimizationInfoEXT"),
        (.linkTimeOptimizationEXT, "linkTimeOptimizationEXT"),
        (.rayTracingAllowMotionNV, "rayTracingAllowMotionNV"),
        (.colorAttachmentFeedbackLoopEXT, "colorAttachmentFeedbackLoopEXT"),
        (.depthStencilAttachmentFeedbackLoopEXT, "depthStencilAttachmentFeedbackLoopEXT"),
        (.rayTracingOpacityMicromapKHR, "rayTracingOpacityMicromapKHR"),
        (.dispatchBase, "dispatchBase"),
        (.viewIndexFromDeviceIndex, "viewIndexFromDeviceIndex"),
        (.failOnPipelineCompileRequired, "failOnPipelineCompileRequired"),
        (.earlyReturnOnFailure, "earlyReturnOnFailure"),
        (.noProtectedAccess, "noProtectedAccess"),
        (.protectedAccessOnly, "protectedAccessOnly"),
    ]
}

public struct ColorComponentFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let r = ColorComponentFlags(rawValue: 1)
    public static let g = ColorComponentFlags(rawValue: 2)
    public static let b = ColorComponentFlags(rawValue: 4)
    public static let a = ColorComponentFlags(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.r, "r"),
        (.g, "g"),
        (.b, "b"),
        (.a, "a"),
    ]
}

public struct FenceCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let signaled = FenceCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.signaled, "signaled"),
    ]
}

public struct SemaphoreCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct FormatFeatureFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let sampledImage = FormatFeatureFlags(rawValue: 1)
    public static let storageImage = FormatFeatureFlags(rawValue: 2)
    public static let storageImageAtomic = FormatFeatureFlags(rawValue: 4)
    public static let uniformTexelBuffer = FormatFeatureFlags(rawValue: 8)
    public static let storageTexelBuffer = FormatFeatureFlags(rawValue: 16)
    public static let storageTexelBufferAtomic = FormatFeatureFlags(rawValue: 32)
    public static let vertexBuffer = FormatFeatureFlags(rawValue: 64)
    public static let colorAttachment = FormatFeatureFlags(rawValue: 128)
    public static let colorAttachmentBlend = FormatFeatureFlags(rawValue: 256)
    public static let depthStencilAttachment = FormatFeatureFlags(rawValue: 512)
    public static let blitSrc = FormatFeatureFlags(rawValue: 1024)
    public static let blitDst = FormatFeatureFlags(rawValue: 2048)
    public static let sampledImageFilterLinear = FormatFeatureFlags(rawValue: 4096)
    public static let videoDecodeOutputKHR = FormatFeatureFlags(rawValue: 33554432)
    public static let videoDecodeDpbKHR = FormatFeatureFlags(rawValue: 67108864)
    public static let accelerationStructureVertexBufferKHR = FormatFeatureFlags(rawValue: 536870912)
    public static let sampledImageFilterCubicEXT = FormatFeatureFlags(rawValue: 8192)
    public static let fragmentDensityMapEXT = FormatFeatureFlags(rawValue: 16777216)
    public static let fragmentShadingRateAttachmentKHR = FormatFeatureFlags(rawValue: 1073741824)
    public static let videoEncodeInputKHR = FormatFeatureFlags(rawValue: 134217728)
    public static let videoEncodeDpbKHR = FormatFeatureFlags(rawValue: 268435456)
    public static let transferSrc = FormatFeatureFlags(rawValue: 16384)
    public static let transferDst = FormatFeatureFlags(rawValue: 32768)
    public static let midpointChromaSamples = FormatFeatureFlags(rawValue: 131072)
    public static let sampledImageYcbcrConversionLinearFilter = FormatFeatureFlags(rawValue: 262144)
    public static let sampledImageYcbcrConversionSeparateReconstructionFilter = FormatFeatureFlags(rawValue: 524288)
    public static let sampledImageYcbcrConversionChromaReconstructionExplicit = FormatFeatureFlags(rawValue: 1048576)
    public static let sampledImageYcbcrConversionChromaReconstructionExplicitForceable = FormatFeatureFlags(rawValue: 2097152)
    public static let disjoint = FormatFeatureFlags(rawValue: 4194304)
    public static let cositedChromaSamples = FormatFeatureFlags(rawValue: 8388608)
    public static let sampledImageFilterMinmax = FormatFeatureFlags(rawValue: 65536)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.sampledImage, "sampledImage"),
        (.storageImage, "storageImage"),
        (.storageImageAtomic, "storageImageAtomic"),
        (.uniformTexelBuffer, "uniformTexelBuffer"),
        (.storageTexelBuffer, "storageTexelBuffer"),
        (.storageTexelBufferAtomic, "storageTexelBufferAtomic"),
        (.vertexBuffer, "vertexBuffer"),
        (.colorAttachment, "colorAttachment"),
        (.colorAttachmentBlend, "colorAttachmentBlend"),
        (.depthStencilAttachment, "depthStencilAttachment"),
        (.blitSrc, "blitSrc"),
        (.blitDst, "blitDst"),
        (.sampledImageFilterLinear, "sampledImageFilterLinear"),
        (.videoDecodeOutputKHR, "videoDecodeOutputKHR"),
        (.videoDecodeDpbKHR, "videoDecodeDpbKHR"),
        (.accelerationStructureVertexBufferKHR, "accelerationStructureVertexBufferKHR"),
        (.sampledImageFilterCubicEXT, "sampledImageFilterCubicEXT"),
        (.fragmentDensityMapEXT, "fragmentDensityMapEXT"),
        (.fragmentShadingRateAttachmentKHR, "fragmentShadingRateAttachmentKHR"),
        (.videoEncodeInputKHR, "videoEncodeInputKHR"),
        (.videoEncodeDpbKHR, "videoEncodeDpbKHR"),
        (.transferSrc, "transferSrc"),
        (.transferDst, "transferDst"),
        (.midpointChromaSamples, "midpointChromaSamples"),
        (.sampledImageYcbcrConversionLinearFilter, "sampledImageYcbcrConversionLinearFilter"),
        (.sampledImageYcbcrConversionSeparateReconstructionFilter, "sampledImageYcbcrConversionSeparateReconstructionFilter"),
        (.sampledImageYcbcrConversionChromaReconstructionExplicit, "sampledImageYcbcrConversionChromaReconstructionExplicit"),
        (.sampledImageYcbcrConversionChromaReconstructionExplicitForceable, "sampledImageYcbcrConversionChromaReconstructionExplicitForceable"),
        (.disjoint, "disjoint"),
        (.cositedChromaSamples, "cositedChromaSamples"),
        (.sampledImageFilterMinmax, "sampledImageFilterMinmax"),
    ]
}

public struct QueryControlFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let precise = QueryControlFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.precise, "precise"),
    ]
}

public struct QueryResultFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let type64 = QueryResultFlags(rawValue: 1)
    public static let typeWait = QueryResultFlags(rawValue: 2)
    public static let typeWithAvailability = QueryResultFlags(rawValue: 4)
    public static let typePartial = QueryResultFlags(rawValue: 8)
    public static let typeWithStatusKHR = QueryResultFlags(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.type64, "type64"),
        (.typeWait, "typeWait"),
        (.typeWithAvailability, "typeWithAvailability"),
        (.typePartial, "typePartial"),
        (.typeWithStatusKHR, "typeWithStatusKHR"),
    ]
}

public struct ShaderModuleCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct EventCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceOnly = EventCreateFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceOnly, "deviceOnly"),
    ]
}

public struct CommandPoolCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let transient = CommandPoolCreateFlags(rawValue: 1)
    public static let resetCommandBuffer = CommandPoolCreateFlags(rawValue: 2)
    public static let protected = CommandPoolCreateFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.transient, "transient"),
        (.resetCommandBuffer, "resetCommandBuffer"),
        (.protected, "protected"),
    ]
}

public struct CommandPoolResetFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let releaseResources = CommandPoolResetFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.releaseResources, "releaseResources"),
    ]
}

public struct CommandBufferResetFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let releaseResources = CommandBufferResetFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.releaseResources, "releaseResources"),
    ]
}

public struct CommandBufferUsageFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let oneTimeSubmit = CommandBufferUsageFlags(rawValue: 1)
    public static let renderPassContinue = CommandBufferUsageFlags(rawValue: 2)
    public static let simultaneousUse = CommandBufferUsageFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.oneTimeSubmit, "oneTimeSubmit"),
        (.renderPassContinue, "renderPassContinue"),
        (.simultaneousUse, "simultaneousUse"),
    ]
}

public struct QueryPipelineStatisticFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let inputAssemblyVertices = QueryPipelineStatisticFlags(rawValue: 1)
    public static let inputAssemblyPrimitives = QueryPipelineStatisticFlags(rawValue: 2)
    public static let vertexShaderInvocations = QueryPipelineStatisticFlags(rawValue: 4)
    public static let geometryShaderInvocations = QueryPipelineStatisticFlags(rawValue: 8)
    public static let geometryShaderPrimitives = QueryPipelineStatisticFlags(rawValue: 16)
    public static let clippingInvocations = QueryPipelineStatisticFlags(rawValue: 32)
    public static let clippingPrimitives = QueryPipelineStatisticFlags(rawValue: 64)
    public static let fragmentShaderInvocations = QueryPipelineStatisticFlags(rawValue: 128)
    public static let tessellationControlShaderPatches = QueryPipelineStatisticFlags(rawValue: 256)
    public static let tessellationEvaluationShaderInvocations = QueryPipelineStatisticFlags(rawValue: 512)
    public static let computeShaderInvocations = QueryPipelineStatisticFlags(rawValue: 1024)
    public static let taskShaderInvocationsEXT = QueryPipelineStatisticFlags(rawValue: 2048)
    public static let meshShaderInvocationsEXT = QueryPipelineStatisticFlags(rawValue: 4096)
    public static let clusterCullingShaderInvocationsHUAWEI = QueryPipelineStatisticFlags(rawValue: 8192)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.inputAssemblyVertices, "inputAssemblyVertices"),
        (.inputAssemblyPrimitives, "inputAssemblyPrimitives"),
        (.vertexShaderInvocations, "vertexShaderInvocations"),
        (.geometryShaderInvocations, "geometryShaderInvocations"),
        (.geometryShaderPrimitives, "geometryShaderPrimitives"),
        (.clippingInvocations, "clippingInvocations"),
        (.clippingPrimitives, "clippingPrimitives"),
        (.fragmentShaderInvocations, "fragmentShaderInvocations"),
        (.tessellationControlShaderPatches, "tessellationControlShaderPatches"),
        (.tessellationEvaluationShaderInvocations, "tessellationEvaluationShaderInvocations"),
        (.computeShaderInvocations, "computeShaderInvocations"),
        (.taskShaderInvocationsEXT, "taskShaderInvocationsEXT"),
        (.meshShaderInvocationsEXT, "meshShaderInvocationsEXT"),
        (.clusterCullingShaderInvocationsHUAWEI, "clusterCullingShaderInvocationsHUAWEI"),
    ]
}

public struct MemoryMapFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let placedEXT = MemoryMapFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.placedEXT, "placedEXT"),
    ]
}

public struct MemoryUnmapFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let reserveEXT = MemoryUnmapFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.reserveEXT, "reserveEXT"),
    ]
}

public struct ImageAspectFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let color = ImageAspectFlags(rawValue: 1)
    public static let depth = ImageAspectFlags(rawValue: 2)
    public static let stencil = ImageAspectFlags(rawValue: 4)
    public static let metadata = ImageAspectFlags(rawValue: 8)
    public static let memoryPlane0EXT = ImageAspectFlags(rawValue: 128)
    public static let memoryPlane1EXT = ImageAspectFlags(rawValue: 256)
    public static let memoryPlane2EXT = ImageAspectFlags(rawValue: 512)
    public static let memoryPlane3EXT = ImageAspectFlags(rawValue: 1024)
    public static let plane0 = ImageAspectFlags(rawValue: 16)
    public static let plane1 = ImageAspectFlags(rawValue: 32)
    public static let plane2 = ImageAspectFlags(rawValue: 64)
    public static let none: ImageAspectFlags  = []

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.color, "color"),
        (.depth, "depth"),
        (.stencil, "stencil"),
        (.metadata, "metadata"),
        (.memoryPlane0EXT, "memoryPlane0EXT"),
        (.memoryPlane1EXT, "memoryPlane1EXT"),
        (.memoryPlane2EXT, "memoryPlane2EXT"),
        (.memoryPlane3EXT, "memoryPlane3EXT"),
        (.plane0, "plane0"),
        (.plane1, "plane1"),
        (.plane2, "plane2"),
        (.none, "none"),
    ]
}

public struct SparseMemoryBindFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let metadata = SparseMemoryBindFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.metadata, "metadata"),
    ]
}

public struct SparseImageFormatFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let singleMiptail = SparseImageFormatFlags(rawValue: 1)
    public static let alignedMipSize = SparseImageFormatFlags(rawValue: 2)
    public static let nonstandardBlockSize = SparseImageFormatFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.singleMiptail, "singleMiptail"),
        (.alignedMipSize, "alignedMipSize"),
        (.nonstandardBlockSize, "nonstandardBlockSize"),
    ]
}

public struct SubpassDescriptionFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let perViewAttributesNVX = SubpassDescriptionFlags(rawValue: 1)
    public static let perViewPositionXOnlyNVX = SubpassDescriptionFlags(rawValue: 2)
    public static let tileShadingApronQCOM = SubpassDescriptionFlags(rawValue: 256)
    public static let rasterizationOrderAttachmentColorAccessEXT = SubpassDescriptionFlags(rawValue: 16)
    public static let rasterizationOrderAttachmentDepthAccessEXT = SubpassDescriptionFlags(rawValue: 32)
    public static let rasterizationOrderAttachmentStencilAccessEXT = SubpassDescriptionFlags(rawValue: 64)
    public static let enableLegacyDitheringEXT = SubpassDescriptionFlags(rawValue: 128)
    public static let fragmentRegionEXT = SubpassDescriptionFlags(rawValue: 4)
    public static let customResolveEXT = SubpassDescriptionFlags(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.perViewAttributesNVX, "perViewAttributesNVX"),
        (.perViewPositionXOnlyNVX, "perViewPositionXOnlyNVX"),
        (.tileShadingApronQCOM, "tileShadingApronQCOM"),
        (.rasterizationOrderAttachmentColorAccessEXT, "rasterizationOrderAttachmentColorAccessEXT"),
        (.rasterizationOrderAttachmentDepthAccessEXT, "rasterizationOrderAttachmentDepthAccessEXT"),
        (.rasterizationOrderAttachmentStencilAccessEXT, "rasterizationOrderAttachmentStencilAccessEXT"),
        (.enableLegacyDitheringEXT, "enableLegacyDitheringEXT"),
        (.fragmentRegionEXT, "fragmentRegionEXT"),
        (.customResolveEXT, "customResolveEXT"),
    ]
}

public struct PipelineStageFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let topOfPipe = PipelineStageFlags(rawValue: 1)
    public static let drawIndirect = PipelineStageFlags(rawValue: 2)
    public static let vertexInput = PipelineStageFlags(rawValue: 4)
    public static let vertexShader = PipelineStageFlags(rawValue: 8)
    public static let tessellationControlShader = PipelineStageFlags(rawValue: 16)
    public static let tessellationEvaluationShader = PipelineStageFlags(rawValue: 32)
    public static let geometryShader = PipelineStageFlags(rawValue: 64)
    public static let fragmentShader = PipelineStageFlags(rawValue: 128)
    public static let earlyFragmentTests = PipelineStageFlags(rawValue: 256)
    public static let lateFragmentTests = PipelineStageFlags(rawValue: 512)
    public static let colorAttachmentOutput = PipelineStageFlags(rawValue: 1024)
    public static let computeShader = PipelineStageFlags(rawValue: 2048)
    public static let transfer = PipelineStageFlags(rawValue: 4096)
    public static let bottomOfPipe = PipelineStageFlags(rawValue: 8192)
    public static let host = PipelineStageFlags(rawValue: 16384)
    public static let allGraphics = PipelineStageFlags(rawValue: 32768)
    public static let allCommands = PipelineStageFlags(rawValue: 65536)
    public static let transformFeedbackEXT = PipelineStageFlags(rawValue: 16777216)
    public static let conditionalRenderingEXT = PipelineStageFlags(rawValue: 262144)
    public static let accelerationStructureBuildKHR = PipelineStageFlags(rawValue: 33554432)
    public static let rayTracingShaderKHR = PipelineStageFlags(rawValue: 2097152)
    public static let fragmentDensityProcessEXT = PipelineStageFlags(rawValue: 8388608)
    public static let fragmentShadingRateAttachmentKHR = PipelineStageFlags(rawValue: 4194304)
    public static let taskShaderEXT = PipelineStageFlags(rawValue: 524288)
    public static let meshShaderEXT = PipelineStageFlags(rawValue: 1048576)
    public static let commandPreprocessEXT = PipelineStageFlags(rawValue: 131072)
    public static let none: PipelineStageFlags  = []

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.topOfPipe, "topOfPipe"),
        (.drawIndirect, "drawIndirect"),
        (.vertexInput, "vertexInput"),
        (.vertexShader, "vertexShader"),
        (.tessellationControlShader, "tessellationControlShader"),
        (.tessellationEvaluationShader, "tessellationEvaluationShader"),
        (.geometryShader, "geometryShader"),
        (.fragmentShader, "fragmentShader"),
        (.earlyFragmentTests, "earlyFragmentTests"),
        (.lateFragmentTests, "lateFragmentTests"),
        (.colorAttachmentOutput, "colorAttachmentOutput"),
        (.computeShader, "computeShader"),
        (.transfer, "transfer"),
        (.bottomOfPipe, "bottomOfPipe"),
        (.host, "host"),
        (.allGraphics, "allGraphics"),
        (.allCommands, "allCommands"),
        (.transformFeedbackEXT, "transformFeedbackEXT"),
        (.conditionalRenderingEXT, "conditionalRenderingEXT"),
        (.accelerationStructureBuildKHR, "accelerationStructureBuildKHR"),
        (.rayTracingShaderKHR, "rayTracingShaderKHR"),
        (.fragmentDensityProcessEXT, "fragmentDensityProcessEXT"),
        (.fragmentShadingRateAttachmentKHR, "fragmentShadingRateAttachmentKHR"),
        (.taskShaderEXT, "taskShaderEXT"),
        (.meshShaderEXT, "meshShaderEXT"),
        (.commandPreprocessEXT, "commandPreprocessEXT"),
        (.none, "none"),
    ]
}

public struct SampleCountFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let type1 = SampleCountFlags(rawValue: 1)
    public static let type2 = SampleCountFlags(rawValue: 2)
    public static let type4 = SampleCountFlags(rawValue: 4)
    public static let type8 = SampleCountFlags(rawValue: 8)
    public static let type16 = SampleCountFlags(rawValue: 16)
    public static let type32 = SampleCountFlags(rawValue: 32)
    public static let type64 = SampleCountFlags(rawValue: 64)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.type1, "type1"),
        (.type2, "type2"),
        (.type4, "type4"),
        (.type8, "type8"),
        (.type16, "type16"),
        (.type32, "type32"),
        (.type64, "type64"),
    ]
}

public struct AttachmentDescriptionFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let mayAlias = AttachmentDescriptionFlags(rawValue: 1)
    public static let resolveSkipTransferFunctionKHR = AttachmentDescriptionFlags(rawValue: 2)
    public static let resolveEnableTransferFunctionKHR = AttachmentDescriptionFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.mayAlias, "mayAlias"),
        (.resolveSkipTransferFunctionKHR, "resolveSkipTransferFunctionKHR"),
        (.resolveEnableTransferFunctionKHR, "resolveEnableTransferFunctionKHR"),
    ]
}

public struct StencilFaceFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let front = StencilFaceFlags(rawValue: 1)
    public static let back = StencilFaceFlags(rawValue: 2)
    public static let frontAndBack = StencilFaceFlags(rawValue: 0x00000003)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.front, "front"),
        (.back, "back"),
        (.frontAndBack, "frontAndBack"),
    ]
}

public struct CullModeFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let none: CullModeFlags  = []
    public static let front = CullModeFlags(rawValue: 1)
    public static let back = CullModeFlags(rawValue: 2)
    public static let frontAndBack = CullModeFlags(rawValue: 0x00000003)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.front, "front"),
        (.back, "back"),
        (.frontAndBack, "frontAndBack"),
    ]
}

public struct DescriptorPoolCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let freeDescriptorSet = DescriptorPoolCreateFlags(rawValue: 1)
    public static let hostOnlyEXT = DescriptorPoolCreateFlags(rawValue: 4)
    public static let allowOverallocationSetsNV = DescriptorPoolCreateFlags(rawValue: 8)
    public static let allowOverallocationPoolsNV = DescriptorPoolCreateFlags(rawValue: 16)
    public static let updateAfterBind = DescriptorPoolCreateFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.freeDescriptorSet, "freeDescriptorSet"),
        (.hostOnlyEXT, "hostOnlyEXT"),
        (.allowOverallocationSetsNV, "allowOverallocationSetsNV"),
        (.allowOverallocationPoolsNV, "allowOverallocationPoolsNV"),
        (.updateAfterBind, "updateAfterBind"),
    ]
}

public struct DescriptorPoolResetFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DependencyFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let byRegion = DependencyFlags(rawValue: 1)
    public static let feedbackLoopEXT = DependencyFlags(rawValue: 8)
    public static let queueFamilyOwnershipTransferUseAllStagesKHR = DependencyFlags(rawValue: 32)
    public static let asymmetricEventKHR = DependencyFlags(rawValue: 64)
    public static let deviceGroup = DependencyFlags(rawValue: 4)
    public static let viewLocal = DependencyFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.byRegion, "byRegion"),
        (.feedbackLoopEXT, "feedbackLoopEXT"),
        (.queueFamilyOwnershipTransferUseAllStagesKHR, "queueFamilyOwnershipTransferUseAllStagesKHR"),
        (.asymmetricEventKHR, "asymmetricEventKHR"),
        (.deviceGroup, "deviceGroup"),
        (.viewLocal, "viewLocal"),
    ]
}

public struct SubgroupFeatureFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let basic = SubgroupFeatureFlags(rawValue: 1)
    public static let vote = SubgroupFeatureFlags(rawValue: 2)
    public static let arithmetic = SubgroupFeatureFlags(rawValue: 4)
    public static let ballot = SubgroupFeatureFlags(rawValue: 8)
    public static let shuffle = SubgroupFeatureFlags(rawValue: 16)
    public static let shuffleRelative = SubgroupFeatureFlags(rawValue: 32)
    public static let clustered = SubgroupFeatureFlags(rawValue: 64)
    public static let quad = SubgroupFeatureFlags(rawValue: 128)
    public static let partitionedEXT = SubgroupFeatureFlags(rawValue: 256)
    public static let rotate = SubgroupFeatureFlags(rawValue: 512)
    public static let rotateClustered = SubgroupFeatureFlags(rawValue: 1024)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.basic, "basic"),
        (.vote, "vote"),
        (.arithmetic, "arithmetic"),
        (.ballot, "ballot"),
        (.shuffle, "shuffle"),
        (.shuffleRelative, "shuffleRelative"),
        (.clustered, "clustered"),
        (.quad, "quad"),
        (.partitionedEXT, "partitionedEXT"),
        (.rotate, "rotate"),
        (.rotateClustered, "rotateClustered"),
    ]
}

public struct IndirectCommandsLayoutUsageFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let explicitPreprocess = IndirectCommandsLayoutUsageFlagsNV(rawValue: 1)
    public static let indexedSequences = IndirectCommandsLayoutUsageFlagsNV(rawValue: 2)
    public static let unorderedSequences = IndirectCommandsLayoutUsageFlagsNV(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.explicitPreprocess, "explicitPreprocess"),
        (.indexedSequences, "indexedSequences"),
        (.unorderedSequences, "unorderedSequences"),
    ]
}

public struct IndirectStateFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let flagFrontface = IndirectStateFlagsNV(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.flagFrontface, "flagFrontface"),
    ]
}

public struct GeometryFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaque = GeometryFlagsKHR(rawValue: 1)
    public static let noDuplicateAnyHitInvocation = GeometryFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaque, "opaque"),
        (.noDuplicateAnyHitInvocation, "noDuplicateAnyHitInvocation"),
    ]
}

public struct GeometryInstanceFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let triangleFacingCullDisable = GeometryInstanceFlagsKHR(rawValue: 1)
    public static let triangleFlipFacing = GeometryInstanceFlagsKHR(rawValue: 2)
    public static let forceOpaque = GeometryInstanceFlagsKHR(rawValue: 4)
    public static let forceNoOpaque = GeometryInstanceFlagsKHR(rawValue: 8)
    public static let forceOpacityMicromap2State = GeometryInstanceFlagsKHR(rawValue: 16)
    public static let disableOpacityMicromaps = GeometryInstanceFlagsKHR(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.triangleFacingCullDisable, "triangleFacingCullDisable"),
        (.triangleFlipFacing, "triangleFlipFacing"),
        (.forceOpaque, "forceOpaque"),
        (.forceNoOpaque, "forceNoOpaque"),
        (.forceOpacityMicromap2State, "forceOpacityMicromap2State"),
        (.disableOpacityMicromaps, "disableOpacityMicromaps"),
    ]
}

public struct ClusterAccelerationStructureGeometryFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let cullDisable = ClusterAccelerationStructureGeometryFlagsNV(rawValue: 1)
    public static let noDuplicateAnyhitInvocation = ClusterAccelerationStructureGeometryFlagsNV(rawValue: 2)
    public static let opaque = ClusterAccelerationStructureGeometryFlagsNV(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.cullDisable, "cullDisable"),
        (.noDuplicateAnyhitInvocation, "noDuplicateAnyhitInvocation"),
        (.opaque, "opaque"),
    ]
}

public struct ClusterAccelerationStructureClusterFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let allowDisableOpacityMicromaps = ClusterAccelerationStructureClusterFlagsNV(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.allowDisableOpacityMicromaps, "allowDisableOpacityMicromaps"),
    ]
}

public struct ClusterAccelerationStructureAddressResolutionFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let none: ClusterAccelerationStructureAddressResolutionFlagsNV  = []
    public static let indirectedDstImplicitData = ClusterAccelerationStructureAddressResolutionFlagsNV(rawValue: 1)
    public static let indirectedScratchData = ClusterAccelerationStructureAddressResolutionFlagsNV(rawValue: 2)
    public static let indirectedDstAddressArray = ClusterAccelerationStructureAddressResolutionFlagsNV(rawValue: 4)
    public static let indirectedDstSizesArray = ClusterAccelerationStructureAddressResolutionFlagsNV(rawValue: 8)
    public static let indirectedSrcInfosArray = ClusterAccelerationStructureAddressResolutionFlagsNV(rawValue: 16)
    public static let indirectedSrcInfosCount = ClusterAccelerationStructureAddressResolutionFlagsNV(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.indirectedDstImplicitData, "indirectedDstImplicitData"),
        (.indirectedScratchData, "indirectedScratchData"),
        (.indirectedDstAddressArray, "indirectedDstAddressArray"),
        (.indirectedDstSizesArray, "indirectedDstSizesArray"),
        (.indirectedSrcInfosArray, "indirectedSrcInfosArray"),
        (.indirectedSrcInfosCount, "indirectedSrcInfosCount"),
    ]
}

public struct BuildAccelerationStructureFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let allowUpdate = BuildAccelerationStructureFlagsKHR(rawValue: 1)
    public static let allowCompaction = BuildAccelerationStructureFlagsKHR(rawValue: 2)
    public static let preferFastTrace = BuildAccelerationStructureFlagsKHR(rawValue: 4)
    public static let preferFastBuild = BuildAccelerationStructureFlagsKHR(rawValue: 8)
    public static let lowMemory = BuildAccelerationStructureFlagsKHR(rawValue: 16)
    public static let motionNV = BuildAccelerationStructureFlagsKHR(rawValue: 32)
    public static let allowOpacityMicromapDataUpdateEXT = BuildAccelerationStructureFlagsKHR(rawValue: 256)
    public static let allowDataAccess = BuildAccelerationStructureFlagsKHR(rawValue: 2048)
    public static let allowClusterOpacityMicromapsNV = BuildAccelerationStructureFlagsKHR(rawValue: 4096)
    public static let allowOpacityMicromapUpdate = BuildAccelerationStructureFlagsKHR(rawValue: 64)
    public static let allowDisableOpacityMicromaps = BuildAccelerationStructureFlagsKHR(rawValue: 128)
    public static let micromapLossy = BuildAccelerationStructureFlagsKHR(rawValue: 1024)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.allowUpdate, "allowUpdate"),
        (.allowCompaction, "allowCompaction"),
        (.preferFastTrace, "preferFastTrace"),
        (.preferFastBuild, "preferFastBuild"),
        (.lowMemory, "lowMemory"),
        (.motionNV, "motionNV"),
        (.allowOpacityMicromapDataUpdateEXT, "allowOpacityMicromapDataUpdateEXT"),
        (.allowDataAccess, "allowDataAccess"),
        (.allowClusterOpacityMicromapsNV, "allowClusterOpacityMicromapsNV"),
        (.allowOpacityMicromapUpdate, "allowOpacityMicromapUpdate"),
        (.allowDisableOpacityMicromaps, "allowDisableOpacityMicromaps"),
        (.micromapLossy, "micromapLossy"),
    ]
}

public struct PrivateDataSlotCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct AccelerationStructureCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceAddressCaptureReplay = AccelerationStructureCreateFlagsKHR(rawValue: 1)
    public static let descriptorBufferCaptureReplayEXT = AccelerationStructureCreateFlagsKHR(rawValue: 8)
    public static let motionNV = AccelerationStructureCreateFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceAddressCaptureReplay, "deviceAddressCaptureReplay"),
        (.descriptorBufferCaptureReplayEXT, "descriptorBufferCaptureReplayEXT"),
        (.motionNV, "motionNV"),
    ]
}

public struct DescriptorUpdateTemplateCreateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineCreationFeedbackFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let valid = PipelineCreationFeedbackFlags(rawValue: 1)
    public static let applicationPipelineCacheHit = PipelineCreationFeedbackFlags(rawValue: 2)
    public static let basePipelineAcceleration = PipelineCreationFeedbackFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.valid, "valid"),
        (.applicationPipelineCacheHit, "applicationPipelineCacheHit"),
        (.basePipelineAcceleration, "basePipelineAcceleration"),
    ]
}

public struct PerformanceCounterDescriptionFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let performanceImpacting = PerformanceCounterDescriptionFlagsKHR(rawValue: 1)
    public static let concurrentlyImpacted = PerformanceCounterDescriptionFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.performanceImpacting, "performanceImpacting"),
        (.concurrentlyImpacted, "concurrentlyImpacted"),
    ]
}

public struct AcquireProfilingLockFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct SemaphoreWaitFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let any = SemaphoreWaitFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.any, "any"),
    ]
}

public struct PipelineCompilerControlFlagsAMD: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct ShaderCorePropertiesFlagsAMD: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DeviceDiagnosticsConfigFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let enableShaderDebugInfo = DeviceDiagnosticsConfigFlagsNV(rawValue: 1)
    public static let enableResourceTracking = DeviceDiagnosticsConfigFlagsNV(rawValue: 2)
    public static let enableAutomaticCheckpoints = DeviceDiagnosticsConfigFlagsNV(rawValue: 4)
    public static let enableShaderErrorReporting = DeviceDiagnosticsConfigFlagsNV(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.enableShaderDebugInfo, "enableShaderDebugInfo"),
        (.enableResourceTracking, "enableResourceTracking"),
        (.enableAutomaticCheckpoints, "enableAutomaticCheckpoints"),
        (.enableShaderErrorReporting, "enableShaderErrorReporting"),
    ]
}

public struct AccessFlags2: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let none: AccessFlags2  = []
    public static let indirectCommandRead = AccessFlags2(rawValue: 1)
    public static let indexRead = AccessFlags2(rawValue: 2)
    public static let vertexAttributeRead = AccessFlags2(rawValue: 4)
    public static let uniformRead = AccessFlags2(rawValue: 8)
    public static let inputAttachmentRead = AccessFlags2(rawValue: 16)
    public static let shaderRead = AccessFlags2(rawValue: 32)
    public static let shaderWrite = AccessFlags2(rawValue: 64)
    public static let colorAttachmentRead = AccessFlags2(rawValue: 128)
    public static let colorAttachmentWrite = AccessFlags2(rawValue: 256)
    public static let depthStencilAttachmentRead = AccessFlags2(rawValue: 512)
    public static let depthStencilAttachmentWrite = AccessFlags2(rawValue: 1024)
    public static let transferRead = AccessFlags2(rawValue: 2048)
    public static let transferWrite = AccessFlags2(rawValue: 4096)
    public static let hostRead = AccessFlags2(rawValue: 8192)
    public static let hostWrite = AccessFlags2(rawValue: 16384)
    public static let memoryRead = AccessFlags2(rawValue: 32768)
    public static let memoryWrite = AccessFlags2(rawValue: 65536)
    public static let shaderSampledRead = AccessFlags2(rawValue: 4294967296)
    public static let shaderStorageRead = AccessFlags2(rawValue: 8589934592)
    public static let shaderStorageWrite = AccessFlags2(rawValue: 17179869184)
    public static let videoDecodeReadKHR = AccessFlags2(rawValue: 34359738368)
    public static let videoDecodeWriteKHR = AccessFlags2(rawValue: 68719476736)
    public static let samplerHeapReadEXT = AccessFlags2(rawValue: 144115188075855872)
    public static let resourceHeapReadEXT = AccessFlags2(rawValue: 288230376151711744)
    public static let videoEncodeReadKHR = AccessFlags2(rawValue: 137438953472)
    public static let videoEncodeWriteKHR = AccessFlags2(rawValue: 274877906944)
    public static let shaderTileAttachmentReadQCOM = AccessFlags2(rawValue: 2251799813685248)
    public static let shaderTileAttachmentWriteQCOM = AccessFlags2(rawValue: 4503599627370496)
    public static let transformFeedbackWriteEXT = AccessFlags2(rawValue: 33554432)
    public static let transformFeedbackCounterReadEXT = AccessFlags2(rawValue: 67108864)
    public static let transformFeedbackCounterWriteEXT = AccessFlags2(rawValue: 134217728)
    public static let conditionalRenderingReadEXT = AccessFlags2(rawValue: 1048576)
    public static let commandPreprocessReadEXT = AccessFlags2(rawValue: 131072)
    public static let commandPreprocessWriteEXT = AccessFlags2(rawValue: 262144)
    public static let fragmentShadingRateAttachmentReadKHR = AccessFlags2(rawValue: 8388608)
    public static let accelerationStructureReadKHR = AccessFlags2(rawValue: 2097152)
    public static let accelerationStructureWriteKHR = AccessFlags2(rawValue: 4194304)
    public static let fragmentDensityMapReadEXT = AccessFlags2(rawValue: 16777216)
    public static let colorAttachmentReadNoncoherentEXT = AccessFlags2(rawValue: 524288)
    public static let descriptorBufferReadEXT = AccessFlags2(rawValue: 2199023255552)
    public static let invocationMaskReadHUAWEI = AccessFlags2(rawValue: 549755813888)
    public static let shaderBindingTableReadKHR = AccessFlags2(rawValue: 1099511627776)
    public static let micromapReadEXT = AccessFlags2(rawValue: 17592186044416)
    public static let micromapWriteEXT = AccessFlags2(rawValue: 35184372088832)
    public static let opticalFlowReadNV = AccessFlags2(rawValue: 4398046511104)
    public static let opticalFlowWriteNV = AccessFlags2(rawValue: 8796093022208)
    public static let dataGraphReadARM = AccessFlags2(rawValue: 140737488355328)
    public static let dataGraphWriteARM = AccessFlags2(rawValue: 281474976710656)
    public static let memoryDecompressionReadEXT = AccessFlags2(rawValue: 36028797018963968)
    public static let memoryDecompressionWriteEXT = AccessFlags2(rawValue: 72057594037927936)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.indirectCommandRead, "indirectCommandRead"),
        (.indexRead, "indexRead"),
        (.vertexAttributeRead, "vertexAttributeRead"),
        (.uniformRead, "uniformRead"),
        (.inputAttachmentRead, "inputAttachmentRead"),
        (.shaderRead, "shaderRead"),
        (.shaderWrite, "shaderWrite"),
        (.colorAttachmentRead, "colorAttachmentRead"),
        (.colorAttachmentWrite, "colorAttachmentWrite"),
        (.depthStencilAttachmentRead, "depthStencilAttachmentRead"),
        (.depthStencilAttachmentWrite, "depthStencilAttachmentWrite"),
        (.transferRead, "transferRead"),
        (.transferWrite, "transferWrite"),
        (.hostRead, "hostRead"),
        (.hostWrite, "hostWrite"),
        (.memoryRead, "memoryRead"),
        (.memoryWrite, "memoryWrite"),
        (.shaderSampledRead, "shaderSampledRead"),
        (.shaderStorageRead, "shaderStorageRead"),
        (.shaderStorageWrite, "shaderStorageWrite"),
        (.videoDecodeReadKHR, "videoDecodeReadKHR"),
        (.videoDecodeWriteKHR, "videoDecodeWriteKHR"),
        (.samplerHeapReadEXT, "samplerHeapReadEXT"),
        (.resourceHeapReadEXT, "resourceHeapReadEXT"),
        (.videoEncodeReadKHR, "videoEncodeReadKHR"),
        (.videoEncodeWriteKHR, "videoEncodeWriteKHR"),
        (.shaderTileAttachmentReadQCOM, "shaderTileAttachmentReadQCOM"),
        (.shaderTileAttachmentWriteQCOM, "shaderTileAttachmentWriteQCOM"),
        (.transformFeedbackWriteEXT, "transformFeedbackWriteEXT"),
        (.transformFeedbackCounterReadEXT, "transformFeedbackCounterReadEXT"),
        (.transformFeedbackCounterWriteEXT, "transformFeedbackCounterWriteEXT"),
        (.conditionalRenderingReadEXT, "conditionalRenderingReadEXT"),
        (.commandPreprocessReadEXT, "commandPreprocessReadEXT"),
        (.commandPreprocessWriteEXT, "commandPreprocessWriteEXT"),
        (.fragmentShadingRateAttachmentReadKHR, "fragmentShadingRateAttachmentReadKHR"),
        (.accelerationStructureReadKHR, "accelerationStructureReadKHR"),
        (.accelerationStructureWriteKHR, "accelerationStructureWriteKHR"),
        (.fragmentDensityMapReadEXT, "fragmentDensityMapReadEXT"),
        (.colorAttachmentReadNoncoherentEXT, "colorAttachmentReadNoncoherentEXT"),
        (.descriptorBufferReadEXT, "descriptorBufferReadEXT"),
        (.invocationMaskReadHUAWEI, "invocationMaskReadHUAWEI"),
        (.shaderBindingTableReadKHR, "shaderBindingTableReadKHR"),
        (.micromapReadEXT, "micromapReadEXT"),
        (.micromapWriteEXT, "micromapWriteEXT"),
        (.opticalFlowReadNV, "opticalFlowReadNV"),
        (.opticalFlowWriteNV, "opticalFlowWriteNV"),
        (.dataGraphReadARM, "dataGraphReadARM"),
        (.dataGraphWriteARM, "dataGraphWriteARM"),
        (.memoryDecompressionReadEXT, "memoryDecompressionReadEXT"),
        (.memoryDecompressionWriteEXT, "memoryDecompressionWriteEXT"),
    ]
}

public struct PipelineStageFlags2: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let none: PipelineStageFlags2  = []
    public static let topOfPipe = PipelineStageFlags2(rawValue: 1)
    public static let drawIndirect = PipelineStageFlags2(rawValue: 2)
    public static let vertexInput = PipelineStageFlags2(rawValue: 4)
    public static let vertexShader = PipelineStageFlags2(rawValue: 8)
    public static let tessellationControlShader = PipelineStageFlags2(rawValue: 16)
    public static let tessellationEvaluationShader = PipelineStageFlags2(rawValue: 32)
    public static let geometryShader = PipelineStageFlags2(rawValue: 64)
    public static let fragmentShader = PipelineStageFlags2(rawValue: 128)
    public static let earlyFragmentTests = PipelineStageFlags2(rawValue: 256)
    public static let lateFragmentTests = PipelineStageFlags2(rawValue: 512)
    public static let colorAttachmentOutput = PipelineStageFlags2(rawValue: 1024)
    public static let computeShader = PipelineStageFlags2(rawValue: 2048)
    public static let allTransfer = PipelineStageFlags2(rawValue: 4096)
    public static let bottomOfPipe = PipelineStageFlags2(rawValue: 8192)
    public static let host = PipelineStageFlags2(rawValue: 16384)
    public static let allGraphics = PipelineStageFlags2(rawValue: 32768)
    public static let allCommands = PipelineStageFlags2(rawValue: 65536)
    public static let copy = PipelineStageFlags2(rawValue: 4294967296)
    public static let resolve = PipelineStageFlags2(rawValue: 8589934592)
    public static let blit = PipelineStageFlags2(rawValue: 17179869184)
    public static let clear = PipelineStageFlags2(rawValue: 34359738368)
    public static let indexInput = PipelineStageFlags2(rawValue: 68719476736)
    public static let vertexAttributeInput = PipelineStageFlags2(rawValue: 137438953472)
    public static let preRasterizationShaders = PipelineStageFlags2(rawValue: 274877906944)
    public static let videoDecodeKHR = PipelineStageFlags2(rawValue: 67108864)
    public static let videoEncodeKHR = PipelineStageFlags2(rawValue: 134217728)
    public static let transformFeedbackEXT = PipelineStageFlags2(rawValue: 16777216)
    public static let conditionalRenderingEXT = PipelineStageFlags2(rawValue: 262144)
    public static let commandPreprocessEXT = PipelineStageFlags2(rawValue: 131072)
    public static let fragmentShadingRateAttachmentKHR = PipelineStageFlags2(rawValue: 4194304)
    public static let accelerationStructureBuildKHR = PipelineStageFlags2(rawValue: 33554432)
    public static let rayTracingShaderKHR = PipelineStageFlags2(rawValue: 2097152)
    public static let fragmentDensityProcessEXT = PipelineStageFlags2(rawValue: 8388608)
    public static let taskShaderEXT = PipelineStageFlags2(rawValue: 524288)
    public static let meshShaderEXT = PipelineStageFlags2(rawValue: 1048576)
    public static let subpassShaderHUAWEI = PipelineStageFlags2(rawValue: 549755813888)
    public static let invocationMaskHUAWEI = PipelineStageFlags2(rawValue: 1099511627776)
    public static let accelerationStructureCopyKHR = PipelineStageFlags2(rawValue: 268435456)
    public static let micromapBuildEXT = PipelineStageFlags2(rawValue: 1073741824)
    public static let clusterCullingShaderHUAWEI = PipelineStageFlags2(rawValue: 2199023255552)
    public static let opticalFlowNV = PipelineStageFlags2(rawValue: 536870912)
    public static let convertCooperativeVectorMatrixNV = PipelineStageFlags2(rawValue: 17592186044416)
    public static let dataGraphARM = PipelineStageFlags2(rawValue: 4398046511104)
    public static let copyIndirectKHR = PipelineStageFlags2(rawValue: 70368744177664)
    public static let memoryDecompressionEXT = PipelineStageFlags2(rawValue: 35184372088832)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.topOfPipe, "topOfPipe"),
        (.drawIndirect, "drawIndirect"),
        (.vertexInput, "vertexInput"),
        (.vertexShader, "vertexShader"),
        (.tessellationControlShader, "tessellationControlShader"),
        (.tessellationEvaluationShader, "tessellationEvaluationShader"),
        (.geometryShader, "geometryShader"),
        (.fragmentShader, "fragmentShader"),
        (.earlyFragmentTests, "earlyFragmentTests"),
        (.lateFragmentTests, "lateFragmentTests"),
        (.colorAttachmentOutput, "colorAttachmentOutput"),
        (.computeShader, "computeShader"),
        (.allTransfer, "allTransfer"),
        (.bottomOfPipe, "bottomOfPipe"),
        (.host, "host"),
        (.allGraphics, "allGraphics"),
        (.allCommands, "allCommands"),
        (.copy, "copy"),
        (.resolve, "resolve"),
        (.blit, "blit"),
        (.clear, "clear"),
        (.indexInput, "indexInput"),
        (.vertexAttributeInput, "vertexAttributeInput"),
        (.preRasterizationShaders, "preRasterizationShaders"),
        (.videoDecodeKHR, "videoDecodeKHR"),
        (.videoEncodeKHR, "videoEncodeKHR"),
        (.transformFeedbackEXT, "transformFeedbackEXT"),
        (.conditionalRenderingEXT, "conditionalRenderingEXT"),
        (.commandPreprocessEXT, "commandPreprocessEXT"),
        (.fragmentShadingRateAttachmentKHR, "fragmentShadingRateAttachmentKHR"),
        (.accelerationStructureBuildKHR, "accelerationStructureBuildKHR"),
        (.rayTracingShaderKHR, "rayTracingShaderKHR"),
        (.fragmentDensityProcessEXT, "fragmentDensityProcessEXT"),
        (.taskShaderEXT, "taskShaderEXT"),
        (.meshShaderEXT, "meshShaderEXT"),
        (.subpassShaderHUAWEI, "subpassShaderHUAWEI"),
        (.invocationMaskHUAWEI, "invocationMaskHUAWEI"),
        (.accelerationStructureCopyKHR, "accelerationStructureCopyKHR"),
        (.micromapBuildEXT, "micromapBuildEXT"),
        (.clusterCullingShaderHUAWEI, "clusterCullingShaderHUAWEI"),
        (.opticalFlowNV, "opticalFlowNV"),
        (.convertCooperativeVectorMatrixNV, "convertCooperativeVectorMatrixNV"),
        (.dataGraphARM, "dataGraphARM"),
        (.copyIndirectKHR, "copyIndirectKHR"),
        (.memoryDecompressionEXT, "memoryDecompressionEXT"),
    ]
}

public struct AccelerationStructureMotionInfoFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct AccelerationStructureMotionInstanceFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct FormatFeatureFlags2: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let sampledImage = FormatFeatureFlags2(rawValue: 1)
    public static let storageImage = FormatFeatureFlags2(rawValue: 2)
    public static let storageImageAtomic = FormatFeatureFlags2(rawValue: 4)
    public static let uniformTexelBuffer = FormatFeatureFlags2(rawValue: 8)
    public static let storageTexelBuffer = FormatFeatureFlags2(rawValue: 16)
    public static let storageTexelBufferAtomic = FormatFeatureFlags2(rawValue: 32)
    public static let vertexBuffer = FormatFeatureFlags2(rawValue: 64)
    public static let colorAttachment = FormatFeatureFlags2(rawValue: 128)
    public static let colorAttachmentBlend = FormatFeatureFlags2(rawValue: 256)
    public static let depthStencilAttachment = FormatFeatureFlags2(rawValue: 512)
    public static let blitSrc = FormatFeatureFlags2(rawValue: 1024)
    public static let blitDst = FormatFeatureFlags2(rawValue: 2048)
    public static let sampledImageFilterLinear = FormatFeatureFlags2(rawValue: 4096)
    public static let transferSrc = FormatFeatureFlags2(rawValue: 16384)
    public static let transferDst = FormatFeatureFlags2(rawValue: 32768)
    public static let sampledImageFilterMinmax = FormatFeatureFlags2(rawValue: 65536)
    public static let midpointChromaSamples = FormatFeatureFlags2(rawValue: 131072)
    public static let sampledImageYcbcrConversionLinearFilter = FormatFeatureFlags2(rawValue: 262144)
    public static let sampledImageYcbcrConversionSeparateReconstructionFilter = FormatFeatureFlags2(rawValue: 524288)
    public static let sampledImageYcbcrConversionChromaReconstructionExplicit = FormatFeatureFlags2(rawValue: 1048576)
    public static let sampledImageYcbcrConversionChromaReconstructionExplicitForceable = FormatFeatureFlags2(rawValue: 2097152)
    public static let disjoint = FormatFeatureFlags2(rawValue: 4194304)
    public static let cositedChromaSamples = FormatFeatureFlags2(rawValue: 8388608)
    public static let storageReadWithoutFormat = FormatFeatureFlags2(rawValue: 2147483648)
    public static let storageWriteWithoutFormat = FormatFeatureFlags2(rawValue: 4294967296)
    public static let sampledImageDepthComparison = FormatFeatureFlags2(rawValue: 8589934592)
    public static let videoDecodeOutputKHR = FormatFeatureFlags2(rawValue: 33554432)
    public static let videoDecodeDpbKHR = FormatFeatureFlags2(rawValue: 67108864)
    public static let accelerationStructureVertexBufferKHR = FormatFeatureFlags2(rawValue: 536870912)
    public static let fragmentDensityMapEXT = FormatFeatureFlags2(rawValue: 16777216)
    public static let fragmentShadingRateAttachmentKHR = FormatFeatureFlags2(rawValue: 1073741824)
    public static let videoEncodeInputKHR = FormatFeatureFlags2(rawValue: 134217728)
    public static let videoEncodeDpbKHR = FormatFeatureFlags2(rawValue: 268435456)
    public static let blockMatchingSxdQCOM = FormatFeatureFlags2(rawValue: 17592186044416)
    public static let accelerationStructureRadiusBufferNV = FormatFeatureFlags2(rawValue: 2251799813685248)
    public static let linearColorAttachmentNV = FormatFeatureFlags2(rawValue: 274877906944)
    public static let weightImageQCOM = FormatFeatureFlags2(rawValue: 17179869184)
    public static let weightSampledImageQCOM = FormatFeatureFlags2(rawValue: 34359738368)
    public static let blockMatchingQCOM = FormatFeatureFlags2(rawValue: 68719476736)
    public static let boxFilterSampledQCOM = FormatFeatureFlags2(rawValue: 137438953472)
    public static let tensorShaderARM = FormatFeatureFlags2(rawValue: 549755813888)
    public static let tensorImageAliasingARM = FormatFeatureFlags2(rawValue: 8796093022208)
    public static let opticalFlowImageNV = FormatFeatureFlags2(rawValue: 1099511627776)
    public static let opticalFlowVectorNV = FormatFeatureFlags2(rawValue: 2199023255552)
    public static let opticalFlowCostNV = FormatFeatureFlags2(rawValue: 4398046511104)
    public static let tensorDataGraphARM = FormatFeatureFlags2(rawValue: 281474976710656)
    public static let copyImageIndirectDstKHR = FormatFeatureFlags2(rawValue: 576460752303423488)
    public static let videoEncodeQuantizationDeltaMapKHR = FormatFeatureFlags2(rawValue: 562949953421312)
    public static let videoEncodeEmphasisMapKHR = FormatFeatureFlags2(rawValue: 1125899906842624)
    public static let depthCopyOnComputeQueueKHR = FormatFeatureFlags2(rawValue: 4503599627370496)
    public static let depthCopyOnTransferQueueKHR = FormatFeatureFlags2(rawValue: 9007199254740992)
    public static let stencilCopyOnComputeQueueKHR = FormatFeatureFlags2(rawValue: 18014398509481984)
    public static let stencilCopyOnTransferQueueKHR = FormatFeatureFlags2(rawValue: 36028797018963968)
    public static let dataGraphOpticalFlowImageARM = FormatFeatureFlags2(rawValue: 72057594037927936)
    public static let dataGraphOpticalFlowVectorARM = FormatFeatureFlags2(rawValue: 144115188075855872)
    public static let dataGraphOpticalFlowCostARM = FormatFeatureFlags2(rawValue: 288230376151711744)
    public static let sampledImageFilterCubic = FormatFeatureFlags2(rawValue: 8192)
    public static let hostImageTransfer = FormatFeatureFlags2(rawValue: 70368744177664)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.sampledImage, "sampledImage"),
        (.storageImage, "storageImage"),
        (.storageImageAtomic, "storageImageAtomic"),
        (.uniformTexelBuffer, "uniformTexelBuffer"),
        (.storageTexelBuffer, "storageTexelBuffer"),
        (.storageTexelBufferAtomic, "storageTexelBufferAtomic"),
        (.vertexBuffer, "vertexBuffer"),
        (.colorAttachment, "colorAttachment"),
        (.colorAttachmentBlend, "colorAttachmentBlend"),
        (.depthStencilAttachment, "depthStencilAttachment"),
        (.blitSrc, "blitSrc"),
        (.blitDst, "blitDst"),
        (.sampledImageFilterLinear, "sampledImageFilterLinear"),
        (.transferSrc, "transferSrc"),
        (.transferDst, "transferDst"),
        (.sampledImageFilterMinmax, "sampledImageFilterMinmax"),
        (.midpointChromaSamples, "midpointChromaSamples"),
        (.sampledImageYcbcrConversionLinearFilter, "sampledImageYcbcrConversionLinearFilter"),
        (.sampledImageYcbcrConversionSeparateReconstructionFilter, "sampledImageYcbcrConversionSeparateReconstructionFilter"),
        (.sampledImageYcbcrConversionChromaReconstructionExplicit, "sampledImageYcbcrConversionChromaReconstructionExplicit"),
        (.sampledImageYcbcrConversionChromaReconstructionExplicitForceable, "sampledImageYcbcrConversionChromaReconstructionExplicitForceable"),
        (.disjoint, "disjoint"),
        (.cositedChromaSamples, "cositedChromaSamples"),
        (.storageReadWithoutFormat, "storageReadWithoutFormat"),
        (.storageWriteWithoutFormat, "storageWriteWithoutFormat"),
        (.sampledImageDepthComparison, "sampledImageDepthComparison"),
        (.videoDecodeOutputKHR, "videoDecodeOutputKHR"),
        (.videoDecodeDpbKHR, "videoDecodeDpbKHR"),
        (.accelerationStructureVertexBufferKHR, "accelerationStructureVertexBufferKHR"),
        (.fragmentDensityMapEXT, "fragmentDensityMapEXT"),
        (.fragmentShadingRateAttachmentKHR, "fragmentShadingRateAttachmentKHR"),
        (.videoEncodeInputKHR, "videoEncodeInputKHR"),
        (.videoEncodeDpbKHR, "videoEncodeDpbKHR"),
        (.blockMatchingSxdQCOM, "blockMatchingSxdQCOM"),
        (.accelerationStructureRadiusBufferNV, "accelerationStructureRadiusBufferNV"),
        (.linearColorAttachmentNV, "linearColorAttachmentNV"),
        (.weightImageQCOM, "weightImageQCOM"),
        (.weightSampledImageQCOM, "weightSampledImageQCOM"),
        (.blockMatchingQCOM, "blockMatchingQCOM"),
        (.boxFilterSampledQCOM, "boxFilterSampledQCOM"),
        (.tensorShaderARM, "tensorShaderARM"),
        (.tensorImageAliasingARM, "tensorImageAliasingARM"),
        (.opticalFlowImageNV, "opticalFlowImageNV"),
        (.opticalFlowVectorNV, "opticalFlowVectorNV"),
        (.opticalFlowCostNV, "opticalFlowCostNV"),
        (.tensorDataGraphARM, "tensorDataGraphARM"),
        (.copyImageIndirectDstKHR, "copyImageIndirectDstKHR"),
        (.videoEncodeQuantizationDeltaMapKHR, "videoEncodeQuantizationDeltaMapKHR"),
        (.videoEncodeEmphasisMapKHR, "videoEncodeEmphasisMapKHR"),
        (.depthCopyOnComputeQueueKHR, "depthCopyOnComputeQueueKHR"),
        (.depthCopyOnTransferQueueKHR, "depthCopyOnTransferQueueKHR"),
        (.stencilCopyOnComputeQueueKHR, "stencilCopyOnComputeQueueKHR"),
        (.stencilCopyOnTransferQueueKHR, "stencilCopyOnTransferQueueKHR"),
        (.dataGraphOpticalFlowImageARM, "dataGraphOpticalFlowImageARM"),
        (.dataGraphOpticalFlowVectorARM, "dataGraphOpticalFlowVectorARM"),
        (.dataGraphOpticalFlowCostARM, "dataGraphOpticalFlowCostARM"),
        (.sampledImageFilterCubic, "sampledImageFilterCubic"),
        (.hostImageTransfer, "hostImageTransfer"),
    ]
}

public struct RenderingFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let contentsSecondaryCommandBuffers = RenderingFlags(rawValue: 1)
    public static let suspending = RenderingFlags(rawValue: 2)
    public static let resuming = RenderingFlags(rawValue: 4)
    public static let enableLegacyDitheringEXT = RenderingFlags(rawValue: 8)
    public static let contentsInlineKHR = RenderingFlags(rawValue: 16)
    public static let perLayerFragmentDensityVALVE = RenderingFlags(rawValue: 32)
    public static let fragmentRegionEXT = RenderingFlags(rawValue: 64)
    public static let customResolveEXT = RenderingFlags(rawValue: 128)
    public static let localReadConcurrentAccessControlKHR = RenderingFlags(rawValue: 256)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.contentsSecondaryCommandBuffers, "contentsSecondaryCommandBuffers"),
        (.suspending, "suspending"),
        (.resuming, "resuming"),
        (.enableLegacyDitheringEXT, "enableLegacyDitheringEXT"),
        (.contentsInlineKHR, "contentsInlineKHR"),
        (.perLayerFragmentDensityVALVE, "perLayerFragmentDensityVALVE"),
        (.fragmentRegionEXT, "fragmentRegionEXT"),
        (.customResolveEXT, "customResolveEXT"),
        (.localReadConcurrentAccessControlKHR, "localReadConcurrentAccessControlKHR"),
    ]
}

public struct MemoryDecompressionMethodFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let gdeflate10 = MemoryDecompressionMethodFlagsEXT(rawValue: 1)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.gdeflate10, "gdeflate10"),
    ]
}

public struct DeviceFaultFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let flagDeviceLost = DeviceFaultFlagsKHR(rawValue: 1)
    public static let flagMemoryAddress = DeviceFaultFlagsKHR(rawValue: 2)
    public static let flagInstructionAddress = DeviceFaultFlagsKHR(rawValue: 4)
    public static let flagVendor = DeviceFaultFlagsKHR(rawValue: 8)
    public static let flagWatchdogTimeout = DeviceFaultFlagsKHR(rawValue: 16)
    public static let flagOverflow = DeviceFaultFlagsKHR(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.flagDeviceLost, "flagDeviceLost"),
        (.flagMemoryAddress, "flagMemoryAddress"),
        (.flagInstructionAddress, "flagInstructionAddress"),
        (.flagVendor, "flagVendor"),
        (.flagWatchdogTimeout, "flagWatchdogTimeout"),
        (.flagOverflow, "flagOverflow"),
    ]
}

public struct BuildMicromapFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let preferFastTrace = BuildMicromapFlagsEXT(rawValue: 1)
    public static let preferFastBuild = BuildMicromapFlagsEXT(rawValue: 2)
    public static let allowCompaction = BuildMicromapFlagsEXT(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.preferFastTrace, "preferFastTrace"),
        (.preferFastBuild, "preferFastBuild"),
        (.allowCompaction, "allowCompaction"),
    ]
}

public struct MicromapCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceAddressCaptureReplay = MicromapCreateFlagsEXT(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceAddressCaptureReplay, "deviceAddressCaptureReplay"),
    ]
}

public struct IndirectCommandsLayoutUsageFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let explicitPreprocess = IndirectCommandsLayoutUsageFlagsEXT(rawValue: 1)
    public static let unorderedSequences = IndirectCommandsLayoutUsageFlagsEXT(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.explicitPreprocess, "explicitPreprocess"),
        (.unorderedSequences, "unorderedSequences"),
    ]
}

public struct IndirectCommandsInputModeFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let vulkanIndexBuffer = IndirectCommandsInputModeFlagsEXT(rawValue: 1)
    public static let dxgiIndexBuffer = IndirectCommandsInputModeFlagsEXT(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.vulkanIndexBuffer, "vulkanIndexBuffer"),
        (.dxgiIndexBuffer, "dxgiIndexBuffer"),
    ]
}

public struct DirectDriverLoadingFlagsLUNARG: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineCreateFlags2: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let typeDisableOptimization = PipelineCreateFlags2(rawValue: 1)
    public static let typeAllowDerivatives = PipelineCreateFlags2(rawValue: 2)
    public static let typeDerivative = PipelineCreateFlags2(rawValue: 4)
    public static let typeViewIndexFromDeviceIndex = PipelineCreateFlags2(rawValue: 8)
    public static let typeDispatchBase = PipelineCreateFlags2(rawValue: 16)
    public static let typeFailOnPipelineCompileRequired = PipelineCreateFlags2(rawValue: 256)
    public static let typeEarlyReturnOnFailure = PipelineCreateFlags2(rawValue: 512)
    public static let typeNoProtectedAccess = PipelineCreateFlags2(rawValue: 134217728)
    public static let typeProtectedAccessOnly = PipelineCreateFlags2(rawValue: 1073741824)
    public static let typeDescriptorHeapEXT = PipelineCreateFlags2(rawValue: 68719476736)
    public static let typeRayTracingAllowSpheresAndLinearSweptSpheresNV = PipelineCreateFlags2(rawValue: 8589934592)
    public static let typeEnableLegacyDitheringEXT = PipelineCreateFlags2(rawValue: 17179869184)
    public static let typeDeferCompileNV = PipelineCreateFlags2(rawValue: 32)
    public static let typeCaptureStatisticsKHR = PipelineCreateFlags2(rawValue: 64)
    public static let typeCaptureInternalRepresentationsKHR = PipelineCreateFlags2(rawValue: 128)
    public static let typeLinkTimeOptimizationEXT = PipelineCreateFlags2(rawValue: 1024)
    public static let typeRetainLinkTimeOptimizationInfoEXT = PipelineCreateFlags2(rawValue: 8388608)
    public static let typeLibraryKHR = PipelineCreateFlags2(rawValue: 2048)
    public static let typeRayTracingSkipTrianglesKHR = PipelineCreateFlags2(rawValue: 4096)
    public static let typeRayTracingSkipAabbsKHR = PipelineCreateFlags2(rawValue: 8192)
    public static let typeRayTracingNoNullAnyHitShadersKHR = PipelineCreateFlags2(rawValue: 16384)
    public static let typeRayTracingNoNullClosestHitShadersKHR = PipelineCreateFlags2(rawValue: 32768)
    public static let typeRayTracingNoNullMissShadersKHR = PipelineCreateFlags2(rawValue: 65536)
    public static let typeRayTracingNoNullIntersectionShadersKHR = PipelineCreateFlags2(rawValue: 131072)
    public static let typeRayTracingShaderGroupHandleCaptureReplayKHR = PipelineCreateFlags2(rawValue: 524288)
    public static let typeIndirectBindableNV = PipelineCreateFlags2(rawValue: 262144)
    public static let typeRayTracingAllowMotionNV = PipelineCreateFlags2(rawValue: 1048576)
    public static let typeRenderingFragmentShadingRateAttachmentKHR = PipelineCreateFlags2(rawValue: 2097152)
    public static let typeRenderingFragmentDensityMapAttachmentEXT = PipelineCreateFlags2(rawValue: 4194304)
    public static let typeColorAttachmentFeedbackLoopEXT = PipelineCreateFlags2(rawValue: 33554432)
    public static let typeDepthStencilAttachmentFeedbackLoopEXT = PipelineCreateFlags2(rawValue: 67108864)
    public static let typeRayTracingDisplacementMicromapNV = PipelineCreateFlags2(rawValue: 268435456)
    public static let typeDescriptorBufferEXT = PipelineCreateFlags2(rawValue: 536870912)
    public static let typeDisallowOpacityMicromapARM = PipelineCreateFlags2(rawValue: 137438953472)
    public static let typeInstrumentShadersARM = PipelineCreateFlags2(rawValue: 549755813888)
    public static let typeCaptureDataKHR = PipelineCreateFlags2(rawValue: 2147483648)
    public static let typeIndirectBindableEXT = PipelineCreateFlags2(rawValue: 274877906944)
    public static let typePerLayerFragmentDensityVALVE = PipelineCreateFlags2(rawValue: 1099511627776)
    public static let typeRayTracingOpacityMicromapKHR = PipelineCreateFlags2(rawValue: 16777216)
    public static let typeOpacityMicromapDisallowMixedSpecialIndexKHR = PipelineCreateFlags2(rawValue: 2199023255552)
    public static let type64BitIndexingEXT = PipelineCreateFlags2(rawValue: 8796093022208)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeDisableOptimization, "typeDisableOptimization"),
        (.typeAllowDerivatives, "typeAllowDerivatives"),
        (.typeDerivative, "typeDerivative"),
        (.typeViewIndexFromDeviceIndex, "typeViewIndexFromDeviceIndex"),
        (.typeDispatchBase, "typeDispatchBase"),
        (.typeFailOnPipelineCompileRequired, "typeFailOnPipelineCompileRequired"),
        (.typeEarlyReturnOnFailure, "typeEarlyReturnOnFailure"),
        (.typeNoProtectedAccess, "typeNoProtectedAccess"),
        (.typeProtectedAccessOnly, "typeProtectedAccessOnly"),
        (.typeDescriptorHeapEXT, "typeDescriptorHeapEXT"),
        (.typeRayTracingAllowSpheresAndLinearSweptSpheresNV, "typeRayTracingAllowSpheresAndLinearSweptSpheresNV"),
        (.typeEnableLegacyDitheringEXT, "typeEnableLegacyDitheringEXT"),
        (.typeDeferCompileNV, "typeDeferCompileNV"),
        (.typeCaptureStatisticsKHR, "typeCaptureStatisticsKHR"),
        (.typeCaptureInternalRepresentationsKHR, "typeCaptureInternalRepresentationsKHR"),
        (.typeLinkTimeOptimizationEXT, "typeLinkTimeOptimizationEXT"),
        (.typeRetainLinkTimeOptimizationInfoEXT, "typeRetainLinkTimeOptimizationInfoEXT"),
        (.typeLibraryKHR, "typeLibraryKHR"),
        (.typeRayTracingSkipTrianglesKHR, "typeRayTracingSkipTrianglesKHR"),
        (.typeRayTracingSkipAabbsKHR, "typeRayTracingSkipAabbsKHR"),
        (.typeRayTracingNoNullAnyHitShadersKHR, "typeRayTracingNoNullAnyHitShadersKHR"),
        (.typeRayTracingNoNullClosestHitShadersKHR, "typeRayTracingNoNullClosestHitShadersKHR"),
        (.typeRayTracingNoNullMissShadersKHR, "typeRayTracingNoNullMissShadersKHR"),
        (.typeRayTracingNoNullIntersectionShadersKHR, "typeRayTracingNoNullIntersectionShadersKHR"),
        (.typeRayTracingShaderGroupHandleCaptureReplayKHR, "typeRayTracingShaderGroupHandleCaptureReplayKHR"),
        (.typeIndirectBindableNV, "typeIndirectBindableNV"),
        (.typeRayTracingAllowMotionNV, "typeRayTracingAllowMotionNV"),
        (.typeRenderingFragmentShadingRateAttachmentKHR, "typeRenderingFragmentShadingRateAttachmentKHR"),
        (.typeRenderingFragmentDensityMapAttachmentEXT, "typeRenderingFragmentDensityMapAttachmentEXT"),
        (.typeColorAttachmentFeedbackLoopEXT, "typeColorAttachmentFeedbackLoopEXT"),
        (.typeDepthStencilAttachmentFeedbackLoopEXT, "typeDepthStencilAttachmentFeedbackLoopEXT"),
        (.typeRayTracingDisplacementMicromapNV, "typeRayTracingDisplacementMicromapNV"),
        (.typeDescriptorBufferEXT, "typeDescriptorBufferEXT"),
        (.typeDisallowOpacityMicromapARM, "typeDisallowOpacityMicromapARM"),
        (.typeInstrumentShadersARM, "typeInstrumentShadersARM"),
        (.typeCaptureDataKHR, "typeCaptureDataKHR"),
        (.typeIndirectBindableEXT, "typeIndirectBindableEXT"),
        (.typePerLayerFragmentDensityVALVE, "typePerLayerFragmentDensityVALVE"),
        (.typeRayTracingOpacityMicromapKHR, "typeRayTracingOpacityMicromapKHR"),
        (.typeOpacityMicromapDisallowMixedSpecialIndexKHR, "typeOpacityMicromapDisallowMixedSpecialIndexKHR"),
        (.type64BitIndexingEXT, "type64BitIndexingEXT"),
    ]
}

public struct BufferUsageFlags2: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let transferSrc = BufferUsageFlags2(rawValue: 1)
    public static let transferDst = BufferUsageFlags2(rawValue: 2)
    public static let uniformTexelBuffer = BufferUsageFlags2(rawValue: 4)
    public static let storageTexelBuffer = BufferUsageFlags2(rawValue: 8)
    public static let uniformBuffer = BufferUsageFlags2(rawValue: 16)
    public static let storageBuffer = BufferUsageFlags2(rawValue: 32)
    public static let indexBuffer = BufferUsageFlags2(rawValue: 64)
    public static let vertexBuffer = BufferUsageFlags2(rawValue: 128)
    public static let indirectBuffer = BufferUsageFlags2(rawValue: 256)
    public static let descriptorHeapEXT = BufferUsageFlags2(rawValue: 268435456)
    public static let micromapBuildInputReadOnlyEXT = BufferUsageFlags2(rawValue: 8388608)
    public static let micromapStorageEXT = BufferUsageFlags2(rawValue: 16777216)
    public static let conditionalRenderingEXT = BufferUsageFlags2(rawValue: 512)
    public static let shaderBindingTableKHR = BufferUsageFlags2(rawValue: 1024)
    public static let transformFeedbackBufferEXT = BufferUsageFlags2(rawValue: 2048)
    public static let transformFeedbackCounterBufferEXT = BufferUsageFlags2(rawValue: 4096)
    public static let videoDecodeSrcKHR = BufferUsageFlags2(rawValue: 8192)
    public static let videoDecodeDstKHR = BufferUsageFlags2(rawValue: 16384)
    public static let videoEncodeDstKHR = BufferUsageFlags2(rawValue: 32768)
    public static let videoEncodeSrcKHR = BufferUsageFlags2(rawValue: 65536)
    public static let accelerationStructureBuildInputReadOnlyKHR = BufferUsageFlags2(rawValue: 524288)
    public static let accelerationStructureStorageKHR = BufferUsageFlags2(rawValue: 1048576)
    public static let samplerDescriptorBufferEXT = BufferUsageFlags2(rawValue: 2097152)
    public static let resourceDescriptorBufferEXT = BufferUsageFlags2(rawValue: 4194304)
    public static let pushDescriptorsDescriptorBufferEXT = BufferUsageFlags2(rawValue: 67108864)
    public static let dataGraphForeignDescriptorARM = BufferUsageFlags2(rawValue: 536870912)
    public static let tileMemoryQCOM = BufferUsageFlags2(rawValue: 134217728)
    public static let memoryDecompressionEXT = BufferUsageFlags2(rawValue: 4294967296)
    public static let preprocessBufferEXT = BufferUsageFlags2(rawValue: 2147483648)
    public static let shaderDeviceAddress = BufferUsageFlags2(rawValue: 131072)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.transferSrc, "transferSrc"),
        (.transferDst, "transferDst"),
        (.uniformTexelBuffer, "uniformTexelBuffer"),
        (.storageTexelBuffer, "storageTexelBuffer"),
        (.uniformBuffer, "uniformBuffer"),
        (.storageBuffer, "storageBuffer"),
        (.indexBuffer, "indexBuffer"),
        (.vertexBuffer, "vertexBuffer"),
        (.indirectBuffer, "indirectBuffer"),
        (.descriptorHeapEXT, "descriptorHeapEXT"),
        (.micromapBuildInputReadOnlyEXT, "micromapBuildInputReadOnlyEXT"),
        (.micromapStorageEXT, "micromapStorageEXT"),
        (.conditionalRenderingEXT, "conditionalRenderingEXT"),
        (.shaderBindingTableKHR, "shaderBindingTableKHR"),
        (.transformFeedbackBufferEXT, "transformFeedbackBufferEXT"),
        (.transformFeedbackCounterBufferEXT, "transformFeedbackCounterBufferEXT"),
        (.videoDecodeSrcKHR, "videoDecodeSrcKHR"),
        (.videoDecodeDstKHR, "videoDecodeDstKHR"),
        (.videoEncodeDstKHR, "videoEncodeDstKHR"),
        (.videoEncodeSrcKHR, "videoEncodeSrcKHR"),
        (.accelerationStructureBuildInputReadOnlyKHR, "accelerationStructureBuildInputReadOnlyKHR"),
        (.accelerationStructureStorageKHR, "accelerationStructureStorageKHR"),
        (.samplerDescriptorBufferEXT, "samplerDescriptorBufferEXT"),
        (.resourceDescriptorBufferEXT, "resourceDescriptorBufferEXT"),
        (.pushDescriptorsDescriptorBufferEXT, "pushDescriptorsDescriptorBufferEXT"),
        (.dataGraphForeignDescriptorARM, "dataGraphForeignDescriptorARM"),
        (.tileMemoryQCOM, "tileMemoryQCOM"),
        (.memoryDecompressionEXT, "memoryDecompressionEXT"),
        (.preprocessBufferEXT, "preprocessBufferEXT"),
        (.shaderDeviceAddress, "shaderDeviceAddress"),
    ]
}

public struct AddressCopyFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceLocal = AddressCopyFlagsKHR(rawValue: 1)
    public static let sparse = AddressCopyFlagsKHR(rawValue: 2)
    public static let protected = AddressCopyFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceLocal, "deviceLocal"),
        (.sparse, "sparse"),
        (.protected, "protected"),
    ]
}

public struct TensorCreateFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let mutableFormat = TensorCreateFlagsARM(rawValue: 1)
    public static let protected = TensorCreateFlagsARM(rawValue: 2)
    public static let descriptorHeapCaptureReplay = TensorCreateFlagsARM(rawValue: 8)
    public static let descriptorBufferCaptureReplay = TensorCreateFlagsARM(rawValue: 4)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.mutableFormat, "mutableFormat"),
        (.protected, "protected"),
        (.descriptorHeapCaptureReplay, "descriptorHeapCaptureReplay"),
        (.descriptorBufferCaptureReplay, "descriptorBufferCaptureReplay"),
    ]
}

public struct TensorUsageFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let shader = TensorUsageFlagsARM(rawValue: 2)
    public static let transferSrc = TensorUsageFlagsARM(rawValue: 4)
    public static let transferDst = TensorUsageFlagsARM(rawValue: 8)
    public static let imageAliasing = TensorUsageFlagsARM(rawValue: 16)
    public static let dataGraph = TensorUsageFlagsARM(rawValue: 32)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.shader, "shader"),
        (.transferSrc, "transferSrc"),
        (.transferDst, "transferDst"),
        (.imageAliasing, "imageAliasing"),
        (.dataGraph, "dataGraph"),
    ]
}

public struct TensorViewCreateFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let descriptorBufferCaptureReplay = TensorViewCreateFlagsARM(rawValue: 1)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.descriptorBufferCaptureReplay, "descriptorBufferCaptureReplay"),
    ]
}

public struct DataGraphPipelineSessionCreateFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let protected = DataGraphPipelineSessionCreateFlagsARM(rawValue: 1)
    public static let opticalFlowCache = DataGraphPipelineSessionCreateFlagsARM(rawValue: 2)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.protected, "protected"),
        (.opticalFlowCache, "opticalFlowCache"),
    ]
}

public struct DataGraphPipelineDispatchFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct VideoEncodeRgbModelConversionFlagsVALVE: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let rgbIdentity = VideoEncodeRgbModelConversionFlagsVALVE(rawValue: 1)
    public static let ycbcrIdentity = VideoEncodeRgbModelConversionFlagsVALVE(rawValue: 2)
    public static let ycbcr709 = VideoEncodeRgbModelConversionFlagsVALVE(rawValue: 4)
    public static let ycbcr601 = VideoEncodeRgbModelConversionFlagsVALVE(rawValue: 8)
    public static let ycbcr2020 = VideoEncodeRgbModelConversionFlagsVALVE(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.rgbIdentity, "rgbIdentity"),
        (.ycbcrIdentity, "ycbcrIdentity"),
        (.ycbcr709, "ycbcr709"),
        (.ycbcr601, "ycbcr601"),
        (.ycbcr2020, "ycbcr2020"),
    ]
}

public struct VideoEncodeRgbRangeCompressionFlagsVALVE: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let fullRange = VideoEncodeRgbRangeCompressionFlagsVALVE(rawValue: 1)
    public static let narrowRange = VideoEncodeRgbRangeCompressionFlagsVALVE(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.fullRange, "fullRange"),
        (.narrowRange, "narrowRange"),
    ]
}

public struct VideoEncodeRgbChromaOffsetFlagsVALVE: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let cositedEven = VideoEncodeRgbChromaOffsetFlagsVALVE(rawValue: 1)
    public static let midpoint = VideoEncodeRgbChromaOffsetFlagsVALVE(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.cositedEven, "cositedEven"),
        (.midpoint, "midpoint"),
    ]
}

public struct SpirvResourceTypeFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let all = SpirvResourceTypeFlagsEXT(rawValue: 0x7FFFFFFF)
    public static let sampler = SpirvResourceTypeFlagsEXT(rawValue: 1)
    public static let sampledImage = SpirvResourceTypeFlagsEXT(rawValue: 2)
    public static let readOnlyImage = SpirvResourceTypeFlagsEXT(rawValue: 4)
    public static let readWriteImage = SpirvResourceTypeFlagsEXT(rawValue: 8)
    public static let combinedSampledImage = SpirvResourceTypeFlagsEXT(rawValue: 16)
    public static let uniformBuffer = SpirvResourceTypeFlagsEXT(rawValue: 32)
    public static let readOnlyStorageBuffer = SpirvResourceTypeFlagsEXT(rawValue: 64)
    public static let readWriteStorageBuffer = SpirvResourceTypeFlagsEXT(rawValue: 128)
    public static let accelerationStructure = SpirvResourceTypeFlagsEXT(rawValue: 256)
    public static let tensorARM = SpirvResourceTypeFlagsEXT(rawValue: 512)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.all, "all"),
        (.sampler, "sampler"),
        (.sampledImage, "sampledImage"),
        (.readOnlyImage, "readOnlyImage"),
        (.readWriteImage, "readWriteImage"),
        (.combinedSampledImage, "combinedSampledImage"),
        (.uniformBuffer, "uniformBuffer"),
        (.readOnlyStorageBuffer, "readOnlyStorageBuffer"),
        (.readWriteStorageBuffer, "readWriteStorageBuffer"),
        (.accelerationStructure, "accelerationStructure"),
        (.tensorARM, "tensorARM"),
    ]
}

public struct GpaSqShaderStageFlagsAMD: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let ps = GpaSqShaderStageFlagsAMD(rawValue: 1)
    public static let vs = GpaSqShaderStageFlagsAMD(rawValue: 2)
    public static let gs = GpaSqShaderStageFlagsAMD(rawValue: 4)
    public static let es = GpaSqShaderStageFlagsAMD(rawValue: 8)
    public static let hs = GpaSqShaderStageFlagsAMD(rawValue: 16)
    public static let ls = GpaSqShaderStageFlagsAMD(rawValue: 32)
    public static let cs = GpaSqShaderStageFlagsAMD(rawValue: 64)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.ps, "ps"),
        (.vs, "vs"),
        (.gs, "gs"),
        (.es, "es"),
        (.hs, "hs"),
        (.ls, "ls"),
        (.cs, "cs"),
    ]
}

public struct GpaPerfBlockPropertiesFlagsAMD: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PhysicalDeviceGpaPropertiesFlagsAMD: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct AddressCommandFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let protected = AddressCommandFlagsKHR(rawValue: 1)
    public static let fullyBound = AddressCommandFlagsKHR(rawValue: 2)
    public static let storageBufferUsage = AddressCommandFlagsKHR(rawValue: 4)
    public static let unknownStorageBufferUsage = AddressCommandFlagsKHR(rawValue: 8)
    public static let transformFeedbackBufferUsage = AddressCommandFlagsKHR(rawValue: 16)
    public static let unknownTransformFeedbackBufferUsage = AddressCommandFlagsKHR(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.protected, "protected"),
        (.fullyBound, "fullyBound"),
        (.storageBufferUsage, "storageBufferUsage"),
        (.unknownStorageBufferUsage, "unknownStorageBufferUsage"),
        (.transformFeedbackBufferUsage, "transformFeedbackBufferUsage"),
        (.unknownTransformFeedbackBufferUsage, "unknownTransformFeedbackBufferUsage"),
    ]
}

public struct CompositeAlphaFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaque = CompositeAlphaFlagsKHR(rawValue: 1)
    public static let preMultiplied = CompositeAlphaFlagsKHR(rawValue: 2)
    public static let postMultiplied = CompositeAlphaFlagsKHR(rawValue: 4)
    public static let inherit = CompositeAlphaFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaque, "opaque"),
        (.preMultiplied, "preMultiplied"),
        (.postMultiplied, "postMultiplied"),
        (.inherit, "inherit"),
    ]
}

public struct DisplayPlaneAlphaFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaque = DisplayPlaneAlphaFlagsKHR(rawValue: 1)
    public static let global = DisplayPlaneAlphaFlagsKHR(rawValue: 2)
    public static let perPixel = DisplayPlaneAlphaFlagsKHR(rawValue: 4)
    public static let perPixelPremultiplied = DisplayPlaneAlphaFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaque, "opaque"),
        (.global, "global"),
        (.perPixel, "perPixel"),
        (.perPixelPremultiplied, "perPixelPremultiplied"),
    ]
}

public struct SurfaceTransformFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let identity = SurfaceTransformFlagsKHR(rawValue: 1)
    public static let rotate90 = SurfaceTransformFlagsKHR(rawValue: 2)
    public static let rotate180 = SurfaceTransformFlagsKHR(rawValue: 4)
    public static let rotate270 = SurfaceTransformFlagsKHR(rawValue: 8)
    public static let horizontalMirror = SurfaceTransformFlagsKHR(rawValue: 16)
    public static let horizontalMirrorRotate90 = SurfaceTransformFlagsKHR(rawValue: 32)
    public static let horizontalMirrorRotate180 = SurfaceTransformFlagsKHR(rawValue: 64)
    public static let horizontalMirrorRotate270 = SurfaceTransformFlagsKHR(rawValue: 128)
    public static let inherit = SurfaceTransformFlagsKHR(rawValue: 256)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.identity, "identity"),
        (.rotate90, "rotate90"),
        (.rotate180, "rotate180"),
        (.rotate270, "rotate270"),
        (.horizontalMirror, "horizontalMirror"),
        (.horizontalMirrorRotate90, "horizontalMirrorRotate90"),
        (.horizontalMirrorRotate180, "horizontalMirrorRotate180"),
        (.horizontalMirrorRotate270, "horizontalMirrorRotate270"),
        (.inherit, "inherit"),
    ]
}

public struct SwapchainCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let splitInstanceBindRegions = SwapchainCreateFlagsKHR(rawValue: 1)
    public static let protected = SwapchainCreateFlagsKHR(rawValue: 2)
    public static let mutableFormat = SwapchainCreateFlagsKHR(rawValue: 4)
    public static let presentTimingEXT = SwapchainCreateFlagsKHR(rawValue: 512)
    public static let presentId2 = SwapchainCreateFlagsKHR(rawValue: 64)
    public static let presentWait2 = SwapchainCreateFlagsKHR(rawValue: 128)
    public static let deferredMemoryAllocation = SwapchainCreateFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.splitInstanceBindRegions, "splitInstanceBindRegions"),
        (.protected, "protected"),
        (.mutableFormat, "mutableFormat"),
        (.presentTimingEXT, "presentTimingEXT"),
        (.presentId2, "presentId2"),
        (.presentWait2, "presentWait2"),
        (.deferredMemoryAllocation, "deferredMemoryAllocation"),
    ]
}

public struct DisplayModeCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DisplaySurfaceCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

#if VK_USE_PLATFORM_ANDROID_KHR
public struct AndroidSurfaceCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_VI_NN
public struct ViSurfaceCreateFlagsNN: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_WAYLAND_KHR
public struct WaylandSurfaceCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_UBM_SEC
public struct UbmSurfaceCreateFlagsSEC: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_WIN32_KHR
public struct Win32SurfaceCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_XLIB_KHR
public struct XlibSurfaceCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_XCB_KHR
public struct XcbSurfaceCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_DIRECTFB_EXT
public struct DirectFBSurfaceCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_IOS_MVK
public struct IOSSurfaceCreateFlagsMVK: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_MACOS_MVK
public struct MacOSSurfaceCreateFlagsMVK: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_METAL_EXT
public struct MetalSurfaceCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_FUCHSIA
public struct ImagePipeSurfaceCreateFlagsFUCHSIA: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

#if VK_USE_PLATFORM_GGP
public struct StreamDescriptorSurfaceCreateFlagsGGP: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

public struct HeadlessSurfaceCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

#if VK_USE_PLATFORM_SCREEN_QNX
public struct ScreenSurfaceCreateFlagsQNX: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

public struct PeerMemoryFeatureFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let copySrc = PeerMemoryFeatureFlags(rawValue: 1)
    public static let copyDst = PeerMemoryFeatureFlags(rawValue: 2)
    public static let genericSrc = PeerMemoryFeatureFlags(rawValue: 4)
    public static let genericDst = PeerMemoryFeatureFlags(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.copySrc, "copySrc"),
        (.copyDst, "copyDst"),
        (.genericSrc, "genericSrc"),
        (.genericDst, "genericDst"),
    ]
}

public struct MemoryAllocateFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let deviceMask = MemoryAllocateFlags(rawValue: 1)
    public static let zeroInitializeEXT = MemoryAllocateFlags(rawValue: 8)
    public static let deviceAddress = MemoryAllocateFlags(rawValue: 2)
    public static let deviceAddressCaptureReplay = MemoryAllocateFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.deviceMask, "deviceMask"),
        (.zeroInitializeEXT, "zeroInitializeEXT"),
        (.deviceAddress, "deviceAddress"),
        (.deviceAddressCaptureReplay, "deviceAddressCaptureReplay"),
    ]
}

public struct DeviceGroupPresentModeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let local = DeviceGroupPresentModeFlagsKHR(rawValue: 1)
    public static let remote = DeviceGroupPresentModeFlagsKHR(rawValue: 2)
    public static let sum = DeviceGroupPresentModeFlagsKHR(rawValue: 4)
    public static let localMultiDevice = DeviceGroupPresentModeFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.local, "local"),
        (.remote, "remote"),
        (.sum, "sum"),
        (.localMultiDevice, "localMultiDevice"),
    ]
}

public struct DebugReportFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let information = DebugReportFlagsEXT(rawValue: 1)
    public static let warning = DebugReportFlagsEXT(rawValue: 2)
    public static let performanceWarning = DebugReportFlagsEXT(rawValue: 4)
    public static let error = DebugReportFlagsEXT(rawValue: 8)
    public static let debug = DebugReportFlagsEXT(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.information, "information"),
        (.warning, "warning"),
        (.performanceWarning, "performanceWarning"),
        (.error, "error"),
        (.debug, "debug"),
    ]
}

public struct CommandPoolTrimFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct ExternalMemoryHandleTypeFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaqueWin32 = ExternalMemoryHandleTypeFlagsNV(rawValue: 1)
    public static let opaqueWin32Kmt = ExternalMemoryHandleTypeFlagsNV(rawValue: 2)
    public static let d3d11Image = ExternalMemoryHandleTypeFlagsNV(rawValue: 4)
    public static let d3d11ImageKmt = ExternalMemoryHandleTypeFlagsNV(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaqueWin32, "opaqueWin32"),
        (.opaqueWin32Kmt, "opaqueWin32Kmt"),
        (.d3d11Image, "d3d11Image"),
        (.d3d11ImageKmt, "d3d11ImageKmt"),
    ]
}

public struct ClusterAccelerationStructureIndexFormatFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let type8bit = ClusterAccelerationStructureIndexFormatFlagsNV(rawValue: 1)
    public static let type16bit = ClusterAccelerationStructureIndexFormatFlagsNV(rawValue: 2)
    public static let type32bit = ClusterAccelerationStructureIndexFormatFlagsNV(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.type8bit, "type8bit"),
        (.type16bit, "type16bit"),
        (.type32bit, "type32bit"),
    ]
}

public struct ExternalMemoryFeatureFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let dedicatedOnly = ExternalMemoryFeatureFlagsNV(rawValue: 1)
    public static let exportable = ExternalMemoryFeatureFlagsNV(rawValue: 2)
    public static let importable = ExternalMemoryFeatureFlagsNV(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.dedicatedOnly, "dedicatedOnly"),
        (.exportable, "exportable"),
        (.importable, "importable"),
    ]
}

public struct ExternalMemoryHandleTypeFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaqueFd = ExternalMemoryHandleTypeFlags(rawValue: 1)
    public static let opaqueWin32 = ExternalMemoryHandleTypeFlags(rawValue: 2)
    public static let opaqueWin32Kmt = ExternalMemoryHandleTypeFlags(rawValue: 4)
    public static let d3d11Texture = ExternalMemoryHandleTypeFlags(rawValue: 8)
    public static let d3d11TextureKmt = ExternalMemoryHandleTypeFlags(rawValue: 16)
    public static let d3d12Heap = ExternalMemoryHandleTypeFlags(rawValue: 32)
    public static let d3d12Resource = ExternalMemoryHandleTypeFlags(rawValue: 64)
    public static let dmaBufEXT = ExternalMemoryHandleTypeFlags(rawValue: 512)
    public static let hostAllocationEXT = ExternalMemoryHandleTypeFlags(rawValue: 128)
    public static let hostMappedForeignMemoryEXT = ExternalMemoryHandleTypeFlags(rawValue: 256)
    public static let rdmaAddressNV = ExternalMemoryHandleTypeFlags(rawValue: 4096)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaqueFd, "opaqueFd"),
        (.opaqueWin32, "opaqueWin32"),
        (.opaqueWin32Kmt, "opaqueWin32Kmt"),
        (.d3d11Texture, "d3d11Texture"),
        (.d3d11TextureKmt, "d3d11TextureKmt"),
        (.d3d12Heap, "d3d12Heap"),
        (.d3d12Resource, "d3d12Resource"),
        (.dmaBufEXT, "dmaBufEXT"),
        (.hostAllocationEXT, "hostAllocationEXT"),
        (.hostMappedForeignMemoryEXT, "hostMappedForeignMemoryEXT"),
        (.rdmaAddressNV, "rdmaAddressNV"),
    ]
}

public struct ExternalMemoryFeatureFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let dedicatedOnly = ExternalMemoryFeatureFlags(rawValue: 1)
    public static let exportable = ExternalMemoryFeatureFlags(rawValue: 2)
    public static let importable = ExternalMemoryFeatureFlags(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.dedicatedOnly, "dedicatedOnly"),
        (.exportable, "exportable"),
        (.importable, "importable"),
    ]
}

public struct ExternalSemaphoreHandleTypeFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaqueFd = ExternalSemaphoreHandleTypeFlags(rawValue: 1)
    public static let opaqueWin32 = ExternalSemaphoreHandleTypeFlags(rawValue: 2)
    public static let opaqueWin32Kmt = ExternalSemaphoreHandleTypeFlags(rawValue: 4)
    public static let d3d12Fence = ExternalSemaphoreHandleTypeFlags(rawValue: 8)
    public static let syncFd = ExternalSemaphoreHandleTypeFlags(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaqueFd, "opaqueFd"),
        (.opaqueWin32, "opaqueWin32"),
        (.opaqueWin32Kmt, "opaqueWin32Kmt"),
        (.d3d12Fence, "d3d12Fence"),
        (.syncFd, "syncFd"),
    ]
}

public struct ExternalSemaphoreFeatureFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let exportable = ExternalSemaphoreFeatureFlags(rawValue: 1)
    public static let importable = ExternalSemaphoreFeatureFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.exportable, "exportable"),
        (.importable, "importable"),
    ]
}

public struct SemaphoreImportFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let temporary = SemaphoreImportFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.temporary, "temporary"),
    ]
}

public struct ExternalFenceHandleTypeFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let opaqueFd = ExternalFenceHandleTypeFlags(rawValue: 1)
    public static let opaqueWin32 = ExternalFenceHandleTypeFlags(rawValue: 2)
    public static let opaqueWin32Kmt = ExternalFenceHandleTypeFlags(rawValue: 4)
    public static let syncFd = ExternalFenceHandleTypeFlags(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.opaqueFd, "opaqueFd"),
        (.opaqueWin32, "opaqueWin32"),
        (.opaqueWin32Kmt, "opaqueWin32Kmt"),
        (.syncFd, "syncFd"),
    ]
}

public struct ExternalFenceFeatureFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let exportable = ExternalFenceFeatureFlags(rawValue: 1)
    public static let importable = ExternalFenceFeatureFlags(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.exportable, "exportable"),
        (.importable, "importable"),
    ]
}

public struct FenceImportFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let temporary = FenceImportFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.temporary, "temporary"),
    ]
}

public struct SurfaceCounterFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let vblank = SurfaceCounterFlagsEXT(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.vblank, "vblank"),
    ]
}

public struct PipelineViewportSwizzleStateCreateFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineDiscardRectangleStateCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineCoverageToColorStateCreateFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineCoverageModulationStateCreateFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineCoverageReductionStateCreateFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct ValidationCacheCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DebugUtilsMessageSeverityFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let verbose = DebugUtilsMessageSeverityFlagsEXT(rawValue: 1)
    public static let info = DebugUtilsMessageSeverityFlagsEXT(rawValue: 16)
    public static let warning = DebugUtilsMessageSeverityFlagsEXT(rawValue: 256)
    public static let error = DebugUtilsMessageSeverityFlagsEXT(rawValue: 4096)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.verbose, "verbose"),
        (.info, "info"),
        (.warning, "warning"),
        (.error, "error"),
    ]
}

public struct DebugUtilsMessageTypeFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let general = DebugUtilsMessageTypeFlagsEXT(rawValue: 1)
    public static let validation = DebugUtilsMessageTypeFlagsEXT(rawValue: 2)
    public static let performance = DebugUtilsMessageTypeFlagsEXT(rawValue: 4)
    public static let deviceAddressBinding = DebugUtilsMessageTypeFlagsEXT(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.general, "general"),
        (.validation, "validation"),
        (.performance, "performance"),
        (.deviceAddressBinding, "deviceAddressBinding"),
    ]
}

public struct DebugUtilsMessengerCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DebugUtilsMessengerCallbackDataFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DeviceMemoryReportFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineRasterizationConservativeStateCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DescriptorBindingFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let updateAfterBind = DescriptorBindingFlags(rawValue: 1)
    public static let updateUnusedWhilePending = DescriptorBindingFlags(rawValue: 2)
    public static let partiallyBound = DescriptorBindingFlags(rawValue: 4)
    public static let variableDescriptorCount = DescriptorBindingFlags(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.updateAfterBind, "updateAfterBind"),
        (.updateUnusedWhilePending, "updateUnusedWhilePending"),
        (.partiallyBound, "partiallyBound"),
        (.variableDescriptorCount, "variableDescriptorCount"),
    ]
}

public struct ConditionalRenderingFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let inverted = ConditionalRenderingFlagsEXT(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.inverted, "inverted"),
    ]
}

public struct ResolveModeFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let none: ResolveModeFlags  = []
    public static let sampleZero = ResolveModeFlags(rawValue: 1)
    public static let average = ResolveModeFlags(rawValue: 2)
    public static let min = ResolveModeFlags(rawValue: 4)
    public static let max = ResolveModeFlags(rawValue: 8)
    public static let customEXT = ResolveModeFlags(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.sampleZero, "sampleZero"),
        (.average, "average"),
        (.min, "min"),
        (.max, "max"),
        (.customEXT, "customEXT"),
    ]
}

public struct PipelineRasterizationStateStreamCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct PipelineRasterizationDepthClipStateCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct ToolPurposeFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let validation = ToolPurposeFlags(rawValue: 1)
    public static let profiling = ToolPurposeFlags(rawValue: 2)
    public static let tracing = ToolPurposeFlags(rawValue: 4)
    public static let additionalFeatures = ToolPurposeFlags(rawValue: 8)
    public static let modifyingFeatures = ToolPurposeFlags(rawValue: 16)
    public static let debugReportingEXT = ToolPurposeFlags(rawValue: 32)
    public static let debugMarkersEXT = ToolPurposeFlags(rawValue: 64)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.validation, "validation"),
        (.profiling, "profiling"),
        (.tracing, "tracing"),
        (.additionalFeatures, "additionalFeatures"),
        (.modifyingFeatures, "modifyingFeatures"),
        (.debugReportingEXT, "debugReportingEXT"),
        (.debugMarkersEXT, "debugMarkersEXT"),
    ]
}

public struct SubmitFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let protected = SubmitFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.protected, "protected"),
    ]
}

#if VK_USE_PLATFORM_FUCHSIA
public struct ImageFormatConstraintsFlagsFUCHSIA: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

public struct HostImageCopyFlags: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let memcpy = HostImageCopyFlags(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.memcpy, "memcpy"),
    ]
}

public struct PartitionedAccelerationStructureInstanceFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let flagTriangleFacingCullDisable = PartitionedAccelerationStructureInstanceFlagsNV(rawValue: 1)
    public static let flagTriangleFlipFacing = PartitionedAccelerationStructureInstanceFlagsNV(rawValue: 2)
    public static let flagForceOpaque = PartitionedAccelerationStructureInstanceFlagsNV(rawValue: 4)
    public static let flagForceNoOpaque = PartitionedAccelerationStructureInstanceFlagsNV(rawValue: 8)
    public static let flagEnableExplicitBoundingBox = PartitionedAccelerationStructureInstanceFlagsNV(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.flagTriangleFacingCullDisable, "flagTriangleFacingCullDisable"),
        (.flagTriangleFlipFacing, "flagTriangleFlipFacing"),
        (.flagForceOpaque, "flagForceOpaque"),
        (.flagForceNoOpaque, "flagForceNoOpaque"),
        (.flagEnableExplicitBoundingBox, "flagEnableExplicitBoundingBox"),
    ]
}

#if VK_USE_PLATFORM_FUCHSIA
public struct ImageConstraintsInfoFlagsFUCHSIA: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let cpuReadRarely = ImageConstraintsInfoFlagsFUCHSIA(rawValue: 1)
    public static let cpuReadOften = ImageConstraintsInfoFlagsFUCHSIA(rawValue: 2)
    public static let cpuWriteRarely = ImageConstraintsInfoFlagsFUCHSIA(rawValue: 4)
    public static let cpuWriteOften = ImageConstraintsInfoFlagsFUCHSIA(rawValue: 8)
    public static let protectedOptional = ImageConstraintsInfoFlagsFUCHSIA(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.cpuReadRarely, "cpuReadRarely"),
        (.cpuReadOften, "cpuReadOften"),
        (.cpuWriteRarely, "cpuWriteRarely"),
        (.cpuWriteOften, "cpuWriteOften"),
        (.protectedOptional, "protectedOptional"),
    ]
}
#endif

public struct GraphicsPipelineLibraryFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let vertexInputInterface = GraphicsPipelineLibraryFlagsEXT(rawValue: 1)
    public static let preRasterizationShaders = GraphicsPipelineLibraryFlagsEXT(rawValue: 2)
    public static let fragmentShader = GraphicsPipelineLibraryFlagsEXT(rawValue: 4)
    public static let fragmentOutputInterface = GraphicsPipelineLibraryFlagsEXT(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.vertexInputInterface, "vertexInputInterface"),
        (.preRasterizationShaders, "preRasterizationShaders"),
        (.fragmentShader, "fragmentShader"),
        (.fragmentOutputInterface, "fragmentOutputInterface"),
    ]
}

public struct ImageCompressionFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let `default`: ImageCompressionFlagsEXT  = []
    public static let fixedRateDefault = ImageCompressionFlagsEXT(rawValue: 1)
    public static let fixedRateExplicit = ImageCompressionFlagsEXT(rawValue: 2)
    public static let disabled = ImageCompressionFlagsEXT(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.default, "default"),
        (.fixedRateDefault, "fixedRateDefault"),
        (.fixedRateExplicit, "fixedRateExplicit"),
        (.disabled, "disabled"),
    ]
}

public struct ImageCompressionFixedRateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeNone: ImageCompressionFixedRateFlagsEXT  = []
    public static let type1bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 1)
    public static let type2bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 2)
    public static let type3bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 4)
    public static let type4bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 8)
    public static let type5bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 16)
    public static let type6bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 32)
    public static let type7bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 64)
    public static let type8bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 128)
    public static let type9bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 256)
    public static let type10bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 512)
    public static let type11bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 1024)
    public static let type12bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 2048)
    public static let type13bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 4096)
    public static let type14bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 8192)
    public static let type15bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 16384)
    public static let type16bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 32768)
    public static let type17bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 65536)
    public static let type18bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 131072)
    public static let type19bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 262144)
    public static let type20bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 524288)
    public static let type21bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 1048576)
    public static let type22bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 2097152)
    public static let type23bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 4194304)
    public static let type24bpc = ImageCompressionFixedRateFlagsEXT(rawValue: 8388608)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeNone, "typeNone"),
        (.type1bpc, "type1bpc"),
        (.type2bpc, "type2bpc"),
        (.type3bpc, "type3bpc"),
        (.type4bpc, "type4bpc"),
        (.type5bpc, "type5bpc"),
        (.type6bpc, "type6bpc"),
        (.type7bpc, "type7bpc"),
        (.type8bpc, "type8bpc"),
        (.type9bpc, "type9bpc"),
        (.type10bpc, "type10bpc"),
        (.type11bpc, "type11bpc"),
        (.type12bpc, "type12bpc"),
        (.type13bpc, "type13bpc"),
        (.type14bpc, "type14bpc"),
        (.type15bpc, "type15bpc"),
        (.type16bpc, "type16bpc"),
        (.type17bpc, "type17bpc"),
        (.type18bpc, "type18bpc"),
        (.type19bpc, "type19bpc"),
        (.type20bpc, "type20bpc"),
        (.type21bpc, "type21bpc"),
        (.type22bpc, "type22bpc"),
        (.type23bpc, "type23bpc"),
        (.type24bpc, "type24bpc"),
    ]
}

#if VK_USE_PLATFORM_METAL_EXT
public struct ExportMetalObjectTypeFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let metalDevice = ExportMetalObjectTypeFlagsEXT(rawValue: 1)
    public static let metalCommandQueue = ExportMetalObjectTypeFlagsEXT(rawValue: 2)
    public static let metalBuffer = ExportMetalObjectTypeFlagsEXT(rawValue: 4)
    public static let metalTexture = ExportMetalObjectTypeFlagsEXT(rawValue: 8)
    public static let metalIosurface = ExportMetalObjectTypeFlagsEXT(rawValue: 16)
    public static let metalSharedEvent = ExportMetalObjectTypeFlagsEXT(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.metalDevice, "metalDevice"),
        (.metalCommandQueue, "metalCommandQueue"),
        (.metalBuffer, "metalBuffer"),
        (.metalTexture, "metalTexture"),
        (.metalIosurface, "metalIosurface"),
        (.metalSharedEvent, "metalSharedEvent"),
    ]
}
#endif

public struct RenderingAttachmentFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let inputAttachmentFeedback = RenderingAttachmentFlagsKHR(rawValue: 1)
    public static let resolveSkipTransferFunction = RenderingAttachmentFlagsKHR(rawValue: 2)
    public static let resolveEnableTransferFunction = RenderingAttachmentFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.inputAttachmentFeedback, "inputAttachmentFeedback"),
        (.resolveSkipTransferFunction, "resolveSkipTransferFunction"),
        (.resolveEnableTransferFunction, "resolveEnableTransferFunction"),
    ]
}

public struct ResolveImageFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let skipTransferFunction = ResolveImageFlagsKHR(rawValue: 1)
    public static let enableTransferFunction = ResolveImageFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.skipTransferFunction, "skipTransferFunction"),
        (.enableTransferFunction, "enableTransferFunction"),
    ]
}

public struct DeviceAddressBindingFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let internalObject = DeviceAddressBindingFlagsEXT(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.internalObject, "internalObject"),
    ]
}

public struct OpticalFlowGridSizeFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeUnknown: OpticalFlowGridSizeFlagsNV  = []
    public static let type1x1 = OpticalFlowGridSizeFlagsNV(rawValue: 1)
    public static let type2x2 = OpticalFlowGridSizeFlagsNV(rawValue: 2)
    public static let type4x4 = OpticalFlowGridSizeFlagsNV(rawValue: 4)
    public static let type8x8 = OpticalFlowGridSizeFlagsNV(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeUnknown, "typeUnknown"),
        (.type1x1, "type1x1"),
        (.type2x2, "type2x2"),
        (.type4x4, "type4x4"),
        (.type8x8, "type8x8"),
    ]
}

public struct OpticalFlowUsageFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let unknown: OpticalFlowUsageFlagsNV  = []
    public static let input = OpticalFlowUsageFlagsNV(rawValue: 1)
    public static let output = OpticalFlowUsageFlagsNV(rawValue: 2)
    public static let hint = OpticalFlowUsageFlagsNV(rawValue: 4)
    public static let cost = OpticalFlowUsageFlagsNV(rawValue: 8)
    public static let globalFlow = OpticalFlowUsageFlagsNV(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.unknown, "unknown"),
        (.input, "input"),
        (.output, "output"),
        (.hint, "hint"),
        (.cost, "cost"),
        (.globalFlow, "globalFlow"),
    ]
}

public struct OpticalFlowSessionCreateFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let enableHint = OpticalFlowSessionCreateFlagsNV(rawValue: 1)
    public static let enableCost = OpticalFlowSessionCreateFlagsNV(rawValue: 2)
    public static let enableGlobalFlow = OpticalFlowSessionCreateFlagsNV(rawValue: 4)
    public static let allowRegions = OpticalFlowSessionCreateFlagsNV(rawValue: 8)
    public static let bothDirections = OpticalFlowSessionCreateFlagsNV(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.enableHint, "enableHint"),
        (.enableCost, "enableCost"),
        (.enableGlobalFlow, "enableGlobalFlow"),
        (.allowRegions, "allowRegions"),
        (.bothDirections, "bothDirections"),
    ]
}

public struct OpticalFlowExecuteFlagsNV: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let disableTemporalHints = OpticalFlowExecuteFlagsNV(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.disableTemporalHints, "disableTemporalHints"),
    ]
}

public struct FrameBoundaryFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let frameEnd = FrameBoundaryFlagsEXT(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.frameEnd, "frameEnd"),
    ]
}

public struct PresentScalingFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let oneToOne = PresentScalingFlagsKHR(rawValue: 1)
    public static let aspectRatioStretch = PresentScalingFlagsKHR(rawValue: 2)
    public static let stretch = PresentScalingFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.oneToOne, "oneToOne"),
        (.aspectRatioStretch, "aspectRatioStretch"),
        (.stretch, "stretch"),
    ]
}

public struct PresentGravityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let min = PresentGravityFlagsKHR(rawValue: 1)
    public static let max = PresentGravityFlagsKHR(rawValue: 2)
    public static let centered = PresentGravityFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.min, "min"),
        (.max, "max"),
        (.centered, "centered"),
    ]
}

public struct ShaderCreateFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeLinkStage = ShaderCreateFlagsEXT(rawValue: 1)
    public static let typeDescriptorHeap = ShaderCreateFlagsEXT(rawValue: 1024)
    public static let typeInstrumentShaderARM = ShaderCreateFlagsEXT(rawValue: 2048)
    public static let typeAllowVaryingSubgroupSize = ShaderCreateFlagsEXT(rawValue: 2)
    public static let typeRequireFullSubgroups = ShaderCreateFlagsEXT(rawValue: 4)
    public static let typeNoTaskShader = ShaderCreateFlagsEXT(rawValue: 8)
    public static let typeDispatchBase = ShaderCreateFlagsEXT(rawValue: 16)
    public static let typeFragmentShadingRateAttachment = ShaderCreateFlagsEXT(rawValue: 32)
    public static let typeFragmentDensityMapAttachment = ShaderCreateFlagsEXT(rawValue: 64)
    public static let typeIndirectBindable = ShaderCreateFlagsEXT(rawValue: 128)
    public static let typeOpacityMicromapDisallowMixedSpecialIndex = ShaderCreateFlagsEXT(rawValue: 4096)
    public static let type64BitIndexing = ShaderCreateFlagsEXT(rawValue: 32768)
    public static let typeIndependentSetsKHR = ShaderCreateFlagsEXT(rawValue: 262144)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeLinkStage, "typeLinkStage"),
        (.typeDescriptorHeap, "typeDescriptorHeap"),
        (.typeInstrumentShaderARM, "typeInstrumentShaderARM"),
        (.typeAllowVaryingSubgroupSize, "typeAllowVaryingSubgroupSize"),
        (.typeRequireFullSubgroups, "typeRequireFullSubgroups"),
        (.typeNoTaskShader, "typeNoTaskShader"),
        (.typeDispatchBase, "typeDispatchBase"),
        (.typeFragmentShadingRateAttachment, "typeFragmentShadingRateAttachment"),
        (.typeFragmentDensityMapAttachment, "typeFragmentDensityMapAttachment"),
        (.typeIndirectBindable, "typeIndirectBindable"),
        (.typeOpacityMicromapDisallowMixedSpecialIndex, "typeOpacityMicromapDisallowMixedSpecialIndex"),
        (.type64BitIndexing, "type64BitIndexing"),
        (.typeIndependentSetsKHR, "typeIndependentSetsKHR"),
    ]
}

public struct TileShadingRenderPassFlagsQCOM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let enable = TileShadingRenderPassFlagsQCOM(rawValue: 1)
    public static let perTileExecution = TileShadingRenderPassFlagsQCOM(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.enable, "enable"),
        (.perTileExecution, "perTileExecution"),
    ]
}

public struct PhysicalDeviceSchedulingControlsFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let shaderCoreCount = PhysicalDeviceSchedulingControlsFlagsARM(rawValue: 1)
    public static let dispatchParameters = PhysicalDeviceSchedulingControlsFlagsARM(rawValue: 2)

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.shaderCoreCount, "shaderCoreCount"),
        (.dispatchParameters, "dispatchParameters"),
    ]
}

#if VK_USE_PLATFORM_OHOS
public struct SurfaceCreateFlagsOHOS: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}
#endif

public struct PresentStageFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let queueOperationsEnd = PresentStageFlagsEXT(rawValue: 1)
    public static let requestDequeued = PresentStageFlagsEXT(rawValue: 2)
    public static let imageFirstPixelOut = PresentStageFlagsEXT(rawValue: 4)
    public static let imageFirstPixelVisible = PresentStageFlagsEXT(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.queueOperationsEnd, "queueOperationsEnd"),
        (.requestDequeued, "requestDequeued"),
        (.imageFirstPixelOut, "imageFirstPixelOut"),
        (.imageFirstPixelVisible, "imageFirstPixelVisible"),
    ]
}

public struct PastPresentationTimingFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let allowPartialResults = PastPresentationTimingFlagsEXT(rawValue: 1)
    public static let allowOutOfOrderResults = PastPresentationTimingFlagsEXT(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.allowPartialResults, "allowPartialResults"),
        (.allowOutOfOrderResults, "allowOutOfOrderResults"),
    ]
}

public struct PresentTimingInfoFlagsEXT: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let presentAtRelativeTime = PresentTimingInfoFlagsEXT(rawValue: 1)
    public static let presentAtNearestRefreshCycle = PresentTimingInfoFlagsEXT(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.presentAtRelativeTime, "presentAtRelativeTime"),
        (.presentAtNearestRefreshCycle, "presentAtNearestRefreshCycle"),
    ]
}

public struct PerformanceCounterDescriptionFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct ShaderInstrumentationValuesFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct DataGraphTOSAQualityFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let dataGraphTosaQualityAccelerated = DataGraphTOSAQualityFlagsARM(rawValue: 1)
    public static let dataGraphTosaQualityConformant = DataGraphTOSAQualityFlagsARM(rawValue: 2)
    public static let dataGraphTosaQualityExperimental = DataGraphTOSAQualityFlagsARM(rawValue: 4)
    public static let dataGraphTosaQualityDeprecated = DataGraphTOSAQualityFlagsARM(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.dataGraphTosaQualityAccelerated, "dataGraphTosaQualityAccelerated"),
        (.dataGraphTosaQualityConformant, "dataGraphTosaQualityConformant"),
        (.dataGraphTosaQualityExperimental, "dataGraphTosaQualityExperimental"),
        (.dataGraphTosaQualityDeprecated, "dataGraphTosaQualityDeprecated"),
    ]
}

public struct DataGraphOpticalFlowGridSizeFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeUnknown: DataGraphOpticalFlowGridSizeFlagsARM  = []
    public static let type1x1 = DataGraphOpticalFlowGridSizeFlagsARM(rawValue: 1)
    public static let type2x2 = DataGraphOpticalFlowGridSizeFlagsARM(rawValue: 2)
    public static let type4x4 = DataGraphOpticalFlowGridSizeFlagsARM(rawValue: 4)
    public static let type8x8 = DataGraphOpticalFlowGridSizeFlagsARM(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeUnknown, "typeUnknown"),
        (.type1x1, "type1x1"),
        (.type2x2, "type2x2"),
        (.type4x4, "type4x4"),
        (.type8x8, "type8x8"),
    ]
}

public struct DataGraphOpticalFlowImageUsageFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let unknown: DataGraphOpticalFlowImageUsageFlagsARM  = []
    public static let input = DataGraphOpticalFlowImageUsageFlagsARM(rawValue: 1)
    public static let output = DataGraphOpticalFlowImageUsageFlagsARM(rawValue: 2)
    public static let hint = DataGraphOpticalFlowImageUsageFlagsARM(rawValue: 4)
    public static let cost = DataGraphOpticalFlowImageUsageFlagsARM(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.unknown, "unknown"),
        (.input, "input"),
        (.output, "output"),
        (.hint, "hint"),
        (.cost, "cost"),
    ]
}

public struct DataGraphOpticalFlowCreateFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let enableHint = DataGraphOpticalFlowCreateFlagsARM(rawValue: 1)
    public static let enableCost = DataGraphOpticalFlowCreateFlagsARM(rawValue: 2)
    public static let reserved30 = DataGraphOpticalFlowCreateFlagsARM(rawValue: 1073741824)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.enableHint, "enableHint"),
        (.enableCost, "enableCost"),
        (.reserved30, "reserved30"),
    ]
}

public struct DataGraphOpticalFlowExecuteFlagsARM: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let disableTemporalHints = DataGraphOpticalFlowExecuteFlagsARM(rawValue: 1)
    public static let inputUnchanged = DataGraphOpticalFlowExecuteFlagsARM(rawValue: 2)
    public static let referenceUnchanged = DataGraphOpticalFlowExecuteFlagsARM(rawValue: 4)
    public static let inputIsPreviousReference = DataGraphOpticalFlowExecuteFlagsARM(rawValue: 8)
    public static let referenceIsPreviousInput = DataGraphOpticalFlowExecuteFlagsARM(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.disableTemporalHints, "disableTemporalHints"),
        (.inputUnchanged, "inputUnchanged"),
        (.referenceUnchanged, "referenceUnchanged"),
        (.inputIsPreviousReference, "inputIsPreviousReference"),
        (.referenceIsPreviousInput, "referenceIsPreviousInput"),
    ]
}

public struct VideoCodecOperationFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let none: VideoCodecOperationFlagsKHR  = []
    public static let encodeH264 = VideoCodecOperationFlagsKHR(rawValue: 65536)
    public static let encodeH265 = VideoCodecOperationFlagsKHR(rawValue: 131072)
    public static let decodeH264 = VideoCodecOperationFlagsKHR(rawValue: 1)
    public static let decodeH265 = VideoCodecOperationFlagsKHR(rawValue: 2)
    public static let decodeAv1 = VideoCodecOperationFlagsKHR(rawValue: 4)
    public static let encodeAv1 = VideoCodecOperationFlagsKHR(rawValue: 262144)
    public static let decodeVp9 = VideoCodecOperationFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.encodeH264, "encodeH264"),
        (.encodeH265, "encodeH265"),
        (.decodeH264, "decodeH264"),
        (.decodeH265, "decodeH265"),
        (.decodeAv1, "decodeAv1"),
        (.encodeAv1, "encodeAv1"),
        (.decodeVp9, "decodeVp9"),
    ]
}

public struct VideoCapabilityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let protectedContent = VideoCapabilityFlagsKHR(rawValue: 1)
    public static let separateReferenceImages = VideoCapabilityFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.protectedContent, "protectedContent"),
        (.separateReferenceImages, "separateReferenceImages"),
    ]
}

public struct VideoSessionCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let protectedContent = VideoSessionCreateFlagsKHR(rawValue: 1)
    public static let allowEncodeParameterOptimizations = VideoSessionCreateFlagsKHR(rawValue: 2)
    public static let inlineQueries = VideoSessionCreateFlagsKHR(rawValue: 4)
    public static let allowEncodeQuantizationDeltaMap = VideoSessionCreateFlagsKHR(rawValue: 8)
    public static let allowEncodeEmphasisMap = VideoSessionCreateFlagsKHR(rawValue: 16)
    public static let inlineSessionParameters = VideoSessionCreateFlagsKHR(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.protectedContent, "protectedContent"),
        (.allowEncodeParameterOptimizations, "allowEncodeParameterOptimizations"),
        (.inlineQueries, "inlineQueries"),
        (.allowEncodeQuantizationDeltaMap, "allowEncodeQuantizationDeltaMap"),
        (.allowEncodeEmphasisMap, "allowEncodeEmphasisMap"),
        (.inlineSessionParameters, "inlineSessionParameters"),
    ]
}

public struct VideoSessionParametersCreateFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let quantizationMapCompatible = VideoSessionParametersCreateFlagsKHR(rawValue: 1)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.quantizationMapCompatible, "quantizationMapCompatible"),
    ]
}

public struct VideoBeginCodingFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct VideoEndCodingFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct VideoCodingControlFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let reset = VideoCodingControlFlagsKHR(rawValue: 1)
    public static let encodeRateControl = VideoCodingControlFlagsKHR(rawValue: 2)
    public static let encodeQualityLevel = VideoCodingControlFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.reset, "reset"),
        (.encodeRateControl, "encodeRateControl"),
        (.encodeQualityLevel, "encodeQualityLevel"),
    ]
}

public struct VideoDecodeUsageFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let `default`: VideoDecodeUsageFlagsKHR  = []
    public static let transcoding = VideoDecodeUsageFlagsKHR(rawValue: 1)
    public static let offline = VideoDecodeUsageFlagsKHR(rawValue: 2)
    public static let streaming = VideoDecodeUsageFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.default, "default"),
        (.transcoding, "transcoding"),
        (.offline, "offline"),
        (.streaming, "streaming"),
    ]
}

public struct VideoDecodeCapabilityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let dpbAndOutputCoincide = VideoDecodeCapabilityFlagsKHR(rawValue: 1)
    public static let dpbAndOutputDistinct = VideoDecodeCapabilityFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.dpbAndOutputCoincide, "dpbAndOutputCoincide"),
        (.dpbAndOutputDistinct, "dpbAndOutputDistinct"),
    ]
}

public struct VideoDecodeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct VideoDecodeH264PictureLayoutFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let progressive: VideoDecodeH264PictureLayoutFlagsKHR  = []
    public static let interlacedInterleavedLines = VideoDecodeH264PictureLayoutFlagsKHR(rawValue: 1)
    public static let interlacedSeparatePlanes = VideoDecodeH264PictureLayoutFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.progressive, "progressive"),
        (.interlacedInterleavedLines, "interlacedInterleavedLines"),
        (.interlacedSeparatePlanes, "interlacedSeparatePlanes"),
    ]
}

public struct VideoEncodeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let intraRefresh = VideoEncodeFlagsKHR(rawValue: 4)
    public static let withQuantizationDeltaMap = VideoEncodeFlagsKHR(rawValue: 1)
    public static let withEmphasisMap = VideoEncodeFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.intraRefresh, "intraRefresh"),
        (.withQuantizationDeltaMap, "withQuantizationDeltaMap"),
        (.withEmphasisMap, "withEmphasisMap"),
    ]
}

public struct VideoEncodeUsageFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let `default`: VideoEncodeUsageFlagsKHR  = []
    public static let transcoding = VideoEncodeUsageFlagsKHR(rawValue: 1)
    public static let streaming = VideoEncodeUsageFlagsKHR(rawValue: 2)
    public static let recording = VideoEncodeUsageFlagsKHR(rawValue: 4)
    public static let conferencing = VideoEncodeUsageFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.default, "default"),
        (.transcoding, "transcoding"),
        (.streaming, "streaming"),
        (.recording, "recording"),
        (.conferencing, "conferencing"),
    ]
}

public struct VideoEncodeContentFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let `default`: VideoEncodeContentFlagsKHR  = []
    public static let camera = VideoEncodeContentFlagsKHR(rawValue: 1)
    public static let desktop = VideoEncodeContentFlagsKHR(rawValue: 2)
    public static let rendered = VideoEncodeContentFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.default, "default"),
        (.camera, "camera"),
        (.desktop, "desktop"),
        (.rendered, "rendered"),
    ]
}

public struct VideoEncodeCapabilityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let precedingExternallyEncodedBytes = VideoEncodeCapabilityFlagsKHR(rawValue: 1)
    public static let insufficientBitstreamBufferRangeDetection = VideoEncodeCapabilityFlagsKHR(rawValue: 2)
    public static let quantizationDeltaMap = VideoEncodeCapabilityFlagsKHR(rawValue: 4)
    public static let emphasisMap = VideoEncodeCapabilityFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.precedingExternallyEncodedBytes, "precedingExternallyEncodedBytes"),
        (.insufficientBitstreamBufferRangeDetection, "insufficientBitstreamBufferRangeDetection"),
        (.quantizationDeltaMap, "quantizationDeltaMap"),
        (.emphasisMap, "emphasisMap"),
    ]
}

public struct VideoEncodeFeedbackFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let bitstreamBufferOffset = VideoEncodeFeedbackFlagsKHR(rawValue: 1)
    public static let bitstreamBytesWritten = VideoEncodeFeedbackFlagsKHR(rawValue: 2)
    public static let bitstreamHasOverrides = VideoEncodeFeedbackFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.bitstreamBufferOffset, "bitstreamBufferOffset"),
        (.bitstreamBytesWritten, "bitstreamBytesWritten"),
        (.bitstreamHasOverrides, "bitstreamHasOverrides"),
    ]
}

public struct VideoEncodeRateControlFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
    ]
}

public struct VideoEncodeRateControlModeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let `default`: VideoEncodeRateControlModeFlagsKHR  = []
    public static let disabled = VideoEncodeRateControlModeFlagsKHR(rawValue: 1)
    public static let cbr = VideoEncodeRateControlModeFlagsKHR(rawValue: 2)
    public static let vbr = VideoEncodeRateControlModeFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.default, "default"),
        (.disabled, "disabled"),
        (.cbr, "cbr"),
        (.vbr, "vbr"),
    ]
}

public struct VideoEncodeIntraRefreshModeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let none: VideoEncodeIntraRefreshModeFlagsKHR  = []
    public static let perPicturePartition = VideoEncodeIntraRefreshModeFlagsKHR(rawValue: 1)
    public static let blockBased = VideoEncodeIntraRefreshModeFlagsKHR(rawValue: 2)
    public static let blockRowBased = VideoEncodeIntraRefreshModeFlagsKHR(rawValue: 4)
    public static let blockColumnBased = VideoEncodeIntraRefreshModeFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
        (.perPicturePartition, "perPicturePartition"),
        (.blockBased, "blockBased"),
        (.blockRowBased, "blockRowBased"),
        (.blockColumnBased, "blockColumnBased"),
    ]
}

public struct VideoChromaSubsamplingFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeInvalid: VideoChromaSubsamplingFlagsKHR  = []
    public static let typeMonochrome = VideoChromaSubsamplingFlagsKHR(rawValue: 1)
    public static let type420 = VideoChromaSubsamplingFlagsKHR(rawValue: 2)
    public static let type422 = VideoChromaSubsamplingFlagsKHR(rawValue: 4)
    public static let type444 = VideoChromaSubsamplingFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeInvalid, "typeInvalid"),
        (.typeMonochrome, "typeMonochrome"),
        (.type420, "type420"),
        (.type422, "type422"),
        (.type444, "type444"),
    ]
}

public struct VideoComponentBitDepthFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let typeInvalid: VideoComponentBitDepthFlagsKHR  = []
    public static let type8 = VideoComponentBitDepthFlagsKHR(rawValue: 1)
    public static let type10 = VideoComponentBitDepthFlagsKHR(rawValue: 4)
    public static let type12 = VideoComponentBitDepthFlagsKHR(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.typeInvalid, "typeInvalid"),
        (.type8, "type8"),
        (.type10, "type10"),
        (.type12, "type12"),
    ]
}

public struct VideoEncodeH264CapabilityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let hrdCompliance = VideoEncodeH264CapabilityFlagsKHR(rawValue: 1)
    public static let predictionWeightTableGenerated = VideoEncodeH264CapabilityFlagsKHR(rawValue: 2)
    public static let rowUnalignedSlice = VideoEncodeH264CapabilityFlagsKHR(rawValue: 4)
    public static let differentSliceType = VideoEncodeH264CapabilityFlagsKHR(rawValue: 8)
    public static let bFrameInL0List = VideoEncodeH264CapabilityFlagsKHR(rawValue: 16)
    public static let bFrameInL1List = VideoEncodeH264CapabilityFlagsKHR(rawValue: 32)
    public static let perPictureTypeMinMaxQp = VideoEncodeH264CapabilityFlagsKHR(rawValue: 64)
    public static let perSliceConstantQp = VideoEncodeH264CapabilityFlagsKHR(rawValue: 128)
    public static let generatePrefixNalu = VideoEncodeH264CapabilityFlagsKHR(rawValue: 256)
    public static let bPictureIntraRefresh = VideoEncodeH264CapabilityFlagsKHR(rawValue: 1024)
    public static let mbQpDiffWraparound = VideoEncodeH264CapabilityFlagsKHR(rawValue: 512)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.hrdCompliance, "hrdCompliance"),
        (.predictionWeightTableGenerated, "predictionWeightTableGenerated"),
        (.rowUnalignedSlice, "rowUnalignedSlice"),
        (.differentSliceType, "differentSliceType"),
        (.bFrameInL0List, "bFrameInL0List"),
        (.bFrameInL1List, "bFrameInL1List"),
        (.perPictureTypeMinMaxQp, "perPictureTypeMinMaxQp"),
        (.perSliceConstantQp, "perSliceConstantQp"),
        (.generatePrefixNalu, "generatePrefixNalu"),
        (.bPictureIntraRefresh, "bPictureIntraRefresh"),
        (.mbQpDiffWraparound, "mbQpDiffWraparound"),
    ]
}

public struct VideoEncodeH264StdFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let separateColorPlaneFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 1)
    public static let qpprimeYZeroTransformBypassFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 2)
    public static let scalingMatrixPresentFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 4)
    public static let chromaQpIndexOffset = VideoEncodeH264StdFlagsKHR(rawValue: 8)
    public static let secondChromaQpIndexOffset = VideoEncodeH264StdFlagsKHR(rawValue: 16)
    public static let picInitQpMinus26 = VideoEncodeH264StdFlagsKHR(rawValue: 32)
    public static let weightedPredFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 64)
    public static let weightedBipredIdcExplicit = VideoEncodeH264StdFlagsKHR(rawValue: 128)
    public static let weightedBipredIdcImplicit = VideoEncodeH264StdFlagsKHR(rawValue: 256)
    public static let transform8x8ModeFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 512)
    public static let directSpatialMvPredFlagUnset = VideoEncodeH264StdFlagsKHR(rawValue: 1024)
    public static let entropyCodingModeFlagUnset = VideoEncodeH264StdFlagsKHR(rawValue: 2048)
    public static let entropyCodingModeFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 4096)
    public static let direct8x8InferenceFlagUnset = VideoEncodeH264StdFlagsKHR(rawValue: 8192)
    public static let constrainedIntraPredFlagSet = VideoEncodeH264StdFlagsKHR(rawValue: 16384)
    public static let deblockingFilterDisabled = VideoEncodeH264StdFlagsKHR(rawValue: 32768)
    public static let deblockingFilterEnabled = VideoEncodeH264StdFlagsKHR(rawValue: 65536)
    public static let deblockingFilterPartial = VideoEncodeH264StdFlagsKHR(rawValue: 131072)
    public static let sliceQpDelta = VideoEncodeH264StdFlagsKHR(rawValue: 524288)
    public static let differentSliceQpDelta = VideoEncodeH264StdFlagsKHR(rawValue: 1048576)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.separateColorPlaneFlagSet, "separateColorPlaneFlagSet"),
        (.qpprimeYZeroTransformBypassFlagSet, "qpprimeYZeroTransformBypassFlagSet"),
        (.scalingMatrixPresentFlagSet, "scalingMatrixPresentFlagSet"),
        (.chromaQpIndexOffset, "chromaQpIndexOffset"),
        (.secondChromaQpIndexOffset, "secondChromaQpIndexOffset"),
        (.picInitQpMinus26, "picInitQpMinus26"),
        (.weightedPredFlagSet, "weightedPredFlagSet"),
        (.weightedBipredIdcExplicit, "weightedBipredIdcExplicit"),
        (.weightedBipredIdcImplicit, "weightedBipredIdcImplicit"),
        (.transform8x8ModeFlagSet, "transform8x8ModeFlagSet"),
        (.directSpatialMvPredFlagUnset, "directSpatialMvPredFlagUnset"),
        (.entropyCodingModeFlagUnset, "entropyCodingModeFlagUnset"),
        (.entropyCodingModeFlagSet, "entropyCodingModeFlagSet"),
        (.direct8x8InferenceFlagUnset, "direct8x8InferenceFlagUnset"),
        (.constrainedIntraPredFlagSet, "constrainedIntraPredFlagSet"),
        (.deblockingFilterDisabled, "deblockingFilterDisabled"),
        (.deblockingFilterEnabled, "deblockingFilterEnabled"),
        (.deblockingFilterPartial, "deblockingFilterPartial"),
        (.sliceQpDelta, "sliceQpDelta"),
        (.differentSliceQpDelta, "differentSliceQpDelta"),
    ]
}

public struct VideoEncodeH264RateControlFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let attemptHrdCompliance = VideoEncodeH264RateControlFlagsKHR(rawValue: 1)
    public static let regularGop = VideoEncodeH264RateControlFlagsKHR(rawValue: 2)
    public static let referencePatternFlat = VideoEncodeH264RateControlFlagsKHR(rawValue: 4)
    public static let referencePatternDyadic = VideoEncodeH264RateControlFlagsKHR(rawValue: 8)
    public static let temporalLayerPatternDyadic = VideoEncodeH264RateControlFlagsKHR(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.attemptHrdCompliance, "attemptHrdCompliance"),
        (.regularGop, "regularGop"),
        (.referencePatternFlat, "referencePatternFlat"),
        (.referencePatternDyadic, "referencePatternDyadic"),
        (.temporalLayerPatternDyadic, "temporalLayerPatternDyadic"),
    ]
}

public struct VideoEncodeH265CapabilityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let hrdCompliance = VideoEncodeH265CapabilityFlagsKHR(rawValue: 1)
    public static let predictionWeightTableGenerated = VideoEncodeH265CapabilityFlagsKHR(rawValue: 2)
    public static let rowUnalignedSliceSegment = VideoEncodeH265CapabilityFlagsKHR(rawValue: 4)
    public static let differentSliceSegmentType = VideoEncodeH265CapabilityFlagsKHR(rawValue: 8)
    public static let bFrameInL0List = VideoEncodeH265CapabilityFlagsKHR(rawValue: 16)
    public static let bFrameInL1List = VideoEncodeH265CapabilityFlagsKHR(rawValue: 32)
    public static let perPictureTypeMinMaxQp = VideoEncodeH265CapabilityFlagsKHR(rawValue: 64)
    public static let perSliceSegmentConstantQp = VideoEncodeH265CapabilityFlagsKHR(rawValue: 128)
    public static let multipleTilesPerSliceSegment = VideoEncodeH265CapabilityFlagsKHR(rawValue: 256)
    public static let multipleSliceSegmentsPerTile = VideoEncodeH265CapabilityFlagsKHR(rawValue: 512)
    public static let bPictureIntraRefresh = VideoEncodeH265CapabilityFlagsKHR(rawValue: 2048)
    public static let cuQpDiffWraparound = VideoEncodeH265CapabilityFlagsKHR(rawValue: 1024)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.hrdCompliance, "hrdCompliance"),
        (.predictionWeightTableGenerated, "predictionWeightTableGenerated"),
        (.rowUnalignedSliceSegment, "rowUnalignedSliceSegment"),
        (.differentSliceSegmentType, "differentSliceSegmentType"),
        (.bFrameInL0List, "bFrameInL0List"),
        (.bFrameInL1List, "bFrameInL1List"),
        (.perPictureTypeMinMaxQp, "perPictureTypeMinMaxQp"),
        (.perSliceSegmentConstantQp, "perSliceSegmentConstantQp"),
        (.multipleTilesPerSliceSegment, "multipleTilesPerSliceSegment"),
        (.multipleSliceSegmentsPerTile, "multipleSliceSegmentsPerTile"),
        (.bPictureIntraRefresh, "bPictureIntraRefresh"),
        (.cuQpDiffWraparound, "cuQpDiffWraparound"),
    ]
}

public struct VideoEncodeH265StdFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let separateColorPlaneFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 1)
    public static let sampleAdaptiveOffsetEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 2)
    public static let scalingListDataPresentFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 4)
    public static let pcmEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 8)
    public static let spsTemporalMvpEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 16)
    public static let initQpMinus26 = VideoEncodeH265StdFlagsKHR(rawValue: 32)
    public static let weightedPredFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 64)
    public static let weightedBipredFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 128)
    public static let log2ParallelMergeLevelMinus2 = VideoEncodeH265StdFlagsKHR(rawValue: 256)
    public static let signDataHidingEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 512)
    public static let transformSkipEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 1024)
    public static let transformSkipEnabledFlagUnset = VideoEncodeH265StdFlagsKHR(rawValue: 2048)
    public static let ppsSliceChromaQpOffsetsPresentFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 4096)
    public static let transquantBypassEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 8192)
    public static let constrainedIntraPredFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 16384)
    public static let entropyCodingSyncEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 32768)
    public static let deblockingFilterOverrideEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 65536)
    public static let dependentSliceSegmentsEnabledFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 131072)
    public static let dependentSliceSegmentFlagSet = VideoEncodeH265StdFlagsKHR(rawValue: 262144)
    public static let sliceQpDelta = VideoEncodeH265StdFlagsKHR(rawValue: 524288)
    public static let differentSliceQpDelta = VideoEncodeH265StdFlagsKHR(rawValue: 1048576)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.separateColorPlaneFlagSet, "separateColorPlaneFlagSet"),
        (.sampleAdaptiveOffsetEnabledFlagSet, "sampleAdaptiveOffsetEnabledFlagSet"),
        (.scalingListDataPresentFlagSet, "scalingListDataPresentFlagSet"),
        (.pcmEnabledFlagSet, "pcmEnabledFlagSet"),
        (.spsTemporalMvpEnabledFlagSet, "spsTemporalMvpEnabledFlagSet"),
        (.initQpMinus26, "initQpMinus26"),
        (.weightedPredFlagSet, "weightedPredFlagSet"),
        (.weightedBipredFlagSet, "weightedBipredFlagSet"),
        (.log2ParallelMergeLevelMinus2, "log2ParallelMergeLevelMinus2"),
        (.signDataHidingEnabledFlagSet, "signDataHidingEnabledFlagSet"),
        (.transformSkipEnabledFlagSet, "transformSkipEnabledFlagSet"),
        (.transformSkipEnabledFlagUnset, "transformSkipEnabledFlagUnset"),
        (.ppsSliceChromaQpOffsetsPresentFlagSet, "ppsSliceChromaQpOffsetsPresentFlagSet"),
        (.transquantBypassEnabledFlagSet, "transquantBypassEnabledFlagSet"),
        (.constrainedIntraPredFlagSet, "constrainedIntraPredFlagSet"),
        (.entropyCodingSyncEnabledFlagSet, "entropyCodingSyncEnabledFlagSet"),
        (.deblockingFilterOverrideEnabledFlagSet, "deblockingFilterOverrideEnabledFlagSet"),
        (.dependentSliceSegmentsEnabledFlagSet, "dependentSliceSegmentsEnabledFlagSet"),
        (.dependentSliceSegmentFlagSet, "dependentSliceSegmentFlagSet"),
        (.sliceQpDelta, "sliceQpDelta"),
        (.differentSliceQpDelta, "differentSliceQpDelta"),
    ]
}

public struct VideoEncodeH265RateControlFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let attemptHrdCompliance = VideoEncodeH265RateControlFlagsKHR(rawValue: 1)
    public static let regularGop = VideoEncodeH265RateControlFlagsKHR(rawValue: 2)
    public static let referencePatternFlat = VideoEncodeH265RateControlFlagsKHR(rawValue: 4)
    public static let referencePatternDyadic = VideoEncodeH265RateControlFlagsKHR(rawValue: 8)
    public static let temporalSubLayerPatternDyadic = VideoEncodeH265RateControlFlagsKHR(rawValue: 16)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.attemptHrdCompliance, "attemptHrdCompliance"),
        (.regularGop, "regularGop"),
        (.referencePatternFlat, "referencePatternFlat"),
        (.referencePatternDyadic, "referencePatternDyadic"),
        (.temporalSubLayerPatternDyadic, "temporalSubLayerPatternDyadic"),
    ]
}

public struct VideoEncodeH265CtbSizeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let type16 = VideoEncodeH265CtbSizeFlagsKHR(rawValue: 1)
    public static let type32 = VideoEncodeH265CtbSizeFlagsKHR(rawValue: 2)
    public static let type64 = VideoEncodeH265CtbSizeFlagsKHR(rawValue: 4)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.type16, "type16"),
        (.type32, "type32"),
        (.type64, "type64"),
    ]
}

public struct VideoEncodeH265TransformBlockSizeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let type4 = VideoEncodeH265TransformBlockSizeFlagsKHR(rawValue: 1)
    public static let type8 = VideoEncodeH265TransformBlockSizeFlagsKHR(rawValue: 2)
    public static let type16 = VideoEncodeH265TransformBlockSizeFlagsKHR(rawValue: 4)
    public static let type32 = VideoEncodeH265TransformBlockSizeFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.type4, "type4"),
        (.type8, "type8"),
        (.type16, "type16"),
        (.type32, "type32"),
    ]
}

public struct VideoEncodeAV1CapabilityFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let videoEncodeAv1CapabilityPerRateControlGroupMinMaxQIndex = VideoEncodeAV1CapabilityFlagsKHR(rawValue: 1)
    public static let videoEncodeAv1CapabilityGenerateObuExtensionHeader = VideoEncodeAV1CapabilityFlagsKHR(rawValue: 2)
    public static let videoEncodeAv1CapabilityPrimaryReferenceCdfOnly = VideoEncodeAV1CapabilityFlagsKHR(rawValue: 4)
    public static let videoEncodeAv1CapabilityFrameSizeOverride = VideoEncodeAV1CapabilityFlagsKHR(rawValue: 8)
    public static let videoEncodeAv1CapabilityMotionVectorScaling = VideoEncodeAV1CapabilityFlagsKHR(rawValue: 16)
    public static let videoEncodeAv1CapabilityCompoundPredictionIntraRefresh = VideoEncodeAV1CapabilityFlagsKHR(rawValue: 32)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.videoEncodeAv1CapabilityPerRateControlGroupMinMaxQIndex, "videoEncodeAv1CapabilityPerRateControlGroupMinMaxQIndex"),
        (.videoEncodeAv1CapabilityGenerateObuExtensionHeader, "videoEncodeAv1CapabilityGenerateObuExtensionHeader"),
        (.videoEncodeAv1CapabilityPrimaryReferenceCdfOnly, "videoEncodeAv1CapabilityPrimaryReferenceCdfOnly"),
        (.videoEncodeAv1CapabilityFrameSizeOverride, "videoEncodeAv1CapabilityFrameSizeOverride"),
        (.videoEncodeAv1CapabilityMotionVectorScaling, "videoEncodeAv1CapabilityMotionVectorScaling"),
        (.videoEncodeAv1CapabilityCompoundPredictionIntraRefresh, "videoEncodeAv1CapabilityCompoundPredictionIntraRefresh"),
    ]
}

public struct VideoEncodeAV1StdFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let videoEncodeAv1StdUniformTileSpacingFlagSet = VideoEncodeAV1StdFlagsKHR(rawValue: 1)
    public static let videoEncodeAv1StdSkipModePresentUnset = VideoEncodeAV1StdFlagsKHR(rawValue: 2)
    public static let videoEncodeAv1StdPrimaryRefFrame = VideoEncodeAV1StdFlagsKHR(rawValue: 4)
    public static let videoEncodeAv1StdDeltaQ = VideoEncodeAV1StdFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.videoEncodeAv1StdUniformTileSpacingFlagSet, "videoEncodeAv1StdUniformTileSpacingFlagSet"),
        (.videoEncodeAv1StdSkipModePresentUnset, "videoEncodeAv1StdSkipModePresentUnset"),
        (.videoEncodeAv1StdPrimaryRefFrame, "videoEncodeAv1StdPrimaryRefFrame"),
        (.videoEncodeAv1StdDeltaQ, "videoEncodeAv1StdDeltaQ"),
    ]
}

public struct VideoEncodeAV1RateControlFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let videoEncodeAv1RateControlRegularGop = VideoEncodeAV1RateControlFlagsKHR(rawValue: 1)
    public static let videoEncodeAv1RateControlTemporalLayerPatternDyadic = VideoEncodeAV1RateControlFlagsKHR(rawValue: 2)
    public static let videoEncodeAv1RateControlReferencePatternFlat = VideoEncodeAV1RateControlFlagsKHR(rawValue: 4)
    public static let videoEncodeAv1RateControlReferencePatternDyadic = VideoEncodeAV1RateControlFlagsKHR(rawValue: 8)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.videoEncodeAv1RateControlRegularGop, "videoEncodeAv1RateControlRegularGop"),
        (.videoEncodeAv1RateControlTemporalLayerPatternDyadic, "videoEncodeAv1RateControlTemporalLayerPatternDyadic"),
        (.videoEncodeAv1RateControlReferencePatternFlat, "videoEncodeAv1RateControlReferencePatternFlat"),
        (.videoEncodeAv1RateControlReferencePatternDyadic, "videoEncodeAv1RateControlReferencePatternDyadic"),
    ]
}

public struct VideoEncodeAV1SuperblockSizeFlagsKHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt32

    public static let videoEncodeAv1SuperblockSize64 = VideoEncodeAV1SuperblockSizeFlagsKHR(rawValue: 1)
    public static let videoEncodeAv1SuperblockSize128 = VideoEncodeAV1SuperblockSizeFlagsKHR(rawValue: 2)

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.videoEncodeAv1SuperblockSize64, "videoEncodeAv1SuperblockSize64"),
        (.videoEncodeAv1SuperblockSize128, "videoEncodeAv1SuperblockSize128"),
    ]
}

public struct AccessFlags3KHR: OptionSet, StringConvertibleOptionSet {
    public let rawValue: UInt64

    public static let none: AccessFlags3KHR  = []

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    static let descriptions: [(Self, String)] = [
        (.none, "none"),
    ]
}

