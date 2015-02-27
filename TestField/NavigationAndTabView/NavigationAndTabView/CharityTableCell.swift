//
//  CharityTableCell.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/25/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class CharityTableCell : UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var name: UILabel!

    func populate(charity : NSDictionary? ) {
        NSLog("populate - setting up image")
        let imagePath = getCharityImagePath(charity)
        LoadImage(imagePath, self.profileImageView)
        
        NSLog("populate - setting up name")
        name.text = getCharityName(charity)
    }
    
}