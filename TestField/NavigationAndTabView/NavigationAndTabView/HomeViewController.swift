//
//  HomeViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/17/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if !isLoggedIn() && !isFacebookLoggedIn() {
            self.performSegueWithIdentifier("gotoLogin", sender: self)
        } else if isFacebookCredential() {
            // what does fb need for access token
//            fblogin.logInWithReadPermissions(["public_profile", "email"], handler: { (result, error) -> Void in
//                NSLog("fb login result \(result)")
//                NSLog("fb login erorr \(error)")
//            })
            
            if FBSDKAccessToken.currentAccessToken().expirationDate.compare(NSDate()) == NSComparisonResult.OrderedDescending {
                // fb credential not expired
                
                var name : String = getFirstName()!
                self.usernameLabel.text = "welcome back\n" + name
                // NSLog("Already logged in as: \(email)")
                    
                sleep(2)
                // prefs.setInteger(0, forKey: "ISLOGGEDIN")
            
                self.performSegueWithIdentifier("gotoMainPage", sender: self)
                
            } else {
                // fb credential expired; re log in
                
                var permissions = ["public_profile", "email"]  // email permission is necessary for willGive user id
                fblogin.logInWithReadPermissions(permissions, handler: { (result, error) -> Void in
                    NSLog("result: \(result)")
                    NSLog("error: \(error)")
                    var parameters = ["access_token" :FBSDKAccessToken.currentAccessToken().tokenString, "refresh_token" : ""]
                    NSLog("\(parameters)")
                    request(.POST, FbSignInURL, parameters: parameters)
                        .responseJSON { (request, response, JSON, error) in
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
                                self.performSegueWithIdentifier("gotoMainPage", sender: self)
                            }
                        }
                    
                })

            }
            
            
        } else
        {
            // try to login in with saved credentials
            let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
            var email = prefs.valueForKey("USERNAME") as! String
            var pswd = prefs.valueForKey("PASSWORD") as! String
            
            var credential = ["username" : email, "password" : pswd]
            request(.POST, SignInURL, parameters: credential)
                .responseJSON {(request, response, JSON, error) in
                    println("request: \(request)")
                    println("response: \(response)")
                    if(error != nil || JSON == nil) {
                        // TODO network error? go offline mode
                        NSLog("Saved credential login FAILED")
                    }
                    else {
                        NSLog("Saved credential login SUCCESS")
                    }
                }
            
            self.usernameLabel.text = "welcome back,\n" + email
            NSLog("Already logged in as: \(email)")
            
            sleep(2)
            // prefs.setInteger(0, forKey: "ISLOGGEDIN")
            
            self.performSegueWithIdentifier("gotoMainPage", sender: self)
        }
    }

}