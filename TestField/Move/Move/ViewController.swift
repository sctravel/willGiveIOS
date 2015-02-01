//
//  ViewController.swift
//  Move
//
//  Created by Cyrus Zhang on 2/1/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Location = CGPoint(x: 0, y: 0)

    @IBOutlet weak var Person: UIImageView!

    
    func SetPersonLocation(touches: NSSet)
    {
        var touch : UITouch! = touches.anyObject() as UITouch
        Location = touch.locationInView(self.view)
        Person.center = Location
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        SetPersonLocation(touches)
    }

    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        SetPersonLocation(touches)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

