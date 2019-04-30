//
//  LoginService.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/29/19.
//

import Foundation
import Firebase

public class LoginService {
    
    private var user: UserModel
    
    public init(_ user: UserModel) {
        self.user = user
    }
    
    /// Logs user into Firebase
    ///
    /// - Parameters:
    ///     - password: password to be used to login
    /// - Returns:
    ///     - Firebase provided User object
    /// - Throws:
    ///     - invalidLogin: if login is unsuccessful
    public func login(password: String) throws -> User {
        
        var retUser: User?
        Auth.auth().signIn(withEmail: user.email, password: password) { [weak self] result, error in
            guard self != nil else { return }
            retUser = result?.user
        }
        
        if retUser == nil {
            return retUser!
        } else {
            throw LoginServiceError.invalidLogin
        }
    }
    
    enum LoginServiceError: Error {
        case invalidLogin
    }
}
