//
//  RequestProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import SwiftyJSON
import Alamofire

/// Base class for Request
public protocol RequestProtocol {
    
    /// Endpoint of request
    var endpoint: String { get set }
    
    /// Parameters used to compose fields for http request
    /// e.g. {"a": "1", "b": "2"} becomes '.../endpoint?a=1&b=2'
    var parameters: Parameters? { get set }
}
