//
//  User.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/04/25.
//

import Foundation
import CoreLocation
import Firebase

public class UserModel {
    public var email: String
    public var location: CLLocation?
    
    public init(email: String, location: CLLocation) {
        self.email = email
        self.location = location
    }
    
    /// Null Constructor
    public init() {
        self.email = ""
        self.location = nil
    }
}
