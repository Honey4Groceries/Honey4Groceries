//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let location = LocationService()
    override func viewDidAppear(_ animated: Bool) {
        print("Hello")
        self.location.requestAuth()
        self.location.requestLocation()
        self.location.getLocation(callback: { currentLocation in
            print(currentLocation.debugDescription)
        })
    }
}
