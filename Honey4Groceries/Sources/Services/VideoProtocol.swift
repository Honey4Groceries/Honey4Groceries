//
//  VideoProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import AVFoundation
import PromiseKit

/// Protocol for services involving AVFoundation Video
public protocol VideoProtocol {
    /// AVCaptureSession belonging to the VideoService.
    var session: AVCaptureSession { get set }
    
    /// Video Preview Layer for input of video.
    var previewLayer: AVCaptureVideoPreviewLayer? { get }
    
    /// Gets input for device and returns nil if it fails.
    func getInput() -> AVCaptureDeviceInput?
    
    /// Gets output for device and returns nil if it fails.
    func getOutput() -> AVCaptureOutput?
    
    /// Start session associated with VideoProtocol. Throws invalidStart if session
    /// is already running.
    /// Precondition: AVCaptureDevice.authorizationStatus(for: .video) == AVAuthorizationStatus.authorized
    func startSession() throws
    
    /// Stop session associated with VideoProtocol. Throws invalidStop if session
    /// was not initially running.
    func stopSession() throws
    
    /// Setup session by adding AVCaptureDeviceInput and AVCaptureOutput.
    /// Throws nilInput or nilOutput if it fails to get the input or output
    /// for the device.
    func sessionSetup() throws
    
}

// Extension used here to provide default implementation of methods
extension VideoProtocol {
    public func getInput() -> AVCaptureDeviceInput? {
        var currentAuthStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if currentAuthStatus != AVAuthorizationStatus.authorized {
            firstly {
                requestAuthorization(mediaType: .video)
            }.done { auth in
                currentAuthStatus = auth
            }
        }
        
        // Return nil if unauthorized
        if currentAuthStatus != AVAuthorizationStatus.authorized {
            return nil
        }
        
        guard let captureDevice = AVCaptureDevice.default(for: .video),
            let input = try? AVCaptureDeviceInput(device: captureDevice)
            else { return nil }
    
        return input
    }
    
    public func startSession() throws {
        guard !session.isRunning else { throw VideoError.invalidStart }
        
        session.startRunning()
    }
    
    public func stopSession() throws {
        guard session.isRunning else { throw VideoError.invalidStop }
        session.stopRunning()
    }
    
    public func sessionSetup() throws {
        guard let input = getInput() else { throw VideoError.nilInput }
        guard let output = getOutput() else { throw VideoError.nilOutput }
        session.addInput(input)
        session.addOutput(output)
    }
    
    /// Request authorization for said mediaType and returns promise wrapping auth status
    private func requestAuthorization(mediaType: AVMediaType) -> Guarantee<AVAuthorizationStatus> {
        return Guarantee { seal in
            AVCaptureDevice.requestAccess(for: mediaType) { granted in
                seal((granted) ? AVAuthorizationStatus.authorized : AVAuthorizationStatus.denied)
            }
        }
    }
}

/// Enum for errors pertaining to VideoProtocol
enum VideoError: Error {
    case invalidStart
    case invalidStop
    case nilInput
    case nilOutput
}
