//
//  AuthService.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//
import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, name: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let authResult = authResult else {
                userCreationComplete(false,error)
                return
            }
            let userData = ["email": authResult.user.email, "owing": "0.00", "owed": "0.00", "name": name]
            DataService.instance.createDBUser(uid: authResult.user.uid, userData: userData as Dictionary<String, Any>)
            userCreationComplete(true,nil)
        }
    }
    
    func loginUser (withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true,nil)
        }
    }
}
