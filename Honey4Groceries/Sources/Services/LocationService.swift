import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var location: CLLocation?
    var retrieved: Date?
    var locationManager: CLLocationManager
    
    public override init() {
        location = nil
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        retrieved = Date()
        super.init()
        
        locationManager.delegate = self
    }
    
    func requestAuth() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }

    func getLocation(callback:@escaping (CLLocation?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(1), execute: {
            callback(self.location)
        })
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
