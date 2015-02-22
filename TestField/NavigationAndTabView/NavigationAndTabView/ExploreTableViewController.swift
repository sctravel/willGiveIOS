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
    
    var charities = [NSDictionary]()
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCharities()
    }
    
    
    func populateCharities(){
        
        NSLog("******** in populateCharities ********")
        
        request(.GET, ListCharityURL, parameters: ["start":0, "count":10])
            .responseJSON { (request, response, JSON, error) in
                println("request: \(request)")
                println("response: \(response)")
                // TODO furhter drill down of error scenarios, based on response.statusCode
                if(error != nil || JSON == nil) {
                    showAlert("Failed to retrieve data", "Please check your network connection", self)
                    NSLog(error!.localizedDescription)
                }
                else {
                    var resp = JSON! as [NSDictionary]
                    resp.map({self.charities.append($0)})
                    self.tableView.reloadData()
                }
        }
        
    }
    
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as UITableViewCell
        Cell.textLabel?.text = charities[indexPath.row]["name"] as? String
        return Cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepare for segue")
        
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        var destView = segue.destinationViewController as DetailPageViewController
        
        NSLog("Selected charity: \(charities[indexPath.row])")
        
        destView.charity = charities[indexPath.row]
        
        NSLog("destView.charity populated")
    }

    
}
