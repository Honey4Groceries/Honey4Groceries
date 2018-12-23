//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lat = CLLocationDegrees(32.8801)
        let long = CLLocationDegrees(117.2340)
        let location = CLLocation(latitude: lat, longitude: long)
        print("hello")
        print(Store.searchStores(Radius: "200", Location: location))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}
