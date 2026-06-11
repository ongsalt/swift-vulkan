@_exported import CVulkan

public func checkResult(_ result: VkResult) throws(Result) {
    if result.rawValue < 0 {
        throw Result(rawValue: result.rawValue)!
    }
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

// size_t is Int
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
