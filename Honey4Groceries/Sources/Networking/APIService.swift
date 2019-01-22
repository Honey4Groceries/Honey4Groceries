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
    public func execute(_ request: RequestProtocol) -> Promise<ResponseProtocol> {
        
        // merge default params and request params
        let completeParams = mergeParameters(defaultParameters: configuration.getDefaultParameters() ?? [:],
                                             requestParameters: request.parameters ?? [:])
        
        // make Alamofire request. Merge config parameters and request parameters into one dictionary
        return Promise { seal in
            Alamofire.request(configuration.getUrl().absoluteString + request.endpoint,
                              parameters: completeParams).response { response in

                // not using .responseJSON because the Response class wants a DefaultDataResponse
                seal.fulfill(Response(afResponse: response))
            }
        }
    }
    
    /// Helper function to merge default params from configuration object and params from request object
    ///
    /// - Parameters:
    ///     - DefaultParameters: default parameters in the configuration object
    ///     - RequestParameters: parameters in the Request object
    /// - Returns: Parameters
    private func mergeParameters(defaultParameters: Parameters, requestParameters: Parameters)
        -> Parameters {
        return defaultParameters.merging(requestParameters, uniquingKeysWith: { (first, _) in first})
    }
}
