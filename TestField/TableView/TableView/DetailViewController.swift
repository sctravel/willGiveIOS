//
//  DetailViewController.swift
//  TableView
//
//  Created by Cyrus Zhang on 2/1/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController
{
    
    var FristString = String()
    
    @IBOutlet weak var TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.text = FristString
    }
}