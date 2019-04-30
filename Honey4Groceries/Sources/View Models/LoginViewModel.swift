//
//  UserViewModel.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/04/22.
//

import Foundation
import CoreLocation
import Firebase

public class LoginViewModel {
    private let user: UserModel
    public var password: String
    
    public init(user: UserModel = UserModel()) {
        self.user = user
        self.password = ""
    }
    
    public var location: CLLocation {
        return user.location ?? CLLocation()
    }
    
    public func setUserEmail(email: String) {
        user.email = email
    }
    
    public func login() {
        do {
            let loginService = LoginService(user)
            let firebaseUser = try loginService.login(password: self.password)
        } catch {
            print("hi")
        }
    }
}
