//
//  Response.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/24/18.
//

import Foundation
import SwiftyJSON
import Alamofire

public class Response: ResponseProtocol {
    
    /// Type of Result
    public let type: Result 
    
    /// HTTP Response
    public let httpResponse: HTTPURLResponse?
    
    /// HTTP Response Status Code
    public var httpStatusCode: Int? {
        return self.type.code
    }
    
    /// Raw Data of Response
    public var rawData: Data?
    
    /// JSON Data of Response
    public lazy var jsonData: JSON = try! JSON(data: rawData ?? Data())
    
    /// Initialize a new Response with given Alamofire response
    ///
    /// - Parameters:
    ///     - response: response from Alamofire
    public init(afResponse response: DefaultDataResponse) {
        self.type = Result.from(response: response.response)
        self.httpResponse = response.response
        self.rawData = response.data
    }
}
