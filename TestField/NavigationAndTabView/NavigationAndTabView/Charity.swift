//
//  Charity.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/5/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation


class Charity : NSObject {

    var recipientId : Int
    var name : String
    
    var status : String?
    var email : String?
    var EIN : String?
    var address : String?
    var zipcode : String?
    var city : String?
    var state : String?
    var country : String?
    var phone : String?
    var fax : String?
    var website : String?
    var mission : String?
    var facebookUrl : String?
    var videoUrl : String?
    var imageUrl : String?
    var contactPersonName : String?
    var contactPersonTitle : String?
    var imagePath : String?
    var rating : Int?
    
    init(recipientId :Int, name :String){
        self.recipientId = recipientId
        self.name = name
    }
    
    override init(){
        self.recipientId = -1
        self.name = "placeholder"
        super.init()
    }
    
    // https://github.com/RestKit/RestKit/issues/2155
//    override func validateValue(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, forKeyPath inKeyPath: String, error outError: NSErrorPointer) -> Bool {
//        NSLog("***********************  in validateValue")
//        if let memory: AnyObject = ioValue.memory {
//            if inKeyPath != "recipientId" && inKeyPath != "name" && ioValue.memory is NSNull {
//                ioValue.memory = nil
//                return true
//            }
//        }
//        return super.validateValue(ioValue, forKeyPath: inKeyPath, error: outError)
//    }
    
}