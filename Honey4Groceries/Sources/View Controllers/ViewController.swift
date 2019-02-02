//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    let locationService = LocationService()
    
    var latitude: Double?
    var longitude: Double?
    var locationError: Error?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationService.getLocation().done { currentLocation in
            if currentLocation == nil {
                self.locationError = LocationService.LocationError.nilOutput
            } else {
                self.latitude = currentLocation?.coordinate.latitude
                self.longitude = currentLocation?.coordinate.longitude
                print(self.latitude as Any)
                print(self.longitude as Any)
            }
        }.catch { error in
            switch error {
            case CLLocationManager.PMKError.notAuthorized:
                print("Not Authorized")
            default:
                print("Other Errors")
            }
            self.locationError = error
            print(self.locationError as Any)
        }
    }
}
