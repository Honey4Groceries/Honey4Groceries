import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var location: CLLocationCoordinate2D?
    var retrieved: Date?
    var locationManager: CLLocationManager
    
    public override init() {
        location = nil
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        retrieved = Date()
        //locationManager.requestAlwaysAuthorization()
        super.init()
        
        locationManager.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func requestAuth() {
        locationManager.requestAlwaysAuthorization()
    }

    func getLocation() -> CLLocationCoordinate2D? {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .notDetermined:
                    break
                case .restricted:
                    break
                case .denied:
                    break
                case .authorizedAlways:
                    locationManager.requestLocation()
                    print("success")
                    break
                case .authorizedWhenInUse:
                    break
            }
            return location
        } else {
            print("fail")
            return nil
        }
    }

    private func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> CLLocationCoordinate2D? {
        let lastLocation = locations.last!
        location = CLLocationCoordinate2DMake(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
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
            print("location:: (location)")
        }
    }
}
