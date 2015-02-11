//
//  ViewController.swift
//  Constraints
//
//  Created by Cyrus Zhang on 2/10/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        if sender.titleForState(.Normal) == "X" {
            sender.setTitle("A very long title for this button", forState: .Normal)
        } else {
            sender.setTitle("X", forState: .Normal)
        }
    }
    
}

