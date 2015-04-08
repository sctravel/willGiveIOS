//
//  Constants.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/13/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

let BaseGreen = UIColor(red :120/255.0, green : 220/255.0, blue : 150/255.0, alpha : 0.8)
let BaseGray = UIColor(red: 210/255.0, green : 210/255.0, blue : 210/255.0, alpha : 1.0)

let ServerAddress : String = "54.174.120.77"
let SignInURL : String = "https://" + ServerAddress + "/services/login/mobileSignin"
let SignUpURL : String = "https://" + ServerAddress + "/services/login/mobileSignup"
let ListCharityURL : String = "https://" + ServerAddress + "/services/charities/listAllCharity"
let PledgeURL : String = "https://" + ServerAddress + "/payment/pledge"
let SearchURL : String = "https://" + ServerAddress + "/services/charities/searchCharity"
let FbSignInURL : String = "https://" + ServerAddress + "/auth/facebook/token"
let UserHistoryURL : String = "https://" + ServerAddress + "/services/user/getTransactionHistory"
let UserFavoritesURL : String = "https://" + ServerAddress + "/services/user/getFavoriteCharity"
let CharityHistoryURL : String = "https://" + ServerAddress + "/services/transactionsByCharityId"


let EmailRegex = ".*@.*\\.[a-z]+"

let ImageCache = NSCache()

let QrPrefix = "http://www.willgive.org/c/"

let LEToken = "73f5219d-c276-4c2a-a1c5-6c4036a89e85"