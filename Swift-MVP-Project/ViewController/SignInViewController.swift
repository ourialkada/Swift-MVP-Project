//
//  SignInViewController.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController,SignInViewDelegate {
    
    private let signInPresentor = SignInPresentor()
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var lbAlert: UILabel!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        signInPresentor.setViewDelegate(signInViewDelegate: self)
    }
    
    @IBAction func logInClick(_ sender: Any) {
        Spinner.start()
        self.lbAlert.isHidden = true
        signInPresentor.login(credentials: Credentials(email: email.text!, password: password.text!))
    }
    
    
    func displayErrorMessage(description: (String)) {
        Spinner.stop()
        self.lbAlert.isHidden=false
        self.lbAlert.backgroundColor = .red
        self.lbAlert.text = description
    }
    
    func logInSuccess() {
        Spinner.stop()
        self.lbAlert.isHidden=false
        self.lbAlert.backgroundColor = .red
        self.performSegue(withIdentifier: "toHome", sender: nil)
    }
}



