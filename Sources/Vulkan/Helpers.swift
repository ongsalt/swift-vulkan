import CVulkan

func checkResult(_ result: VkResult) throws {
    if result.rawValue < 0 {
        throw Result(rawValue: result.rawValue)!
    }
}
public protocol CStructConvertible<CStruct> {
    associatedtype CStruct
    func withCStruct<R>(_ body: (UnsafePointer<CStruct>) throws -> R) rethrows -> R
}
extension Optional where Wrapped: CStructConvertible {
    func withOptionalCStruct<R>(_ body: (UnsafePointer<Wrapped.CStruct>?) throws -> R) rethrows -> R
    {
        guard let s = self else { return try body(nil) }
        return try s.withCStruct(body)
    }
}
extension Optional where Wrapped == String {
    func withOptionalCString<R>(_ body: (UnsafePointer<CChar>?) throws -> R) rethrows -> R {
        guard let s = self else { return try body(nil) }
        return try s.withCString(body)
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
}
private func _withCStringBufferPointer<I: IteratorProtocol, R>(
    to array: inout [UnsafePointer<CChar>?], appending iterator: inout I,
    _ body: (UnsafeBufferPointer<UnsafePointer<CChar>?>) throws -> R
) rethrows -> R where I.Element == String {
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
}
extension Array where Element == String {
    func withCStringBufferPointer<R>(
        _ body: (UnsafeBufferPointer<UnsafePointer<CChar>?>) throws -> R
    ) rethrows -> R {
        var cStrings: [UnsafePointer<CChar>?] = []
        cStrings.reserveCapacity(self.count)
        var iterator = makeIterator()
        return try _withCStringBufferPointer(to: &cStrings, appending: &iterator, body)
    }
}
private func _withCStructBufferPointer<S: CStructConvertible, I: IteratorProtocol, R>(
    to array: inout [S.CStruct], appending iterator: inout I,
    _ body: (UnsafeBufferPointer<S.CStruct>) throws -> R
) rethrows -> R where I.Element == S {
    if let structure = iterator.next() {
        return try structure.withCStruct { cStruct in
            array.append(cStruct.pointee)
            return try _withCStructBufferPointer(to: &array, appending: &iterator, body)
        }
    } else {
        return try array.withUnsafeBufferPointer { ptr in
            try body(ptr)
        }
    }
}
extension Array where Element: CStructConvertible {
    func withCStructBufferPointer<R>(_ body: (UnsafeBufferPointer<Element.CStruct>) throws -> R)
        rethrows -> R
    {
        var cStructs: [Element.CStruct] = []
        cStructs.reserveCapacity(self.count)
        var iterator = makeIterator()
        return try _withCStructBufferPointer(to: &cStructs, appending: &iterator, body)
    }
}
extension Optional {
    func withOptionalCStructBufferPointer<T: CStructConvertible, R>(
        _ body: (UnsafeBufferPointer<T.CStruct>) throws -> R
    ) rethrows -> R where Wrapped == [T] {
        guard let array = self else { return try body(UnsafeBufferPointer(start: nil, count: 0)) }
        return try array.withCStructBufferPointer(body)
    }

    func withOptionalUnsafeBufferPointer<T, R>(_ body: (UnsafeBufferPointer<T>) throws -> R)
        rethrows -> R where Wrapped == [T]
    {
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
    throws -> [R]
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
    func withHandle<R>(_ body: (OpaquePointer?) throws -> R) rethrows -> R
}
protocol _HandleContainer: HandleContainer, Equatable {
    var handle: OpaquePointer? { get }
}
extension _HandleContainer {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.handle == rhs.handle
    }

    public func withHandle<R>(_ body: (OpaquePointer?) throws -> R) rethrows -> R {
        return try body(handle)
    }
}

struct Tuple<T: CStructConvertible, S: CStructConvertible> {
    let first: T
    let second: S

    init(_ first: T, _ second: S) {
        self.first = first
        self.second = second
    }
}

extension Tuple: CStructConvertible {
    typealias CStruct = T.CStruct

    func withCStruct<R>(_ body: (UnsafePointer<T.CStruct>) throws -> R) rethrows -> R {
        try second.withCStruct { secondPtr in
            try first.withCStruct { firstPtr in
                let pNextPtr =
                    UnsafeMutableRawPointer(mutating: firstPtr).assumingMemoryBound(
                        to: UnsafeRawPointer.self)
                    + 8
                pNextPtr.pointee = UnsafeRawPointer(secondPtr)

                return try body(firstPtr)
            }
        }
    }
}

public protocol Chainable {}
public struct Chain<Base: Chainable, Next> {
    let base: Base
    let next: Next
}

extension Chain where Base == BaseA {
    func push<NewValue: BaseA.Extension & CStructConvertible>(_ newValue: NewValue)
        -> Chain<Base, Tuple<NewValue, Next>>
    {
        Chain<Base, _>(base: base, next: Tuple(newValue, next))
    }
}

public struct BaseA: Chainable, CStructConvertible {
    public typealias CStruct = Int
    protocol Extension {}

    public func withCStruct<R>(_ body: (UnsafePointer<Int>) throws -> R) rethrows -> R {
        var s = 0
        return try body(&s)
    }

    func push<T: Extension>(_ next: T) -> Chain<Self, T> {
        Chain(base: self, next: next)
    }
}

extension Chain: CStructConvertible where Base: CStructConvertible, Next: CStructConvertible {
    public func withCStruct<R>(_ body: (UnsafePointer<Base.CStruct>) throws -> R) rethrows -> R {
        try Tuple(base, next).withCStruct { ptr in
            try body(ptr)
        }
    }
}

struct BaseB: Chainable, CStructConvertible {
    func withCStruct<R>(_ body: (UnsafePointer<String>) throws -> R) rethrows -> R {
        fatalError()
    }

    typealias CStruct = String
    protocol Extension {}

    func push<T: Extension>(_ next: T) -> Chain<Self, T> {
        Chain(base: self, next: next)
    }
}
struct CCC: BaseA.Extension, BaseB.Extension, CStructConvertible {
    func withCStruct<R>(_ body: (UnsafePointer<UInt32>) throws -> R) rethrows -> R {
        fatalError()
    }

    typealias CStruct = UInt32
}

func example() {
    let a = BaseA()
        .push(CCC())
        .push(CCC())

        
}

// }
