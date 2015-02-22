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
        
        let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("gotoLogin", sender: self)
        } else {
            var email = prefs.valueForKey("USERNAME") as NSString
            self.usernameLabel.text = email
            NSLog("Already logged in as: \(email)")
            
            sleep(1)
            var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            // prefs.setInteger(0, forKey: "ISLOGGEDIN")
            
            self.performSegueWithIdentifier("gotoMainPage", sender: self)
        }
    }

    @IBAction func logoutPressed(sender: AnyObject) {
        clearUserSession()
        self.performSegueWithIdentifier("gotoLogin", sender: self)
    }
    
    func clearUserSession() {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
    }
}