import PromiseKit

/// Class for the location service
public class LocationService {
    
    /// Enum for different types of location errors
    public enum LocationError: Error {
        case nilOutput
    }
    
    /**
     Gets the current location
     
     Calling this function gets the current location after requesting authorization.
     
     - Returns: a promise which is to be handled later, either rejected with error or updated
                successfully with CLLocation
     */
    public func getLocation() -> Promise<CLLocation?> {
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
