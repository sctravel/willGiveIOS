//
//  User.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/17/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation


class User : NSObject {
    
    var userId : Int?
    var firstName : String?
    var lastName : String?
    var provider : String?
    var sessionId : String?
    var email : String?
    var imageIconUrl : String?
    
    override init(){
        self.userId = -1
        self.email = "placeholder@willgive.org"
        super.init()
    }
}