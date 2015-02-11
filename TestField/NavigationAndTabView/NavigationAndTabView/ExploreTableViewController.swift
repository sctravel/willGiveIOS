//
//  ExploreViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/5/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class ExploreTableViewController: UITableViewController {
    
    var Charities = [Charity]()
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCharities()
    }
    
    
    func populateCharities(){
        Charities.append(Charity(Id: 1, Name: "Infinity Math"))
        Charities.append(Charity(Id: 2, Name: "RedCross"))
        Charities.append(Charity(Id: 3, Name: "Seattle Children's Hostipal"))
        Charities.append(Charity(Id: 4, Name: "WWE"))
        Charities.append(Charity(Id: 5, Name: "MMA"))
    }
    
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Charities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = Charities[indexPath.row].Name
        
        return Cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        
        NSLog("Getting in \(Charities[indexPath.row].Name)")
        
        var destView = segue.destinationViewController as DetailPageViewController
        
        destView.charity = Charities[indexPath.row]
    }

    
}
