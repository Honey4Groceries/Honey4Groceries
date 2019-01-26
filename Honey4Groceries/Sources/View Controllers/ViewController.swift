//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit

class ViewController: UIViewController {

    let location = LocationServiceTest()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello")
        self.location.getLocation().done { currentLocation in
            print(currentLocation.debugDescription)
        }
    }
}
