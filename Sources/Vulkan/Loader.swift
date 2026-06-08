import CVulkan

#if os(Linux)
    import Glibc
#elseif os(Windows)
    import WinSDK
#else
    import Darwin
#endif

public protocol Loader {
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr { get }
}

public enum LoaderError: Error {
    case loaderNotFound
    case symbolNotFound
}

#if os(Windows)
    typealias Handle = WinSDK.HINSTANCE

    func loadLibrary(_ path: String) -> Handle? {
        LoadLibraryA(path)
    }

    func getProcAddress(_ handle: Handle, _ name: String) -> UnsafeMutableRawPointer? {
        unsafeBitCast(GetProcAddress(handle, name), to: UnsafeMutableRawPointer?.self)
    }

    func freeLibrary(_ handle: Handle) {
        FreeLibrary(handle)

    }
#else
    typealias Handle = UnsafeMutableRawPointer

    func loadLibrary(_ path: String) -> Handle? {
        dlopen(path, RTLD_LAZY)
    }

    func getProcAddress(_ handle: Handle, _ name: String) -> UnsafeMutableRawPointer? {
        dlsym(handle, "vkGetInstanceProcAddr")
    }

    func freeLibrary(_ handle: Handle) {
        dlclose(handle)
    }
#endif

public class DynamicLoader: Loader {
    let handle: Handle

    public let vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr

    public init(path: String) throws {
        guard let handle = loadLibrary(path) else {
            throw LoaderError.loaderNotFound
        }
        guard let vkGetInstanceProcAddr = getProcAddress(handle, "vkGetInstanceProcAddr") else {
            freeLibrary(handle)
            throw LoaderError.symbolNotFound
        }
        self.handle = handle
        self.vkGetInstanceProcAddr = unsafeBitCast(
            vkGetInstanceProcAddr, to: PFN_vkGetInstanceProcAddr.self)
    }

    public convenience init() throws {
        #if os(Linux)
            try self.init(path: "libvulkan.so.1")
        #elseif os(Windows)
            try self.init(path: "vulkan-1.dll")
        #else
            try self.init(path: "libvulkan.1.dylib")
        #endif
    }

    deinit {
        freeLibrary(handle)
    }
}

extension Entry {
    public convenience init() throws {
        self.init(loader: try DynamicLoader())
    }
}
