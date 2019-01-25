//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate  {

    let location = LocationService()
    override func viewDidAppear(_ animated: Bool) {
        print("Hello")
        self.location.requestAuth()
        self.location.requestLocation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            print(self.location.getLocation().debugDescription)
        })
    }

}
