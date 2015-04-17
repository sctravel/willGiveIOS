//
//  MainTabBarController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 4/16/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController : UITabBarController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSLog("MainTabBarController")
        
        // change the tint
        self.tabBar.tintColor = UIColor.greenColor()

    }
    
}