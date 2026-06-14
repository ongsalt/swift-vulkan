public protocol Chainable<Base>: CStructConvertible where Self.CStruct == Base.CStruct {
    associatedtype Base: CStructConvertible
    var base: Base { get }

    associatedtype NestedTuple
    var asTuple: NestedTuple { get }

    func withCStruct<R, E: Error>(
        pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Base.CStruct>) throws(E) -> R
    )
        throws(E) -> R
}

extension Chainable {
    // auto implement CStructConvertible
    public func withCStruct<R, E: Error>(_ body: (UnsafePointer<Base.CStruct>) throws(E) -> R)
        throws(E) -> R
    {
        try self.withCStruct(pNext: nil, body)
    }
}

extension Chainable where Base == Self {
    // this will include those that are not a base too
    // but we wont generate a `push(extension:)` for it
    public var base: Self { self }
    public var asTuple: Self { self }
}

public struct AnyChainableArray<Base: ChainableBase> {
    var storage: [any Chainable<Base>] = []
    public init(storage: [any Chainable<Base>] = []) {
        self.storage = storage
    }
}

extension AnyChainableArray: Collection, MutableCollection, BidirectionalCollection,
    RandomAccessCollection
{
    public typealias Index = Int
    public typealias Element = any Chainable<Base>

    public var startIndex: Int { storage.startIndex }
    public var endIndex: Int { storage.endIndex }

    public subscript(position: Int) -> any Chainable<Base> {
        get { storage[position] }
        set { storage[position] = newValue }
    }

    public func index(after i: Int) -> Int { storage.index(after: i) }
    public func index(before i: Int) -> Int { storage.index(before: i) }
}

extension AnyChainableArray: RangeReplaceableCollection {
    public init() {
        self.init(storage: [])
    }

    public mutating func replaceSubrange<C: Collection>(_ subrange: Range<Int>, with newElements: C)
    where C.Element == any Chainable<Base> {
        storage.replaceSubrange(subrange, with: newElements)
    }
}

extension AnyChainableArray: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = any Chainable<Base>
    public init(arrayLiteral elements: any Chainable<Base>...) {
        self.init(storage: elements)
    }
}

extension AnyChainableArray {
    func withCStructBufferPointer<R, E: Error>(
        _ body: (UnsafeBufferPointer<Base.CStruct>) throws(E) -> R
    ) throws(E) -> R {
        func _withCStructBufferPointer<S: CStructConvertible, I: IteratorProtocol>(
            to array: inout [S.CStruct], appending iterator: inout I,
            _ body: (UnsafeBufferPointer<S.CStruct>) throws(E) -> R
        ) throws(E) -> R where I.Element == any Chainable<S> {
            if let chainable = iterator.next() {
                return try chainable.withCStruct { cStruct throws(E) in
                    array.append(cStruct.pointee)
                    return try _withCStructBufferPointer(to: &array, appending: &iterator, body)
                }
            } else {
                return try array.withUnsafeBufferPointer { ptr throws(E) in
                    try body(ptr)
                }
            }
        }

        var cStructs: [Base.CStruct] = []
        cStructs.reserveCapacity(self.storage.count)
        var iterator = self.storage.makeIterator()
        return try _withCStructBufferPointer(to: &cStructs, appending: &iterator, body)
    }
}

public protocol ChainableBase: Chainable {}

public struct Chain<Base: Chainable, Next: Chainable> {
    public let base: Base
    public let next: Next
}

extension Chain {
    public typealias NestedTuple = (Base, Next.NestedTuple)
    public var asTuple: NestedTuple {
        return (base, next.asTuple)
    }
}

extension Chain: Chainable<Base> {
    public typealias CStruct = Base.CStruct

    init(cStruct: CStruct) {
        fatalError("im too lazy to implement this")
    }

    public func withCStruct<R, E: Error>(
        pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Base.CStruct>) throws(E) -> R
    ) throws(E) -> R {
        try next.withCStruct(pNext: pNext) { nextPtr throws(E) in
            try base.withCStruct(pNext: nextPtr, body)
        }
    }
}

extension Optional where Wrapped: Chainable, Wrapped: CStructConvertible {
    func withOptionalCStruct<R, E: Error>(
        pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Wrapped.CStruct>?) throws(E) -> R
    ) throws(E) -> R {
        guard let s = self else { return try body(nil) }
        return try s.withCStruct(body)
    }
}

public protocol ChainLink: Chainable {
    associatedtype Tail: Chainable
    var next: Tail { get }
}

extension Chain: ChainLink {
    public typealias Tail = Next
}

extension Chain {
    public var _0: Base { base }
    public var _1: Next.Base { next.base }
}

extension Chain where Next: ChainLink {
    public var _2: Next.Tail.Base { next.next.base }
}

extension Chain where Next: ChainLink, Next.Tail: ChainLink {
    public var _3: Next.Tail.Tail.Base { next.next.next.base }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink
{
    public var _4: Next.Tail.Tail.Tail.Base { next.next.next.next.base }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail: ChainLink
{
    public var _5: Next.Tail.Tail.Tail.Tail.Base { next.next.next.next.next.base }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail: ChainLink
{
    public var _6: Next.Tail.Tail.Tail.Tail.Tail.Base { next.next.next.next.next.next.base }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail: ChainLink
{
    public var _7: Next.Tail.Tail.Tail.Tail.Tail.Tail.Base {
        next.next.next.next.next.next.next.base
    }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail.Tail: ChainLink
{
    public var _8: Next.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Base {
        next.next.next.next.next.next.next.next.base
    }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail.Tail.Tail: ChainLink
{
    public var _9: Next.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Base {
        next.next.next.next.next.next.next.next.next.base
    }
}

extension Chain
where
    Next: ChainLink,
    Next.Tail: ChainLink,
    Next.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail.Tail.Tail: ChainLink,
    Next.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Tail: ChainLink
{
    public var _10: Next.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Tail.Base {
        next.next.next.next.next.next.next.next.next.next.base
    }
}
