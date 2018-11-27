//
//  Request.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation

public class Request: RequestProtocol {
    
    /// Endpoint for request
    public var endpoint: String
    
    /// Parameters for request
    public var parameters: Parameters?
    
    
    /// Initialize a new Request
    ///
    /// - Parameters:
    ///     - endpoint: API endpoint as String (e.g. venues/search/)
    ///     - parameters: Parameters for HTTP request
    public init(endpoint: String = "", parameters: Parameters? = nil) {
        self.endpoint = endpoint
        self.parameters = parameters
    }
}
