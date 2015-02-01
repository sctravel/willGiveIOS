//
//  ViewController.swift
//  NavigationBetweenViewControllers
//
//  Created by Cyrus Zhang on 1/31/15.
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

    @IBAction func toView2Pressed(sender: AnyObject) {
        let view2 = self.storyboard?.instantiateViewControllerWithIdentifier("view2") as
        myViewController2
        self.navigationController?.pushViewController(view2, animated: true)
    }

}

