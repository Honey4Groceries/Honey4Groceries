//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("wtf is going on")
        // Do any additional setup after loading the view, typically from a nib.
        
        let barcodeService = BarcodeVideoService(onBarcodeDetected: onBarcodeDetected)
        do {
            try barcodeService.sessionSetup()
        } catch {
            print("Error setting up barcodeService")
        }
        
        barcodeService.addPreviewSublayer(view: self.view)
        do {
            try barcodeService.startSession()
        } catch {
            print("Error starting session")
        }
        
        print(barcodeService.session.isRunning)
    }
    
    func onBarcodeDetected(barcodeString: String) {
        print(barcodeString)
    }

}
