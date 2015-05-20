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
    
    
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnFacebook: UIButton!
    @IBOutlet var btnForgot: UIButton!
    @IBOutlet var btnSignup: UIButton!
    

    override func viewDidAppear(animated: Bool) {
        
        var logger = getLogger()
        logger.log("hello log entries")
        
        super.viewDidAppear(true)
        if isLoggedIn() {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        
        // no soft keyboard anymore
        self.txtEmail.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        
        var email : String = self.txtEmail.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).lowercaseString
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
                .responseJSON {(request, response, JSON, error) in
                    println("request: \(request)")
                    println("response: \(response)")
                    // TODO furhter drill down of error scenarios, based on response.statusCode
                    if(error != nil || JSON == nil) {
                        showAlert("Sign in Failed!", "Please check your Email/Password", self)
                        NSLog(error!.localizedDescription)
                    }
                    else {
                        var user = JSON as! NSDictionary
                        NSLog("Login SUCCESS");
                        saveUser(user, password, false)
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                }

        }
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    
    @IBAction func facebookPressed(sender: AnyObject) {
        NSLog("Facebook button pressed")
        var permissions = ["public_profile", "email"]  // email permission is necessary for willGive user id
        fblogin.logInWithReadPermissions(permissions, handler: { (result, error) -> Void in
            NSLog("result: \(result)")
            NSLog("error: \(error)")
            var parameters = ["access_token" :FBSDKAccessToken.currentAccessToken().tokenString, "refresh_token" : ""]
            NSLog("\(parameters)")
            request(.POST, FbSignInURL, parameters: parameters)
                .responseJSON {
                    (request, response, JSON, error) in
                    println("request: \(request)")
                    println("response: \(response)")
                    // TODO furhter drill down of error scenarios, based on response.statusCode
                    if(error != nil || JSON == nil) {
                        showAlert("FB Sign In Failed!", "Please try again", self)
                        NSLog(error!.localizedDescription)
                    }
                    else {
                        var user = JSON as! NSDictionary
                        NSLog("Login SUCCESS \(user)")
                        saveUser(user, "", true)
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                }
            
            })

    }
    
    @IBAction func forgotPressed(sender: AnyObject) {
        NSLog("Forgot button pressed")
    }
    
    @IBAction func signupPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("gotoSignUp", sender: self)
    }
    
}