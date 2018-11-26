//
//  APIConfig.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation

/// Stores API configurations including base URL and default parameters(e.g. API key)
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
    ///     - name: Name of configuration
    ///     - urlString: Base url for API
    ///     - defaultParameters: Parameters that must be included for API call
    public init?(name: String? = nil, base urlString: String, defaultParameters: Parameters? = nil) {
        guard let url = URL(string: urlString) else { return nil }
        self.url = url
        
        // Sets name to host of URL if non-nil
        self.name = name ?? (url.host ?? "")
        self.defaultParameters = defaultParameters
    }
    
}
