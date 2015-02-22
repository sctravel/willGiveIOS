//
//  LoginViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/14/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController : UIViewController {
 
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func loginPressed(sender: AnyObject) {
        
        // no soft keyboard anymore
        self.txtEmail.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        
        var email : String = self.txtEmail.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        var password : String = self.txtPassword.text
       
        if ( email == "" || password == "" ) {
            showAlert("Sign in Failed!", "Please enter Email and Password", self)
        }
        else if (!matchesRegexInText(EmailRegex, email)) {
            showAlert("Sign in Failed!", "Please enter valid Email address", self)
        }
        else {
            
            var credential = ["username" : email, "password" : password]
            request(.POST, SignInURL, parameters: credential)
                .responseJSON { (request, response, JSON, error) in
                    println("request: \(request)")
                    println("response: \(response)")
                    // TODO furhter drill down of error scenarios, based on response.statusCode
                    if(error != nil || JSON == nil) {
                        showAlert("Sign in Failed!", "Please check your Email/Password", self)
                        NSLog(error!.localizedDescription)
                    }
                    else {
                        var user = JSON! as NSDictionary
                        NSLog("Login SUCCESS");

                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(email, forKey: "USERNAME")
                        // set ID: prefs.setObject(ID, forKey: "USERID")
                        prefs.setObject(user, forKey: "USEROBJ")
                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
                        prefs.synchronize()
                        // TODO save the credential for how long?
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
            }
            
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func facebookPressed(sender: AnyObject) {
        NSLog("Facebook button pressed")
        self.performSegueWithIdentifier("gotoMainPage", sender: self)
    }
    
    @IBAction func forgotPressed(sender: AnyObject) {
        NSLog("Forgot button pressed")
    }
    
    @IBAction func signupPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("gotoSignUp", sender: self)
    }
    
}