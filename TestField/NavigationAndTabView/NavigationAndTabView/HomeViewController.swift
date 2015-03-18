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
        
        if !isLoggedIn() || isFacebookLoggedIn() {
            self.performSegueWithIdentifier("gotoLogin", sender: self)
        } else {
            // try to login in with saved credentials
            let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
            var email = prefs.valueForKey("USERNAME") as String
            var pswd = prefs.valueForKey("PASSWORD") as String
            
            var credential = ["username" : email, "password" : pswd]
            request(.POST, SignInURL, parameters: credential)
                .responseJSON { (request, response, JSON, error) in
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