//
//  UserViewModel.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/04/22.
//

import Foundation
import CoreLocation
import Firebase

/// ViewModel for Welcome Screen
public class WelcomeViewModel: ViewModelProtocol {
    private let user: UserModel
    public var password: String
    
    public init(user: UserModel = UserModel()) {
        self.user = user
        self.password = ""
    }
    
    public var location: CLLocation {
        return self.user.location ?? CLLocation()
    }
    
    public func setUserEmail(email: String) {
        self.user.email = email
    }
    
    public func login() throws -> User {
        do {
            let authService = AuthService(user)
            let firebaseUser = try authService.login(password: self.password)
            return firebaseUser
        } catch {
            print("\(error)")
            throw error
        }
    }
}
