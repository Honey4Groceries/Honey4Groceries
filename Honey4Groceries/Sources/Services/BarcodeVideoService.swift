//
//  BarcodeVideoService.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import AVFoundation

public class BarcodeVideoService: NSObject, VideoProtocol {

    public var session: AVCaptureSession
    public var previewLayer: AVCaptureVideoPreviewLayer
    
    /// Holds string for barcode. When value of barcode is updated,
    /// session is stopped and onBarcodeDetected is executed.
    public var barcode: String? = nil {
        didSet {
            do {
                 try self.stopSession()
            } catch {
                print("Error: BarcodeVideoService - Stopping uninitialized session")
                return
            }
            self.onBarcodeDetected()
        }
    }
    
    public var onBarcodeDetected: () -> Void
    
    private let barcodeTypes: [AVMetadataObject.ObjectType] = [
        AVMetadataObject.ObjectType.ean8,
        AVMetadataObject.ObjectType.ean13,
        AVMetadataObject.ObjectType.upce
    ]
    
    public init?(onBarcodeDetected: @escaping () -> Void) {
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
}

extension BarcodeVideoService: AVCaptureMetadataOutputObjectsDelegate {

    private func metadataOutput(_ output: AVCaptureMetadataOutput,
                                didOutput metadataObjects: [AVMetadataObject],
                                from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            return
        }
        
        // Get the metadata object.
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject

        if metadataObject.stringValue != nil {
            self.barcode = metadataObject.stringValue
        }
    }
}
