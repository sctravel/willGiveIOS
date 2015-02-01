//
//  ViewController.swift
//  Scrolling
//
//  Created by Cyrus Zhang on 2/1/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ScrollView.contentSize.height = 1200
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

