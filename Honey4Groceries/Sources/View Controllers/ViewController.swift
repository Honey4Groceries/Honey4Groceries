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
        // Do any additional setup after loading the view, typically from a nib.
        
        let barcodeService = BarcodeVideoService(onBarcodeDetected: onBarcodeDetected)
        do {
            try barcodeService.sessionSetup()
        } catch {
            
        }
        
        barcodeService.addPreviewSublayer(view: self.view)
        do {
            try barcodeService.startSession()
        } catch {
            
        }
        
    }
    
    func onBarcodeDetected(barcodeString: String?) {
        print(barcodeString)
    }

}
