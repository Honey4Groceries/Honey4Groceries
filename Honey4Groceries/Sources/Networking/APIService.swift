//
//  APIService.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

public class APIService: APIServiceProtocol {
    
    /// Configuration used by API
    public var configuration: APIConfig
    
    /// Initialize a new API with given configuration
    ///
    /// - Parameters:
    ///     - configuration: configuration
    public init(_ configuration: APIConfig) {
        self.configuration = configuration
    }
    
    /// Execute request and return Promise with Response
    ///
    /// - Parameters:
    ///     - request: request to be executed
    /// - Returns: Promise<ResponseProtocol>
    public func execute(_ request: RequestProtocol) -> Promise<ResponseProtocol>{
        // TODO
    }
    
}
