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
    
    static func searchStores(Radius: Int, Location: CLLocation) -> Dictionary<String, String> {
        firstly {
            APIFactory.build(type: API.Foursquare).execute(Request(endpoint: "venues/search", parameters: ["ll": String(Location.coordinate.latitude) + "," + String(Location.coordinate.longitude)]))
        }.done { response in
            getStoresAsDictionary(Stores: response)
        }.catch { error in
                
        }
    }
    
    /*
     *Takes the response protocal and returns a dictionary of the values inside "name" and "id"
    */
    static func getStoresAsDictionary(Stores: ResponseProtocol) -> Dictionary<String, String> {
        let storeData = Stores.jsonData
    
        var storeDataDictionary: [String: String] = [:]
        
        for item in storeData["venues"].arrayValue {
            storeDataDictionary.updateValue(item["name"].stringValue, forKey: item["id"].stringValue)
        }
        
        return storeDataDictionary
    }
    
    
    static func getStoreHours(Store: Dictionary<String, String>) -> Dictionary<String, String> {
        // TODO
        // Must make another API call for each Store venue to get the store hours
    }
}
