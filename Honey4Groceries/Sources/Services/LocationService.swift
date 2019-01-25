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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func requestAuth() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }

    func getLocation() -> CLLocation? {
        return location
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
