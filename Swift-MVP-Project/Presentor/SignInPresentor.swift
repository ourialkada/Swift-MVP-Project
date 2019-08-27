//
//  SignInPresentor.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Firebase

protocol SignInViewDelegate: NSObjectProtocol {
    func displayErrorMessage(description:(String))
    func logInSuccess()
}

class SignInPresentor {
    weak private var signInViewDelegate : SignInViewDelegate?
    
    func setViewDelegate(signInViewDelegate:SignInViewDelegate?){
        self.signInViewDelegate = signInViewDelegate
    }
    
    func login(credentials: Credentials){
        
        if isValid(creds: credentials)
        {
            Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { (user, error) in
                
                if error?.localizedDescription == nil {
                    if NetworkState().isConnected {
                        self.signInViewDelegate?.logInSuccess()
                    }
                    else
                    {
                        self.signInViewDelegate?.displayErrorMessage(description: "Please check your Internet Connection")
                    }
                }
                    
                else{
                    if NetworkState().isConnected {
                        
                        self.signInViewDelegate?.displayErrorMessage(description: "Login failed Incorrect Email or Password")
                    }
                    else
                    {
                        self.signInViewDelegate?.displayErrorMessage(description:"Please check your Internet Connection")
                    }
                    
                }
                
            }
        }
    }
    
    func isValid(creds:Credentials) -> Bool {
        let emailText = creds.email
        let passText = creds.password
        
        if emailText.range(of:"@") == nil || (emailText.range(of:".com") == nil && emailText.range(of:".net") == nil && emailText.range(of:".edu") == nil && emailText.range(of:".org") == nil) {
            self.signInViewDelegate?.displayErrorMessage(description: "Check Email Field!")
            return false;
        }
        
        if (passText.count) < 1{
            
            self.signInViewDelegate?.displayErrorMessage(description: "Check Password Field!")
            return false;
        }
        
        if emailText.count < 1
        {
            self.signInViewDelegate?.displayErrorMessage(description: "Check Email Field!")
            return false;
        }
        return true;
    }
    
}
