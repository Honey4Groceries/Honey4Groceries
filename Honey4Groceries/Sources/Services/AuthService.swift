//
//  AuthService.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/29/19.
//

import Foundation
import Firebase

public class AuthService {
    
    private var user: UserModel
    
    public init(_ user: UserModel) {
        self.user = user
    }
    
    /// Logins user into Firebase
    ///
    /// - Parameters:
    ///     - password: password to be used to login
    /// - Returns:
    ///     - Firebase provided User object
    /// - Throws:
    ///     - FIRAuthError returned from firebase
    public func login(password: String) throws -> User {
        var retUser: User?
        var retError: Error?
        
        Auth.auth().signIn(withEmail: user.email, password: password) { [weak self] result, error in
            guard self != nil else { return }
            
            guard error == nil else {
                retError = error
                return
            }
            
            retUser = result?.user
        }
        
        if retError != nil {
            throw retError!
        }
        
        return retUser!
    }
    
    /// Sign up user on Firebase
    ///
    /// - Parameters:
    ///     - password: password to be used to login
    /// - Returns:
    ///     - Firebase provided User object
    /// - Throws:
    ///     - FIRAuthError returned from firebase
    public func signup(password: String) throws -> User {
        var retUser: User?
        var retError: Error?
        
        Auth.auth().createUser(withEmail: user.email, password: password) { [weak self] result, error in
            guard self != nil else { return }
            
            guard error == nil else {
                retError = error
                return
            }
            
            retUser = result?.user
        }
        
        if retError != nil {
            throw retError!
        }
        
        return retUser!
    }
}
