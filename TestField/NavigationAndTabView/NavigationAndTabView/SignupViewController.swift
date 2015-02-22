//
//  SignupViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/21/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class SingupViewController : UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func signupPressed(sender: AnyObject) {
        // signup logic
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}