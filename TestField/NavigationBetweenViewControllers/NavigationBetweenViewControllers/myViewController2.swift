//
//  myViewController2.swift
//  NavigationBetweenViewControllers
//
//  Created by Cyrus Zhang on 1/31/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class myViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toView1Pressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func toView3Pressed(sender: AnyObject) {
        let view3 = self.storyboard?.instantiateViewControllerWithIdentifier("view3")
        as myViewController3
        self.navigationController?.pushViewController(view3, animated: true)
    }
}

