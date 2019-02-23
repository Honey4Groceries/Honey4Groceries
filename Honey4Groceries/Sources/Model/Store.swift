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
    private var openTime: String
    private var closeTime: String
    
    public init(storeID: String, name: String, openTime: String, closeTime: String) {
        self.storeID = storeID
        self.name = name
        self.openTime = openTime
        self.closeTime = closeTime
    }
    
    public func getName() -> String {
        return name
    }
    
    public func getStoreID() -> String {
        return storeID
    }
    
    public func getStoreHours() -> [String] {
        return [openTime, closeTime]
    }

    /// Helper function for searchStores to convert ResponseProtocol to a dictionary
    ///
    /// - Parameters:
    ///     - stores: a ResponseProtocol raw data
    /// - Returns: [String: String]
    ///     - Saves the store name and store ID as a dictionary
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
    ///     - Radius: The radius around the location to search in meters
    ///     - Location: The location to search around
    ///     - Limit: The maximum amount of stores we want
    /// - Returns: [String: String]
    ///     - Saves the stores and response as a dictionary
    static func searchStores(radius: Int, location: CLLocation, limit: Int = 10) -> Promise<[String: String]> {
        
        /* build parameters */
        let parameters = storeParametersBuilder(radius: radius, location: location, limit: limit)
        
        /* create Foursquare service with APIFactory */
        do {
            let foursquareService = try APIFactory.build(type: API.Foursquare)
            
            /* create a request object */
            let request = Request(endpoint: FoursquareEndpoints.venueSearch.rawValue, parameters: parameters)
            
            /* Promise chain to get venues */
            return firstly {
                foursquareService.execute(request)
            }.map { response in
                getStoresAsDictionary(Stores: response)
            }
        } catch {
            print("Some error message")
            return Promise(error: error)
            // or have the function throw, I don't know which is better
        }
    }
    
    /// Helper function for searchStores to build the parameters dictionary
    ///
    /// - Parameters:
    ///     - Radius: The radius around the location to search in meters
    ///     - Location: The location to search around
    ///     - Limit: The maximum amount of stores we want
    /// - Returns: Parameters
    private static func storeParametersBuilder(radius: Int, location: CLLocation, limit: Int)
        -> Parameters {
        
        return ["radius": String(radius), "ll": String(location.coordinate.latitude) + ","
            + String(location.coordinate.longitude), "limit": String(limit), "categoryId": FoursquareVenue.GroceryStore.ID]
        
    }
}
