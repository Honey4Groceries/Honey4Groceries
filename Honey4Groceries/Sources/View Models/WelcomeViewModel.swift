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
    private var password: String
    
    /// Initialize a new WelcomeViewModel
    /// - Parameters:
    ///     - user: user to be used with Welcome screen - defaults to empty
    public init(user: UserModel = UserModel()) {
        self.user = user
        self.password = ""
    }
    
    public func setUserEmail(email: String) {
        self.user.email = email
    }
    
    public func setPassword(password: String) {
        self.password = password
    }
    
    public func login() throws -> User {
        do {
            let authService = AuthService(user)
            let firebaseUser = try authService.login(password: self.password)
            return firebaseUser
        } catch {
            throw error
        }
    }
}
