//
//  VideoView.swift
//  highpitch
//
//  Created by musung on 11/21/23.
//

import SwiftUI
import AVKit

struct VideoView: NSViewRepresentable {
    typealias NSViewType = NSView
    let avPlayer: AVPlayer
    
    func makeNSView(context: Context) -> NSView {
        let playerView = AVPlayerView()
        playerView.player = avPlayer
        playerView.controlsStyle = .none
        playerView.allowsMagnification = false
        playerView.allowsVideoFrameAnalysis = false
        playerView.allowsPictureInPicturePlayback = false
        playerView.allowedTouchTypes = []
        playerView.gestureRecognizers = []
        playerView.actionPopUpButtonMenu = .none
        playerView.window?.disableCursorRects()
        playerView.window?.disableKeyEquivalentForDefaultButtonCell()
        return playerView
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        // Update code if needed
    }
}
