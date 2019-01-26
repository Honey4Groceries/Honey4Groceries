//
//  LocationServiceTest.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/01/26.
//

import PromiseKit

class LocationServiceTest {
    func getLocation() -> Guarantee<CLLocation?> {
        let guarantee = Guarantee<CLLocation?> {seal in
            firstly {
                CLLocationManager.requestAuthorization(type: .always)
            }.then { authorizationStatus -> Promise<[CLLocation]> in
                return CLLocationManager.requestLocation()
            }.done {currentLocation in
                seal(currentLocation.first)
            }.catch {error in
                print("Get Location Failed!")
            }
        }
        return guarantee
    }
}
