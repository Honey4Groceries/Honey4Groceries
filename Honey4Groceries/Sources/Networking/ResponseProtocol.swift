//
//  ResponseProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import SwiftyJSON

public enum Result {
    case success(_: Int)
    case error(_: Int)
    case noResponse
    
    private static let successCodes: Range<Int> = 200..<300 // 200-299
    
    /// Pseudo constructor to get result from HTTPURLResponse
    public static func from(response: HTTPURLResponse?) -> Result {
        guard let response = response else {
            return .noResponse
        }
        if Result.successCodes.contains(response.statusCode) {
            return .success(response.statusCode)
        } else {
            return .error(response.statusCode)
        }
    }
    
    /// Result Code
    public var code: Int? {
        switch self {
        case .success(let code):
            return code
        case .error(let code):
            return code
        default:
            return nil
        }
    }
}

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
