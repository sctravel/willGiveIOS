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

func isFacebookCredential() -> Bool {
    let prefs : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    return prefs.boolForKey("FBLOGIN") as Bool
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

var fblogin : FBSDKLoginManager = FBSDKLoginManager()

func loginFacebook(view : UIViewController) {
    var permissions = ["public_profile", "email"]  // email permission is necessary for willGive user id
    fblogin.logInWithReadPermissions(permissions, handler: { (result, error) -> Void in
        NSLog("result: \(result)")
        NSLog("error: \(error)")
        var parameters = ["access_token" :FBSDKAccessToken.currentAccessToken().tokenString, "refresh_token" : ""]
        NSLog("\(parameters)")
        request(.POST, FbSignInURL, parameters: parameters)
            .responseJSON { (request, response, JSON, error) in
                println("request: \(request)")
                println("response: \(response)")
                // TODO furhter drill down of error scenarios, based on response.statusCode
                if(error != nil || JSON == nil) {
                    showAlert("FB Sign In Failed!", "Please try again", view)
                    NSLog(error!.localizedDescription)
                }
                else {
                    var user = JSON! as NSDictionary
                    NSLog("Login SUCCESS \(user)")
                    saveUser(user, "", true)
                    view.dismissViewControllerAnimated(true, completion: nil)
                }
        }
        
    })
}