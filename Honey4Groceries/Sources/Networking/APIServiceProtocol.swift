//
//  APIProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import PromiseKit

public protocol APIServiceProtocol {
    
    /// Configuration used by API
    var configuration: APIConfig { get }
    
    /// Execute request and return Promise with Response
    ///
    /// - Parameters:
    ///     - request: request to be executed
    /// - Returns: Response from API call with specified request as Promise with Response type
    func execute(_ request: RequestProtocol) -> Promise<ResponseProtocol>
    
}
