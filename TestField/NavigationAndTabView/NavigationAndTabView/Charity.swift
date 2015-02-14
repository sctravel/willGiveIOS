//
//  Charity.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/5/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit


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
}