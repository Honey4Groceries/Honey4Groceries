//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        let location = LocationService()
        location.requestAuth()
        print("\(location)")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}
