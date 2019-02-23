//
//  FirebaseDB.swift
//  Honey4Groceries
//
//  Created by Thomas Tang on 2/21/19.
//

import Foundation
import PromiseKit
import SwiftyJSON
import CoreLocation

public class Database {
    // Get Prices->Store for 1 Item: [get(item: itemID)->[StoreIDs:PriceIds]], 4square getStores, loop through stores from 4square, check if it is in StoreIDs list from product node
    public func getPrices(productID: String, location: CLLocation, API: API = API.Firebase) -> Promise<[String: String]> {
        
        return firstly {
            when(fulfilled: Store.searchStores(radius: 5000, location: location, limit: 10), getPrices(productID: productID))
        }.map { stores, prices in
            var storesMatched: [String: String] = [:]
            for (_, storeID) in stores {
                if (prices[storeID] != nil) {
                    storesMatched[storeID] = prices[storeID]
                }
            }
            return storesMatched
        }
    }
    
    // / Get Prices->Store for 1 Item: [get(item: itemID)->[StoreIDs:PriceIds]], no Foursquare call, only firebase, no location
    public func getPrices(productID: String, API: API = API.Firebase) -> Promise<[String: String]> {
        do {
            let databaseService = try APIFactory.build(type: API)
            let request = Request(endpoint: FirebaseStoreEndPoint + productID + "/" + FirebaseStoreProducts + ".json")
            
            return firstly {
                databaseService.execute(request)
            }.map { response in
                FirebaseAPI.getStorePricesAsDictionary(prices: response)
            }
        } catch {
            return Promise(error: error)
        }
    }
}
