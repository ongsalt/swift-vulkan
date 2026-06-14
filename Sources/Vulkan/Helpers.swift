@_exported import CVulkan

#if canImport(Darwin)
    import Darwin
#elseif canImport(Glibc)
    import Glibc
#endif

public func checkResult(_ result: VkResult) throws(Result) {
    guard result.rawValue < 0 else { return }
    guard let r = Result(rawValue: result.rawValue) else {
        fatalError("unknown error code: \(result.rawValue)")
    }

    throw r
}

public protocol CStructConvertible<CStruct> {
    associatedtype CStruct
    func withCStruct<R, E: Error>(_ body: (UnsafePointer<CStruct>) throws(E) -> R) throws(E) -> R
}

extension Optional where Wrapped: CStructConvertible {
    func withOptionalCStruct<R, E: Error>(_ body: (UnsafePointer<Wrapped.CStruct>?) throws(E) -> R)
        throws(E) -> R
    {
        guard let s = self else { return try body(nil) }
        return try s.withCStruct(body)
    }
}

extension Optional where Wrapped == String {
    func withOptionalCString<R, E: Error>(_ body: (UnsafePointer<CChar>?) throws(E) -> R) throws(E)
        -> R
    {
        guard let s = self else { return try body(nil) }
        return try s._withCString(body)
    }
}

extension String {
    init<T>(unsafeBytesOf value: T) {
        self = withUnsafeBytes(of: value) { ptr in
            String(cString: ptr.bindMemory(to: CChar.self).baseAddress!)
        }
    }

    func unsafeBytesCopy<T>() -> T {
        let size = MemoryLayout<T>.size
        let ptr = UnsafeMutableBufferPointer<CChar>.allocate(capacity: size)
        defer { ptr.deallocate() }
        ptr.initialize(repeating: 0)
        let rawPtr = UnsafeMutableRawBufferPointer(ptr)
        rawPtr.copyBytes(from: utf8.prefix(size - 1))
        return rawPtr.bindMemory(to: T.self).baseAddress!.pointee
    }

    // typed error ver
    func _withCString<R, E: Error>(_ body: (UnsafePointer<CChar>) throws(E) -> R) throws(E)
        -> R
    {
        do {
            return try self.withCString(body)
        } catch {
            throw error as! E
        }
    }

}

private func _withCStringBufferPointer<I: IteratorProtocol, R, E: Error>(
    to array: inout [UnsafePointer<CChar>?], appending iterator: inout I,
    _ body: (UnsafeBufferPointer<UnsafePointer<CChar>?>) throws(E) -> R
) throws(E) -> R where I.Element == String {
    do {
        if let string = iterator.next() {
            return try string.withCString { cString in
                array.append(cString)
                return try _withCStringBufferPointer(to: &array, appending: &iterator, body)
            }
        } else {
            return try array.withUnsafeBufferPointer { ptr in
                try body(ptr)
            }
        }
    } catch {
        throw error as! E
    }
}

extension Array where Element == String {
    func withCStringBufferPointer<R, E: Error>(
        _ body: (UnsafeBufferPointer<UnsafePointer<CChar>?>) throws(E) -> R
    ) throws(E) -> R {
        var cStrings: [UnsafePointer<CChar>?] = []
        cStrings.reserveCapacity(self.count)
        var iterator = makeIterator()
        return try _withCStringBufferPointer(to: &cStrings, appending: &iterator, body)
    }
}

private func _withCStructBufferPointer<S: CStructConvertible, I: IteratorProtocol, R, E: Error>(
    to array: inout [S.CStruct], appending iterator: inout I,
    _ body: (UnsafeBufferPointer<S.CStruct>) throws(E) -> R
) throws(E) -> R where I.Element == S {
    if let structure = iterator.next() {
        return try structure.withCStruct { cStruct throws(E) in
            array.append(cStruct.pointee)
            return try _withCStructBufferPointer(to: &array, appending: &iterator, body)
        }
    } else {
        return try array.withUnsafeBufferPointer { ptr throws(E) in
            try body(ptr)
        }
    }
}

extension Array where Element: CStructConvertible {
    func withCStructBufferPointer<R, E: Error>(
        _ body: (UnsafeBufferPointer<Element.CStruct>) throws(E) -> R
    ) throws(E) -> R {
        var cStructs: [Element.CStruct] = []
        cStructs.reserveCapacity(self.count)
        var iterator = makeIterator()
        return try _withCStructBufferPointer(to: &cStructs, appending: &iterator, body)
    }
}

extension Optional {
    func withOptionalCStructBufferPointer<T: CStructConvertible, R, E: Error>(
        _ body: (UnsafeBufferPointer<T.CStruct>) throws(E) -> R
    ) throws(E) -> R where Wrapped == [T] {
        guard let array = self else { return try body(UnsafeBufferPointer(start: nil, count: 0)) }
        return try array.withCStructBufferPointer(body)
    }

    func withOptionalUnsafeBufferPointer<T, R, E: Error>(
        _ body: (UnsafeBufferPointer<T>) throws(E) -> R
    ) throws(E) -> R where Wrapped == [T] {
        guard let array = self else { return try body(UnsafeBufferPointer(start: nil, count: 0)) }
        return try array.withUnsafeBufferPointer(body)
    }
}

extension Sequence {
    func unsafeBytesCopy<T>() -> T {
        let capacity = MemoryLayout<T>.stride / MemoryLayout<Element>.stride
        let ptr = UnsafeMutableBufferPointer<Element>.allocate(capacity: capacity)
        defer { ptr.deallocate() }
        _ = ptr.initialize(from: self.prefix(capacity))
        return UnsafeMutableRawBufferPointer(ptr).bindMemory(to: T.self).baseAddress!.pointee
    }
}

func enumerate<R>(_ body: (UnsafeMutablePointer<R>?, UnsafeMutablePointer<UInt32>) -> VkResult)
    throws(Result) -> [R]
{
    var count: UInt32 = 0
    var result = VK_SUCCESS
    var array: [R]

    repeat {
        try checkResult(body(nil, &count))

        if count == 0 {
            return []
        }

        array = [R](unsafeUninitializedCapacity: Int(count)) { buffer, initializedCount in
            result = body(buffer.baseAddress!, &count)
            initializedCount = Int(count)
        }
    } while result == VK_INCOMPLETE

    try checkResult(result)
    return array
}

func enumerate<R>(_ body: (UnsafeMutablePointer<R>?, UnsafeMutablePointer<UInt32>) -> Void) -> [R] {
    var count: UInt32 = 0
    body(nil, &count)

    if count == 0 {
        return []
    }

    return [R](unsafeUninitializedCapacity: Int(count)) { buffer, initializedCount in
        body(buffer.baseAddress!, &count)
        initializedCount = Int(count)
    }
}

func enumerateBytes(_ body: (UnsafeMutablePointer<UInt8>?, UnsafeMutablePointer<Int>) -> VkResult)
    throws(Result) -> [UInt8]
{
    var count: Int = 0
    var result = VK_SUCCESS
    var array: [UInt8]

    repeat {
        try checkResult(body(nil, &count))

        if count == 0 {
            return []
        }

        array = [UInt8](unsafeUninitializedCapacity: Int(count)) { buffer, initializedCount in
            result = body(buffer.baseAddress!, &count)
            initializedCount = Int(count)
        }
    } while result == VK_INCOMPLETE

    try checkResult(result)
    return array
}

protocol StringConvertibleOptionSet: OptionSet, CustomStringConvertible {
    static var descriptions: [(Self.Element, String)] { get }
}

extension StringConvertibleOptionSet {
    public var description: String {
        let descriptions = Self.descriptions.filter { self.contains($0.0) }.map { $0.1 }
        return "[\(descriptions.joined(separator: ", "))]"
    }
}

public protocol HandleContainer {
    func withHandle<R, E: Error>(_ body: (OpaquePointer?) throws(E) -> R) throws(E) -> R
}

protocol _HandleContainer: HandleContainer, Equatable {
    var handle: OpaquePointer? { get }
}

extension _HandleContainer {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.handle == rhs.handle
    }

    public func withHandle<R, E: Error>(_ body: (OpaquePointer?) throws(E) -> R) throws(E) -> R {
        return try body(handle)
    }
}

public struct EmptyEnum<T: BinaryInteger> {}

extension EmptyEnum: RawRepresentable {
    public var rawValue: T { 0 }
    public init?(rawValue: T) {}
}

func maybeMutable(_ ptr: UnsafeRawPointer?) -> UnsafeRawPointer? {
    ptr
}

func maybeMutable(_ ptr: UnsafeRawPointer?) -> UnsafeMutableRawPointer? {
    UnsafeMutableRawPointer(mutating: ptr)
}

public protocol VulkanStructure: CStructConvertible {
    static var structureType: StructureType { get }
    // var default: Self { get }
}

public protocol OutStruct: VulkanStructure {
    init(cStruct: CStruct)
}

// public protocol InStruct: VulkanStructure {}
func zeroed<T>(of type: T.Type) -> T {
    withUnsafeTemporaryAllocation(of: type, capacity: 1) { buffer in
        memset(buffer.baseAddress, 0, MemoryLayout<T>.size)
        return buffer.baseAddress!.pointee
    }
}


extension PhysicalDevice {
    // public func getProperties2<each Ext>(chaining _: repeat (each Ext).Type)
    //     -> (PhysicalDeviceProperties2, repeat each Ext)
    // where repeat each Ext: OutStruct {
    //     let out = withOutStructureChain(base: PhysicalDeviceProperties2.self, chaining: (repeat (each Ext).self)) {
    //         ptr  in
    //         self.instance.dispatchTable.vkGetPhysicalDeviceProperties2(self.handle, ptr)
    //     }

    //     self.getProperties2(chaining: ())
    //     // return out
    //     fatalError()
    // }
}
func withOutStructureChain<Base, E, each Ext>(
    base baseIn: Base.Type,
    chaining _: (repeat (each Ext).Type),
    call: (UnsafeMutablePointer<Base.CStruct>) throws(E) -> Void
) throws(E) -> (Base, repeat each Ext)
where Base: OutStruct, repeat each Ext: OutStruct 
{    
    // claude wrote this
    // im gonna redo this once we have MutableRef in September
    // may be generate new `init()` for every struct for default init
    // or .zero = Self(cStruct: VkShi())

    var base = zeroed(of: baseIn.CStruct.self)
    var scratch: [UnsafeMutableRawPointer] = []

    // 1. Stable storage per extender; force-set sType, pNext patched below.
    func materialize<T: OutStruct>(_ ty: T.Type) {
        let p = UnsafeMutablePointer<T.CStruct>.allocate(capacity: 1)
        let value = zeroed(of: ty.CStruct.self)
        p.initialize(to: value)
        UnsafeMutableRawPointer(p)
            .assumingMemoryBound(to: VkBaseOutStructure.self)
            .pointee.sType = .init(numericCast(T.structureType.rawValue))
        scratch.append(UnsafeMutableRawPointer(p))
    }
    repeat materialize((each Ext).self)

    // 2. Link scratch[0] -> scratch[1] -> ... -> nil
    for i in scratch.indices {
        let ptr = (i + 1 < scratch.count) ? scratch[i + 1] : nil
        scratch[i].assumingMemoryBound(to: VkBaseOutStructure.self)
            .pointee.pNext = .init(OpaquePointer(ptr))
    }

    // 3. Run the call against a stable base pointer.
    try withUnsafeMutablePointer(to: &base) { p throws(E) in
        let h = UnsafeMutableRawPointer(p).assumingMemoryBound(to: VkBaseOutStructure.self)
        h.pointee.sType = .init(numericCast(Base.structureType.rawValue))
        h.pointee.pNext = .init(OpaquePointer(scratch.first!))
        try call(p)
    }

    // 4. Read back in pack order (== allocation order), free scratch.
    var idx = 0
    func readBack<T: OutStruct>(_: T.Type) -> T {
        defer { idx += 1 }
        let p = scratch[idx].assumingMemoryBound(to: T.CStruct.self)
        defer {
            p.deinitialize(count: 1)
            p.deallocate()
        }
        return T(cStruct: p.pointee)
    }

    return (Base(cStruct: base), repeat readBack((each Ext).self))
}
