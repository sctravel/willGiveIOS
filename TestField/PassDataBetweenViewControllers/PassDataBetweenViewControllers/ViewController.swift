//
//  ViewController.swift
//  PassDataBetweenViewControllers
//
//  Created by Cyrus Zhang on 1/31/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : viewTwo = segue.destinationViewController as viewTwo
        DestViewController.labelText = textField.text
    }


}

