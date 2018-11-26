//
//  APIFactory.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation

/// Factory class that builds APIService objects
public class APIFactory {
    
    /// Factory function that builds an APIService by taking in an API type
    ///
    /// - Parameters:
    ///     - type: type of API
    /// - Returns: APIService instance of specified API
    public static func build(type: API) -> APIService? {
        guard let config = APIConfigs[type] else { return nil }
        return APIService(config)
    }
    
}
