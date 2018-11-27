//
//  APIConfig.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation

public final class APIConfig {
    
    /// Name of API
    private var name: String
    
    /// Base URL
    private var url: URL
    
    /// Default parameters
    private var defaultParameters: Parameters?
    
    /// Initialize a new APIConfig
    ///
    /// - Parameters:
    ///     - name: name of configuration
    ///     - url: base url for API
    ///     - defaultParameters: parameters that must be included
    public init?(name: String? = nil, base urlString: String, defaultParameters: Parameters? = nil) {
        guard let url = URL(string: urlString) else { return nil }
        self.url = url
        
        // Sets name to host of URL if non-nil
        self.name = name ?? (url.host ?? "")
        self.defaultParameters = defaultParameters
    }
    
    public func getName() ->String {
        return name
    }
    
    public func getUrl() -> URL {
        return url
    }
    
    public func getDefaultParameters() -> Parameters? {
        return defaultParameters
    }
}
