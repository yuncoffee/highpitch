//
//  CaptureEngine.swift
//  highpitch
//
//  Created by musung on 11/14/23.
//

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An object that captures a stream of captured sample buffers containing screen and audio content.
*/

import Foundation
import AVFoundation
import AVFAudio
import ScreenCaptureKit
import OSLog
import Combine

/// An object that wraps an instance of `SCStream`, and returns its results as an `AsyncThrowingStream`.
class CaptureEngineForPreview: NSObject, @unchecked Sendable {
    
    private let logger = Logger()
    private var stream: SCStream?
    private var videoSampleBufferQueue: DispatchQueue
    private var streamOutput: CaptureEngineStreamOutput?
    
    // Store the the startCapture continuation, so that you can cancel it when you call stopCapture().
    private var continuation: AsyncThrowingStream<CapturedFrame, Error>.Continuation?
    override init() {
        self.videoSampleBufferQueue = DispatchQueue(label: UUID().uuidString)
    }
    
    /// - Tag: StartCapture
    func startCapture(configuration: SCStreamConfiguration, filter: SCContentFilter) -> AsyncThrowingStream<CapturedFrame, Error> {
        AsyncThrowingStream<CapturedFrame, Error> { continuation in
            do {
                // The stream output object.
                let output = CaptureEngineStreamOutput(
                    continuation: continuation
                )
                output.capturedFrameHandler = { continuation.yield($0) }
                streamOutput = output
                //
                stream = SCStream(filter: filter, configuration: configuration, delegate: streamOutput)
                
                // Add a stream output to capture screen content.
                try stream?.addStreamOutput(streamOutput!, type: .screen, sampleHandlerQueue: videoSampleBufferQueue)
                stream?.startCapture()
                //
                streamOutput?.sessionStarted = true
                //
            } catch {
                continuation.finish(throwing: error)
            }
        }
    }
    
    func stopCapture() async {
        do {
            try await stream?.stopCapture()
            continuation?.finish()
        } catch {
            continuation?.finish(throwing: error)
        }
    }
    
    /// - Tag: UpdateStreamConfiguration
    func update(configuration: SCStreamConfiguration, filter: SCContentFilter) async {
        do {
            try await stream?.updateConfiguration(configuration)
            try await stream?.updateContentFilter(filter)
        } catch {
            logger.error("Failed to update the stream session: \(String(describing: error))")
        }
    }
}

/// A class that handles output from an SCStream, and handles stream errors.
private class CaptureEngineStreamOutput: NSObject, SCStreamOutput, SCStreamDelegate {
    
    var pcmBufferHandler: ((AVAudioPCMBuffer) -> Void)?
    var capturedFrameHandler: ((CapturedFrame) -> Void)?
    var sessionStarted = false
    var firstSampleTime: CMTime = .zero
    var lastSampleBuffer: CMSampleBuffer?
    
    // Store the the startCapture continuation, so you can cancel it if an error occurs.
    private var continuation: AsyncThrowingStream<CapturedFrame, Error>.Continuation?
    
    init(continuation: AsyncThrowingStream<CapturedFrame, Error>.Continuation?) {
        self.continuation = continuation
    }
    
    /// - Tag: DidOutputSampleBuffer
    func stream(_ stream: SCStream, didOutputSampleBuffer sampleBuffer: CMSampleBuffer, of outputType: SCStreamOutputType) {
        
        // Return early if session hasn't started yet
        guard sessionStarted else { return }
        
        // Return early if the sample buffer is invalid.
        guard sampleBuffer.isValid else { return }
        guard let frame = createFrame(for: sampleBuffer) else { return }
        capturedFrameHandler?(frame)
    }
    
    /// Create a `CapturedFrame` for the video sample buffer.
    private func createFrame(for sampleBuffer: CMSampleBuffer) -> CapturedFrame? {
        
        // Retrieve the array of metadata attachments from the sample buffer.
        guard let attachmentsArray = CMSampleBufferGetSampleAttachmentsArray(
            sampleBuffer,createIfNecessary: false) as? [[SCStreamFrameInfo: Any]],
              let attachments = attachmentsArray.first else { return nil }
        
        // Validate the status of the frame. If it isn't `.complete`, return nil.
        guard let statusRawValue = attachments[SCStreamFrameInfo.status] as? Int,
              let status = SCFrameStatus(rawValue: statusRawValue),
              status == .complete else { return nil }
        
        // Get the pixel buffer that contains the image data.
        guard let pixelBuffer = sampleBuffer.imageBuffer else { return nil }
        
        // Get the backing IOSurface.
        guard let surfaceRef = CVPixelBufferGetIOSurface(pixelBuffer)?.takeUnretainedValue() else { return nil }
        let surface = unsafeBitCast(surfaceRef, to: IOSurface.self)
        
        // Retrieve the content rectangle, scale, and scale factor.
        guard let contentRectDict = attachments[.contentRect],
              let contentRect = CGRect(dictionaryRepresentation: contentRectDict as! CFDictionary),
              let contentScale = attachments[.contentScale] as? CGFloat,
              let scaleFactor = attachments[.scaleFactor] as? CGFloat else { return nil }
        
        // Create a new frame with the relevant data.
        let frame = CapturedFrame(surface: surface,
                                  contentRect: contentRect,
                                  contentScale: contentScale,
                                  scaleFactor: scaleFactor)
        return frame
    }
    
    // Creates an AVAudioPCMBuffer instance on which to perform an average and peak audio level calculation.
    func createPCMBuffer(for sampleBuffer: CMSampleBuffer) -> AVAudioPCMBuffer? {
        let numSamples = AVAudioFrameCount(sampleBuffer.numSamples)
        let format = AVAudioFormat(cmAudioFormatDescription: sampleBuffer.formatDescription!)
        let pcmBuffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: numSamples)!
        pcmBuffer.frameLength = numSamples
        CMSampleBufferCopyPCMDataIntoAudioBufferList(
            sampleBuffer,
            at: 0,
            frameCount: Int32(numSamples),
            into: pcmBuffer.mutableAudioBufferList
        )
        return pcmBuffer
    }
    
    func stream(_ stream: SCStream, didStopWithError error: Error) {
        continuation?.finish(throwing: error)
    }
}
