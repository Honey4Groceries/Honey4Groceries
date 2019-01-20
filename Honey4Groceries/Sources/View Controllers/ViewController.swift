//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import AVFoundation
import PromiseKit

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate  {

    let location = LocationService()
    override func viewDidAppear(_ animated: Bool) {
        print("Hello")
        self.location.requestAuth()
        print(self.location.getLocation().debugDescription)
    }

}
