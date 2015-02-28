//
//  ProfileViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/28/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    @IBAction func logoutPressed(sender: AnyObject) {
        clearUserSession()
        self.performSegueWithIdentifier("loggedOut", sender: self)
    }
    
    func clearUserSession() {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
    }
}