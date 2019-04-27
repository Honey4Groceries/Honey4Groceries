//
//  User.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/04/25.
//

import Foundation
import CoreLocation

public class User {
    public let username: String
    public let location: CLLocation
    
    public init(username: String, location: CLLocation) {
        self.username = username
        self.location = location
    }
}
