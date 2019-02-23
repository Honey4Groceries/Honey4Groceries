//
//  NetworkConstants.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation

/// Typealias for <String, String> Dictionary
public typealias Parameters = [String: String]

public enum API: String {
    case Firebase
    case Foursquare
    case Barcode
    
    var name: String {
        switch self {
        case .Firebase: return "Firebase"
        case .Foursquare: return "Foursquare"
        case .Barcode: return "Barcode"
        }
    }
}

public enum FoursquareEndpoints: String {
    case venueSearch = "venues/search"
}

public enum FoursquareVenue: String {
    case GroceryStore
    
    var ID: String {
        switch self {
        case .GroceryStore: return "4bf58dd8d48988d118951735"
        }
    }
}

public let APIConfigs: [API: APIConfig] = [
    API.Foursquare: APIConfig(name: API.Foursquare.name, base: FoursquareBaseURL, defaultParameters:
        FoursquareDefaultParameters)!,
    API.Firebase: APIConfig(name: API.Firebase.name, base: FirebaseBaseURL)!
]

private let FoursquareBaseURL = "https://api.foursquare.com/v2/"
//private let FourSquareVenueSearchEndpoint = "venues/search"
//private let FourSquareGroceryCategoryID = "4bf58dd8d48988d118951735"
private let FoursquareClientID = "4TCOBRNYJSHUVUA21XNC1NGYF1EFSMKSSCPTLPHXE1KITWME"
private let FoursquareClientSecret = "M4JZCLSXBFPDKS0G52OYPI1J13KIYDIYKLS5J0ASRCDKDVTE"
private let FoursquareVersion = "20181120"
private let FoursquareDefaultParameters = [
    "client_id": FoursquareClientID,
    "client_secret": FoursquareClientSecret,
    "v": FoursquareVersion
]

public enum FirebaseEndpoints: String {
    case product = "products/"
}

public let FirebaseBaseURL = "https://honey4groceries.firebaseio.com/"

public let FirebaseStoreEndPoint = "stores/"
public let FirebaseStoreProducts = "products/"

/// Enum for handling results of requests
public enum Result {
    case success(_: Int)
    case error(_: Int)
    case noResponse
    
    private static let successCodes: Range<Int> = 200..<300 // 200-299
    
    /// Pseudo constructor to get result from HTTPURLResponse
    public static func from(response: HTTPURLResponse?) -> Result {
        guard let response = response else {
            return .noResponse
        }
        if Result.successCodes.contains(response.statusCode) {
            return .success(response.statusCode)
        } else {
            return .error(response.statusCode)
        }
    }
    
    /// Result Code
    public var code: Int? {
        switch self {
        case .success(let code):
            return code
        case .error(let code):
            return code
        default:
            return nil
        }
    }
}
