
class Shit {}

func apiV45() {
    // implemented
    // device.getProperties2() -> PhysicalDeviceProperties2

    // this is the last one to implement, cuz it seem painful
    // in order for this to work, we must implement T.defualt() -> T (from zeroed constructor)
    // device.getProperties2(with: PhysicalDeviceDrmPropertiesEXT.self, PhysicalDeviceVulkan13Properties.self) -> (PhysicalDeviceProperties2, PhysicalDeviceDrmPropertiesEXT, PhysicalDeviceVulkan13Properties)

    // This one do not strictly need T.defualt(), but should be
    // var properties = PhysicalDeviceProperties2()
    // var vulkan13Properies = PhysicalDeviceVulkan13Properties()
    // var chain = Chain4(properties).push(vulkan13Properies).push(...)
    // device.getProperties2(&chain)

    // name translation: remove version subfix, if in proto.name.lastWord  == firstParam.firstWord

    var shit = 1332
    let chain = Chain2(&shit)
    print(chain.base.value)
    print(shit)
}

// chain can be both dynamic and static
struct Chain2<Base: ~Copyable, Next: ~Copyable & ~Escapable>: ~Escapable, ~Copyable {
    let base: MutableRef<Base>
    let next: Next

    @_lifetime(copy base, copy next)
    init(base: consuming MutableRef<Base>, next: consuming Next) {
        self.base = base
        self.next = next
    }
}

extension Chain2 {
    @_lifetime(&other, copy self)
    consuming func push<Other>(_ other: inout Other) -> Chain2<Base, Chain2<Other, Next>> {
        .init(
            base: self.base,
            next: .init(base: MutableRef(&other), next: self.next)
        )
    }
}

extension Chain2 where Next == _Tail {
    @_lifetime(&base)
    init(_ base: inout Base) {
        self.base = MutableRef(&base)
        self.next = _Tail()
    }
}

protocol Chainable3: ~Escapable, ~Copyable {}

extension Chain2: Chainable3 {}
struct _Tail: Chainable3 {}
