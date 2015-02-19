//
//  UserCredential.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/17/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation

class UserCredential : NSObject {
    
    var username : NSString  // email actually
    var password : NSString
    
    init(username : NSString, password : NSString){
        self.username = username
        self.password = password
        super.init()
    }
}