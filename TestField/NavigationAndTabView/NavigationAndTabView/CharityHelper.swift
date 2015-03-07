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


func getCharityRecipientId (charity : NSDictionary?) -> Int?
{
    return doGetAttributeIntOptional(charity, "recipientId")
}

func getCharityName (charity : NSDictionary?) -> String?
{
    return doGetAttributeStringOptional(charity, "name")
}

func getCharityStatus (charity : NSDictionary) -> String?
{
    return charity["status"] as String?
}

func getCharityImageUrl (charity : NSDictionary) -> String?
{
    return charity["imageUrl"] as String?
}

func getCharityImagePath (charity : NSDictionary?) -> String?
{
    return doGetAttributeStringOptional(charity!, "imagePath")
}

func getCharityMissionText (charity : NSDictionary?) -> String?
{
    return doGetAttributeStringOptional(charity, "mission")
}

func getCharityUrl (charity : NSDictionary?) -> String?
{
    return doGetAttributeStringOptional(charity, "website")
}

func getCharityPhone (charity : NSDictionary?) -> String? {
    let phone = doGetAttributeStringOptional(charity, "phone")
    if phone != nil { return deleteRegexMatches("[^0-9]", phone) }
    return nil
}

func doGetAttributeStringOptional(charity : NSDictionary?, attr : String) -> String?
{
    if(charity == nil) { return nil as String? }
    return charity![attr] as String?
}

func doGetAttributeIntOptional(charity : NSDictionary?, attr : String) -> Int?
{
    if(charity == nil) { return nil as Int? }
    return charity![attr] as Int?
}



