//
//  UserViewModel.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/04/22.
//

import Foundation
import CoreLocation

public class UserViewModel {
    private let user: User
    private var password: String
    
    public init(user: User) {
        self.user = user
        self.password = ""
    }
    
    func setPassword(password: String) {
        self.password = password
    }
    
    public var username: String {
        return user.username
    }
    
    public var location: CLLocation {
        return user.location
    }
}
