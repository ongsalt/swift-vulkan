public protocol Chainable<Base>: CStructConvertible where Self.CStruct == Base.CStruct {
  associatedtype Base: CStructConvertible

  var base: Base { get }

  func withCStruct<R>(pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Base.CStruct>) throws -> R)
    rethrows -> R
}

extension Chainable {
  // auto implement CStructConvertible
  public func withCStruct<R>(_ body: (UnsafePointer<Base.CStruct>) throws -> R) rethrows -> R {
    try self.withCStruct(pNext: nil, body)
  }
}

extension Chainable where Base == Self {
  // this will include those that are not a base too
  // but we wont generate a `push(extension:)` for it
  public var base: Self { self }
}

public protocol ChainableBase: Chainable {}

public struct Chain<Base: Chainable, Next: Chainable> {
  public let base: Base
  public let next: Next
}

extension Chain: Chainable<Base> {
  public typealias CStruct = Base.CStruct

  public func withCStruct<R>(
    pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Base.CStruct>) throws -> R
  ) rethrows -> R {
    try next.withCStruct(pNext: pNext) { nextPtr in
      try base.withCStruct(pNext: nextPtr, body)
    }
  }
}

extension Optional where Wrapped: Chainable, Wrapped: CStructConvertible {
  func withOptionalCStruct<R>(
    pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Wrapped.CStruct>?) throws -> R
  ) rethrows -> R {
    guard let s = self else { return try body(nil) }
    return try s.withCStruct(body)
  }
}

public struct BaseA: ChainableBase {
  public typealias CStruct = Int
  protocol Extension: Chainable {}

  public func withCStruct<R>(pNext: UnsafeRawPointer?, _ body: (UnsafePointer<Int>) throws -> R)
    rethrows -> R
  {
    var s = 0
    return try body(&s)
  }
}

extension BaseA {
  func push<Extension: BaseA.Extension>(_ ext: Extension)
    -> Chain<Self, Extension>
  {
    Chain(base: base, next: ext)
  }
}

private struct Chain2<Base: ChainableBase, each Next: Chainable> {
  public let base: Base
  public let next: (repeat each Next)
}

extension Chain where Base == BaseA {
  fileprivate func push<NewValue: BaseA.Extension>(_ newValue: NewValue)
    -> Chain<Base, Chain<NewValue, Next>>
  {
    Chain<Base, _>(base: base, next: Chain<NewValue, Next>(base: newValue, next: next))
  }
}

private struct BaseB: ChainableBase {
  typealias CStruct = String
  protocol Extension: Chainable {}

  func withCStruct<R>(pNext: UnsafeRawPointer?, _ body: (UnsafePointer<String>) throws -> R)
    rethrows -> R
  {
    fatalError()
  }

}
private struct ABExt: BaseA.Extension, BaseB.Extension {
  func withCStruct<R>(pNext: UnsafeRawPointer?, _ body: (UnsafePointer<UInt32>) throws -> R)
    rethrows -> R
  {
    fatalError()
  }

  typealias CStruct = UInt32
}

// struct CExt: BaseC.Extension, Chainable {
//   func withCStruct<R>(_ body: (UnsafePointer<UInt32>) throws -> R) rethrows -> R {
//     fatalError()
//   }

//   typealias CStruct = UInt32
// }

private func example() {
  let a: Chain<BaseA, Chain<ABExt, ABExt>> = BaseA()
    .push(ABExt())
    .push(ABExt())

  let aa = BaseA().base
}

func maybeMutable(_ ptr: UnsafeRawPointer?) -> UnsafeRawPointer? {
  ptr
}

func maybeMutable(_ ptr: UnsafeRawPointer?) -> UnsafeMutableRawPointer? {
  UnsafeMutableRawPointer(mutating: ptr)
}
