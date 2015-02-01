//
//  SecondTableViewController.swift
//  TableView
//
//  Created by Cyrus Zhang on 2/1/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController : UITableViewController{
    
    var SecondArray = [String]()
    var SecondAnswerArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as UITableViewCell

        Cell.textLabel?.text = SecondArray[indexPath.row]
        
        return Cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        
        var DestViewController = segue.destinationViewController as DetailViewController
        
        DestViewController.FristString = SecondAnswerArray[indexPath.row]
    }
    

}