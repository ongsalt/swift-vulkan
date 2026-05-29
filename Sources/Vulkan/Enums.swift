public enum ImageLayout: UInt32 {
    case undefined = 0
    case general = 1
    case colorAttachmentOptimal = 2
    case depthStencilAttachmentOptimal = 3
    case depthStencilReadOnlyOptimal = 4
    case shaderReadOnlyOptimal = 5
    case transferSrcOptimal = 6
    case transferDstOptimal = 7
    case preinitialized = 8
}

public enum AttachmentLoadOp: UInt32 {
    case load = 0
    case clear = 1
    case dontCare = 2
}

public enum AttachmentStoreOp: UInt32 {
    case store = 0
    case dontCare = 1
}

public enum ImageType: UInt32 {
    case type1d = 0
    case type2d = 1
    case type3d = 2
}

public enum ImageTiling: UInt32 {
    case optimal = 0
    case linear = 1
}

public enum ImageViewType: UInt32 {
    case type1d = 0
    case type2d = 1
    case type3d = 2
    case typeCube = 3
    case type1dArray = 4
    case type2dArray = 5
    case typeCubeArray = 6
}

public enum CommandBufferLevel: UInt32 {
    case primary = 0
    case secondary = 1
}

public enum ComponentSwizzle: UInt32 {
    case identity = 0
    case zero = 1
    case one = 2
    case r = 3
    case g = 4
    case b = 5
    case a = 6
}

public enum DescriptorType: UInt32 {
    case sampler = 0
    case combinedImageSampler = 1
    case sampledImage = 2
    case storageImage = 3
    case uniformTexelBuffer = 4
    case storageTexelBuffer = 5
    case uniformBuffer = 6
    case storageBuffer = 7
    case uniformBufferDynamic = 8
    case storageBufferDynamic = 9
    case inputAttachment = 10
}

public enum QueryType: UInt32 {
    case occlusion = 0
    case pipelineStatistics = 1
    case timestamp = 2
}

public enum BorderColor: UInt32 {
    case floatTransparentBlack = 0
    case intTransparentBlack = 1
    case floatOpaqueBlack = 2
    case intOpaqueBlack = 3
    case floatOpaqueWhite = 4
    case intOpaqueWhite = 5
}

public enum PipelineBindPoint: UInt32 {
    case graphics = 0
    case compute = 1
}

public enum PipelineCacheHeaderVersion: UInt32 {
    case one = 1
}

public enum PrimitiveTopology: UInt32 {
    case pointList = 0
    case lineList = 1
    case lineStrip = 2
    case triangleList = 3
    case triangleStrip = 4
    case triangleFan = 5
    case lineListWithAdjacency = 6
    case lineStripWithAdjacency = 7
    case triangleListWithAdjacency = 8
    case triangleStripWithAdjacency = 9
    case patchList = 10
}

public enum SharingMode: UInt32 {
    case exclusive = 0
    case concurrent = 1
}

public enum IndexType: UInt32 {
    case uint16 = 0
    case uint32 = 1
}

public enum Filter: UInt32 {
    case nearest = 0
    case linear = 1
}

public enum SamplerMipmapMode: UInt32 {
    case nearest = 0
    case linear = 1
}

public enum SamplerAddressMode: UInt32 {
    case `repeat` = 0
    case mirroredRepeat = 1
    case clampToEdge = 2
    case clampToBorder = 3
}

public enum CompareOp: UInt32 {
    case never = 0
    case less = 1
    case equal = 2
    case lessOrEqual = 3
    case greater = 4
    case notEqual = 5
    case greaterOrEqual = 6
    case always = 7
}

public enum PolygonMode: UInt32 {
    case fill = 0
    case line = 1
    case point = 2
}

public enum FrontFace: UInt32 {
    case counterClockwise = 0
    case clockwise = 1
}

public enum BlendFactor: UInt32 {
    case zero = 0
    case one = 1
    case srcColor = 2
    case oneMinusSrcColor = 3
    case dstColor = 4
    case oneMinusDstColor = 5
    case srcAlpha = 6
    case oneMinusSrcAlpha = 7
    case dstAlpha = 8
    case oneMinusDstAlpha = 9
    case constantColor = 10
    case oneMinusConstantColor = 11
    case constantAlpha = 12
    case oneMinusConstantAlpha = 13
    case srcAlphaSaturate = 14
    case src1Color = 15
    case oneMinusSrc1Color = 16
    case src1Alpha = 17
    case oneMinusSrc1Alpha = 18
}

public enum BlendOp: UInt32 {
    case add = 0
    case subtract = 1
    case reverseSubtract = 2
    case min = 3
    case max = 4
}

public enum StencilOp: UInt32 {
    case keep = 0
    case zero = 1
    case replace = 2
    case incrementAndClamp = 3
    case decrementAndClamp = 4
    case invert = 5
    case incrementAndWrap = 6
    case decrementAndWrap = 7
}

public enum LogicOp: UInt32 {
    case clear = 0
    case and = 1
    case andReverse = 2
    case copy = 3
    case andInverted = 4
    case noOp = 5
    case xor = 6
    case or = 7
    case nor = 8
    case equivalent = 9
    case invert = 10
    case orReverse = 11
    case copyInverted = 12
    case orInverted = 13
    case nand = 14
    case set = 15
}

public enum InternalAllocationType: UInt32 {
    case executable = 0
}

public enum SystemAllocationScope: UInt32 {
    case command = 0
    case object = 1
    case cache = 2
    case device = 3
    case instance = 4
}

public enum PhysicalDeviceType: UInt32 {
    case other = 0
    case integratedGpu = 1
    case discreteGpu = 2
    case virtualGpu = 3
    case cpu = 4
}

public enum VertexInputRate: UInt32 {
    case vertex = 0
    case instance = 1
}

public enum Format: UInt32 {
    case undefined = 0
    case r4g4UnormPack8 = 1
    case r4g4b4a4UnormPack16 = 2
    case b4g4r4a4UnormPack16 = 3
    case r5g6b5UnormPack16 = 4
    case b5g6r5UnormPack16 = 5
    case r5g5b5a1UnormPack16 = 6
    case b5g5r5a1UnormPack16 = 7
    case a1r5g5b5UnormPack16 = 8
    case r8Unorm = 9
    case r8Snorm = 10
    case r8Uscaled = 11
    case r8Sscaled = 12
    case r8Uint = 13
    case r8Sint = 14
    case r8Srgb = 15
    case r8g8Unorm = 16
    case r8g8Snorm = 17
    case r8g8Uscaled = 18
    case r8g8Sscaled = 19
    case r8g8Uint = 20
    case r8g8Sint = 21
    case r8g8Srgb = 22
    case r8g8b8Unorm = 23
    case r8g8b8Snorm = 24
    case r8g8b8Uscaled = 25
    case r8g8b8Sscaled = 26
    case r8g8b8Uint = 27
    case r8g8b8Sint = 28
    case r8g8b8Srgb = 29
    case b8g8r8Unorm = 30
    case b8g8r8Snorm = 31
    case b8g8r8Uscaled = 32
    case b8g8r8Sscaled = 33
    case b8g8r8Uint = 34
    case b8g8r8Sint = 35
    case b8g8r8Srgb = 36
    case r8g8b8a8Unorm = 37
    case r8g8b8a8Snorm = 38
    case r8g8b8a8Uscaled = 39
    case r8g8b8a8Sscaled = 40
    case r8g8b8a8Uint = 41
    case r8g8b8a8Sint = 42
    case r8g8b8a8Srgb = 43
    case b8g8r8a8Unorm = 44
    case b8g8r8a8Snorm = 45
    case b8g8r8a8Uscaled = 46
    case b8g8r8a8Sscaled = 47
    case b8g8r8a8Uint = 48
    case b8g8r8a8Sint = 49
    case b8g8r8a8Srgb = 50
    case a8b8g8r8UnormPack32 = 51
    case a8b8g8r8SnormPack32 = 52
    case a8b8g8r8UscaledPack32 = 53
    case a8b8g8r8SscaledPack32 = 54
    case a8b8g8r8UintPack32 = 55
    case a8b8g8r8SintPack32 = 56
    case a8b8g8r8SrgbPack32 = 57
    case a2r10g10b10UnormPack32 = 58
    case a2r10g10b10SnormPack32 = 59
    case a2r10g10b10UscaledPack32 = 60
    case a2r10g10b10SscaledPack32 = 61
    case a2r10g10b10UintPack32 = 62
    case a2r10g10b10SintPack32 = 63
    case a2b10g10r10UnormPack32 = 64
    case a2b10g10r10SnormPack32 = 65
    case a2b10g10r10UscaledPack32 = 66
    case a2b10g10r10SscaledPack32 = 67
    case a2b10g10r10UintPack32 = 68
    case a2b10g10r10SintPack32 = 69
    case r16Unorm = 70
    case r16Snorm = 71
    case r16Uscaled = 72
    case r16Sscaled = 73
    case r16Uint = 74
    case r16Sint = 75
    case r16Sfloat = 76
    case r16g16Unorm = 77
    case r16g16Snorm = 78
    case r16g16Uscaled = 79
    case r16g16Sscaled = 80
    case r16g16Uint = 81
    case r16g16Sint = 82
    case r16g16Sfloat = 83
    case r16g16b16Unorm = 84
    case r16g16b16Snorm = 85
    case r16g16b16Uscaled = 86
    case r16g16b16Sscaled = 87
    case r16g16b16Uint = 88
    case r16g16b16Sint = 89
    case r16g16b16Sfloat = 90
    case r16g16b16a16Unorm = 91
    case r16g16b16a16Snorm = 92
    case r16g16b16a16Uscaled = 93
    case r16g16b16a16Sscaled = 94
    case r16g16b16a16Uint = 95
    case r16g16b16a16Sint = 96
    case r16g16b16a16Sfloat = 97
    case r32Uint = 98
    case r32Sint = 99
    case r32Sfloat = 100
    case r32g32Uint = 101
    case r32g32Sint = 102
    case r32g32Sfloat = 103
    case r32g32b32Uint = 104
    case r32g32b32Sint = 105
    case r32g32b32Sfloat = 106
    case r32g32b32a32Uint = 107
    case r32g32b32a32Sint = 108
    case r32g32b32a32Sfloat = 109
    case r64Uint = 110
    case r64Sint = 111
    case r64Sfloat = 112
    case r64g64Uint = 113
    case r64g64Sint = 114
    case r64g64Sfloat = 115
    case r64g64b64Uint = 116
    case r64g64b64Sint = 117
    case r64g64b64Sfloat = 118
    case r64g64b64a64Uint = 119
    case r64g64b64a64Sint = 120
    case r64g64b64a64Sfloat = 121
    case b10g11r11UfloatPack32 = 122
    case e5b9g9r9UfloatPack32 = 123
    case d16Unorm = 124
    case x8D24UnormPack32 = 125
    case d32Sfloat = 126
    case s8Uint = 127
    case d16UnormS8Uint = 128
    case d24UnormS8Uint = 129
    case d32SfloatS8Uint = 130
    case bc1RgbUnormBlock = 131
    case bc1RgbSrgbBlock = 132
    case bc1RgbaUnormBlock = 133
    case bc1RgbaSrgbBlock = 134
    case bc2UnormBlock = 135
    case bc2SrgbBlock = 136
    case bc3UnormBlock = 137
    case bc3SrgbBlock = 138
    case bc4UnormBlock = 139
    case bc4SnormBlock = 140
    case bc5UnormBlock = 141
    case bc5SnormBlock = 142
    case bc6hUfloatBlock = 143
    case bc6hSfloatBlock = 144
    case bc7UnormBlock = 145
    case bc7SrgbBlock = 146
    case etc2R8g8b8UnormBlock = 147
    case etc2R8g8b8SrgbBlock = 148
    case etc2R8g8b8a1UnormBlock = 149
    case etc2R8g8b8a1SrgbBlock = 150
    case etc2R8g8b8a8UnormBlock = 151
    case etc2R8g8b8a8SrgbBlock = 152
    case eacR11UnormBlock = 153
    case eacR11SnormBlock = 154
    case eacR11g11UnormBlock = 155
    case eacR11g11SnormBlock = 156
    case astc4x4UnormBlock = 157
    case astc4x4SrgbBlock = 158
    case astc5x4UnormBlock = 159
    case astc5x4SrgbBlock = 160
    case astc5x5UnormBlock = 161
    case astc5x5SrgbBlock = 162
    case astc6x5UnormBlock = 163
    case astc6x5SrgbBlock = 164
    case astc6x6UnormBlock = 165
    case astc6x6SrgbBlock = 166
    case astc8x5UnormBlock = 167
    case astc8x5SrgbBlock = 168
    case astc8x6UnormBlock = 169
    case astc8x6SrgbBlock = 170
    case astc8x8UnormBlock = 171
    case astc8x8SrgbBlock = 172
    case astc10x5UnormBlock = 173
    case astc10x5SrgbBlock = 174
    case astc10x6UnormBlock = 175
    case astc10x6SrgbBlock = 176
    case astc10x8UnormBlock = 177
    case astc10x8SrgbBlock = 178
    case astc10x10UnormBlock = 179
    case astc10x10SrgbBlock = 180
    case astc12x10UnormBlock = 181
    case astc12x10SrgbBlock = 182
    case astc12x12UnormBlock = 183
    case astc12x12SrgbBlock = 184
}

public enum StructureType: UInt32 {
    case applicationInfo = 0
    case instanceCreateInfo = 1
    case deviceQueueCreateInfo = 2
    case deviceCreateInfo = 3
    case submitInfo = 4
    case memoryAllocateInfo = 5
    case mappedMemoryRange = 6
    case bindSparseInfo = 7
    case fenceCreateInfo = 8
    case semaphoreCreateInfo = 9
    case eventCreateInfo = 10
    case queryPoolCreateInfo = 11
    case bufferCreateInfo = 12
    case bufferViewCreateInfo = 13
    case imageCreateInfo = 14
    case imageViewCreateInfo = 15
    case shaderModuleCreateInfo = 16
    case pipelineCacheCreateInfo = 17
    case pipelineShaderStageCreateInfo = 18
    case pipelineVertexInputStateCreateInfo = 19
    case pipelineInputAssemblyStateCreateInfo = 20
    case pipelineTessellationStateCreateInfo = 21
    case pipelineViewportStateCreateInfo = 22
    case pipelineRasterizationStateCreateInfo = 23
    case pipelineMultisampleStateCreateInfo = 24
    case pipelineDepthStencilStateCreateInfo = 25
    case pipelineColorBlendStateCreateInfo = 26
    case pipelineDynamicStateCreateInfo = 27
    case graphicsPipelineCreateInfo = 28
    case computePipelineCreateInfo = 29
    case pipelineLayoutCreateInfo = 30
    case samplerCreateInfo = 31
    case descriptorSetLayoutCreateInfo = 32
    case descriptorPoolCreateInfo = 33
    case descriptorSetAllocateInfo = 34
    case writeDescriptorSet = 35
    case copyDescriptorSet = 36
    case framebufferCreateInfo = 37
    case renderPassCreateInfo = 38
    case commandPoolCreateInfo = 39
    case commandBufferAllocateInfo = 40
    case commandBufferInheritanceInfo = 41
    case commandBufferBeginInfo = 42
    case renderPassBeginInfo = 43
    case bufferMemoryBarrier = 44
    case imageMemoryBarrier = 45
    case memoryBarrier = 46
    case loaderInstanceCreateInfo = 47
    case loaderDeviceCreateInfo = 48
}

public enum SubpassContents: UInt32 {
    case inline = 0
    case secondaryCommandBuffers = 1
}

public enum Result: Int32, Error {
    case success = 0
    case notReady = 1
    case timeout = 2
    case eventSet = 3
    case eventReset = 4
    case incomplete = 5
    case errorOutOfHostMemory = -1
    case errorOutOfDeviceMemory = -2
    case errorInitializationFailed = -3
    case errorDeviceLost = -4
    case errorMemoryMapFailed = -5
    case errorLayerNotPresent = -6
    case errorExtensionNotPresent = -7
    case errorFeatureNotPresent = -8
    case errorIncompatibleDriver = -9
    case errorTooManyObjects = -10
    case errorFormatNotSupported = -11
    case errorFragmentedPool = -12
    case errorUnknown = -13
}

public enum DynamicState: UInt32 {
    case viewport = 0
    case scissor = 1
    case lineWidth = 2
    case depthBias = 3
    case blendConstants = 4
    case depthBounds = 5
    case stencilCompareMask = 6
    case stencilWriteMask = 7
    case stencilReference = 8
}

public enum DescriptorUpdateTemplateType: UInt32 {
    case descriptorSet = 0
}

public enum ObjectType: UInt32 {
    case unknown = 0
    case instance = 1
    case physicalDevice = 2
    case device = 3
    case queue = 4
    case semaphore = 5
    case commandBuffer = 6
    case fence = 7
    case deviceMemory = 8
    case buffer = 9
    case image = 10
    case event = 11
    case queryPool = 12
    case bufferView = 13
    case imageView = 14
    case shaderModule = 15
    case pipelineCache = 16
    case pipelineLayout = 17
    case renderPass = 18
    case pipeline = 19
    case descriptorSetLayout = 20
    case sampler = 21
    case descriptorPool = 22
    case descriptorSet = 23
    case framebuffer = 24
    case commandPool = 25
}

public enum RayTracingInvocationReorderModeEXT: UInt32 {
    case none = 0
    case reorder = 1
}

public enum RayTracingLssIndexingModeNV: UInt32 {
    case list = 0
    case successive = 1
}

public enum RayTracingLssPrimitiveEndCapsModeNV: UInt32 {
    case none = 0
    case chained = 1
}

public enum DirectDriverLoadingModeLUNARG: UInt32 {
    case exclusive = 0
    case inclusive = 1
}

public enum AntiLagModeAMD: UInt32 {
    case driverControl = 0
    case on = 1
    case off = 2
}

public enum AntiLagStageAMD: UInt32 {
    case input = 0
    case present = 1
}

public enum SemaphoreType: UInt32 {
    case binary = 0
    case timeline = 1
}

public enum PresentModeKHR: UInt32 {
    case immediate = 0
    case mailbox = 1
    case fifo = 2
    case fifoRelaxed = 3
}

public enum ColorSpaceKHR: UInt32 {
    case srgbNonlinear = 0
}

public enum DisplaySurfaceStereoTypeNV: UInt32 {
    case none = 0
    case onboardDin = 1
    case hdmi3d = 2
    case inbandDisplayport = 3
}

public enum TimeDomainKHR: UInt32 {
    case device = 0
    case clockMonotonic = 1
    case clockMonotonicRaw = 2
    case queryPerformanceCounter = 3
}

public enum DebugReportObjectTypeEXT: UInt32 {
    case unknown = 0
    case instance = 1
    case physicalDevice = 2
    case device = 3
    case queue = 4
    case semaphore = 5
    case commandBuffer = 6
    case fence = 7
    case deviceMemory = 8
    case buffer = 9
    case image = 10
    case event = 11
    case queryPool = 12
    case bufferView = 13
    case imageView = 14
    case shaderModule = 15
    case pipelineCache = 16
    case pipelineLayout = 17
    case renderPass = 18
    case pipeline = 19
    case descriptorSetLayout = 20
    case sampler = 21
    case descriptorPool = 22
    case descriptorSet = 23
    case framebuffer = 24
    case commandPool = 25
    case surfaceKhr = 26
    case swapchainKhr = 27
    case debugReportCallbackExt = 28
    case displayKhr = 29
    case displayModeKhr = 30
    case validationCacheExt = 33
}

public enum DeviceMemoryReportEventTypeEXT: UInt32 {
    case allocate = 0
    case free = 1
    case `import` = 2
    case unimport = 3
    case allocationFailed = 4
}

public enum RasterizationOrderAMD: UInt32 {
    case strict = 0
    case relaxed = 1
}

public enum ClusterAccelerationStructureTypeNV: UInt32 {
    case clustersBottomLevel = 0
    case triangleCluster = 1
    case triangleClusterTemplate = 2
}

public enum ClusterAccelerationStructureOpTypeNV: UInt32 {
    case moveObjects = 0
    case buildClustersBottomLevel = 1
    case buildTriangleCluster = 2
    case buildTriangleClusterTemplate = 3
    case instantiateTriangleCluster = 4
    case getClusterTemplateIndices = 5
}

public enum ClusterAccelerationStructureOpModeNV: UInt32 {
    case implicitDestinations = 0
    case explicitDestinations = 1
    case computeSizes = 2
}

public enum ValidationCheckEXT: UInt32 {
    case all = 0
    case shaders = 1
}

public enum ValidationFeatureEnableEXT: UInt32 {
    case gpuAssisted = 0
    case gpuAssistedReserveBindingSlot = 1
    case bestPractices = 2
    case debugPrintf = 3
    case synchronizationValidation = 4
}

public enum ValidationFeatureDisableEXT: UInt32 {
    case all = 0
    case shaders = 1
    case threadSafety = 2
    case apiParameters = 3
    case objectLifetimes = 4
    case coreChecks = 5
    case uniqueHandles = 6
    case shaderValidationCache = 7
}

public enum LayerSettingTypeEXT: UInt32 {
    case bool32 = 0
    case int32 = 1
    case int64 = 2
    case uint32 = 3
    case uint64 = 4
    case float32 = 5
    case float64 = 6
    case string = 7
}

public enum IndirectCommandsTokenTypeNV: UInt32 {
    case shaderGroup = 0
    case stateFlags = 1
    case indexBuffer = 2
    case vertexBuffer = 3
    case pushConstant = 4
    case drawIndexed = 5
    case draw = 6
    case drawTasks = 7
}

public enum DisplayPowerStateEXT: UInt32 {
    case off = 0
    case suspend = 1
    case on = 2
}

public enum DeviceEventTypeEXT: UInt32 {
    case displayHotplug = 0
}

public enum DisplayEventTypeEXT: UInt32 {
    case firstPixelOut = 0
}

public enum ViewportCoordinateSwizzleNV: UInt32 {
    case positiveX = 0
    case negativeX = 1
    case positiveY = 2
    case negativeY = 3
    case positiveZ = 4
    case negativeZ = 5
    case positiveW = 6
    case negativeW = 7
}

public enum DiscardRectangleModeEXT: UInt32 {
    case inclusive = 0
    case exclusive = 1
}

public enum PointClippingBehavior: UInt32 {
    case allClipPlanes = 0
    case userClipPlanesOnly = 1
}

public enum SamplerReductionMode: UInt32 {
    case weightedAverage = 0
    case min = 1
    case max = 2
}

public enum TessellationDomainOrigin: UInt32 {
    case upperLeft = 0
    case lowerLeft = 1
}

public enum SamplerYcbcrModelConversion: UInt32 {
    case rgbIdentity = 0
    case ycbcrIdentity = 1
    case ycbcr709 = 2
    case ycbcr601 = 3
    case ycbcr2020 = 4
}

public enum SamplerYcbcrRange: UInt32 {
    case ituFull = 0
    case ituNarrow = 1
}

public enum ChromaLocation: UInt32 {
    case cositedEven = 0
    case midpoint = 1
}

public enum BlendOverlapEXT: UInt32 {
    case uncorrelated = 0
    case disjoint = 1
    case conjoint = 2
}

public enum CoverageModulationModeNV: UInt32 {
    case none = 0
    case rgb = 1
    case alpha = 2
    case rgba = 3
}

public enum CoverageReductionModeNV: UInt32 {
    case merge = 0
    case truncate = 1
}

public enum ValidationCacheHeaderVersionEXT: UInt32 {
    case one = 1
}

public enum ShaderInfoTypeAMD: UInt32 {
    case statistics = 0
    case binary = 1
    case disassembly = 2
}

public enum QueueGlobalPriority: UInt32 {
    case low = 128
    case medium = 256
    case high = 512
    case realtime = 1024
}

public enum ConservativeRasterizationModeEXT: UInt32 {
    case disabled = 0
    case overestimate = 1
    case underestimate = 2
}

public enum VendorId: UInt32 {
    case khronos = 0x10000
    case viv = 0x10001
    case vsi = 0x10002
    case kazan = 0x10003
    case codeplay = 0x10004
    case mesa = 0x10005
    case pocl = 0x10006
    case mobileye = 0x10007
}

public enum DriverId: UInt32 {
    case amdProprietary = 1
    case amdOpenSource = 2
    case mesaRadv = 3
    case nvidiaProprietary = 4
    case intelProprietaryWindows = 5
    case intelOpenSourceMESA = 6
    case imaginationProprietary = 7
    case qualcommProprietary = 8
    case armProprietary = 9
    case googleSwiftshader = 10
    case ggpProprietary = 11
    case broadcomProprietary = 12
    case mesaLlvmpipe = 13
    case moltenvk = 14
    case coreaviProprietary = 15
    case juiceProprietary = 16
    case verisiliconProprietary = 17
    case mesaTurnip = 18
    case mesaV3dv = 19
    case mesaPanvk = 20
    case samsungProprietary = 21
    case mesaVenus = 22
    case mesaDozen = 23
    case mesaNvk = 24
    case imaginationOpenSourceMESA = 25
    case mesaHoneykrisp = 26
    case vulkanScEmulationOnVulkan = 27
    case mesaKosmickrisp = 28
}

public enum ShadingRatePaletteEntryNV: UInt32 {
    case typeNoInvocations = 0
    case type16InvocationsPerPixel = 1
    case type8InvocationsPerPixel = 2
    case type4InvocationsPerPixel = 3
    case type2InvocationsPerPixel = 4
    case type1InvocationPerPixel = 5
    case type1InvocationPer2x1Pixels = 6
    case type1InvocationPer1x2Pixels = 7
    case type1InvocationPer2x2Pixels = 8
    case type1InvocationPer4x2Pixels = 9
    case type1InvocationPer2x4Pixels = 10
    case type1InvocationPer4x4Pixels = 11
}

public enum CoarseSampleOrderTypeNV: UInt32 {
    case `default` = 0
    case custom = 1
    case pixelMajor = 2
    case sampleMajor = 3
}

public enum CopyAccelerationStructureModeKHR: UInt32 {
    case clone = 0
    case compact = 1
}

public enum BuildAccelerationStructureModeKHR: UInt32 {
    case build = 0
    case update = 1
}

public enum AccelerationStructureTypeKHR: UInt32 {
    case topLevel = 0
    case bottomLevel = 1
    case generic = 2
}

public enum GeometryTypeKHR: UInt32 {
    case triangles = 0
    case aabbs = 1
    case instances = 2
}

public enum AccelerationStructureMemoryRequirementsTypeNV: UInt32 {
    case object = 0
    case buildScratch = 1
    case updateScratch = 2
}

public enum AccelerationStructureBuildTypeKHR: UInt32 {
    case host = 0
    case device = 1
    case hostOrDevice = 2
}

public enum RayTracingShaderGroupTypeKHR: UInt32 {
    case general = 0
    case trianglesHitGroup = 1
    case proceduralHitGroup = 2
}

public enum AccelerationStructureCompatibilityKHR: UInt32 {
    case compatible = 0
    case incompatible = 1
}

public enum ShaderGroupShaderKHR: UInt32 {
    case general = 0
    case closestHit = 1
    case anyHit = 2
    case intersection = 3
}

public enum MemoryOverallocationBehaviorAMD: UInt32 {
    case `default` = 0
    case allowed = 1
    case disallowed = 2
}

public enum PerformanceCounterScopeKHR: UInt32 {
    case commandBuffer = 0
    case renderPass = 1
    case command = 2
}

public enum PerformanceCounterUnitKHR: UInt32 {
    case generic = 0
    case percentage = 1
    case nanoseconds = 2
    case bytes = 3
    case bytesPerSecond = 4
    case kelvin = 5
    case watts = 6
    case volts = 7
    case amps = 8
    case hertz = 9
    case cycles = 10
}

public enum PerformanceCounterStorageKHR: UInt32 {
    case int32 = 0
    case int64 = 1
    case uint32 = 2
    case uint64 = 3
    case float32 = 4
    case float64 = 5
}

public enum PerformanceConfigurationTypeINTEL: UInt32 {
    case commandQueueMetricsDiscoveryActivated = 0
}

public enum QueryPoolSamplingModeINTEL: UInt32 {
    case manual = 0
}

public enum PerformanceOverrideTypeINTEL: UInt32 {
    case nullHardware = 0
    case flushGpuCaches = 1
}

public enum PerformanceParameterTypeINTEL: UInt32 {
    case hwCountersSupported = 0
    case streamMarkerValidBits = 1
}

public enum PerformanceValueTypeINTEL: UInt32 {
    case uint32 = 0
    case uint64 = 1
    case float = 2
    case bool = 3
    case string = 4
}

public enum ShaderFloatControlsIndependence: UInt32 {
    case type32BitOnly = 0
    case typeAll = 1
    case typeNone = 2
}

public enum PipelineExecutableStatisticFormatKHR: UInt32 {
    case bool32 = 0
    case int64 = 1
    case uint64 = 2
    case float64 = 3
}

public enum LineRasterizationMode: UInt32 {
    case `default` = 0
    case rectangular = 1
    case bresenham = 2
    case rectangularSmooth = 3
}

public enum FragmentShadingRateCombinerOpKHR: UInt32 {
    case keep = 0
    case replace = 1
    case min = 2
    case max = 3
    case mul = 4
}

public enum FragmentShadingRateNV: UInt32 {
    case type1InvocationPerPixel = 0
    case type1InvocationPer1x2Pixels = 1
    case type1InvocationPer2x1Pixels = 4
    case type1InvocationPer2x2Pixels = 5
    case type1InvocationPer2x4Pixels = 6
    case type1InvocationPer4x2Pixels = 9
    case type1InvocationPer4x4Pixels = 10
    case type2InvocationsPerPixel = 11
    case type4InvocationsPerPixel = 12
    case type8InvocationsPerPixel = 13
    case type16InvocationsPerPixel = 14
    case typeNoInvocations = 15
}

public enum FragmentShadingRateTypeNV: UInt32 {
    case fragmentSize = 0
    case enums = 1
}

public enum SubpassMergeStatusEXT: UInt32 {
    case merged = 0
    case disallowed = 1
    case notMergedSideEffects = 2
    case notMergedSamplesMismatch = 3
    case notMergedViewsMismatch = 4
    case notMergedAliasing = 5
    case notMergedDependencies = 6
    case notMergedIncompatibleInputAttachment = 7
    case notMergedTooManyAttachments = 8
    case notMergedInsufficientStorage = 9
    case notMergedDepthStencilCount = 10
    case notMergedResolveAttachmentReuse = 11
    case notMergedSingleSubpass = 12
    case notMergedUnspecified = 13
}

public enum ProvokingVertexModeEXT: UInt32 {
    case firstVertex = 0
    case lastVertex = 1
}

public enum AccelerationStructureMotionInstanceTypeNV: UInt32 {
    case `static` = 0
    case matrixMotion = 1
    case srtMotion = 2
}

public enum DeviceAddressBindingTypeEXT: UInt32 {
    case bind = 0
    case unbind = 1
}

public enum QueryResultStatusKHR: Int32 {
    case error = -1
    case notReady = 0
    case complete = 1
}

public enum VideoEncodeTuningModeKHR: UInt32 {
    case `default` = 0
    case highQuality = 1
    case lowLatency = 2
    case ultraLowLatency = 3
    case lossless = 4
}

public enum PartitionedAccelerationStructureOpTypeNV: UInt32 {
    case writeInstance = 0
    case updateInstance = 1
    case writePartitionTranslation = 2
}

public enum VideoEncodeAV1PredictionModeKHR: UInt32 {
    case videoEncodeAv1PredictionModeIntraOnly = 0
    case videoEncodeAv1PredictionModeSingleReference = 1
    case videoEncodeAv1PredictionModeUnidirectionalCompound = 2
    case videoEncodeAv1PredictionModeBidirectionalCompound = 3
}

public enum VideoEncodeAV1RateControlGroupKHR: UInt32 {
    case videoEncodeAv1RateControlGroupIntra = 0
    case videoEncodeAv1RateControlGroupPredictive = 1
    case videoEncodeAv1RateControlGroupBipredictive = 2
}

public enum PipelineRobustnessBufferBehavior: UInt32 {
    case deviceDefault = 0
    case disabled = 1
    case robustBufferAccess = 2
    case robustBufferAccess2 = 3
}

public enum PipelineRobustnessImageBehavior: UInt32 {
    case deviceDefault = 0
    case disabled = 1
    case robustImageAccess = 2
    case robustImageAccess2 = 3
}

public enum OpticalFlowPerformanceLevelNV: UInt32 {
    case unknown = 0
    case slow = 1
    case medium = 2
    case fast = 3
}

public enum OpticalFlowSessionBindingPointNV: UInt32 {
    case unknown = 0
    case input = 1
    case reference = 2
    case hint = 3
    case flowVector = 4
    case backwardFlowVector = 5
    case cost = 6
    case backwardCost = 7
    case globalFlow = 8
}

public enum DepthBiasRepresentationEXT: UInt32 {
    case leastRepresentableValueFormat = 0
    case leastRepresentableValueForceUnorm = 1
    case float = 2
}

public enum DeviceFaultAddressTypeKHR: UInt32 {
    case none = 0
    case readInvalid = 1
    case writeInvalid = 2
    case executeInvalid = 3
    case instructionPointerUnknown = 4
    case instructionPointerInvalid = 5
    case instructionPointerFault = 6
}

public enum DeviceFaultVendorBinaryHeaderVersionKHR: UInt32 {
    case one = 1
}

public enum IndirectExecutionSetInfoTypeEXT: UInt32 {
    case pipelines = 0
    case shaderObjects = 1
}

public enum IndirectCommandsTokenTypeEXT: UInt32 {
    case executionSet = 0
    case pushConstant = 1
    case sequenceIndex = 2
    case indexBuffer = 3
    case vertexBuffer = 4
    case drawIndexed = 5
    case draw = 6
    case drawIndexedCount = 7
    case drawCount = 8
    case dispatch = 9
}

public enum ShaderCodeTypeEXT: UInt32 {
    case binary = 0
    case spirv = 1
}

public enum ScopeKHR: UInt32 {
    case device = 1
    case workgroup = 2
    case subgroup = 3
    case queueFamily = 5
}

public enum ComponentTypeKHR: UInt32 {
    case float16 = 0
    case float32 = 1
    case float64 = 2
    case sint8 = 3
    case sint16 = 4
    case sint32 = 5
    case sint64 = 6
    case uint8 = 7
    case uint16 = 8
    case uint32 = 9
    case uint64 = 10
}

public enum CubicFilterWeightsQCOM: UInt32 {
    case catmullRom = 0
    case zeroTangentCardinal = 1
    case bSpline = 2
    case mitchellNetravali = 3
}

public enum BlockMatchWindowCompareModeQCOM: UInt32 {
    case min = 0
    case max = 1
}

public enum PhysicalDeviceLayeredApiKHR: UInt32 {
    case vulkan = 0
    case d3d12 = 1
    case metal = 2
    case opengl = 3
    case opengles = 4
}

public enum LayeredDriverUnderlyingApiMSFT: UInt32 {
    case none = 0
    case d3d12 = 1
}

public enum LatencyMarkerNV: UInt32 {
    case simulationStart = 0
    case simulationEnd = 1
    case rendersubmitStart = 2
    case rendersubmitEnd = 3
    case presentStart = 4
    case presentEnd = 5
    case inputSample = 6
    case triggerFlash = 7
    case outOfBandRendersubmitStart = 8
    case outOfBandRendersubmitEnd = 9
    case outOfBandPresentStart = 10
    case outOfBandPresentEnd = 11
}

public enum OutOfBandQueueTypeNV: UInt32 {
    case render = 0
    case present = 1
}

public enum DepthClampModeEXT: UInt32 {
    case viewportRange = 0
    case userDefinedRange = 1
}

public enum CooperativeVectorMatrixLayoutNV: UInt32 {
    case rowMajor = 0
    case columnMajor = 1
    case inferencingOptimal = 2
    case trainingOptimal = 3
}

public enum TensorTilingARM: UInt32 {
    case optimal = 0
    case linear = 1
}

public enum DefaultVertexAttributeValueKHR: UInt32 {
    case zeroZeroZeroZero = 0
    case zeroZeroZeroOne = 1
}

public enum DataGraphPipelineSessionBindPointARM: UInt32 {
    case transient = 0
}

public enum DataGraphPipelineSessionBindPointTypeARM: UInt32 {
    case memory = 0
}

public enum DataGraphPipelinePropertyARM: UInt32 {
    case creationLog = 0
    case identifier = 1
}

public enum PhysicalDeviceDataGraphProcessingEngineTypeARM: UInt32 {
    case `default` = 0
}

public enum PhysicalDeviceDataGraphOperationTypeARM: UInt32 {
    case spirvExtendedInstructionSet = 0
}

public enum DataGraphModelCacheTypeQCOM: UInt32 {
    case genericBinary = 0
}

public enum PerfHintTypeQCOM: UInt32 {
    case `default` = 0
    case frequencyMin = 1
    case frequencyMax = 2
    case frequencyScaled = 3
}

public enum ThrottleHintTypeSEC: UInt32 {
    case `default` = 0
    case low = 1
    case high = 2
}

public enum DescriptorMappingSourceEXT: UInt32 {
    case heapWithConstantOffset = 0
    case heapWithPushIndex = 1
    case heapWithIndirectIndex = 2
    case heapWithIndirectIndexArray = 3
    case resourceHeapData = 4
    case pushData = 5
    case pushAddress = 6
    case indirectAddress = 7
}

public enum DataGraphTOSALevelARM: UInt32 {
    case dataGraphTosaLevelNone = 0
    case dataGraphTosaLevel8k = 1
}

public enum DataGraphOpticalFlowPerformanceLevelARM: UInt32 {
    case unknown = 0
    case slow = 1
    case medium = 2
    case fast = 3
}

public typealias DataGraphPipelineNodeConnectionTypeARM = EmptyEnum<UInt32>

public typealias DataGraphPipelineNodeTypeARM = EmptyEnum<UInt32>

public enum NeuralAcceleratorStatisticsModeARM: UInt32 {
    case disabled = 0
    case statistics0 = 1
    case statistics1 = 2
}

