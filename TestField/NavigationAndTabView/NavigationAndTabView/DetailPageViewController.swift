//
//  DetailPageViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/3/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class DetailPageViewController: UIViewController {
    
    var charity : NSDictionary?
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var mission: UILabel!

    override func viewDidLoad() {
        NSLog("in detail page - viewDidLoad")
        super.viewDidLoad()
        
        NSLog("Name: \(getCharityName(charity))")
        
        nameButton.setTitle( getCharityName(charity), forState: UIControlState.Normal)
        mission.text = getCharityMissionText(charity)
        mission.sizeToFit()  // this is for label text to start from left right corner
        let imagePath = getCharityImagePath(charity) // medium sized profile image
        
        LoadImage(imagePath, "_medium", self.imageView)
        
    }
    
	
    @IBAction func pledgePressed(sender: AnyObject) {
        NSLog("Pledge button pressed")
        // pop up slider - confirmation
    }
    
    @IBAction func nameButtonPresseed(sender: AnyObject) {
        NSLog("Name Pressed")
        
    }

    @IBAction func callButtonPressed(sender: AnyObject) {
        NSLog("Phone Pressed")
        let phone = getCharityPhone(charity);
        if(phone != nil ) {
            NSLog("phone: \(phone)")
            let url:NSURL = NSURL(string : "tel://" + phone!)!
            UIApplication.sharedApplication().openURL(url)
        } else {
            showAlert( "Sorry",  "Missing Phone Number", self)
        }
    }
    
    @IBAction func mapitButtonPressed(sender: AnyObject) {
        NSLog("Map it Pressed")
    }
    
    @IBAction func einButtonPressed(sender: AnyObject) {
        NSLog("EIN pressed")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepare for segue")
        if(segue.identifier != nil && segue.identifier! == "showWebView") {
            var detailWebView : DetailWebViewController = segue.destinationViewController as DetailWebViewController
            NSLog("url is \(getCharityUrl(charity))")
            // pass data into the detail page
            detailWebView.url = getCharityUrl(charity)
        }
        if(segue.identifier != nil && segue.identifier! == "showPledgeView" ) {
            var pledgeView : PledgeViewController = segue.destinationViewController as PledgeViewController
            NSLog("pledging to \(getCharityRecipientId(charity))")
            pledgeView.recipientId = getCharityRecipientId(charity)
        }
    }

}
