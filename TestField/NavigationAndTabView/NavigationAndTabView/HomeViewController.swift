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
        
        if isLoggedIn() == true {
            self.performSegueWithIdentifier("gotoLogin", sender: self)
        } else {
            var email = prefs.valueForKey("USERNAME") as String
            self.usernameLabel.text = "welcome back,\n" + email
            NSLog("Already logged in as: \(email)")
            
            var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            // prefs.setInteger(0, forKey: "ISLOGGEDIN")
            
            self.performSegueWithIdentifier("gotoMainPage", sender: self)
        }
    }

}