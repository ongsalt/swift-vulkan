protocol TaggedStruct {
    static var structureType: StructureType { get }
}

protocol InStruct: TaggedStruct {}
protocol OutStruct: TaggedStruct {}

// like current one, but its use mutableref

// idgaf about a Handle ref count anymore
// vulkan should never return a handle this way anyway
// maybe give error message with device is nil (so no dispatchTable)
// cant we just use global dispatch table?
protocol CStructConvertible2 {
    associatedtype CStruct

    // not really required for now
    // init(cStruct: CStruct)

    func _withCStruct<R, E>(
        nextInChain: OpaquePointer?,
        body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    ) throws(E) -> (CStruct, R)

    // mutating func _patch(from cStruct: CStruct)

    func withCStruct<R, E>(
        body: (UnsafePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R

    mutating func withMutableCStruct<R, E>(
        body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R
}

extension CStructConvertible2 {
    func withCStruct<R, E>(
        body: (UnsafePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R {
        let (_, r) = try self._withCStruct(nextInChain: nil) { ptr throws(E) in
            try body(UnsafePointer(ptr))
        }
        return r
    }

    // this should not be use anyway
    // mutating func withMutableCStruct<R, E>(
    //     body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    // ) throws(E) -> R {
    //     let (cStruct, r) = try self._withCStruct(nextInChain: nil, body: body)
    //     // patch operation should be per Type
    //     self = Self(cStruct: cStruct)
    //     return r
    // }
}

protocol InChain: TaggedStruct, CStructConvertible2 {
    func withCStruct<R, E>(
        nextInChain: UnsafeRawPointer?,
        body: (UnsafePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R
}

protocol OutChain: TaggedStruct, CStructConvertible2 {
    mutating func withMutableCStruct<R, E>(
        nextInChain: UnsafeMutableRawPointer?,
        body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R
}

extension InChain {
    func withCStruct<R, E>(
        body: (UnsafePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R {
        try self.withCStruct(nextInChain: nil, body: body)
    }
}

extension OutChain {
    mutating func withMutableCStruct<R, E>(
        body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R {
        try self.withMutableCStruct(nextInChain: nil, body: body)
    }
}

struct A: CStructConvertible2, TaggedStruct, OutChain {
    static let structureType: StructureType = .accelerationStructureBuildGeometryInfoKHR
    typealias CStruct = Int

    // everything is var now
    var storage: Int

    init(cStruct: Int) {
        self.storage = cStruct
    }

    mutating func withMutableCStruct<R, E>(
        nextInChain: UnsafeMutableRawPointer? = nil,
        body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    ) throws(E) -> R {
        let (cStruct, returnValue) = try self._withCStruct(nextInChain: OpaquePointer(nextInChain), body: body)

        self = Self(cStruct: cStruct)

        // we need to also move handle from current to newer struct, 

        // or use existing constructor
        // self = Self(cStruct: cStruct, handle: self.handle)

        return returnValue
    }

    func _withCStruct<R, E>(
        nextInChain: OpaquePointer?,
        body: (UnsafeMutablePointer<CStruct>) throws(E) -> R
    ) throws(E) -> (CStruct, R) {
        var cStruct = CStruct()
        let returnValue = try body(&cStruct)
        return (cStruct, returnValue)
    }
}
