# swift-vulkan

A natural Swift interface for Vulkan.

Its aim is to be a lightweight wrapper around Vulkan, yet remove many of the complexities of using the C API directly.

## Overview
- Generated from vk.xml
- Conventional Swift names and types (String, Array, Bool, Enum, OptionSet etc.)
- Classes used to organise commands and handles
- Native error handling (do/try/catch) for failable commands
- Commands loaded automatically
- Support for Vulkan 1.0 / 1.1 / 1.2, plus many extensions


## Example Usage
A simple example of how to get started.
```swift
// Create an entry point to the Vulkan API
// This attempts to load the Vulkan loader dynamically
let entry = try Entry()

// Create an instance
let instance = try entry.createInstance(
    createInfo: InstanceCreateInfo(
        flags: [],
        applicationInfo: nil,
        enabledLayerNames: [],
        enabledExtensionNames: []))

// Find any physical devices
let physicalDevices = try instance.getPhysicalDevices()

// Print the name of each device
for device in physicalDevices {
    print(device.getProperties().deviceName)
}
```

## Future Goals
Swift-vulkan is a relatively new project, and there are still some important milestones to achieve.

- Some degree of automatic memory management (currently, destroy/free commands have to be called manually)
- Import unions as appropriate Swift types
- Simpler initializers for structs with optional members, or members that have obvious default values
- Implement structure chaining (pNext)
- Optimize struct conversion (currently, a conversion is performed each time a struct is passed to a command)
- Use preprocessor conditions to enable specific types at compile time (could do this for all extensions / features, or just for platform-specific extensions)
- Parse Vulkan documentation and generate Swift comments


## Todos
- No return type 
- nuke handle class. just do newtype
- multiple out array
    - is multiple out array of pNext chain possible?
- assert(array1.count == array2.count)
- proper extension support
- typed throws
- handle `api`, currently i nuked everything `vulkansc`
- generate `push(_:)` per each ChainableBase
- namespace platform specific header?
- why do some struct not have `init(cStruct: Self.CStruct)` 
- explicitly type `enumerate()`
- some flag is UInt64 (BufferUsageFlags2)
- `some Chainable<...>` can not be wrapped in an optional

# Design
## Signature transformation
- map simple types
- return types:
    - VkResult -> throws(VulkanResult)

## Chaining
- `[inout] some Chainable<Base>`. (maybe we can provide some `extension` `.0` `.1`...)
    ```swift
    let createInfo = DeviceCreateInfo(...)
        .push(FeaturesA(..))
        .push(FeaturesB(...))
    // createInfo: Chain<DeviceCreateInfo, Chain<FeaturesA, FeaturesB>>
    ``` 

    if we want to do it `ash` way (no chain type). It will requires a (`MutableRef`)[https://github.com/swiftlang/swift-evolution/blob/main/proposals/0519-ref-mutableref-types.md] in swift 6.4 (available in recent `main`)


- return value
```swift
func getSomething<T>(outType: T) throws(VulkanError) -> T where T {}

handl.getSomething(querying: #chainOf<A, B, C>) -> Chain<A, Chain<B, C>>


``` 

