//
//  User.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/17/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation


//class User : NSObject {
//    
//    var userId : Int?
//    var firstName : String?
//    var lastName : String?
//    var provider : String?
//    var sessionId : String?
//    var email : String?
//    var imageIconUrl : String?
//    
//    override init(){
//        self.userId = -1
//        self.email = "placeholder@willgive.org"
//        super.init()
//    }
//}


func saveUser(user : NSDictionary, pswd : String, fblogin : Bool) {
    let email = user["email"] as String
    var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    prefs.setObject(email, forKey: "USERNAME")
    // set ID: prefs.setObject(ID, forKey: "USERID")
    prefs.setObject(user, forKey: "USEROBJ")
    prefs.setBool(fblogin, forKey: "FBLOGIN")
    prefs.setObject(pswd, forKey: "PASSWORD" )
    prefs.setInteger(1, forKey: "ISLOGGEDIN")
    prefs.synchronize()
    // TODO save the credential for how long?
}

func isLoggedIn() -> Bool {
    let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
    if isLoggedIn != 1 {
        return false
    }
    return true
}

func isFacebookLoggedIn() -> Bool {
    let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
    let isFblogin:Bool = prefs.boolForKey("FBLOGIN") as Bool
    if isLoggedIn == 1 && isFblogin {
        return true
    }
    return false
}

func getUserId() -> Int? {
    let user = getUserObj()
    if user != nil { return user!["userId"] as? Int}
    return nil
}

func getUserObj() -> NSDictionary? {
    let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let user:NSDictionary? = prefs.dictionaryForKey("USEROBJ")
    return user
}