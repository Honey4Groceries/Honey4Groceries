//
//  Foursquare.swift
//  Honey4Groceries
//
//  Created by Thomas Tang on 2/22/19.
//

import Foundation
import SwiftyJSON

public class FoursquareAPI {
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
}
