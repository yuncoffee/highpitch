//
//  OverlayView.swift
//  highpitch
//
//  Created by yuncoffee on 11/2/23.
//

import SwiftUI

struct OverlayView: View {
    @State private var window: NSWindow?
    @Binding var isActive: Bool
    @State private var panel: NSPanel = NSPanel()
    
    var body: some View {
        VStack(spacing: 0) {
            Text("HHHzz")
            if nil != window {
                MainView(store: OverlayStore(window: panel))
            }
        }
        .background(WindowAccessor(window: $window))
        .onChange(of: window, { oldValue, newValue in
            print("window:", window)
        })
    }
}

#Preview {
    @State var isActive = false
    
    return OverlayView(isActive: $isActive)
}

class OverlayStore {
    var window: NSWindow
    
    init(window: NSWindow) {
        print("Init window:", window)
        let panel = NSPanel(
            contentRect: NSRect(x: 200, y: 200, width: 400, height: 400),
            styleMask: [.titled, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )
        panel.backgroundColor = NSColor(.clear)
        panel.level = .mainMenu
        // .canJoinAllSpaces를 통해서 모든 Space 및 전체화면 위에도 띄울 수 있게
        panel.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        panel.orderFrontRegardless()
        self.window = panel
        self.window.isOpaque = false
        self.window.backgroundColor = NSColor.clear
        self.window.orderFrontRegardless()
    }
}

struct MainView: View {
    let store: OverlayStore
    
    var body: some View {
        VStack {}
        .onAppear {
            store.window.contentView = NSHostingView(
                rootView: SampleView(store: store)
            )
            print(store.window)
        }
    }
}

struct SampleView: View {
    let store: OverlayStore
    
    var body: some View {
        VStack {
            Button {
//                store.window.backgroundColor = .clear
                store.window.close()
            } label: {
                Text("Close")
            }

            Text("Hello")
        }
        .padding(16)
    }
}

struct WindowAccessor: NSViewRepresentable {
    @Binding var window: NSWindow?
    
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.window = view.window
        }
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        print("nsView:", nsView)
    }
}
