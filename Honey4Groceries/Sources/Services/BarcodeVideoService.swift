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
    public var previewLayer: AVCaptureVideoPreviewLayer
    
    /// Holds string for barcode.
    public var barcode: String = ""
    
    public var onBarcodeDetected: (String) -> Void
    
    private let barcodeTypes: [AVMetadataObject.ObjectType] = [
        AVMetadataObject.ObjectType.ean8,
        AVMetadataObject.ObjectType.ean13,
        AVMetadataObject.ObjectType.upce
    ]
    
    public init(onBarcodeDetected: @escaping (String) -> Void) {
        self.session = AVCaptureSession()
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        self.onBarcodeDetected = onBarcodeDetected
    }
    
    public func getOutput() -> AVCaptureOutput? {
        let output = AVCaptureMetadataOutput()
        let serialQueue = DispatchQueue(label: "BarcodeVideoQueue")
        output.setMetadataObjectsDelegate(self, queue: serialQueue)
        output.metadataObjectTypes = barcodeTypes
        
        return output
    }
    
    /// Adds previewLayer of current service as sublayer to supplied UIView.
    public func addPreviewSublayer(view: UIView) {
        self.previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.previewLayer.frame = view.bounds
        view.layer.addSublayer(self.previewLayer)
    }
}

extension BarcodeVideoService: AVCaptureMetadataOutputObjectsDelegate {

    private func metadataOutput(_ output: AVCaptureMetadataOutput,
                                didOutput metadataObjects: [AVMetadataObject],
                                from connection: AVCaptureConnection) {
        // Check that there is actually a barcode
        if metadataObjects.count == 0 {
            return
        }
        
        // Get the metadata object.
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject

        self.barcode = metadataObject.stringValue ?? "undetected"
        
        do {
            try self.stopSession()
        } catch {
            print("Error: BarcodeVideoService - Stopping uninitialized session")
            return
        }
        
        self.onBarcodeDetected(barcode)
    }
}
