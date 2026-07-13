@preconcurrency import CVulkan

#if os(Linux)
    import Glibc
#elseif os(Windows)
    import WinSDK
#else
    import Darwin
#endif

public protocol Loader: Sendable {
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr { get }
}

public enum LoaderError: Error {
    case loaderNotFound
    case symbolNotFound
}

#if os(Windows)
    typealias LibraryHandle = WinSDK.HINSTANCE

    func loadLibrary(_ path: String) -> LibraryHandle? {
        LoadLibraryA(path)
    }

    func getProcAddress(_ handle: LibraryHandle, _ name: String) -> UnsafeMutableRawPointer? {
        unsafeBitCast(GetProcAddress(handle, name), to: UnsafeMutableRawPointer?.self)
    }

    func freeLibrary(_ handle: LibraryHandle) {
        FreeLibrary(handle)

    }
#else
    typealias LibraryHandle = UnsafeMutableRawPointer

    func loadLibrary(_ path: String) -> LibraryHandle? {
        dlopen(path, RTLD_LAZY)
    }

    func getProcAddress(_ handle: LibraryHandle, _ name: String) -> UnsafeMutableRawPointer? {
        dlsym(handle, "vkGetInstanceProcAddr")
    }

    func freeLibrary(_ handle: LibraryHandle) {
        dlclose(handle)
    }
#endif

public final class DynamicLoader: Loader, @unchecked Sendable {
    let handle: LibraryHandle

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
    public init() throws {
        self.init(loader: try DynamicLoader())
    }
}
