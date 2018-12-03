//
//  Store.swift
//  Honey4Groceries
//
//  Created by Thomas Tang on 11/26/18.
//

import UIKit
import CoreLocation
import PromiseKit
import SwiftyJSON

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
    
    static func getStoresAsDictionary(Stores: ResponseProtocol) -> [Dictionary<String, String>] {
        //Stores.jsonData;
        // Iterate through JSON data of stores, convert to Dictionary
        return []
    }
    
    static func getStoreHours(Store: Dictionary<String, String>) -> [Dictionary<String, String>] {
        // TODO
        // Must make another API call for each Store venue to get the store hours
        return []
    }
    
    static func getStoreHoursAsDictionary(StoreHours: ResponseProtocol) -> [Dictionary<String, String>] {
        return []
    }
    
    static func searchStores(Radius: Int, Location: CLLocation, Endpoint: String = "venues/search", Limit: String = "10", CategoryID: String = "4bf58dd8d48988d118951735") -> [Dictionary<String, String>] {
        
        let parameters = ["radius": String(Radius), "ll": String(Location.coordinate.latitude) + "," + String(Location.coordinate.longitude), "limit": Limit, "categoryID": CategoryID]
        
       
        return (APIFactory.build(type: API.Foursquare)?.execute(Request(endpoint: Endpoint, parameters: parameters))
            .map { response in
                getStoresAsDictionary(Stores: response)
            }.value)!
    }
}
