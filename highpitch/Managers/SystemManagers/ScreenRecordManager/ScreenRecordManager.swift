//
//  ScreenRecordManager.swift
//  highpitch
//
//  Created by musung on 11/14/23.
//

import Foundation
import ScreenCaptureKit
import Combine
import OSLog
import SwiftUI


class ScreenRecordManager: ObservableObject {
    
    /// The supported capture types.
    enum CaptureType {
        case display
        case window
    }
    
    private let logger = Logger()
    
    @Published var isRunning = false
    
    // MARK: - Video Properties
    @Published var captureType: CaptureType = .display {
        didSet { updateEngine() }
    }
    
    @Published var selectedDisplay: SCDisplay? {
        didSet { updateEngine() }
    }
    
    @Published var selectedWindow: SCWindow? {
        didSet { updateEngine() }
    }
    
    @Published var isAppExcluded = true {
        didSet { updateEngine() }
    }
    
    @Published var contentSize = CGSize(width: 1, height: 1)
    private var scaleFactor: Int { Int(NSScreen.main?.backingScaleFactor ?? 2) }
    
    /// A view that renders the screen content.
    lazy var capturePreview: CapturePreview = {
        CapturePreview()
    }()
    var captureDisplayPreviews: [CapturePreview] = []
    var captureWindowPreviews: [CapturePreview] = []
    
    private var availableApps = [SCRunningApplication]()
    @Published private(set) var availableDisplays = [SCDisplay]()
    @Published private(set) var availableWindows = [SCWindow]()
    
    // MARK: - Audio Properties
    @Published var isAudioCaptureEnabled = true {
        didSet {
            updateEngine()
        }
    }
    @Published var isAppAudioExcluded = false { didSet { updateEngine() } }
    
    // The object that manages the SCStream.
    private let captureEngine = CaptureEngine()
    private var captureDisplayEngines: [CaptureEngineForPreview] = []
    private var captureWindowEngines: [CaptureEngineForPreview] = []
    
    private var isSetup = false
    
    // Combine subscribers.
    private var subscriptions = Set<AnyCancellable>()
    
    var canRecord: Bool {
        get async {
            do {
                // If the app doesn't have Screen Recording permission, this call generates an exception.
                try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
                return true
            } catch {
                return false
            }
        }
    }
    
    func monitorAvailableContent() async {
        guard !isSetup else { return }
        // Refresh the lists of capturable content.
        await self.refreshAvailableContent()
        Timer.publish(every: 3, on: .main, in: .common).autoconnect().sink { [weak self] _ in
            guard let self = self else { return }
            Task {
                await self.refreshAvailableContent()
            }
        }
        .store(in: &subscriptions)
    }
    
    func startPreview() async {
        // Exit early if already running.
        guard !isRunning else { return }
        
        if !isSetup {
            // Starting polling for available screen content.
            await monitorAvailableContent()
            isSetup = true
        }
        captureDisplayPreviews = []
        captureDisplayEngines = []
        captureWindowPreviews = []
        captureWindowEngines = []
        availableDisplays.forEach { display in
            captureDisplayPreviews.append(CapturePreview(displayName: display.displayName))
            captureDisplayEngines.append(CaptureEngineForPreview(label: display.displayName))
        }
        availableWindows.forEach { window in
            captureWindowPreviews.append(CapturePreview(displayName: window.displayName))
            captureWindowEngines.append(CaptureEngineForPreview(label: window.displayName))
        }
        for index in 0..<availableWindows.count {
            Task {
                let config = streamConfiguration(scWindow: availableWindows[index])
                let filter = contentFilter(scWindow: availableWindows[index])
                do {
                    for try await frame in captureWindowEngines[index]
                        .startCapture(configuration: config, filter: filter) {
                        captureWindowPreviews[index].updateFrame(frame)
                        if contentSize != frame.size {
                            contentSize = frame.size
                        }
                    }
                } catch {
                    logger.error("\(error.localizedDescription)")
                }
            }
        }
        for index in 0..<availableDisplays.count {
            Task {
                let config = streamConfiguration(scDisplay: availableDisplays[index])
                let filter = contentFilter(scDisplay: availableDisplays[index])
                do {
                    for try await frame in captureDisplayEngines[index]
                        .startCapture(configuration: config, filter: filter) {
                        captureDisplayPreviews[index].updateFrame(frame)
                        if contentSize != frame.size {
                            contentSize = frame.size
                        }
                    }
                } catch {
                    logger.error("\(error.localizedDescription)")
                }
            }
        }
    }
    func stopPreview() async {
        for engine in captureWindowEngines {
            Task {
                await engine.stopCapture()
            }
        }
        for engine in captureDisplayEngines {
            Task {
                await engine.stopCapture()
            }
        }
    }
    /// Starts capturing screen content.
    func start(fileName: String) async {
        // Exit early if already running.
        guard !isRunning else { return }
        
        if !isSetup {
            // Starting polling for available screen content.
            await monitorAvailableContent()
            isSetup = true
        }
        
        // If the user enables audio capture, start monitoring the audio stream.
        
        do {
            let config = streamConfiguration
            let filter = contentFilter
            // Update the running state.
            isRunning = true
            // Start the stream and await new video frames.
            for try await frame in captureEngine.startCapture(configuration: config, filter: filter, fileName: fileName) {
                capturePreview.updateFrame(frame)
                if contentSize != frame.size {
                    // Update the content size if it changed.
                    contentSize = frame.size
                }
            }
        } catch {
            logger.error("\(error.localizedDescription)")
            // Unable to start the stream. Set the running state to false.
            isRunning = false
        }
    }
    
    /// Stops capturing screen content.
    func stop() async {
        guard isRunning else { return }
        await captureEngine.stopCapture()
        isRunning = false
    }
    /// - Tag: UpdateCaptureConfig
    private func updateEngine() {
        guard isRunning else { return }
        Task {
            //await captureEngine.update(configuration: streamConfiguration, filter: contentFilter)
        }
    }
    /// - Tag: UpdateFilter
    private func contentFilter(scWindow: SCWindow) -> SCContentFilter {
        let filter: SCContentFilter
        var excludedApps = [SCRunningApplication]()
        if isAppExcluded {
            excludedApps = availableApps.filter { app in
                Bundle.main.bundleIdentifier == app.bundleIdentifier
            }
        }
        filter = SCContentFilter(desktopIndependentWindow: scWindow)
        return filter
    }
    private func contentFilter(scDisplay: SCDisplay) -> SCContentFilter {
        let filter: SCContentFilter
        guard let display = selectedDisplay else { fatalError("No display selected.") }
        var excludedApps = [SCRunningApplication]()
        if isAppExcluded {
            excludedApps = availableApps.filter { app in
                Bundle.main.bundleIdentifier == app.bundleIdentifier
            }
        }
        filter = SCContentFilter(display: display,
                                 excludingApplications: excludedApps,
                                 exceptingWindows: [])
        return filter
    }
    /// - Tag: UpdateFilter
    private var contentFilter: SCContentFilter {
        let filter: SCContentFilter
        switch captureType {
        case .display:
            guard let display = selectedDisplay else { fatalError("No display selected.") }
            var excludedApps = [SCRunningApplication]()
            if isAppExcluded {
                excludedApps = availableApps.filter { app in
                    Bundle.main.bundleIdentifier == app.bundleIdentifier
                }
            }
            filter = SCContentFilter(display: display,
                                     excludingApplications: excludedApps,
                                     exceptingWindows: [])
        case .window:
            guard let window = selectedWindow else { fatalError("No window selected.") }
            filter = SCContentFilter(desktopIndependentWindow: window)
        }
        return filter
    }
    private func streamConfiguration(scWindow : SCWindow) -> SCStreamConfiguration {
        let streamConfig = SCStreamConfiguration()
        streamConfig.width = 284
        streamConfig.height = 182
        streamConfig.minimumFrameInterval = CMTime(value: 1, timescale: CMTimeScale(5))
        streamConfig.pixelFormat = kCVPixelFormatType_32BGRA
        streamConfig.capturesAudio = false
        streamConfig.showsCursor = false
        streamConfig.queueDepth = 3
        return streamConfig
    }
    private func streamConfiguration(scDisplay : SCDisplay) -> SCStreamConfiguration {
        let streamConfig = SCStreamConfiguration()
        streamConfig.width = 284
        streamConfig.height = 182
        streamConfig.minimumFrameInterval = CMTime(value: 1, timescale: CMTimeScale(5))
        streamConfig.pixelFormat = kCVPixelFormatType_32BGRA
        streamConfig.capturesAudio = false
        streamConfig.showsCursor = false
        streamConfig.queueDepth = 3
        return streamConfig
    }
    
    private var streamConfiguration: SCStreamConfiguration {
        
        let streamConfig = SCStreamConfiguration()
        streamConfig.capturesAudio = isAudioCaptureEnabled
        streamConfig.excludesCurrentProcessAudio = isAppAudioExcluded
        if captureType == .display, let display = selectedDisplay {
            streamConfig.width = display.width * scaleFactor
            streamConfig.height = display.height * scaleFactor
        }
        if captureType == .window, let window = selectedWindow {
            streamConfig.width = Int(window.frame.width) * 2
            streamConfig.height = Int(window.frame.height) * 2
        }
        streamConfig.minimumFrameInterval = CMTime(value: 1, timescale: 60)
        streamConfig.queueDepth = 5
        
        return streamConfig
    }
    
    /// - Tag: GetAvailableContent
    private func refreshAvailableContent() async {
        do {
            // Retrieve the available screen content to capture.
            let availableContent = try await SCShareableContent.excludingDesktopWindows(false,
                                                                                        onScreenWindowsOnly: false)
            availableDisplays = availableContent.displays
            
            let windows = filterWindows(availableContent.windows)
            if windows != availableWindows {
                availableWindows = windows
            }
            availableApps = availableContent.applications
            
            if selectedDisplay == nil {
                selectedDisplay = availableDisplays.first
            }
            if selectedWindow == nil {
                selectedWindow = availableWindows.first
            }
        } catch {
            logger.error("Failed to get the shareable content: \(error.localizedDescription)")
        }
    }
    
    private func filterWindows(_ windows: [SCWindow]) -> [SCWindow] {
        windows
        // Sort the windows by app name.
            .sorted { $0.owningApplication?.applicationName ?? "" < $1.owningApplication?.applicationName ?? "" }
        // Remove windows that don't have an associated .app bundle.
            .filter { $0.owningApplication != nil && $0.owningApplication?.applicationName != "" }
        // Remove this app's window from the list.
            .filter { $0.owningApplication?.bundleIdentifier != Bundle.main.bundleIdentifier }
            .filter { $0.isActive }
            .filter { $0.title != "Item-0" }
            .filter { $0.title != "" }
            .filter { $0.title != "Window" }
            .filter { !$0.displayName.contains("Wallpaper")}
            .filter { !$0.displayName.contains("제어 센터")}
        
    }
}

extension SCWindow {
    var displayName: String {
        switch (owningApplication, title) {
        case (.some(let application), .some(let title)):
            return "\(application.applicationName): \(title)"
        case (.none, .some(let title)):
            return title
        case (.some(let application), .none):
            return "\(application.applicationName): \(windowID)"
        default:
            return ""
        }
    }
}

extension SCDisplay {
    var displayName: String {
        "Display: \(width) x \(height)"
    }
}
