//
//  Barcode.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/02/02.
//

import SwiftyJSON
import PromiseKit

/// The class representing the barcode items
public class BarcodeItems {
    
    /// The barcode value in string format
    private var barcode: String

    /**
     Initializes the BarcodeItems class
     
     - Parameters:
        - barcode: the string representation of the barcode
     */
    public init(barcode: String) {
        self.barcode = barcode
    }

    /**
     Gets the barcode of an item
     
     - Returns: the barcode in string format
     */
    public func getBarcode() -> String {
        return barcode
    }

    /**
     Helper function for searchItems to convert ResponseProtocol to a dictionary
     
     - Parameters:
        - BarcodeItems: a response protocol raw data
     - Returns: [String: String]
     */
    static func getBarcodeItemsAsDictionary(BarcodeItems: ResponseProtocol) -> [String: String] {
        let barcodeItemData = BarcodeItems.jsonData
        
        var barcodeItemDataDictionary: [String: String] = [:]
        
        // turn the barcode API request json to a dictionary
        for barcodeItem in barcodeItemData["products"].arrayValue {
            let barcodeItemBrand = barcodeItem["brand"].stringValue
            let barcodeItemName = barcodeItem["name"].stringValue
            print(barcodeItemBrand)
            barcodeItemDataDictionary[barcodeItemBrand] = barcodeItemName
        }
        
        return barcodeItemDataDictionary
    }
    
    /**
     Search for items given a barcode
     
     - Returns: [String: String]
     */
    static func searchItems() -> [String: String]? {
        var items: [String: String]?
        
        let parameters = itemParametersBuilder()
        
        // Begin the search for the items for the given barcode
        do {
            let chompService = try APIFactory.build(type: API.Chomp)
            
            let request = Request(endpoint: ChompEndpoints.itemBarcodeSearch.rawValue, parameters: parameters)
            firstly {
                chompService.execute(request)
            }.compactMap{ response in
                items = getBarcodeItemsAsDictionary(BarcodeItems: response)
            }
        } catch {
            print("Some error message")
            return nil
        }
        
        return items
    }
    
    /**
     Helper function for barcode
     
     - Returns: [String: String]
     */
    private static func itemParametersBuilder()
        -> Parameters {
            return ["code": ChompItem.Item.Barcode]
    }}
