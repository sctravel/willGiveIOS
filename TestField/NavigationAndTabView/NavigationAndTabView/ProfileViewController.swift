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
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var email: UILabel!
    
    
    
    override func viewDidAppear(animated: Bool) {
    
        NSLog("\(getUserObj())")
        
        var user = getUserObj()
        
        if user != nil {
            var firstname = user!["firstName"] as? String
            var lastname = user!["lastName"] as? String
            name.text = "\(firstname!) \(lastname!)"
            email.text = user!["email"] as? String
            
            var imagepath = user!["imageIconUrl"] as? String
            LoadImage(imagepath, "", self.profileImage)
        }
    
    }
    
    @IBAction func logoutPressed(sender: AnyObject) {
        if isFacebookCredential() {
            fblogin.logOut()
        }
        clearUserSession()
        
        self.performSegueWithIdentifier("loggedOut", sender: self)
    }
    
    func clearUserSession() {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
    }
    
}