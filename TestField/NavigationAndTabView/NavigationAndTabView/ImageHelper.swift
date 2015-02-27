//
//  ImageHelper.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/25/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

func LoadImage(imagePath : String?, imageView : UIImageView ) {
    if imagePath != nil {  // imagePath is present
        if let image = ImageCache.objectForKey(imagePath!) as? UIImage {
            NSLog("Image found in cache")
            imageView.image = image
        } else {
            NSLog("Image not found in cache; retrieving \(imagePath)")
            // clear the image
            imageView.image  = nil
            let url = "https://" + ServerAddress + imagePath!
            
            request(.GET, url).validate(contentType: ["image/*"]).responseImage() {
                (_, _, image, error) in
                if error == nil && image != nil {
                    
                    // put into cache
                    ImageCache.setObject(image!, forKey: imagePath!)
                    
                    // display image
                    imageView.image = image
                }
            }
        }
    }
}