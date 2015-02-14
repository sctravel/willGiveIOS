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

    var charity = Charity(recipientId: 0, name: "PlaceHolder")
    
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    // @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IdLabel.text = "\(charity.recipientId)"
        NameLabel.text = charity.name
        
        let Image = UIImage(named: "charitable_giving.jpg")
        ImageView.image = Image
    }
    
    override func viewWillAppear(animated: Bool) {
        //NSLog("navigationItem.backBarButtonItem - \(        self.navigationItem.backBarButtonItem?.title)")

    }
}
