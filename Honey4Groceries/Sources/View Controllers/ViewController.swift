//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit

class ViewController: UIViewController {

    let location = LocationService()

    override func viewDidAppear(_ animated: Bool) {
        print("Hello")
        self.location.requestAuth()
        self.location.requestLocation()
        self.location.getLocation().done { currentLocation in
            print(currentLocation.debugDescription)
        }
    }
}
