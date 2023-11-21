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

/// A structure that contains the video data to render.
struct CapturedFrame {
    static let invalid = CapturedFrame(surface: nil, contentRect: .zero, contentScale: 0, scaleFactor: 0)
    
    let surface: IOSurface?
    let contentRect: CGRect
    let contentScale: CGFloat
    let scaleFactor: CGFloat
    var size: CGSize { contentRect.size }
}

/// An object that wraps an instance of `SCStream`, and returns its results as an `AsyncThrowingStream`.
class CaptureEngine: NSObject, @unchecked Sendable {
    
    private let logger = Logger()
    private var stream: SCStream?
    private let videoSampleBufferQueue = DispatchQueue(label: "HighPitch.VideoBufferQueue")
    private let audioSampleBufferQueue = DispatchQueue(label: "HighPitch.AudioBufferQueue")
    private let voiceSampleBufferQueue = DispatchQueue(label: "HighPitch.VoiceBufferQueue")
    private var streamOutput: CaptureEngineStreamOutput?
    private var assetWriter: AVAssetWriter?
    private var videoInput: AVAssetWriterInput?
    private var audioInput: AVAssetWriterInput?
    private var voiceInput: AVAssetWriterInput?
    private let audioOutput = AVCaptureAudioDataOutput()
    private var captureSession: AVCaptureSession?
    private var audioDataOutput: AVCaptureAudioDataOutput?
    
    // Store the the startCapture continuation, so that you can cancel it when you call stopCapture().
    private var continuation: AsyncThrowingStream<CapturedFrame, Error>.Continuation?
    
    /// - Tag: StartCapture
    func startCapture(configuration: SCStreamConfiguration, filter: SCContentFilter, fileName: String) -> AsyncThrowingStream<CapturedFrame, Error> {
        AsyncThrowingStream<CapturedFrame, Error> { continuation in
            do {
                //let filePath = getPath(fileName: "hiroo")
                let filePath = URL.getPath(fileName: fileName, type: .video)
                assetWriter = try AVAssetWriter(url: filePath, fileType: .mp4)
                // MARK: AVAssetWriter setup
                let displaySize = CGDisplayBounds(CGMainDisplayID()).size
                guard let assistant = AVOutputSettingsAssistant(preset: .preset3840x2160) else {
                    return
                }
                assistant.sourceVideoFormat = try CMVideoFormatDescription(videoCodecType: .h263, width: Int(displaySize.width), height: Int(displaySize.height))

                guard var outputSettings = assistant.videoSettings else {
                    return
                }
                outputSettings[AVVideoWidthKey] = Int(displaySize.width)
                outputSettings[AVVideoHeightKey] = Int(displaySize.height)
                outputSettings[AVVideoColorPropertiesKey] = [
                    AVVideoTransferFunctionKey: AVVideoTransferFunction_ITU_R_709_2,
                    AVVideoColorPrimariesKey: AVVideoColorPrimaries_ITU_R_709_2,
                    AVVideoYCbCrMatrixKey: AVVideoYCbCrMatrix_ITU_R_709_2
                ]
                videoInput = AVAssetWriterInput(mediaType: .video, outputSettings: outputSettings)
                videoInput!.expectsMediaDataInRealTime = true
                
                guard AVCaptureDevice.default(for: .audio) != nil else {
                    print("No audio device found")
                    return
                }
                let audioSettings: [String: Any] = [
                    AVFormatIDKey: kAudioFormatLinearPCM,
                    AVNumberOfChannelsKey: 2,
                    AVSampleRateKey: 44100,
                    AVLinearPCMBitDepthKey: 16, // Specify the bit depth
                    AVLinearPCMIsBigEndianKey: false, // Specify whether it's big endian or not
                    AVLinearPCMIsFloatKey: false, // Specify whether it's float or not
                    AVLinearPCMIsNonInterleaved: false // Specify whether it's non-interleaved or not
                ]
                
                audioInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioSettings)
                audioInput?.expectsMediaDataInRealTime = true
                
                captureSession = AVCaptureSession()
                
                guard let captureSession = captureSession else {
                    print("Failed to create AVCaptureSession")
                    return
                }
                
                captureSession.beginConfiguration()
                
                let audioDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.microphone], mediaType: .audio, position: .unspecified).devices
                audioDevices.map { item in
                    print(item.localizedName)
                    print(item.deviceType)
                    print(item.position)
                }
                
                let audioDevice = AVCaptureDevice.default(.microphone, for: .audio, position: .unspecified)
                let deviceInput = try AVCaptureDeviceInput(device: audioDevice!)
                
                if captureSession.canAddInput(deviceInput) {
                    captureSession.addInput(deviceInput)
                }
                
                // 오디오 데이터 출력 생성
                audioDataOutput = AVCaptureAudioDataOutput()
                
                if captureSession.canAddOutput(audioDataOutput!) {
                    captureSession.addOutput(audioDataOutput!)
                }
                
                // AVCaptureSession 설정 완료
                captureSession.commitConfiguration()
                voiceInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioSettings)
                guard assetWriter!.canAdd(voiceInput!) else { return }
                assetWriter?.add(voiceInput!)
                //
                // The stream output object.
                let output = CaptureEngineStreamOutput(
                    continuation: continuation,
                    videoInput: videoInput!,
                    audioInput: audioInput!
                )
                output.capturedFrameHandler = { continuation.yield($0) }
                streamOutput = output
                // Adding videoInput to assetWriter
                guard assetWriter!.canAdd(videoInput!) else {
                    return
                }
                assetWriter?.add(videoInput!)
                guard assetWriter!.canAdd(audioInput!) else {
                    return
                }
                assetWriter?.add(audioInput!)

                guard assetWriter!.startWriting() else {
                    if let error = assetWriter!.error {
                        throw error
                    }
                    return
                }
                //
                stream = SCStream(filter: filter, configuration: configuration, delegate: streamOutput)
                
                // Add a stream output to capture screen content.
                try stream?.addStreamOutput(streamOutput!, type: .screen, sampleHandlerQueue: videoSampleBufferQueue)
                try stream?.addStreamOutput(streamOutput!, type: .audio, sampleHandlerQueue: audioSampleBufferQueue)
                stream?.startCapture()
                //
                //captureSession.startRunning()
                //audioDataOutput?.setSampleBufferDelegate(self, queue: voiceSampleBufferQueue)
                assetWriter!.startSession(atSourceTime: .zero)
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
            if let originalBuffer = streamOutput!.lastSampleBuffer {
                let additionalTime = CMTime(
                    seconds: ProcessInfo.processInfo.systemUptime,
                    preferredTimescale: 100) - streamOutput!.firstSampleTime
                let timing = CMSampleTimingInfo(
                    duration: originalBuffer.duration,
                    presentationTimeStamp: additionalTime,
                    decodeTimeStamp: originalBuffer.decodeTimeStamp
                )
                let additionalSampleBuffer = try CMSampleBuffer(
                    copying: originalBuffer,
                    withNewTiming: [timing]
                )
                videoInput!.append(additionalSampleBuffer)
                streamOutput!.lastSampleBuffer = additionalSampleBuffer
            }
            if let originalAudioBuffer = streamOutput!.lastAudioSampleBuffer {
                let additionalTime = CMTime(
                    seconds: ProcessInfo.processInfo.systemUptime,
                    preferredTimescale: 100) - streamOutput!.firstSampleTime
                let timing = CMSampleTimingInfo(
                    duration: originalAudioBuffer.duration,
                    presentationTimeStamp: additionalTime,
                    decodeTimeStamp: originalAudioBuffer.decodeTimeStamp
                )
                let additionalSampleBuffer = try CMSampleBuffer(
                    copying: originalAudioBuffer,
                    withNewTiming: [timing]
                )
                audioInput!.append(additionalSampleBuffer)
                streamOutput!.lastAudioSampleBuffer = additionalSampleBuffer
            }

            // Stop the AVAssetWriter session at time of the repeated frame
            assetWriter!.endSession(atSourceTime: streamOutput!.lastSampleBuffer?.presentationTimeStamp ?? .zero)
            assetWriter!.endSession(atSourceTime: streamOutput!.lastAudioSampleBuffer?.presentationTimeStamp ?? .zero)
            
            captureSession?.stopRunning()
            // Finish writing
            videoInput!.markAsFinished()
            audioInput!.markAsFinished()
            await assetWriter!.finishWriting()
            //
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
    let videoInput: AVAssetWriterInput
    let audioInput: AVAssetWriterInput
    var sessionStarted = false
    var firstSampleTime: CMTime = .zero
    var lastSampleBuffer: CMSampleBuffer?
    var lastAudioSampleBuffer: CMSampleBuffer?
    
    // Store the the startCapture continuation, so you can cancel it if an error occurs.
    private var continuation: AsyncThrowingStream<CapturedFrame, Error>.Continuation?
    
    init(continuation: AsyncThrowingStream<CapturedFrame, Error>.Continuation?, videoInput: AVAssetWriterInput,audioInput: AVAssetWriterInput) {
        self.continuation = continuation
        self.videoInput = videoInput
        self.audioInput = audioInput
    }
    
    /// - Tag: DidOutputSampleBuffer
    func stream(_ stream: SCStream, didOutputSampleBuffer sampleBuffer: CMSampleBuffer, of outputType: SCStreamOutputType) {
        
        // Return early if session hasn't started yet
        guard sessionStarted else { return }
        
        // Return early if the sample buffer is invalid.
        guard sampleBuffer.isValid else { return }
        
        // Determine which type of data the sample buffer contains.
        switch outputType {
        case .screen:
            // Create a CapturedFrame structure for a video sample buffer.
            guard let frame = createFrame(for: sampleBuffer) else { return }
            //
            if videoInput.isReadyForMoreMediaData {
                if firstSampleTime == .zero {
                    firstSampleTime = sampleBuffer.presentationTimeStamp
                }
                let lastSampleTime = sampleBuffer.presentationTimeStamp - firstSampleTime
                lastSampleBuffer = sampleBuffer
                let timing = CMSampleTimingInfo(
                    duration: sampleBuffer.duration,
                    presentationTimeStamp: lastSampleTime,
                    decodeTimeStamp: sampleBuffer.decodeTimeStamp
                )
                if let retimedSampleBuffer = try? CMSampleBuffer(copying: sampleBuffer, withNewTiming: [timing]) {
                    videoInput.append(retimedSampleBuffer)
                } else {
                    print("Couldn't copy CMSampleBuffer, dropping frame")
                }
            } else {
                print("AVAssetWriterInput isn't ready, dropping frame")
            }
            
            capturedFrameHandler?(frame)
        case .audio:
            // Create an AVAudioPCMBuffer from an audio sample buffer.
            guard let samples = createPCMBuffer(for: sampleBuffer) else { return }
            if audioInput.isReadyForMoreMediaData {
                if firstSampleTime == .zero {
                    firstSampleTime = sampleBuffer.presentationTimeStamp
                }
                let lastSampleTime = sampleBuffer.presentationTimeStamp - firstSampleTime
                lastAudioSampleBuffer = sampleBuffer
                let timing = CMSampleTimingInfo(
                    duration: sampleBuffer.duration,
                    presentationTimeStamp: lastSampleTime,
                    decodeTimeStamp: sampleBuffer.decodeTimeStamp
                )
                if let retimedSampleBuffer = try? CMSampleBuffer(copying: sampleBuffer, withNewTiming: [timing]) {
                    audioInput.append(retimedSampleBuffer)
                } else {
                    print("Couldn't copy CMSampleBuffer, dropping frame")
                }
            } else {
                print("AVAssetWriterInput isn't ready, dropping frame")
            }
            pcmBufferHandler?(samples)
        @unknown default:
            fatalError("Encountered unknown stream output type: \(outputType)")
        }
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
extension CaptureEngine {
    func getPath(fileName: String) -> URL {
        let dataPath = getDocumentsDirectory()
            .appendingPathComponent("HighPitch")
            .appendingPathComponent("Video")
        do {
            try FileManager.default
                .createDirectory(at: dataPath, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error creating directory: \(error.localizedDescription)")
        }
        return dataPath.appendingPathComponent(fileName + ".mov")
    }
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        return paths[0]
    }
}
extension CaptureEngine: AVCaptureAudioDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if voiceInput!.isReadyForMoreMediaData {
            voiceInput!.append(sampleBuffer)
        }
    }
    
}
