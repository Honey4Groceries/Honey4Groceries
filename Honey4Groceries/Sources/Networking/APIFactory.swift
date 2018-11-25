//
//  APIFactory.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation

public class APIFactory {
    
    public static func build(type: API) -> APIService? {
        guard let config = APIConfigs[type] else { return nil }
        return APIService(config)
    }
    
}
