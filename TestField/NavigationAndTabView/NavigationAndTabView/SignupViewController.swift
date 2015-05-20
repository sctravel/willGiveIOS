//
//  SignupViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/21/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class SingupViewController : UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func signupPressed(sender: AnyObject) {
        // signup logic
        
        var eml : String = self.email.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).lowercaseString
        var pswd : String = self.password.text
        var cfmpswd : String = self.confirmPassword.text
        var fn : String = self.firstName.text
        var ln : String = self.lastName.text
        
        if( eml == "" || fn == "" || ln == "" || pswd == "" || cfmpswd == "") {
            showAlert("Sign up Failed!", "Please enter info in all the fields", self)
        }
        else if (!matchesRegexInText(EmailRegex, eml)) {
            showAlert("Sign up Failed!", "Please enter valid Email address", self)
        }
        else if (pswd !=  cfmpswd) {
            showAlert("Sign up Failed!", "Password does not match", self)
        }
        else {

            var info = ["email" : eml,
                "firstName" : fn,
                "lastName" : ln,
                "password" : pswd ]
            request(.POST, SignUpURL, parameters: info)
               .responseJSON {(request, response, JSON, error) in
                if(error != nil || JSON == nil) {
                    showAlert("Sign Up Failed!", "Please check your info", self)
                    NSLog(error!.localizedDescription)
                }
                else {
                    var user = JSON as! NSDictionary
                    showAlert("Sign Up Succeeded!", "Please log in", self)
                    NSLog(user.description)
                    saveUser(user, pswd, false)
                }
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}