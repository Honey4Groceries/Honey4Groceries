//
//  ResponseProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import SwiftyJSON

public protocol ResponseProtocol {
    
    /// Type of Result
    var type: Result { get }
    
    /// HTTP Response
    var httpResponse: HTTPURLResponse? { get }
    
    /// HTTP Response Status Code
    var httpStatusCode: Int? { get }
    
    /// Raw Data of Response
    var rawData: Data? { get }
    
    /// JSON Data of Response
    var jsonData: JSON { get }
}
