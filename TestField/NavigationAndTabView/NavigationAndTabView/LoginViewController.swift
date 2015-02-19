//
//  LoginViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/14/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController : UIViewController {
 
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func loginPressed(sender: AnyObject) {
        
        // no soft keyboard anymore
        self.txtEmail.resignFirstResponder()
        self.txtPassword.resignFirstResponder()
        
        var email : String = self.txtEmail.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        var password : String = self.txtPassword.text
       
        if ( email == "" || password == "" ) {
             // alert if email or password is missing
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Email and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
            request(.GET, "https://54.174.120.77/services/charities/listAllCharity", parameters: ["start":1, "count":10])
                .responseJSON { (_, _, JSON, _) in
                    println(JSON!)
            }
            
            request(.POST, "https://54.174.120.77/services/login/mobileSignin", parameters: ["username":"cyrus.ylzhang@gmail.com", "password":"abcd1234"])
                .responseJSON { (_, _, JSON, _) in
                    println(JSON)
                }
            
//            // ceck email and password over https connection
//            var credential = UserCredential(username: email, password: password)
//            NSLog("credential: %@", credential.username);
//
//            var url : NSURL = NSURL(scheme: "https", host: "54.174.120.77", path: "/services/login/mobileSignin")!
//            
//            // mapping is "JsonPath":"AttributeInObject"
//            let respDict = [
//                "userId":"userId",
//                "firstName":"firstName",
//                "lastName":"lastName",
//                "provider":"provider",
//                "sessionId":"sessionId",
//                "email":"email",
//                "imageIconUrl":"imageIconUrl"]
//            
//            let respMapping = RKObjectMapping(forClass: User.self)
//            respMapping.addAttributeMappingsFromDictionary(respDict)
//            
//            let respDescriptor = RKResponseDescriptor(
//                mapping: respMapping,
//                method: RKRequestMethod.POST,
//                pathPattern: nil,
//                keyPath: nil,
//                statusCodes: nil
//            )
//            
//            let reqMapping = RKObjectMapping.requestMapping()
//            reqMapping.addAttributeMappingsFromDictionary([
//                "username" : "username", "password" : "password"
//            ])
//            
//            let reqDescriptor = RKRequestDescriptor(
//                mapping: reqMapping,
//                objectClass: UserCredential.self,
//                rootKeyPath: nil
//            )
//
//            var manager = RKObjectManager(baseURL : url)
//            manager.addRequestDescriptor(reqDescriptor)
//            manager.addResponseDescriptor(respDescriptor)
//
//            // register UserCredential object for JSON type
//            RKMIMETypeSerialization.registerClass(
//                RKNSJSONSerialization.self, forMIMEType : "application/json")
//            
//            NSLog("******** starting POST request ********")
//            
//            manager.postObject(credential, path:"/", parameters:nil,
//                success: { (optration, result) -> Void in
//                    NSLog("******** in success")
//                    let data : User = result.firstObject() as User
//                    NSLog("email\(data.email)")
//                },
//                failure: { (operation, error) -> Void in
//                    NSLog("ERRRRRRRRRROR: \(error)")
//                })
//
//            NSLog("******** finishing POST request ********")

            
//            if ( urlData != nil ) {
//                let res = response as NSHTTPURLResponse!;
//                
//                NSLog("Response code: %ld", res.statusCode);
//                
//                if (res.statusCode >= 200 && res.statusCode < 300)
//                {
//                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
//                    
//                    NSLog("Response ==> %@", responseData);
//                    
//                    var error: NSError?
//                    
//                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
//                    
//                    
//                    let success:NSInteger = jsonData.valueForKey("success") as NSInteger
//                    
//                    //[jsonData[@"success"] integerValue];
//                    
//                    NSLog("Success: %ld", success);
//                    
//                    if(success == 1)
//                    {
//                        NSLog("Login SUCCESS");
//                        
//                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//                        prefs.setObject(email, forKey: "USERNAME")
//                        // set ID: prefs.setObject(ID, forKey: "USERID")
//                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
//                        prefs.synchronize()
//                        
//                        self.dismissViewControllerAnimated(true, completion: nil)
//                        self.performSegueWithIdentifier("gotoMainPage", sender: self)
//                    } else {
//                        var error_msg:NSString
//                        
//                        if jsonData["error_message"] as? NSString != nil {
//                            error_msg = jsonData["error_message"] as NSString
//                        } else {
//                            error_msg = "Unknown Error"
//                        }
//                        var alertView:UIAlertView = UIAlertView()
//                        alertView.title = "Sign in Failed!"
//                        alertView.message = error_msg
//                        alertView.delegate = self
//                        alertView.addButtonWithTitle("OK")
//                        alertView.show()
//                        
//                    }
//                    
//                } else {
//                    var alertView:UIAlertView = UIAlertView()
//                    alertView.title = "Sign in Failed!"
//                    alertView.message = "Connection Failed"
//                    alertView.delegate = self
//                    alertView.addButtonWithTitle("OK")
//                    alertView.show()
//                }
//            } else {
//                var alertView:UIAlertView = UIAlertView()
//                alertView.title = "Sign in Failed!"
//                alertView.message = "Connection Failure"
//                if let error = reponseError {
//                    alertView.message = (error.localizedDescription)
//                }
//                alertView.delegate = self
//                alertView.addButtonWithTitle("OK")
//                alertView.show()
//            }
        }
        
        // all check passes, move to tab view controller
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func facebookPressed(sender: AnyObject) {
        NSLog("Facebook button pressed")
        self.performSegueWithIdentifier("gotoMainPage", sender: self)
    }
    
    
    @IBAction func forgotPressed(sender: AnyObject) {
        NSLog("Forgot button pressed")
    }
}