import PromiseKit

class LocationService {
    func getLocation() -> Promise<CLLocation?> {
        let promise = Promise<CLLocation?> {seal in
            firstly {
                CLLocationManager.requestAuthorization(type: .always)
            }.then { _ -> Promise<[CLLocation]> in
                return CLLocationManager.requestLocation()
            }.done {currentLocation in
                seal.fulfill(currentLocation.first)
            }.catch {error in
                seal.reject(error)
            }
        }
        return promise
    }
}
