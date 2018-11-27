//
//  Store.swift
//  Honey4Groceries
//
//  Created by Thomas Tang on 11/26/18.
//

import UIKit
import CoreLocation
import PromiseKit

public class Store {
    //let searchVenuesEndpoint = "venues/search"
    private var storeID: String
    private var name: String
    private var startTime: String
    private var endTime: String
    
    public init(storeID: String, name: String, startTime: String, endTime: String) {
        self.storeID = storeID
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
    }
    
    public func getName() -> String {
        return name
    }
    
    public func getStoreID() -> String {
        return storeID
    }
    
    public func getStoreHours() -> [String] {
        return [startTime, endTime]
    }
    
    static func searchStores(Radius: Int, Location: CLLocation) -> [Dictionary<String, String>] {
        firstly {
            APIFactory.build(type: API.Foursquare).execute(Request(endpoint: "venues/search", parameters: ["ll": String(Location.coordinate.latitude) + "," + String(Location.coordinate.longitude)]))
        }.done { response in
            getStoresAsDictionary(Stores: response)
        }.catch { error in
                
        }
    }
    
    static func getStoresAsDictionary(Stores: ResponseProtocol) -> [Dictionary<String, String>] {
        // TODO
        // Iterate through JSON data of stores, call getStoreHours for each Store iteration to get the hours for that store
    }
    
    static func getStoreHours(Store: Dictionary<String, String>) -> [Dictionary<String, String>] {
        // TODO
        // Must make another API call for each Store venue to get the store hours
    }
}
