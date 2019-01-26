//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit

class ViewController: UIViewController {

    let locationService = LocationService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello")
        self.locationService.getLocation().done { currentLocation in
            print(currentLocation.debugDescription)
        }
    }
}
