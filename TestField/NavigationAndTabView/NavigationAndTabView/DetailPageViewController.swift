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

    var charity = Charity(Id: 0, Name: "PlaceHolder")
    
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    // @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IdLabel.text = "\(charity.Id!)"
        NameLabel.text = charity.Name
        
        let Image = UIImage(named: "charitable_giving.jpg")
        ImageView.image = Image
    }
    
    override func viewWillAppear(animated: Bool) {
        //NSLog("navigationItem.backBarButtonItem - \(        self.navigationItem.backBarButtonItem?.title)")

    }
}
