//
//  Charity.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/5/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation



//    var recipientId : Int
//    var name : String
//    
//    var status : String?
//    var email : String?
//    var EIN : String?
//    var address : String?
//    var zipcode : String?
//    var city : String?
//    var state : String?
//    var country : String?
//    var phone : String?
//    var fax : String?
//    var website : String?
//    var mission : String?
//    var facebookUrl : String?
//    var videoUrl : String?
//    var imageUrl : String?
//    var contactPersonName : String?
//    var contactPersonTitle : String?
//    var imagePath : String?
//    var rating : Int?


func getCharityRecipientId (charity : NSDictionary) -> String
{
    return charity["recipient_id"] as String
}

func getCharityName (charity : NSDictionary) -> String
{
    return charity["name"] as String
}

func getCharityStatus (charity : NSDictionary) -> String?
{
    return charity["status"] as String?
}

func getImageUrl (charity : NSDictionary) -> String?
{
    return charity["imageUrl"] as String?
}






