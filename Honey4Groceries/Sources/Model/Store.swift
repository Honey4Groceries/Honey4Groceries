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

    /// Helper function for searchStores to convert ResponseProtocol to a dictionary
    ///
    /// - Parameters:
    ///     - Stores: a ResponseProtocol raw data
    /// - Returns: [String: String]
    static func getStoresAsDictionary(Stores: ResponseProtocol) -> [String: String] {
        let storeData = Stores.jsonData
    
        var storeDataDictionary: [String: String] = [:]
        
        for store in storeData["response"]["venues"].arrayValue {
            let storeName = store["name"].stringValue
            let storeId = store["id"].stringValue
            print(storeName, storeId)
            storeDataDictionary[storeName] = storeId
        }
        
        return storeDataDictionary
    }
    
    /// Search for stores a radius around a certain given location
    ///
    /// - Parameters:
    ///     - Radius: The radius around the location to search
    ///     - Location: The location to search around
    ///     - Limit: The maximum amount of stores we want
    /// - Returns: [String: String]
    static func searchStores(radius: String, location: CLLocation, limit: String = "10") -> [String: String]? {
        /* Store variable to contain stores to return, used to access values within promise chain */
        var stores: [String: String]?
        
        /* build parameters */
        let parameters = storeParametersBuilder(radius: radius, location: location, limit: limit)
        
        /* create Foursquare service with APIFactory */
        do {
            let foursquareService = try APIFactory.build(type: API.Foursquare)
            
            /* create a request object */
            let request = Request(endpoint: FoursquareEndpoints.venueSearch.rawValue, parameters: parameters)
            
            /* Promise chain to get venues */
            firstly {
                foursquareService.execute(request)
            }.compactMap { response in
                stores = getStoresAsDictionary(Stores: response)
            }
        } catch {
            print("Some error message")
            return nil
            // or have the function throw, I don't know which is better
        }
        
        return stores
    }
    
    /// Helper function for searchStores to build the parameters dictionary
    ///
    /// - Parameters:
    ///     - Radius: The radius around the location to search
    ///     - Location: The location to search around
    ///     - Limit: The maximum amount of stores we want
    /// - Returns: [String: String]
    private static func storeParametersBuilder(radius: String, location: CLLocation, limit: String)
        -> [String: String] {
        
        return ["radius": radius, "ll": String(location.coordinate.latitude) + ","
            + String(location.coordinate.longitude), "limit": limit, "categoryId": FoursquareVenue.GroceryStore.ID]
        
    }
}
