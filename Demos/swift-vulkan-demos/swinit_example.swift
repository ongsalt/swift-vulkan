import Swinit

// Example of swinit, i dont have glfw installed

class Delegate: Swinit.EventLoopDelegate {
    var window: Window!

    func canCreateSurfaces(_ eventLoop: Swinit.EventLoop) {
        let attr = WindowAttributes(
            title: "hihi", size: Size(width: 800, height: 600), noRedirectionBitmap: true)

        self.window = eventLoop.openWindow(attr)
        
        // these are available on windows 
        window.handle
        window.hInstance
        // window.display.raw and window.surface.raw on wayland
    }

    func windowEvent(_ eventLoop: EventLoop, window: Window, event: WindowEvent) {
        switch event {
        // case .resized(let size, let isFinal):
        // case .keyboardInput(_, let event, _) where event.state == .pressed:
        // case .cursorMoved(_, let p):
        // case .closeRequested:
        default:
            do {}
        }
    }

    func aboutToWait(_ eventLoop: EventLoop) {}
}


EventLoop().run(Delegate())
