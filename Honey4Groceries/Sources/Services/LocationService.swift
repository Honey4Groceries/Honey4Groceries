import CoreLocation
import PromiseKit

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var location: CLLocation?
    var retrieved: Date?
    var locationManager: CLLocationManager
    
    public override init() {
        self.location = nil
        self.locationManager = CLLocationManager()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.retrieved = Date()
        super.init()
        
        locationManager.delegate = self
    }
    
    func requestAuth() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }

    func getLocation() -> Guarantee<CLLocation?> {
        
        let guarantee = Guarantee<CLLocation?> {seal in
            CLLocationManager.requestAuthorization(type: .always).then { CLAuthorizationStatus -> Promise<[CLLocation]> in
                return CLLocationManager.requestLocation()
            }.done {currentLocation in
                seal(currentLocation.first)
            }.catch {error in
                print("Get Location Failed!")
            }
        }
        
        return guarantee
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            manager.stopUpdatingLocation()
            return
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            location = locations.first
        }
    }
}
