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
    case presentSrcKHR = 1000001002
    case videoDecodeDstKHR = 1000024000
    case videoDecodeSrcKHR = 1000024001
    case videoDecodeDpbKHR = 1000024002
    case sharedPresentKHR = 1000111000
    case fragmentDensityMapOptimalEXT = 1000218000
    case fragmentShadingRateAttachmentOptimalKHR = 1000164003
    case videoEncodeDstKHR = 1000299000
    case videoEncodeSrcKHR = 1000299001
    case videoEncodeDpbKHR = 1000299002
    case attachmentFeedbackLoopOptimalEXT = 1000339000
    case tensorAliasingARM = 1000460000
    case videoEncodeQuantizationMapKHR = 1000553000
    case zeroInitializedEXT = 1000620000
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
    case drmFormatModifierEXT = 1000158000
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
    case accelerationStructureKHR = 1000150000
    case accelerationStructureNV = 1000165000
    case sampleWeightImageQCOM = 1000440000
    case blockMatchImageQCOM = 1000440001
    case tensorARM = 1000460000
    case mutableEXT = 1000351000
    case partitionedAccelerationStructureNV = 1000570000
}

public enum QueryType: UInt32 {
    case occlusion = 0
    case pipelineStatistics = 1
    case timestamp = 2
    case resultStatusOnlyKHR = 1000023000
    case transformFeedbackStreamEXT = 1000028004
    case performanceQueryKHR = 1000116000
    case accelerationStructureCompactedSizeKHR = 1000150000
    case accelerationStructureSerializationSizeKHR = 1000150001
    case accelerationStructureCompactedSizeNV = 1000165000
    case timeElapsedQCOM = 1000173000
    case performanceQueryINTEL = 1000210000
    case videoEncodeFeedbackKHR = 1000299000
    case meshPrimitivesGeneratedEXT = 1000328000
    case primitivesGeneratedEXT = 1000382000
    case accelerationStructureSerializationBottomLevelPointersKHR = 1000386000
    case accelerationStructureSizeKHR = 1000386001
    case micromapSerializationSizeEXT = 1000396000
    case micromapCompactedSizeEXT = 1000396001
}

public enum BorderColor: UInt32 {
    case floatTransparentBlack = 0
    case intTransparentBlack = 1
    case floatOpaqueBlack = 2
    case intOpaqueBlack = 3
    case floatOpaqueWhite = 4
    case intOpaqueWhite = 5
    case floatCustomEXT = 1000287003
    case intCustomEXT = 1000287004
}

public enum PipelineBindPoint: UInt32 {
    case graphics = 0
    case compute = 1
    case rayTracingKHR = 1000165000
    case subpassShadingHUAWEI = 1000369003
    case dataGraphARM = 1000507000
}

public enum PipelineCacheHeaderVersion: UInt32 {
    case one = 1
    case dataGraphQCOM = 1000629000
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
    case noneKHR = 1000165000
}

public enum Filter: UInt32 {
    case nearest = 0
    case linear = 1
    case cubicEXT = 1000015000
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
    case mirrorClampToEdge = 4
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
    case fillRectangleNV = 1000153000
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
    case zeroEXT = 1000148000
    case srcEXT = 1000148001
    case dstEXT = 1000148002
    case srcOverEXT = 1000148003
    case dstOverEXT = 1000148004
    case srcInEXT = 1000148005
    case dstInEXT = 1000148006
    case srcOutEXT = 1000148007
    case dstOutEXT = 1000148008
    case srcAtopEXT = 1000148009
    case dstAtopEXT = 1000148010
    case xorEXT = 1000148011
    case multiplyEXT = 1000148012
    case screenEXT = 1000148013
    case overlayEXT = 1000148014
    case darkenEXT = 1000148015
    case lightenEXT = 1000148016
    case colordodgeEXT = 1000148017
    case colorburnEXT = 1000148018
    case hardlightEXT = 1000148019
    case softlightEXT = 1000148020
    case differenceEXT = 1000148021
    case exclusionEXT = 1000148022
    case invertEXT = 1000148023
    case invertRgbEXT = 1000148024
    case lineardodgeEXT = 1000148025
    case linearburnEXT = 1000148026
    case vividlightEXT = 1000148027
    case linearlightEXT = 1000148028
    case pinlightEXT = 1000148029
    case hardmixEXT = 1000148030
    case hslHueEXT = 1000148031
    case hslSaturationEXT = 1000148032
    case hslColorEXT = 1000148033
    case hslLuminosityEXT = 1000148034
    case plusEXT = 1000148035
    case plusClampedEXT = 1000148036
    case plusClampedAlphaEXT = 1000148037
    case plusDarkerEXT = 1000148038
    case minusEXT = 1000148039
    case minusClampedEXT = 1000148040
    case contrastEXT = 1000148041
    case invertOvgEXT = 1000148042
    case redEXT = 1000148043
    case greenEXT = 1000148044
    case blueEXT = 1000148045
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
    case pvrtc12bppUnormBlockIMG = 1000054000
    case pvrtc14bppUnormBlockIMG = 1000054001
    case pvrtc22bppUnormBlockIMG = 1000054002
    case pvrtc24bppUnormBlockIMG = 1000054003
    case pvrtc12bppSrgbBlockIMG = 1000054004
    case pvrtc14bppSrgbBlockIMG = 1000054005
    case pvrtc22bppSrgbBlockIMG = 1000054006
    case pvrtc24bppSrgbBlockIMG = 1000054007
    case astc3x3x3UnormBlockEXT = 1000288000
    case astc3x3x3SrgbBlockEXT = 1000288001
    case astc3x3x3SfloatBlockEXT = 1000288002
    case astc4x3x3UnormBlockEXT = 1000288003
    case astc4x3x3SrgbBlockEXT = 1000288004
    case astc4x3x3SfloatBlockEXT = 1000288005
    case astc4x4x3UnormBlockEXT = 1000288006
    case astc4x4x3SrgbBlockEXT = 1000288007
    case astc4x4x3SfloatBlockEXT = 1000288008
    case astc4x4x4UnormBlockEXT = 1000288009
    case astc4x4x4SrgbBlockEXT = 1000288010
    case astc4x4x4SfloatBlockEXT = 1000288011
    case astc5x4x4UnormBlockEXT = 1000288012
    case astc5x4x4SrgbBlockEXT = 1000288013
    case astc5x4x4SfloatBlockEXT = 1000288014
    case astc5x5x4UnormBlockEXT = 1000288015
    case astc5x5x4SrgbBlockEXT = 1000288016
    case astc5x5x4SfloatBlockEXT = 1000288017
    case astc5x5x5UnormBlockEXT = 1000288018
    case astc5x5x5SrgbBlockEXT = 1000288019
    case astc5x5x5SfloatBlockEXT = 1000288020
    case astc6x5x5UnormBlockEXT = 1000288021
    case astc6x5x5SrgbBlockEXT = 1000288022
    case astc6x5x5SfloatBlockEXT = 1000288023
    case astc6x6x5UnormBlockEXT = 1000288024
    case astc6x6x5SrgbBlockEXT = 1000288025
    case astc6x6x5SfloatBlockEXT = 1000288026
    case astc6x6x6UnormBlockEXT = 1000288027
    case astc6x6x6SrgbBlockEXT = 1000288028
    case astc6x6x6SfloatBlockEXT = 1000288029
    case r8BoolARM = 1000460000
    case r16SfloatFpencodingBfloat16ARM = 1000460001
    case r8SfloatFpencodingFloat8e4m3ARM = 1000460002
    case r8SfloatFpencodingFloat8e5m2ARM = 1000460003
    case r16g16Sfixed5NV = 1000464000
    case r10x6UintPack16ARM = 1000609000
    case r10x6g10x6Uint2pack16ARM = 1000609001
    case r10x6g10x6b10x6a10x6Uint4pack16ARM = 1000609002
    case r12x4UintPack16ARM = 1000609003
    case r12x4g12x4Uint2pack16ARM = 1000609004
    case r12x4g12x4b12x4a12x4Uint4pack16ARM = 1000609005
    case r14x2UintPack16ARM = 1000609006
    case r14x2g14x2Uint2pack16ARM = 1000609007
    case r14x2g14x2b14x2a14x2Uint4pack16ARM = 1000609008
    case r14x2UnormPack16ARM = 1000609009
    case r14x2g14x2Unorm2pack16ARM = 1000609010
    case r14x2g14x2b14x2a14x2Unorm4pack16ARM = 1000609011
    case g14x2B14x2r14x22plane420Unorm3pack16ARM = 1000609012
    case g14x2B14x2r14x22plane422Unorm3pack16ARM = 1000609013
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
    case swapchainCreateInfoKHR = 1000001000
    case presentInfoKHR = 1000001001
    case deviceGroupPresentCapabilitiesKHR = 1000060007
    case imageSwapchainCreateInfoKHR = 1000060008
    case bindImageMemorySwapchainInfoKHR = 1000060009
    case acquireNextImageInfoKHR = 1000060010
    case deviceGroupPresentInfoKHR = 1000060011
    case deviceGroupSwapchainCreateInfoKHR = 1000060012
    case displayModeCreateInfoKHR = 1000002000
    case displaySurfaceCreateInfoKHR = 1000002001
    case displayPresentInfoKHR = 1000003000
    case debugReportCallbackCreateInfoEXT = 1000011000
    case pipelineRasterizationStateRasterizationOrderAMD = 1000018000
    case debugMarkerObjectNameInfoEXT = 1000022000
    case debugMarkerObjectTagInfoEXT = 1000022001
    case debugMarkerMarkerInfoEXT = 1000022002
    case videoProfileInfoKHR = 1000023000
    case videoCapabilitiesKHR = 1000023001
    case videoPictureResourceInfoKHR = 1000023002
    case videoSessionMemoryRequirementsKHR = 1000023003
    case bindVideoSessionMemoryInfoKHR = 1000023004
    case videoSessionCreateInfoKHR = 1000023005
    case videoSessionParametersCreateInfoKHR = 1000023006
    case videoSessionParametersUpdateInfoKHR = 1000023007
    case videoBeginCodingInfoKHR = 1000023008
    case videoEndCodingInfoKHR = 1000023009
    case videoCodingControlInfoKHR = 1000023010
    case videoReferenceSlotInfoKHR = 1000023011
    case queueFamilyVideoPropertiesKHR = 1000023012
    case videoProfileListInfoKHR = 1000023013
    case physicalDeviceVideoFormatInfoKHR = 1000023014
    case videoFormatPropertiesKHR = 1000023015
    case queueFamilyQueryResultStatusPropertiesKHR = 1000023016
    case videoDecodeInfoKHR = 1000024000
    case videoDecodeCapabilitiesKHR = 1000024001
    case videoDecodeUsageInfoKHR = 1000024002
    case dedicatedAllocationImageCreateInfoNV = 1000026000
    case dedicatedAllocationBufferCreateInfoNV = 1000026001
    case dedicatedAllocationMemoryAllocateInfoNV = 1000026002
    case physicalDeviceTransformFeedbackFeaturesEXT = 1000028000
    case physicalDeviceTransformFeedbackPropertiesEXT = 1000028001
    case pipelineRasterizationStateStreamCreateInfoEXT = 1000028002
    case cuModuleCreateInfoNVX = 1000029000
    case cuFunctionCreateInfoNVX = 1000029001
    case cuLaunchInfoNVX = 1000029002
    case cuModuleTexturingModeCreateInfoNVX = 1000029004
    case imageViewHandleInfoNVX = 1000030000
    case imageViewAddressPropertiesNVX = 1000030001
    case videoEncodeH264CapabilitiesKHR = 1000038000
    case videoEncodeH264SessionParametersCreateInfoKHR = 1000038001
    case videoEncodeH264SessionParametersAddInfoKHR = 1000038002
    case videoEncodeH264PictureInfoKHR = 1000038003
    case videoEncodeH264DpbSlotInfoKHR = 1000038004
    case videoEncodeH264NaluSliceInfoKHR = 1000038005
    case videoEncodeH264GopRemainingFrameInfoKHR = 1000038006
    case videoEncodeH264ProfileInfoKHR = 1000038007
    case videoEncodeH264RateControlInfoKHR = 1000038008
    case videoEncodeH264RateControlLayerInfoKHR = 1000038009
    case videoEncodeH264SessionCreateInfoKHR = 1000038010
    case videoEncodeH264QualityLevelPropertiesKHR = 1000038011
    case videoEncodeH264SessionParametersGetInfoKHR = 1000038012
    case videoEncodeH264SessionParametersFeedbackInfoKHR = 1000038013
    case videoEncodeH265CapabilitiesKHR = 1000039000
    case videoEncodeH265SessionParametersCreateInfoKHR = 1000039001
    case videoEncodeH265SessionParametersAddInfoKHR = 1000039002
    case videoEncodeH265PictureInfoKHR = 1000039003
    case videoEncodeH265DpbSlotInfoKHR = 1000039004
    case videoEncodeH265NaluSliceSegmentInfoKHR = 1000039005
    case videoEncodeH265GopRemainingFrameInfoKHR = 1000039006
    case videoEncodeH265ProfileInfoKHR = 1000039007
    case videoEncodeH265RateControlInfoKHR = 1000039009
    case videoEncodeH265RateControlLayerInfoKHR = 1000039010
    case videoEncodeH265SessionCreateInfoKHR = 1000039011
    case videoEncodeH265QualityLevelPropertiesKHR = 1000039012
    case videoEncodeH265SessionParametersGetInfoKHR = 1000039013
    case videoEncodeH265SessionParametersFeedbackInfoKHR = 1000039014
    case videoDecodeH264CapabilitiesKHR = 1000040000
    case videoDecodeH264PictureInfoKHR = 1000040001
    case videoDecodeH264ProfileInfoKHR = 1000040003
    case videoDecodeH264SessionParametersCreateInfoKHR = 1000040004
    case videoDecodeH264SessionParametersAddInfoKHR = 1000040005
    case videoDecodeH264DpbSlotInfoKHR = 1000040006
    case textureLodGatherFormatPropertiesAMD = 1000041000
    case physicalDeviceCornerSampledImageFeaturesNV = 1000050000
    case externalMemoryImageCreateInfoNV = 1000056000
    case exportMemoryAllocateInfoNV = 1000056001
    case validationFlagsEXT = 1000061000
    case imageViewAstcDecodeModeEXT = 1000067000
    case physicalDeviceAstcDecodeFeaturesEXT = 1000067001
    case importMemoryFdInfoKHR = 1000074000
    case memoryFdPropertiesKHR = 1000074001
    case memoryGetFdInfoKHR = 1000074002
    case importSemaphoreFdInfoKHR = 1000079000
    case semaphoreGetFdInfoKHR = 1000079001
    case commandBufferInheritanceConditionalRenderingInfoEXT = 1000081000
    case physicalDeviceConditionalRenderingFeaturesEXT = 1000081001
    case conditionalRenderingBeginInfoEXT = 1000081002
    case presentRegionsKHR = 1000084000
    case pipelineViewportWScalingStateCreateInfoNV = 1000087000
    case surfaceCapabilities2EXT = 1000090000
    case displayPowerInfoEXT = 1000091000
    case deviceEventInfoEXT = 1000091001
    case displayEventInfoEXT = 1000091002
    case swapchainCounterCreateInfoEXT = 1000091003
    case presentTimesInfoGOOGLE = 1000092000
    case physicalDeviceMultiviewPerViewAttributesPropertiesNVX = 1000097000
    case multiviewPerViewAttributesInfoNVX = 1000044009
    case pipelineViewportSwizzleStateCreateInfoNV = 1000098000
    case physicalDeviceDiscardRectanglePropertiesEXT = 1000099000
    case pipelineDiscardRectangleStateCreateInfoEXT = 1000099001
    case physicalDeviceConservativeRasterizationPropertiesEXT = 1000101000
    case pipelineRasterizationConservativeStateCreateInfoEXT = 1000101001
    case physicalDeviceDepthClipEnableFeaturesEXT = 1000102000
    case pipelineRasterizationDepthClipStateCreateInfoEXT = 1000102001
    case hdrMetadataEXT = 1000105000
    case physicalDeviceRelaxedLineRasterizationFeaturesIMG = 1000110000
    case sharedPresentSurfaceCapabilitiesKHR = 1000111000
    case importFenceFdInfoKHR = 1000115000
    case fenceGetFdInfoKHR = 1000115001
    case physicalDevicePerformanceQueryFeaturesKHR = 1000116000
    case physicalDevicePerformanceQueryPropertiesKHR = 1000116001
    case queryPoolPerformanceCreateInfoKHR = 1000116002
    case performanceQuerySubmitInfoKHR = 1000116003
    case acquireProfilingLockInfoKHR = 1000116004
    case performanceCounterKHR = 1000116005
    case performanceCounterDescriptionKHR = 1000116006
    case performanceQueryReservationInfoKHR = 1000116007
    case physicalDeviceSurfaceInfo2KHR = 1000119000
    case surfaceCapabilities2KHR = 1000119001
    case surfaceFormat2KHR = 1000119002
    case displayProperties2KHR = 1000121000
    case displayPlaneProperties2KHR = 1000121001
    case displayModeProperties2KHR = 1000121002
    case displayPlaneInfo2KHR = 1000121003
    case displayPlaneCapabilities2KHR = 1000121004
    case debugUtilsObjectNameInfoEXT = 1000128000
    case debugUtilsObjectTagInfoEXT = 1000128001
    case debugUtilsLabelEXT = 1000128002
    case debugUtilsMessengerCallbackDataEXT = 1000128003
    case debugUtilsMessengerCreateInfoEXT = 1000128004
    case physicalDeviceGpaFeaturesAMD = 1000133000
    case physicalDeviceGpaPropertiesAMD = 1000133001
    case gpaSampleBeginInfoAMD = 1000133002
    case gpaSessionCreateInfoAMD = 1000133003
    case gpaDeviceClockModeInfoAMD = 1000133004
    case physicalDeviceGpaProperties2AMD = 1000133005
    case gpaDeviceGetClockInfoAMD = 1000133006
    case texelBufferDescriptorInfoEXT = 1000135000
    case imageDescriptorInfoEXT = 1000135001
    case resourceDescriptorInfoEXT = 1000135002
    case bindHeapInfoEXT = 1000135003
    case pushDataInfoEXT = 1000135004
    case descriptorSetAndBindingMappingEXT = 1000135005
    case shaderDescriptorSetAndBindingMappingInfoEXT = 1000135006
    case opaqueCaptureDataCreateInfoEXT = 1000135007
    case physicalDeviceDescriptorHeapPropertiesEXT = 1000135008
    case physicalDeviceDescriptorHeapFeaturesEXT = 1000135009
    case commandBufferInheritanceDescriptorHeapInfoEXT = 1000135010
    case samplerCustomBorderColorIndexCreateInfoEXT = 1000135011
    case indirectCommandsLayoutPushDataTokenNV = 1000135012
    case subsampledImageFormatPropertiesEXT = 1000135013
    case physicalDeviceDescriptorHeapTensorPropertiesARM = 1000135014
    case attachmentSampleCountInfoAMD = 1000044008
    case physicalDeviceShaderBfloat16FeaturesKHR = 1000141000
    case sampleLocationsInfoEXT = 1000143000
    case renderPassSampleLocationsBeginInfoEXT = 1000143001
    case pipelineSampleLocationsStateCreateInfoEXT = 1000143002
    case physicalDeviceSampleLocationsPropertiesEXT = 1000143003
    case multisamplePropertiesEXT = 1000143004
    case physicalDeviceBlendOperationAdvancedFeaturesEXT = 1000148000
    case physicalDeviceBlendOperationAdvancedPropertiesEXT = 1000148001
    case pipelineColorBlendAdvancedStateCreateInfoEXT = 1000148002
    case pipelineCoverageToColorStateCreateInfoNV = 1000149000
    case writeDescriptorSetAccelerationStructureKHR = 1000150007
    case accelerationStructureBuildGeometryInfoKHR = 1000150000
    case accelerationStructureDeviceAddressInfoKHR = 1000150002
    case accelerationStructureGeometryAabbsDataKHR = 1000150003
    case accelerationStructureGeometryInstancesDataKHR = 1000150004
    case accelerationStructureGeometryTrianglesDataKHR = 1000150005
    case accelerationStructureGeometryKHR = 1000150006
    case accelerationStructureVersionInfoKHR = 1000150009
    case copyAccelerationStructureInfoKHR = 1000150010
    case copyAccelerationStructureToMemoryInfoKHR = 1000150011
    case copyMemoryToAccelerationStructureInfoKHR = 1000150012
    case physicalDeviceAccelerationStructureFeaturesKHR = 1000150013
    case physicalDeviceAccelerationStructurePropertiesKHR = 1000150014
    case accelerationStructureCreateInfoKHR = 1000150017
    case accelerationStructureBuildSizesInfoKHR = 1000150020
    case physicalDeviceRayTracingPipelineFeaturesKHR = 1000347000
    case physicalDeviceRayTracingPipelinePropertiesKHR = 1000347001
    case rayTracingPipelineCreateInfoKHR = 1000150015
    case rayTracingShaderGroupCreateInfoKHR = 1000150016
    case rayTracingPipelineInterfaceCreateInfoKHR = 1000150018
    case physicalDeviceRayQueryFeaturesKHR = 1000348013
    case pipelineCoverageModulationStateCreateInfoNV = 1000152000
    case physicalDeviceShaderSmBuiltinsFeaturesNV = 1000154000
    case physicalDeviceShaderSmBuiltinsPropertiesNV = 1000154001
    case drmFormatModifierPropertiesListEXT = 1000158000
    case physicalDeviceImageDrmFormatModifierInfoEXT = 1000158002
    case imageDrmFormatModifierListCreateInfoEXT = 1000158003
    case imageDrmFormatModifierExplicitCreateInfoEXT = 1000158004
    case imageDrmFormatModifierPropertiesEXT = 1000158005
    case drmFormatModifierPropertiesList2EXT = 1000158006
    case validationCacheCreateInfoEXT = 1000160000
    case shaderModuleValidationCacheCreateInfoEXT = 1000160001
    case pipelineViewportShadingRateImageStateCreateInfoNV = 1000164000
    case physicalDeviceShadingRateImageFeaturesNV = 1000164001
    case physicalDeviceShadingRateImagePropertiesNV = 1000164002
    case pipelineViewportCoarseSampleOrderStateCreateInfoNV = 1000164005
    case rayTracingPipelineCreateInfoNV = 1000165000
    case accelerationStructureCreateInfoNV = 1000165001
    case geometryNV = 1000165003
    case geometryTrianglesNV = 1000165004
    case geometryAabbNV = 1000165005
    case bindAccelerationStructureMemoryInfoNV = 1000165006
    case writeDescriptorSetAccelerationStructureNV = 1000165007
    case accelerationStructureMemoryRequirementsInfoNV = 1000165008
    case physicalDeviceRayTracingPropertiesNV = 1000165009
    case rayTracingShaderGroupCreateInfoNV = 1000165011
    case accelerationStructureInfoNV = 1000165012
    case physicalDeviceRepresentativeFragmentTestFeaturesNV = 1000166000
    case pipelineRepresentativeFragmentTestStateCreateInfoNV = 1000166001
    case physicalDeviceImageViewImageFormatInfoEXT = 1000170000
    case filterCubicImageViewImageFormatPropertiesEXT = 1000170001
    case physicalDeviceCooperativeMatrixConversionFeaturesQCOM = 1000172000
    case physicalDeviceElapsedTimerQueryFeaturesQCOM = 1000173000
    case importMemoryHostPointerInfoEXT = 1000178000
    case memoryHostPointerPropertiesEXT = 1000178001
    case physicalDeviceExternalMemoryHostPropertiesEXT = 1000178002
    case physicalDeviceShaderClockFeaturesKHR = 1000181000
    case pipelineCompilerControlCreateInfoAMD = 1000183000
    case physicalDeviceShaderCorePropertiesAMD = 1000185000
    case videoDecodeH265CapabilitiesKHR = 1000187000
    case videoDecodeH265SessionParametersCreateInfoKHR = 1000187001
    case videoDecodeH265SessionParametersAddInfoKHR = 1000187002
    case videoDecodeH265ProfileInfoKHR = 1000187003
    case videoDecodeH265PictureInfoKHR = 1000187004
    case videoDecodeH265DpbSlotInfoKHR = 1000187005
    case deviceMemoryOverallocationCreateInfoAMD = 1000189000
    case physicalDeviceVertexAttributeDivisorPropertiesEXT = 1000190000
    case physicalDeviceMeshShaderFeaturesNV = 1000202000
    case physicalDeviceMeshShaderPropertiesNV = 1000202001
    case physicalDeviceShaderImageFootprintFeaturesNV = 1000204000
    case pipelineViewportExclusiveScissorStateCreateInfoNV = 1000205000
    case physicalDeviceExclusiveScissorFeaturesNV = 1000205002
    case checkpointDataNV = 1000206000
    case queueFamilyCheckpointPropertiesNV = 1000206001
    case queueFamilyCheckpointProperties2NV = 1000314008
    case checkpointData2NV = 1000314009
    case physicalDevicePresentTimingFeaturesEXT = 1000208000
    case swapchainTimingPropertiesEXT = 1000208001
    case swapchainTimeDomainPropertiesEXT = 1000208002
    case presentTimingsInfoEXT = 1000208003
    case presentTimingInfoEXT = 1000208004
    case pastPresentationTimingInfoEXT = 1000208005
    case pastPresentationTimingPropertiesEXT = 1000208006
    case pastPresentationTimingEXT = 1000208007
    case presentTimingSurfaceCapabilitiesEXT = 1000208008
    case swapchainCalibratedTimestampInfoEXT = 1000208009
    case physicalDeviceShaderIntegerFunctions2FeaturesINTEL = 1000209000
    case queryPoolPerformanceQueryCreateInfoINTEL = 1000210000
    case initializePerformanceApiInfoINTEL = 1000210001
    case performanceMarkerInfoINTEL = 1000210002
    case performanceStreamMarkerInfoINTEL = 1000210003
    case performanceOverrideInfoINTEL = 1000210004
    case performanceConfigurationAcquireInfoINTEL = 1000210005
    case physicalDevicePciBusInfoPropertiesEXT = 1000212000
    case displayNativeHdrSurfaceCapabilitiesAMD = 1000213000
    case swapchainDisplayNativeHdrCreateInfoAMD = 1000213001
    case physicalDeviceFragmentDensityMapFeaturesEXT = 1000218000
    case physicalDeviceFragmentDensityMapPropertiesEXT = 1000218001
    case renderPassFragmentDensityMapCreateInfoEXT = 1000218002
    case renderingFragmentDensityMapAttachmentInfoEXT = 1000044007
    case fragmentShadingRateAttachmentInfoKHR = 1000226000
    case pipelineFragmentShadingRateStateCreateInfoKHR = 1000226001
    case physicalDeviceFragmentShadingRatePropertiesKHR = 1000226002
    case physicalDeviceFragmentShadingRateFeaturesKHR = 1000226003
    case physicalDeviceFragmentShadingRateKHR = 1000226004
    case renderingFragmentShadingRateAttachmentInfoKHR = 1000044006
    case physicalDeviceShaderCoreProperties2AMD = 1000227000
    case physicalDeviceCoherentMemoryFeaturesAMD = 1000229000
    case physicalDeviceShaderConstantDataFeaturesKHR = 1000231000
    case physicalDeviceShaderAbortFeaturesKHR = 1000233000
    case deviceFaultShaderAbortMessageInfoKHR = 1000233001
    case physicalDeviceShaderAbortPropertiesKHR = 1000233002
    case physicalDeviceShaderImageAtomicInt64FeaturesEXT = 1000234000
    case physicalDeviceShaderQuadControlFeaturesKHR = 1000235000
    case physicalDeviceMemoryBudgetPropertiesEXT = 1000237000
    case physicalDeviceMemoryPriorityFeaturesEXT = 1000238000
    case memoryPriorityAllocateInfoEXT = 1000238001
    case surfaceProtectedCapabilitiesKHR = 1000239000
    case physicalDeviceDedicatedAllocationImageAliasingFeaturesNV = 1000240000
    case physicalDeviceBufferDeviceAddressFeaturesEXT = 1000244000
    case bufferDeviceAddressCreateInfoEXT = 1000244002
    case validationFeaturesEXT = 1000247000
    case physicalDevicePresentWaitFeaturesKHR = 1000248000
    case physicalDeviceCooperativeMatrixFeaturesNV = 1000249000
    case cooperativeMatrixPropertiesNV = 1000249001
    case physicalDeviceCooperativeMatrixPropertiesNV = 1000249002
    case physicalDeviceCoverageReductionModeFeaturesNV = 1000250000
    case pipelineCoverageReductionStateCreateInfoNV = 1000250001
    case framebufferMixedSamplesCombinationNV = 1000250002
    case physicalDeviceFragmentShaderInterlockFeaturesEXT = 1000251000
    case physicalDeviceYcbcrImageArraysFeaturesEXT = 1000252000
    case physicalDeviceProvokingVertexFeaturesEXT = 1000254000
    case pipelineRasterizationProvokingVertexStateCreateInfoEXT = 1000254001
    case physicalDeviceProvokingVertexPropertiesEXT = 1000254002
    case headlessSurfaceCreateInfoEXT = 1000256000
    case physicalDeviceShaderAtomicFloatFeaturesEXT = 1000260000
    case physicalDeviceExtendedDynamicStateFeaturesEXT = 1000267000
    case physicalDevicePipelineExecutablePropertiesFeaturesKHR = 1000269000
    case pipelineInfoKHR = 1000269001
    case pipelineExecutablePropertiesKHR = 1000269002
    case pipelineExecutableInfoKHR = 1000269003
    case pipelineExecutableStatisticKHR = 1000269004
    case pipelineExecutableInternalRepresentationKHR = 1000269005
    case physicalDeviceMapMemoryPlacedFeaturesEXT = 1000272000
    case physicalDeviceMapMemoryPlacedPropertiesEXT = 1000272001
    case memoryMapPlacedInfoEXT = 1000272002
    case physicalDeviceShaderAtomicFloat2FeaturesEXT = 1000273000
    case physicalDeviceDeviceGeneratedCommandsPropertiesNV = 1000277000
    case graphicsShaderGroupCreateInfoNV = 1000277001
    case graphicsPipelineShaderGroupsCreateInfoNV = 1000277002
    case indirectCommandsLayoutTokenNV = 1000277003
    case indirectCommandsLayoutCreateInfoNV = 1000277004
    case generatedCommandsInfoNV = 1000277005
    case generatedCommandsMemoryRequirementsInfoNV = 1000277006
    case physicalDeviceDeviceGeneratedCommandsFeaturesNV = 1000277007
    case physicalDeviceInheritedViewportScissorFeaturesNV = 1000278000
    case commandBufferInheritanceViewportScissorInfoNV = 1000278001
    case physicalDeviceTexelBufferAlignmentFeaturesEXT = 1000281000
    case commandBufferInheritanceRenderPassTransformInfoQCOM = 1000282000
    case renderPassTransformBeginInfoQCOM = 1000282001
    case physicalDeviceDepthBiasControlFeaturesEXT = 1000283000
    case depthBiasInfoEXT = 1000283001
    case depthBiasRepresentationInfoEXT = 1000283002
    case physicalDeviceDeviceMemoryReportFeaturesEXT = 1000284000
    case deviceDeviceMemoryReportCreateInfoEXT = 1000284001
    case deviceMemoryReportCallbackDataEXT = 1000284002
    case samplerCustomBorderColorCreateInfoEXT = 1000287000
    case physicalDeviceCustomBorderColorPropertiesEXT = 1000287001
    case physicalDeviceCustomBorderColorFeaturesEXT = 1000287002
    case physicalDeviceTextureCompressionAstc3dFeaturesEXT = 1000288000
    case pipelineLibraryCreateInfoKHR = 1000290000
    case physicalDevicePresentBarrierFeaturesNV = 1000292000
    case surfaceCapabilitiesPresentBarrierNV = 1000292001
    case swapchainPresentBarrierCreateInfoNV = 1000292002
    case presentIdKHR = 1000294000
    case physicalDevicePresentIdFeaturesKHR = 1000294001
    case videoEncodeInfoKHR = 1000299000
    case videoEncodeRateControlInfoKHR = 1000299001
    case videoEncodeRateControlLayerInfoKHR = 1000299002
    case videoEncodeCapabilitiesKHR = 1000299003
    case videoEncodeUsageInfoKHR = 1000299004
    case queryPoolVideoEncodeFeedbackCreateInfoKHR = 1000299005
    case physicalDeviceVideoEncodeQualityLevelInfoKHR = 1000299006
    case videoEncodeQualityLevelPropertiesKHR = 1000299007
    case videoEncodeQualityLevelInfoKHR = 1000299008
    case videoEncodeSessionParametersGetInfoKHR = 1000299009
    case videoEncodeSessionParametersFeedbackInfoKHR = 1000299010
    case physicalDeviceDiagnosticsConfigFeaturesNV = 1000300000
    case deviceDiagnosticsConfigCreateInfoNV = 1000300001
    case perfHintInfoQCOM = 1000302000
    case physicalDeviceQueuePerfHintFeaturesQCOM = 1000302001
    case physicalDeviceQueuePerfHintPropertiesQCOM = 1000302002
    case physicalDeviceImageProcessing3FeaturesQCOM = 1000303000
    case physicalDeviceShaderMultipleWaitQueuesFeaturesQCOM = 1000304000
    case physicalDeviceShaderMultipleWaitQueuesPropertiesQCOM = 1000304001
    case physicalDeviceShaderSplitBarrierFeaturesEXT = 1000305000
    case physicalDeviceShaderSplitBarrierPropertiesEXT = 1000305001
    case physicalDeviceTileShadingFeaturesQCOM = 1000309000
    case physicalDeviceTileShadingPropertiesQCOM = 1000309001
    case renderPassTileShadingCreateInfoQCOM = 1000309002
    case perTileBeginInfoQCOM = 1000309003
    case perTileEndInfoQCOM = 1000309004
    case dispatchTileInfoQCOM = 1000309005
    case queryLowLatencySupportNV = 1000310000
    case physicalDeviceDescriptorBufferPropertiesEXT = 1000316000
    case physicalDeviceDescriptorBufferDensityMapPropertiesEXT = 1000316001
    case physicalDeviceDescriptorBufferFeaturesEXT = 1000316002
    case descriptorAddressInfoEXT = 1000316003
    case descriptorGetInfoEXT = 1000316004
    case bufferCaptureDescriptorDataInfoEXT = 1000316005
    case imageCaptureDescriptorDataInfoEXT = 1000316006
    case imageViewCaptureDescriptorDataInfoEXT = 1000316007
    case samplerCaptureDescriptorDataInfoEXT = 1000316008
    case opaqueCaptureDescriptorDataCreateInfoEXT = 1000316010
    case descriptorBufferBindingInfoEXT = 1000316011
    case descriptorBufferBindingPushDescriptorBufferHandleEXT = 1000316012
    case accelerationStructureCaptureDescriptorDataInfoEXT = 1000316009
    case deviceMemoryCopyKHR = 1000318000
    case copyDeviceMemoryInfoKHR = 1000318001
    case deviceMemoryImageCopyKHR = 1000318002
    case copyDeviceMemoryImageInfoKHR = 1000318003
    case memoryRangeBarriersInfoKHR = 1000318004
    case memoryRangeBarrierKHR = 1000318005
    case physicalDeviceDeviceAddressCommandsFeaturesKHR = 1000318006
    case bindIndexBuffer3InfoKHR = 1000318007
    case bindVertexBuffer3InfoKHR = 1000318008
    case drawIndirect2InfoKHR = 1000318009
    case drawIndirectCount2InfoKHR = 1000318010
    case dispatchIndirect2InfoKHR = 1000318011
    case conditionalRenderingBeginInfo2EXT = 1000318012
    case bindTransformFeedbackBuffer2InfoEXT = 1000318013
    case memoryMarkerInfoAMD = 1000318014
    case accelerationStructureCreateInfo2KHR = 1000318015
    case physicalDeviceGraphicsPipelineLibraryFeaturesEXT = 1000320000
    case physicalDeviceGraphicsPipelineLibraryPropertiesEXT = 1000320001
    case graphicsPipelineLibraryCreateInfoEXT = 1000320002
    case physicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD = 1000321000
    case physicalDeviceFragmentShaderBarycentricFeaturesKHR = 1000203000
    case physicalDeviceFragmentShaderBarycentricPropertiesKHR = 1000322000
    case physicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR = 1000323000
    case physicalDeviceFragmentShadingRateEnumsPropertiesNV = 1000326000
    case physicalDeviceFragmentShadingRateEnumsFeaturesNV = 1000326001
    case pipelineFragmentShadingRateEnumStateCreateInfoNV = 1000326002
    case accelerationStructureGeometryMotionTrianglesDataNV = 1000327000
    case physicalDeviceRayTracingMotionBlurFeaturesNV = 1000327001
    case accelerationStructureMotionInfoNV = 1000327002
    case physicalDeviceMeshShaderFeaturesEXT = 1000328000
    case physicalDeviceMeshShaderPropertiesEXT = 1000328001
    case physicalDeviceYcbcr2Plane444FormatsFeaturesEXT = 1000330000
    case physicalDeviceFragmentDensityMap2FeaturesEXT = 1000332000
    case physicalDeviceFragmentDensityMap2PropertiesEXT = 1000332001
    case copyCommandTransformInfoQCOM = 1000333000
    case physicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR = 1000336000
    case physicalDeviceImageCompressionControlFeaturesEXT = 1000338000
    case imageCompressionControlEXT = 1000338001
    case imageCompressionPropertiesEXT = 1000338004
    case physicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT = 1000339000
    case physicalDevice4444FormatsFeaturesEXT = 1000340000
    case physicalDeviceFaultFeaturesEXT = 1000341000
    case deviceFaultCountsEXT = 1000341001
    case deviceFaultInfoEXT = 1000341002
    case physicalDeviceRgba10x6FormatsFeaturesEXT = 1000344000
    case physicalDeviceVertexInputDynamicStateFeaturesEXT = 1000352000
    case vertexInputBindingDescription2EXT = 1000352001
    case vertexInputAttributeDescription2EXT = 1000352002
    case physicalDeviceDrmPropertiesEXT = 1000353000
    case physicalDeviceAddressBindingReportFeaturesEXT = 1000354000
    case deviceAddressBindingCallbackDataEXT = 1000354001
    case physicalDeviceDepthClipControlFeaturesEXT = 1000355000
    case pipelineViewportDepthClipControlCreateInfoEXT = 1000355001
    case physicalDevicePrimitiveTopologyListRestartFeaturesEXT = 1000356000
    case subpassShadingPipelineCreateInfoHUAWEI = 1000369000
    case physicalDeviceSubpassShadingFeaturesHUAWEI = 1000369001
    case physicalDeviceSubpassShadingPropertiesHUAWEI = 1000369002
    case physicalDeviceInvocationMaskFeaturesHUAWEI = 1000370000
    case memoryGetRemoteAddressInfoNV = 1000371000
    case physicalDeviceExternalMemoryRdmaFeaturesNV = 1000371001
    case pipelinePropertiesIdentifierEXT = 1000372000
    case physicalDevicePipelinePropertiesFeaturesEXT = 1000372001
    case physicalDeviceFrameBoundaryFeaturesEXT = 1000375000
    case frameBoundaryEXT = 1000375001
    case physicalDeviceMultisampledRenderToSingleSampledFeaturesEXT = 1000376000
    case subpassResolvePerformanceQueryEXT = 1000376001
    case multisampledRenderToSingleSampledInfoEXT = 1000376002
    case physicalDeviceExtendedDynamicState2FeaturesEXT = 1000377000
    case physicalDeviceColorWriteEnableFeaturesEXT = 1000381000
    case pipelineColorWriteCreateInfoEXT = 1000381001
    case physicalDevicePrimitivesGeneratedQueryFeaturesEXT = 1000382000
    case physicalDeviceRayTracingMaintenance1FeaturesKHR = 1000386000
    case physicalDeviceShaderUntypedPointersFeaturesKHR = 1000387000
    case physicalDeviceVideoEncodeRgbConversionFeaturesVALVE = 1000390000
    case videoEncodeRgbConversionCapabilitiesVALVE = 1000390001
    case videoEncodeProfileRgbConversionInfoVALVE = 1000390002
    case videoEncodeSessionRgbConversionCreateInfoVALVE = 1000390003
    case physicalDeviceImageViewMinLodFeaturesEXT = 1000391000
    case imageViewMinLodCreateInfoEXT = 1000391001
    case physicalDeviceMultiDrawFeaturesEXT = 1000392000
    case physicalDeviceMultiDrawPropertiesEXT = 1000392001
    case physicalDeviceImage2dViewOf3dFeaturesEXT = 1000393000
    case physicalDeviceShaderTileImageFeaturesEXT = 1000395000
    case physicalDeviceShaderTileImagePropertiesEXT = 1000395001
    case micromapBuildInfoEXT = 1000396000
    case micromapVersionInfoEXT = 1000396001
    case copyMicromapInfoEXT = 1000396002
    case copyMicromapToMemoryInfoEXT = 1000396003
    case copyMemoryToMicromapInfoEXT = 1000396004
    case physicalDeviceOpacityMicromapFeaturesEXT = 1000396005
    case physicalDeviceOpacityMicromapPropertiesEXT = 1000396006
    case micromapCreateInfoEXT = 1000396007
    case micromapBuildSizesInfoEXT = 1000396008
    case accelerationStructureTrianglesOpacityMicromapEXT = 1000396009
    case physicalDeviceClusterCullingShaderFeaturesHUAWEI = 1000404000
    case physicalDeviceClusterCullingShaderPropertiesHUAWEI = 1000404001
    case physicalDeviceClusterCullingShaderVrsFeaturesHUAWEI = 1000404002
    case physicalDeviceBorderColorSwizzleFeaturesEXT = 1000411000
    case samplerBorderColorComponentMappingCreateInfoEXT = 1000411001
    case physicalDevicePageableDeviceLocalMemoryFeaturesEXT = 1000412000
    case physicalDeviceShaderCorePropertiesARM = 1000415000
    case deviceQueueShaderCoreControlCreateInfoARM = 1000417000
    case physicalDeviceSchedulingControlsFeaturesARM = 1000417001
    case physicalDeviceSchedulingControlsPropertiesARM = 1000417002
    case dispatchParametersARM = 1000417003
    case physicalDeviceSchedulingControlsDispatchParametersPropertiesARM = 1000417004
    case physicalDeviceImageSlicedViewOf3dFeaturesEXT = 1000418000
    case imageViewSlicedCreateInfoEXT = 1000418001
    case physicalDeviceDescriptorSetHostMappingFeaturesVALVE = 1000420000
    case descriptorSetBindingReferenceVALVE = 1000420001
    case descriptorSetLayoutHostMappingInfoVALVE = 1000420002
    case physicalDeviceNonSeamlessCubeMapFeaturesEXT = 1000422000
    case physicalDeviceRenderPassStripedFeaturesARM = 1000424000
    case physicalDeviceRenderPassStripedPropertiesARM = 1000424001
    case renderPassStripeBeginInfoARM = 1000424002
    case renderPassStripeInfoARM = 1000424003
    case renderPassStripeSubmitInfoARM = 1000424004
    case physicalDeviceCopyMemoryIndirectFeaturesNV = 1000426000
    case physicalDeviceDeviceGeneratedCommandsComputeFeaturesNV = 1000428000
    case computePipelineIndirectBufferInfoNV = 1000428001
    case pipelineIndirectDeviceAddressInfoNV = 1000428002
    case physicalDeviceRayTracingLinearSweptSpheresFeaturesNV = 1000429008
    case accelerationStructureGeometryLinearSweptSpheresDataNV = 1000429009
    case accelerationStructureGeometrySpheresDataNV = 1000429010
    case physicalDeviceLinearColorAttachmentFeaturesNV = 1000430000
    case physicalDeviceShaderMaximalReconvergenceFeaturesKHR = 1000434000
    case physicalDeviceImageCompressionControlSwapchainFeaturesEXT = 1000437000
    case physicalDeviceImageProcessingFeaturesQCOM = 1000440000
    case physicalDeviceImageProcessingPropertiesQCOM = 1000440001
    case imageViewSampleWeightCreateInfoQCOM = 1000440002
    case physicalDeviceNestedCommandBufferFeaturesEXT = 1000451000
    case physicalDeviceNestedCommandBufferPropertiesEXT = 1000451001
    case externalMemoryAcquireUnmodifiedEXT = 1000453000
    case physicalDeviceExtendedDynamicState3FeaturesEXT = 1000455000
    case physicalDeviceExtendedDynamicState3PropertiesEXT = 1000455001
    case physicalDeviceSubpassMergeFeedbackFeaturesEXT = 1000458000
    case renderPassCreationControlEXT = 1000458001
    case renderPassCreationFeedbackCreateInfoEXT = 1000458002
    case renderPassSubpassFeedbackCreateInfoEXT = 1000458003
    case directDriverLoadingInfoLUNARG = 1000459000
    case directDriverLoadingListLUNARG = 1000459001
    case tensorCreateInfoARM = 1000460000
    case tensorViewCreateInfoARM = 1000460001
    case bindTensorMemoryInfoARM = 1000460002
    case writeDescriptorSetTensorARM = 1000460003
    case physicalDeviceTensorPropertiesARM = 1000460004
    case tensorFormatPropertiesARM = 1000460005
    case tensorDescriptionARM = 1000460006
    case tensorMemoryRequirementsInfoARM = 1000460007
    case tensorMemoryBarrierARM = 1000460008
    case physicalDeviceTensorFeaturesARM = 1000460009
    case deviceTensorMemoryRequirementsARM = 1000460010
    case copyTensorInfoARM = 1000460011
    case tensorCopyARM = 1000460012
    case tensorDependencyInfoARM = 1000460013
    case memoryDedicatedAllocateInfoTensorARM = 1000460014
    case physicalDeviceExternalTensorInfoARM = 1000460015
    case externalTensorPropertiesARM = 1000460016
    case externalMemoryTensorCreateInfoARM = 1000460017
    case physicalDeviceDescriptorBufferTensorFeaturesARM = 1000460018
    case physicalDeviceDescriptorBufferTensorPropertiesARM = 1000460019
    case descriptorGetTensorInfoARM = 1000460020
    case tensorCaptureDescriptorDataInfoARM = 1000460021
    case tensorViewCaptureDescriptorDataInfoARM = 1000460022
    case frameBoundaryTensorsARM = 1000460023
    case physicalDeviceShaderModuleIdentifierFeaturesEXT = 1000462000
    case physicalDeviceShaderModuleIdentifierPropertiesEXT = 1000462001
    case pipelineShaderStageModuleIdentifierCreateInfoEXT = 1000462002
    case shaderModuleIdentifierEXT = 1000462003
    case physicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT = 1000342000
    case physicalDeviceOpticalFlowFeaturesNV = 1000464000
    case physicalDeviceOpticalFlowPropertiesNV = 1000464001
    case opticalFlowImageFormatInfoNV = 1000464002
    case opticalFlowImageFormatPropertiesNV = 1000464003
    case opticalFlowSessionCreateInfoNV = 1000464004
    case opticalFlowExecuteInfoNV = 1000464005
    case opticalFlowSessionCreatePrivateDataInfoNV = 1000464010
    case physicalDeviceLegacyDitheringFeaturesEXT = 1000465000
    case physicalDeviceAntiLagFeaturesAMD = 1000476000
    case antiLagDataAMD = 1000476001
    case antiLagPresentationInfoAMD = 1000476002
    case surfaceCapabilitiesPresentId2KHR = 1000479000
    case presentId2KHR = 1000479001
    case physicalDevicePresentId2FeaturesKHR = 1000479002
    case surfaceCapabilitiesPresentWait2KHR = 1000480000
    case physicalDevicePresentWait2FeaturesKHR = 1000480001
    case presentWait2InfoKHR = 1000480002
    case physicalDeviceRayTracingPositionFetchFeaturesKHR = 1000481000
    case physicalDeviceShaderObjectFeaturesEXT = 1000482000
    case physicalDeviceShaderObjectPropertiesEXT = 1000482001
    case shaderCreateInfoEXT = 1000482002
    case physicalDevicePipelineBinaryFeaturesKHR = 1000483000
    case pipelineBinaryCreateInfoKHR = 1000483001
    case pipelineBinaryInfoKHR = 1000483002
    case pipelineBinaryKeyKHR = 1000483003
    case physicalDevicePipelineBinaryPropertiesKHR = 1000483004
    case releaseCapturedPipelineDataInfoKHR = 1000483005
    case pipelineBinaryDataInfoKHR = 1000483006
    case pipelineCreateInfoKHR = 1000483007
    case devicePipelineBinaryInternalCacheControlKHR = 1000483008
    case pipelineBinaryHandlesInfoKHR = 1000483009
    case physicalDeviceTilePropertiesFeaturesQCOM = 1000484000
    case tilePropertiesQCOM = 1000484001
    case physicalDeviceAmigoProfilingFeaturesSEC = 1000485000
    case amigoProfilingSubmitInfoSEC = 1000485001
    case surfacePresentModeKHR = 1000274000
    case surfacePresentScalingCapabilitiesKHR = 1000274001
    case surfacePresentModeCompatibilityKHR = 1000274002
    case physicalDeviceSwapchainMaintenance1FeaturesKHR = 1000275000
    case swapchainPresentFenceInfoKHR = 1000275001
    case swapchainPresentModesCreateInfoKHR = 1000275002
    case swapchainPresentModeInfoKHR = 1000275003
    case swapchainPresentScalingCreateInfoKHR = 1000275004
    case releaseSwapchainImagesInfoKHR = 1000275005
    case physicalDeviceMultiviewPerViewViewportsFeaturesQCOM = 1000488000
    case physicalDeviceRayTracingInvocationReorderFeaturesNV = 1000490000
    case physicalDeviceRayTracingInvocationReorderPropertiesNV = 1000490001
    case physicalDeviceCooperativeVectorFeaturesNV = 1000491000
    case physicalDeviceCooperativeVectorPropertiesNV = 1000491001
    case cooperativeVectorPropertiesNV = 1000491002
    case convertCooperativeVectorMatrixInfoNV = 1000491004
    case physicalDeviceExtendedSparseAddressSpaceFeaturesNV = 1000492000
    case physicalDeviceExtendedSparseAddressSpacePropertiesNV = 1000492001
    case physicalDeviceMutableDescriptorTypeFeaturesEXT = 1000351000
    case mutableDescriptorTypeCreateInfoEXT = 1000351002
    case physicalDeviceLegacyVertexAttributesFeaturesEXT = 1000495000
    case physicalDeviceLegacyVertexAttributesPropertiesEXT = 1000495001
    case layerSettingsCreateInfoEXT = 1000496000
    case physicalDeviceShaderCoreBuiltinsFeaturesARM = 1000497000
    case physicalDeviceShaderCoreBuiltinsPropertiesARM = 1000497001
    case physicalDevicePipelineLibraryGroupHandlesFeaturesEXT = 1000498000
    case physicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT = 1000499000
    case physicalDeviceInternallySynchronizedQueuesFeaturesKHR = 1000504000
    case latencySleepModeInfoNV = 1000505000
    case latencySleepInfoNV = 1000505001
    case setLatencyMarkerInfoNV = 1000505002
    case getLatencyMarkerInfoNV = 1000505003
    case latencyTimingsFrameReportNV = 1000505004
    case latencySubmissionPresentIdNV = 1000505005
    case outOfBandQueueTypeInfoNV = 1000505006
    case swapchainLatencyCreateInfoNV = 1000505007
    case latencySurfaceCapabilitiesNV = 1000505008
    case physicalDeviceCooperativeMatrixFeaturesKHR = 1000506000
    case cooperativeMatrixPropertiesKHR = 1000506001
    case physicalDeviceCooperativeMatrixPropertiesKHR = 1000506002
    case dataGraphPipelineCreateInfoARM = 1000507000
    case dataGraphPipelineSessionCreateInfoARM = 1000507001
    case dataGraphPipelineResourceInfoARM = 1000507002
    case dataGraphPipelineConstantARM = 1000507003
    case dataGraphPipelineSessionMemoryRequirementsInfoARM = 1000507004
    case bindDataGraphPipelineSessionMemoryInfoARM = 1000507005
    case physicalDeviceDataGraphFeaturesARM = 1000507006
    case dataGraphPipelineShaderModuleCreateInfoARM = 1000507007
    case dataGraphPipelinePropertyQueryResultARM = 1000507008
    case dataGraphPipelineInfoARM = 1000507009
    case dataGraphPipelineCompilerControlCreateInfoARM = 1000507010
    case dataGraphPipelineSessionBindPointRequirementsInfoARM = 1000507011
    case dataGraphPipelineSessionBindPointRequirementARM = 1000507012
    case dataGraphPipelineIdentifierCreateInfoARM = 1000507013
    case dataGraphPipelineDispatchInfoARM = 1000507014
    case dataGraphProcessingEngineCreateInfoARM = 1000507016
    case queueFamilyDataGraphProcessingEnginePropertiesARM = 1000507017
    case queueFamilyDataGraphPropertiesARM = 1000507018
    case physicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM = 1000507019
    case dataGraphPipelineConstantTensorSemiStructuredSparsityInfoARM = 1000507015
    case queueFamilyDataGraphTosaPropertiesARM = 1000508000
    case physicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM = 1000510000
    case multiviewPerViewRenderAreasRenderPassBeginInfoQCOM = 1000510001
    case physicalDeviceComputeShaderDerivativesFeaturesKHR = 1000201000
    case physicalDeviceComputeShaderDerivativesPropertiesKHR = 1000511000
    case videoDecodeAv1CapabilitiesKHR = 1000512000
    case videoDecodeAv1PictureInfoKHR = 1000512001
    case videoDecodeAv1ProfileInfoKHR = 1000512003
    case videoDecodeAv1SessionParametersCreateInfoKHR = 1000512004
    case videoDecodeAv1DpbSlotInfoKHR = 1000512005
    case videoEncodeAv1CapabilitiesKHR = 1000513000
    case videoEncodeAv1SessionParametersCreateInfoKHR = 1000513001
    case videoEncodeAv1PictureInfoKHR = 1000513002
    case videoEncodeAv1DpbSlotInfoKHR = 1000513003
    case physicalDeviceVideoEncodeAv1FeaturesKHR = 1000513004
    case videoEncodeAv1ProfileInfoKHR = 1000513005
    case videoEncodeAv1RateControlInfoKHR = 1000513006
    case videoEncodeAv1RateControlLayerInfoKHR = 1000513007
    case videoEncodeAv1QualityLevelPropertiesKHR = 1000513008
    case videoEncodeAv1SessionCreateInfoKHR = 1000513009
    case videoEncodeAv1GopRemainingFrameInfoKHR = 1000513010
    case physicalDeviceVideoDecodeVp9FeaturesKHR = 1000514000
    case videoDecodeVp9CapabilitiesKHR = 1000514001
    case videoDecodeVp9PictureInfoKHR = 1000514002
    case videoDecodeVp9ProfileInfoKHR = 1000514003
    case physicalDeviceVideoMaintenance1FeaturesKHR = 1000515000
    case videoInlineQueryInfoKHR = 1000515001
    case physicalDevicePerStageDescriptorSetFeaturesNV = 1000516000
    case physicalDeviceImageProcessing2FeaturesQCOM = 1000518000
    case physicalDeviceImageProcessing2PropertiesQCOM = 1000518001
    case samplerBlockMatchWindowCreateInfoQCOM = 1000518002
    case samplerCubicWeightsCreateInfoQCOM = 1000519000
    case physicalDeviceCubicWeightsFeaturesQCOM = 1000519001
    case blitImageCubicWeightsInfoQCOM = 1000519002
    case physicalDeviceYcbcrDegammaFeaturesQCOM = 1000520000
    case samplerYcbcrConversionYcbcrDegammaCreateInfoQCOM = 1000520001
    case physicalDeviceCubicClampFeaturesQCOM = 1000521000
    case physicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT = 1000524000
    case physicalDeviceUnifiedImageLayoutsFeaturesKHR = 1000527000
    case attachmentFeedbackLoopInfoEXT = 1000527001
    case physicalDeviceLayeredDriverPropertiesMSFT = 1000530000
    case calibratedTimestampInfoKHR = 1000184000
    case setDescriptorBufferOffsetsInfoEXT = 1000545007
    case bindDescriptorBufferEmbeddedSamplersInfoEXT = 1000545008
    case physicalDeviceDescriptorPoolOverallocationFeaturesNV = 1000546000
    case physicalDeviceTileMemoryHeapFeaturesQCOM = 1000547000
    case physicalDeviceTileMemoryHeapPropertiesQCOM = 1000547001
    case tileMemoryRequirementsQCOM = 1000547002
    case tileMemoryBindInfoQCOM = 1000547003
    case tileMemorySizeInfoQCOM = 1000547004
    case physicalDeviceCopyMemoryIndirectFeaturesKHR = 1000549000
    case physicalDeviceCopyMemoryIndirectPropertiesKHR = 1000426001
    case copyMemoryIndirectInfoKHR = 1000549002
    case copyMemoryToImageIndirectInfoKHR = 1000549003
    case physicalDeviceMemoryDecompressionFeaturesEXT = 1000427000
    case physicalDeviceMemoryDecompressionPropertiesEXT = 1000427001
    case decompressMemoryInfoEXT = 1000550002
    case displaySurfaceStereoCreateInfoNV = 1000551000
    case displayModeStereoPropertiesNV = 1000551001
    case videoEncodeIntraRefreshCapabilitiesKHR = 1000552000
    case videoEncodeSessionIntraRefreshCreateInfoKHR = 1000552001
    case videoEncodeIntraRefreshInfoKHR = 1000552002
    case videoReferenceIntraRefreshInfoKHR = 1000552003
    case physicalDeviceVideoEncodeIntraRefreshFeaturesKHR = 1000552004
    case videoEncodeQuantizationMapCapabilitiesKHR = 1000553000
    case videoFormatQuantizationMapPropertiesKHR = 1000553001
    case videoEncodeQuantizationMapInfoKHR = 1000553002
    case videoEncodeQuantizationMapSessionParametersCreateInfoKHR = 1000553005
    case physicalDeviceVideoEncodeQuantizationMapFeaturesKHR = 1000553009
    case videoEncodeH264QuantizationMapCapabilitiesKHR = 1000553003
    case videoEncodeH265QuantizationMapCapabilitiesKHR = 1000553004
    case videoFormatH265QuantizationMapPropertiesKHR = 1000553006
    case videoEncodeAv1QuantizationMapCapabilitiesKHR = 1000553007
    case videoFormatAv1QuantizationMapPropertiesKHR = 1000553008
    case physicalDeviceRawAccessChainsFeaturesNV = 1000555000
    case externalComputeQueueDeviceCreateInfoNV = 1000556000
    case externalComputeQueueCreateInfoNV = 1000556001
    case externalComputeQueueDataParamsNV = 1000556002
    case physicalDeviceExternalComputeQueuePropertiesNV = 1000556003
    case physicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR = 1000558000
    case physicalDeviceCommandBufferInheritanceFeaturesNV = 1000559000
    case physicalDeviceMaintenance7FeaturesKHR = 1000562000
    case physicalDeviceMaintenance7PropertiesKHR = 1000562001
    case physicalDeviceLayeredApiPropertiesListKHR = 1000562002
    case physicalDeviceLayeredApiPropertiesKHR = 1000562003
    case physicalDeviceLayeredApiVulkanPropertiesKHR = 1000562004
    case physicalDeviceShaderAtomicFloat16VectorFeaturesNV = 1000563000
    case physicalDeviceShaderReplicatedCompositesFeaturesEXT = 1000564000
    case physicalDeviceShaderFloat8FeaturesEXT = 1000567000
    case physicalDeviceRayTracingValidationFeaturesNV = 1000568000
    case physicalDeviceClusterAccelerationStructureFeaturesNV = 1000569000
    case physicalDeviceClusterAccelerationStructurePropertiesNV = 1000569001
    case clusterAccelerationStructureClustersBottomLevelInputNV = 1000569002
    case clusterAccelerationStructureTriangleClusterInputNV = 1000569003
    case clusterAccelerationStructureMoveObjectsInputNV = 1000569004
    case clusterAccelerationStructureInputInfoNV = 1000569005
    case clusterAccelerationStructureCommandsInfoNV = 1000569006
    case rayTracingPipelineClusterAccelerationStructureCreateInfoNV = 1000569007
    case physicalDevicePartitionedAccelerationStructureFeaturesNV = 1000570000
    case physicalDevicePartitionedAccelerationStructurePropertiesNV = 1000570001
    case writeDescriptorSetPartitionedAccelerationStructureNV = 1000570002
    case partitionedAccelerationStructureInstancesInputNV = 1000570003
    case buildPartitionedAccelerationStructureInfoNV = 1000570004
    case partitionedAccelerationStructureFlagsNV = 1000570005
    case physicalDeviceDeviceGeneratedCommandsFeaturesEXT = 1000572000
    case physicalDeviceDeviceGeneratedCommandsPropertiesEXT = 1000572001
    case generatedCommandsMemoryRequirementsInfoEXT = 1000572002
    case indirectExecutionSetCreateInfoEXT = 1000572003
    case generatedCommandsInfoEXT = 1000572004
    case indirectCommandsLayoutCreateInfoEXT = 1000572006
    case indirectCommandsLayoutTokenEXT = 1000572007
    case writeIndirectExecutionSetPipelineEXT = 1000572008
    case writeIndirectExecutionSetShaderEXT = 1000572009
    case indirectExecutionSetPipelineInfoEXT = 1000572010
    case indirectExecutionSetShaderInfoEXT = 1000572011
    case indirectExecutionSetShaderLayoutInfoEXT = 1000572012
    case generatedCommandsPipelineInfoEXT = 1000572013
    case generatedCommandsShaderInfoEXT = 1000572014
    case physicalDeviceFaultFeaturesKHR = 1000573000
    case physicalDeviceFaultPropertiesKHR = 1000573001
    case deviceFaultInfoKHR = 1000573002
    case deviceFaultDebugInfoKHR = 1000573003
    case physicalDeviceMaintenance8FeaturesKHR = 1000574000
    case memoryBarrierAccessFlags3KHR = 1000574002
    case physicalDeviceImageAlignmentControlFeaturesMESA = 1000575000
    case physicalDeviceImageAlignmentControlPropertiesMESA = 1000575001
    case imageAlignmentControlCreateInfoMESA = 1000575002
    case physicalDeviceShaderFmaFeaturesKHR = 1000579000
    case pushConstantBankInfoNV = 1000580000
    case physicalDevicePushConstantBankFeaturesNV = 1000580001
    case physicalDevicePushConstantBankPropertiesNV = 1000580002
    case physicalDeviceRayTracingInvocationReorderFeaturesEXT = 1000581000
    case physicalDeviceRayTracingInvocationReorderPropertiesEXT = 1000581001
    case physicalDeviceDepthClampControlFeaturesEXT = 1000582000
    case pipelineViewportDepthClampControlCreateInfoEXT = 1000582001
    case physicalDeviceMaintenance9FeaturesKHR = 1000584000
    case physicalDeviceMaintenance9PropertiesKHR = 1000584001
    case queueFamilyOwnershipTransferPropertiesKHR = 1000584002
    case physicalDeviceVideoMaintenance2FeaturesKHR = 1000586000
    case videoDecodeH264InlineSessionParametersInfoKHR = 1000586001
    case videoDecodeH265InlineSessionParametersInfoKHR = 1000586002
    case videoDecodeAv1InlineSessionParametersInfoKHR = 1000586003
    case physicalDeviceHdrVividFeaturesHUAWEI = 1000590000
    case hdrVividDynamicMetadataHUAWEI = 1000590001
    case physicalDeviceCooperativeMatrix2FeaturesNV = 1000593000
    case cooperativeMatrixFlexibleDimensionsPropertiesNV = 1000593001
    case physicalDeviceCooperativeMatrix2PropertiesNV = 1000593002
    case physicalDevicePipelineOpacityMicromapFeaturesARM = 1000596000
    case physicalDeviceDepthClampZeroOneFeaturesKHR = 1000421000
    case physicalDevicePerformanceCountersByRegionFeaturesARM = 1000605000
    case physicalDevicePerformanceCountersByRegionPropertiesARM = 1000605001
    case performanceCounterARM = 1000605002
    case performanceCounterDescriptionARM = 1000605003
    case renderPassPerformanceCountersByRegionBeginInfoARM = 1000605004
    case physicalDeviceShaderInstrumentationFeaturesARM = 1000607000
    case physicalDeviceShaderInstrumentationPropertiesARM = 1000607001
    case shaderInstrumentationCreateInfoARM = 1000607002
    case shaderInstrumentationMetricDescriptionARM = 1000607003
    case physicalDeviceVertexAttributeRobustnessFeaturesEXT = 1000608000
    case physicalDeviceFormatPackFeaturesARM = 1000609000
    case physicalDeviceFragmentDensityMapLayeredFeaturesVALVE = 1000611000
    case physicalDeviceFragmentDensityMapLayeredPropertiesVALVE = 1000611001
    case pipelineFragmentDensityMapLayeredCreateInfoVALVE = 1000611002
    case physicalDeviceRobustness2FeaturesKHR = 1000286000
    case physicalDeviceRobustness2PropertiesKHR = 1000286001
    case setPresentConfigNV = 1000613000
    case physicalDevicePresentMeteringFeaturesNV = 1000613001
    case physicalDeviceFragmentDensityMapOffsetFeaturesEXT = 1000425000
    case physicalDeviceFragmentDensityMapOffsetPropertiesEXT = 1000425001
    case renderPassFragmentDensityMapOffsetEndInfoEXT = 1000425002
    case physicalDeviceZeroInitializeDeviceMemoryFeaturesEXT = 1000620000
    case physicalDevicePresentModeFifoLatestReadyFeaturesKHR = 1000361000
    case physicalDeviceOpacityMicromapFeaturesKHR = 1000623000
    case physicalDeviceOpacityMicromapPropertiesKHR = 1000623001
    case accelerationStructureGeometryMicromapDataKHR = 1000623002
    case accelerationStructureTrianglesOpacityMicromapKHR = 1000623003
    case physicalDeviceShader64BitIndexingFeaturesEXT = 1000627000
    case physicalDeviceCustomResolveFeaturesEXT = 1000628000
    case beginCustomResolveInfoEXT = 1000628001
    case customResolveCreateInfoEXT = 1000628002
    case physicalDeviceDataGraphModelFeaturesQCOM = 1000629000
    case dataGraphPipelineBuiltinModelCreateInfoQCOM = 1000629001
    case physicalDeviceMaintenance10FeaturesKHR = 1000630000
    case physicalDeviceMaintenance10PropertiesKHR = 1000630001
    case renderingAttachmentFlagsInfoKHR = 1000630002
    case renderingEndInfoKHR = 1000619003
    case resolveImageModeInfoKHR = 1000630004
    case physicalDeviceDataGraphOpticalFlowFeaturesARM = 1000631000
    case queueFamilyDataGraphOpticalFlowPropertiesARM = 1000631001
    case dataGraphOpticalFlowImageFormatInfoARM = 1000631003
    case dataGraphOpticalFlowImageFormatPropertiesARM = 1000631004
    case dataGraphPipelineOpticalFlowDispatchInfoARM = 1000631005
    case dataGraphPipelineOpticalFlowCreateInfoARM = 1000631002
    case dataGraphPipelineResourceInfoImageLayoutARM = 1000631006
    case dataGraphPipelineSingleNodeCreateInfoARM = 1000631007
    case dataGraphPipelineSingleNodeConnectionARM = 1000631008
    case physicalDeviceShaderLongVectorFeaturesEXT = 1000635000
    case physicalDeviceShaderLongVectorPropertiesEXT = 1000635001
    case physicalDevicePipelineCacheIncrementalModeFeaturesSEC = 1000637000
    case physicalDeviceShaderUniformBufferUnsizedArrayFeaturesEXT = 1000642000
    case computeOccupancyPriorityParametersNV = 1000645000
    case physicalDeviceComputeOccupancyPriorityFeaturesNV = 1000645001
    case physicalDeviceMaintenance11FeaturesKHR = 1000657000
    case queueFamilyOptimalImageTransferGranularityPropertiesKHR = 1000657001
    case physicalDeviceShaderSubgroupPartitionedFeaturesEXT = 1000662000
    case physicalDeviceShaderMixedFloatDotProductFeaturesVALVE = 1000673000
    case physicalDeviceThrottleHintFeaturesSEC = 1000674000
    case throttleHintSubmitInfoSEC = 1000674001
    case dataGraphPipelineNeuralStatisticsCreateInfoARM = 1000676000
    case dataGraphPipelineSessionNeuralStatisticsCreateInfoARM = 1000676001
    case physicalDeviceDataGraphNeuralAcceleratorStatisticsFeaturesARM = 1000676002
    case physicalDevicePrimitiveRestartIndexFeaturesEXT = 1000678000
}

public enum SubpassContents: UInt32 {
    case inline = 0
    case secondaryCommandBuffers = 1
    case inlineAndSecondaryCommandBuffersKHR = 1000451000
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
    case errorSurfaceLostKHR = -1000000000
    case errorNativeWindowInUseKHR = -1000000001
    case suboptimalKHR = 1000001003
    case errorOutOfDateKHR = -1000001004
    case errorIncompatibleDisplayKHR = -1000003001
    case errorInvalidShaderNV = -1000012000
    case errorImageUsageNotSupportedKHR = -1000023000
    case errorVideoPictureLayoutNotSupportedKHR = -1000023001
    case errorVideoProfileOperationNotSupportedKHR = -1000023002
    case errorVideoProfileFormatNotSupportedKHR = -1000023003
    case errorVideoProfileCodecNotSupportedKHR = -1000023004
    case errorVideoStdVersionNotSupportedKHR = -1000023005
    case errorInvalidDrmFormatModifierPlaneLayoutEXT = -1000158000
    case errorPresentTimingQueueFullEXT = -1000208000
    case threadIdleKHR = 1000268000
    case threadDoneKHR = 1000268001
    case operationDeferredKHR = 1000268002
    case operationNotDeferredKHR = 1000268003
    case errorInvalidVideoStdParametersKHR = -1000299000
    case errorCompressionExhaustedEXT = -1000338000
    case incompatibleShaderBinaryEXT = 1000482000
    case pipelineBinaryMissingKHR = 1000483000
    case errorNotEnoughSpaceKHR = -1000483000
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
    case viewportWScalingNV = 1000087000
    case discardRectangleEXT = 1000099000
    case discardRectangleEnableEXT = 1000099001
    case discardRectangleModeEXT = 1000099002
    case sampleLocationsEXT = 1000143000
    case rayTracingPipelineStackSizeKHR = 1000347000
    case viewportShadingRatePaletteNV = 1000164004
    case viewportCoarseSampleOrderNV = 1000164006
    case exclusiveScissorEnableNV = 1000205000
    case exclusiveScissorNV = 1000205001
    case fragmentShadingRateKHR = 1000226000
    case vertexInputEXT = 1000352000
    case patchControlPointsEXT = 1000377000
    case logicOpEXT = 1000377003
    case colorWriteEnableEXT = 1000381000
    case depthClampEnableEXT = 1000455003
    case polygonModeEXT = 1000455004
    case rasterizationSamplesEXT = 1000455005
    case sampleMaskEXT = 1000455006
    case alphaToCoverageEnableEXT = 1000455007
    case alphaToOneEnableEXT = 1000455008
    case logicOpEnableEXT = 1000455009
    case colorBlendEnableEXT = 1000455010
    case colorBlendEquationEXT = 1000455011
    case colorWriteMaskEXT = 1000455012
    case tessellationDomainOriginEXT = 1000455002
    case rasterizationStreamEXT = 1000455013
    case conservativeRasterizationModeEXT = 1000455014
    case extraPrimitiveOverestimationSizeEXT = 1000455015
    case depthClipEnableEXT = 1000455016
    case sampleLocationsEnableEXT = 1000455017
    case colorBlendAdvancedEXT = 1000455018
    case provokingVertexModeEXT = 1000455019
    case lineRasterizationModeEXT = 1000455020
    case lineStippleEnableEXT = 1000455021
    case depthClipNegativeOneToOneEXT = 1000455022
    case viewportWScalingEnableNV = 1000455023
    case viewportSwizzleNV = 1000455024
    case coverageToColorEnableNV = 1000455025
    case coverageToColorLocationNV = 1000455026
    case coverageModulationModeNV = 1000455027
    case coverageModulationTableEnableNV = 1000455028
    case coverageModulationTableNV = 1000455029
    case shadingRateImageEnableNV = 1000455030
    case representativeFragmentTestEnableNV = 1000455031
    case coverageReductionModeNV = 1000455032
    case attachmentFeedbackLoopEnableEXT = 1000524000
    case depthClampRangeEXT = 1000582000
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
    case surfaceKHR = 1000000000
    case swapchainKHR = 1000001000
    case displayKHR = 1000002000
    case displayModeKHR = 1000002001
    case debugReportCallbackEXT = 1000011000
    case videoSessionKHR = 1000023000
    case videoSessionParametersKHR = 1000023001
    case cuModuleNVX = 1000029000
    case cuFunctionNVX = 1000029001
    case debugUtilsMessengerEXT = 1000128000
    case gpaSessionAMD = 1000133000
    case accelerationStructureKHR = 1000150000
    case validationCacheEXT = 1000160000
    case accelerationStructureNV = 1000165000
    case performanceConfigurationINTEL = 1000210000
    case deferredOperationKHR = 1000268000
    case indirectCommandsLayoutNV = 1000277000
    case micromapEXT = 1000396000
    case tensorARM = 1000460000
    case tensorViewARM = 1000460001
    case opticalFlowSessionNV = 1000464000
    case shaderEXT = 1000482000
    case pipelineBinaryKHR = 1000483000
    case dataGraphPipelineSessionARM = 1000507000
    case externalComputeQueueNV = 1000556000
    case indirectCommandsLayoutEXT = 1000572000
    case indirectExecutionSetEXT = 1000572001
    case shaderInstrumentationARM = 1000607000
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
    case sharedDemandRefresh = 1000111000
    case sharedContinuousRefresh = 1000111001
    case fifoLatestReady = 1000361000
}

public enum ColorSpaceKHR: UInt32 {
    case srgbNonlinear = 0
    case displayP3NonlinearEXT = 1000104001
    case extendedSrgbLinearEXT = 1000104002
    case displayP3LinearEXT = 1000104003
    case dciP3NonlinearEXT = 1000104004
    case bt709LinearEXT = 1000104005
    case bt709NonlinearEXT = 1000104006
    case bt2020LinearEXT = 1000104007
    case hdr10St2084EXT = 1000104008
    case dolbyvisionEXT = 1000104009
    case hdr10HlgEXT = 1000104010
    case adobergbLinearEXT = 1000104011
    case adobergbNonlinearEXT = 1000104012
    case passThroughEXT = 1000104013
    case extendedSrgbNonlinearEXT = 1000104014
    case displayNativeAMD = 1000213000
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
    case presentStageLocalEXT = 1000208000
    case swapchainLocalEXT = 1000208001
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
    case samplerYcbcrConversion = 1000156000
    case descriptorUpdateTemplate = 1000085000
    case cuModuleNvx = 1000029000
    case cuFunctionNvx = 1000029001
    case accelerationStructureKhr = 1000150000
    case accelerationStructureNv = 1000165000
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
    case pushData = 1000135000
    case drawMeshTasks = 1000328000
    case pipeline = 1000428003
    case dispatch = 1000428004
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
    case weightedAverageRangeclampQCOM = 1000521000
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
    case serialize = 2
    case deserialize = 3
}

public enum BuildAccelerationStructureModeKHR: UInt32 {
    case build = 0
    case update = 1
}

public enum AccelerationStructureTypeKHR: UInt32 {
    case topLevel = 0
    case bottomLevel = 1
    case generic = 2
    case opacityMicromap = 1000623000
}

public enum GeometryTypeKHR: UInt32 {
    case triangles = 0
    case aabbs = 1
    case instances = 2
    case spheresNV = 1000429004
    case linearSweptSpheresNV = 1000429005
    case micromap = 1000623000
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

#if VK_USE_PLATFORM_WIN32_KHR
public enum FullScreenExclusiveEXT: UInt32 {
    case `default` = 0
    case allowed = 1
    case disallowed = 2
    case applicationControlled = 3
}
#endif

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
    case insufficientBitstreamBufferRange = -1000299000
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

public enum MicromapTypeEXT: UInt32 {
    case opacityMicromap = 0
}

public enum CopyMicromapModeEXT: UInt32 {
    case clone = 0
    case serialize = 1
    case deserialize = 2
    case compact = 3
}

public enum BuildMicromapModeEXT: UInt32 {
    case build = 0
}

public enum OpacityMicromapFormatKHR: UInt32 {
    case type2State = 1
    case type4State = 2
}

public enum OpacityMicromapSpecialIndexKHR: Int32 {
    case fullyTransparent = -1
    case fullyOpaque = -2
    case fullyUnknownTransparent = -3
    case fullyUnknownOpaque = -4
    case clusterGeometryDisableOpacityMicromapNV = -5
}

public enum AccelerationStructureSerializedBlockTypeKHR: UInt32 {
    case opacityMicromap = 0
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
    case pushData = 1000135000
    case pushDataSequenceIndex = 1000135001
    case drawMeshTasksNv = 1000202002
    case drawMeshTasksCountNv = 1000202003
    case drawMeshTasks = 1000328000
    case drawMeshTasksCount = 1000328001
    case traceRays2 = 1000386004
}

#if VK_ENABLE_BETA_EXTENSIONS
public enum DisplacementMicromapFormatNV: UInt32 {
    case type64Triangles64Bytes = 1
    case type256Triangles128Bytes = 2
    case type1024Triangles128Bytes = 3
}
#endif

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
    case bfloat16 = 1000141000
    case sint8PackedNV = 1000491000
    case uint8PackedNV = 1000491001
    case float8E4m3EXT = 1000491002
    case float8E5m2EXT = 1000491003
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

#if VK_ENABLE_BETA_EXTENSIONS
public enum CompressedTriangleFormatAMDX: UInt32 {
    case dgf1 = 0
}
#endif

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
    case opticalFlowCache = 1000631001
    case neuralAcceleratorStatistics = 1000676000
}

public enum DataGraphPipelineSessionBindPointTypeARM: UInt32 {
    case memory = 0
}

public enum DataGraphPipelinePropertyARM: UInt32 {
    case creationLog = 0
    case identifier = 1
    case neuralAcceleratorDebugDatabase = 1000676000
    case neuralAcceleratorStatisticsInfo = 1000676001
}

public enum PhysicalDeviceDataGraphProcessingEngineTypeARM: UInt32 {
    case `default` = 0
    case neuralQCOM = 1000629000
    case computeQCOM = 1000629001
}

public enum PhysicalDeviceDataGraphOperationTypeARM: UInt32 {
    case spirvExtendedInstructionSet = 0
    case neuralModelQCOM = 1000629000
    case builtinModelQCOM = 1000629001
    case opticalFlow = 1000631000
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
    case heapWithShaderRecordIndex = 8
    case shaderRecordData = 9
    case shaderRecordAddress = 10
}

public enum GpaPerfBlockAMD: UInt32 {
    case cpf = 0
    case ia = 1
    case vgt = 2
    case pa = 3
    case sc = 4
    case spi = 5
    case sq = 6
    case sx = 7
    case ta = 8
    case td = 9
    case tcp = 10
    case tcc = 11
    case tca = 12
    case db = 13
    case cb = 14
    case gds = 15
    case srbm = 16
    case grbm = 17
    case grbmSe = 18
    case rlc = 19
    case dma = 20
    case mc = 21
    case cpg = 22
    case cpc = 23
    case wd = 24
    case tcs = 25
    case atc = 26
    case atcL2 = 27
    case mcVmL2 = 28
    case ea = 29
    case rpb = 30
    case rmi = 31
    case umcch = 32
    case ge = 33
    case gl1a = 34
    case gl1c = 35
    case gl1cg = 36
    case gl2a = 37
    case gl2c = 38
    case cha = 39
    case chc = 40
    case chcg = 41
    case gus = 42
    case gcr = 43
    case ph = 44
    case utcl1 = 45
    case geDist = 46
    case geSe = 47
    case dfMall = 48
    case sqWgp = 49
    case pc = 50
    case gl1xa = 51
    case gl1xc = 52
    case wgs = 53
    case eacpwd = 54
    case ease = 55
    case rlcuser = 56
}

public enum GpaSampleTypeAMD: UInt32 {
    case cumulative = 0
    case trace = 1
    case timing = 2
}

public enum GpaDeviceClockModeAMD: UInt32 {
    case `default` = 0
    case query = 1
    case profiling = 2
    case minMemory = 3
    case minEngine = 4
    case peak = 5
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

public enum DataGraphPipelineNodeConnectionTypeARM: UInt32 {
    case opticalFlowInput = 1000631000
    case opticalFlowReference = 1000631001
    case opticalFlowHint = 1000631002
    case opticalFlowFlowVector = 1000631003
    case opticalFlowCost = 1000631004
}

public enum DataGraphPipelineNodeTypeARM: UInt32 {
    case opticalFlow = 1000631000
}

public enum NeuralAcceleratorStatisticsModeARM: UInt32 {
    case disabled = 0
    case statistics0 = 1
    case statistics1 = 2
}

