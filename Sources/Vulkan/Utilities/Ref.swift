import Builtin

// stolen from 6.4 std

//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2026 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

/// A safe reference allowing in-place reads to a shared value.

@frozen
public struct Ref<Value: ~Copyable>: Copyable, ~Escapable {
  @usableFromInline
  let pointer: UnsafePointer<Value>

  /// Initializes an instance of `Ref` with the given borrowed value. This
  /// creates a constant reference to that value preventing writes on the 
  /// original value while this reference is still active.
  
  @_alwaysEmitIntoClient
  @_lifetime(borrow value)
  @_transparent
  public init(_ value: borrowing Value) {
    // they actually use `Builtin.borrow` which do not exist in 6.3
    pointer = UnsafePointer(Builtin.unprotectedAddressOfBorrow(value))
  }
}


extension Ref: @unchecked Sendable where Value: Sendable & ~Copyable {}


extension Ref: BitwiseCopyable {}


extension Ref where Value: ~Copyable {
  /// Dereferences the constant reference allowing for in-place reads to the
  /// underlying value.
  
  @_alwaysEmitIntoClient
  @_transparent
  public var value: Value {
    // @_unsafeSelfDependentResult
    unsafeAddress {
      pointer
    }
  }
}