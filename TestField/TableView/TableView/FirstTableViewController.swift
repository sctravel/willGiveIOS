//
//  ViewController.swift
//  TableView
//
//  Created by Cyrus Zhang on 2/1/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var FirstTableArray = [String]()
    
    var SecondArray = [SecondTable]()
    
    var ThirdArray = [ThirdView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FirstTableArray = ["First", "Second", "Third"]
        
        SecondArray = [
            SecondTable(SecondTitle: ["FirstFirst", "SecondFirst", "ThirdFirst"], Pic: ""),
            SecondTable(SecondTitle: ["FirstSecond", "SecondSecond", "ThirdSecond"], Pic: ""),
            SecondTable(SecondTitle: ["FirstThird", "SecondThird", "ThirdThird"], Pic: "")
        ]
        
        ThirdArray = [
            ThirdView(ThirdViewArray: ["1 1","2 1","3 1"]),
            ThirdView(ThirdViewArray: ["1 2", "2 2", "3 2"]),
            ThirdView(ThirdViewArray: ["1 3", "2 3", "3 3"])
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FirstTableArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = FirstTableArray[indexPath.row]
        
        return Cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        
        var DestViewController = segue.destinationViewController as SecondTableViewController
        
        var SecondTableArrayTwo : SecondTable = SecondArray[indexPath.row]
        
        NSLog(SecondTableArrayTwo.SecondTitle.first!)
        
        DestViewController.SecondArray = SecondTableArrayTwo.SecondTitle
        DestViewController.SecondAnswerArray = ThirdArray[indexPath.row].ThirdViewArray
    }
    

}

