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
    
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        
        NSLog("in detail page - viewDidLoad")
        
        super.viewDidLoad()
        
        NSLog("in detail page - viewDidLoad - superview loaded")
        
        if(charity != nil) {
            var recipientId = charity!["recipient_id"] as Int?
            var name = charity!["name"] as String?
            
            NSLog("recipientId: \(recipientId)")
            NSLog("name: \(name)")
            
            IdLabel.text = "\(recipientId)"
            NameLabel.text = name
            
            let Image = UIImage(named: "charitable_giving.jpg")
            ImageView.image = Image
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        //NSLog("navigationItem.backBarButtonItem - \(        self.navigationItem.backBarButtonItem?.title)")

    }
}
