//
//  Firebase.swift
//  Honey4Groceries
//
//  Created by Thomas Tang on 2/22/19.
//

import Foundation
import SwiftyJSON

public class FirebaseAPI {
    static func getStorePricesAsDictionary(prices: ResponseProtocol) -> [String: String] {
        let storePriceData = prices.jsonData
        var storePriceDataAsDictionary: [String: String] = [:]
        
        for (storeID, priceID) in storePriceData {
            storePriceDataAsDictionary[storeID] = priceID.stringValue
        }
        
        return storePriceDataAsDictionary
    }
}
