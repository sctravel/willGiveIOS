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
            self.usernameLabel.text = prefs.valueForKey("USERNAME") as NSString
        }
    }

    @IBAction func logoutPressed(sender: AnyObject) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("gotoLogin", sender: self)
    }
}