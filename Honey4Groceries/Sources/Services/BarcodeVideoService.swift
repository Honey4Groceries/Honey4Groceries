//
//  BarcodeVideoService.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import AVFoundation
import UIKit

/// Implementation of VideoProtocol for barcode recognition
public class BarcodeVideoService: NSObject, VideoProtocol {

    public var session: AVCaptureSession
    public var previewLayer: AVCaptureVideoPreviewLayer?
    
    public var onBarcodeDetected: (String?) -> Void
    
    public init(onBarcodeDetected: @escaping (String?) -> Void) {
        self.session = AVCaptureSession()
        self.onBarcodeDetected = onBarcodeDetected
    }
    
    public func getOutput() -> AVCaptureOutput? {
        let output = AVCaptureMetadataOutput()
        return output
    }
    
    /**
    Set metatdata objects delegate for AVCaptureMetadataOutput.
     - Parameters: output - AVCaptureMetadataOutput to set delegate for
    */
    private func setOutputDelegate(output: AVCaptureMetadataOutput?) {
        if output == nil { return }
        output?.metadataObjectTypes = output?.availableMetadataObjectTypes
        let serialQueue = DispatchQueue(label: "BarcodeVideoQueue")
        output?.setMetadataObjectsDelegate(self, queue: serialQueue)
    }
    
    public func sessionSetup() throws {
        guard let input = getInput() else { throw VideoError.nilInput }
        guard let output = getOutput() else { throw VideoError.nilOutput }
        session.addInput(input)
        session.addOutput(output)
        
        setOutputDelegate(output: output as? AVCaptureMetadataOutput)
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
    }
    
    /**
    Adds previewLayer of current service as sublayer to UIView passed in.
     - Parameters: view - UIView to add preview sublayer to.
    */
    public func addPreviewSublayer(view: UIView) {
        self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.previewLayer?.frame = view.bounds
        view.layer.addSublayer(self.previewLayer ?? view.layer)
    }
}

extension BarcodeVideoService: AVCaptureMetadataOutputObjectsDelegate {
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput,
                               didOutput metadataObjects: [AVMetadataObject],
                               from connection: AVCaptureConnection) {
        // Check that there is actually a barcode
        if metadataObjects.count == 0 {
            return
        }
        
        var barcodeObject: AVMetadataMachineReadableCodeObject?
        
        // Iterate through metadata object and get first one that is barcode.
        for metadataObject in metadataObjects where metadataObject is AVMetadataMachineReadableCodeObject {
            barcodeObject = metadataObject as? AVMetadataMachineReadableCodeObject
            break
        }

        // If no barcode is detected then just continue
        if barcodeObject == nil {
            return
        }
        
        self.session.stopRunning()
        
        self.onBarcodeDetected(barcodeObject?.stringValue)
    }
}
