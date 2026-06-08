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
