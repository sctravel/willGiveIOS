//
//  viewTwo.swift
//  PassDataBetweenViewControllers
//
//  Created by Cyrus Zhang on 1/31/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class viewTwo: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var labelText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = labelText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
