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
//    var didAnimateCell:[NSIndexPath: Bool] = [:]
  
    var currentLoadIndex = 0
    let loadBatch = 5
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateCharities()
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        populateCharities()
//    }
    
    // everytime it gets called, it loads <loadBatch> more charities into the charity list
    func populateCharities(){
        
        NSLog("******** in populateCharities ********")
        
        request(.GET, ListCharityURL, parameters: ["start" : currentLoadIndex, "count" : loadBatch])
            .responseJSON { (request, response, JSON, error) in
                println("request: \(request)")
                println("response: \(response)")
                println("error: \(error)")
                // TODO furhter drill down of error scenarios, based on response.statusCode
                if(error != nil || JSON == nil) {
                    showAlert("Failed to retrieve data", "Please check your network connection", self)
                    NSLog(error!.localizedDescription)
                }
                else {
                    self.currentLoadIndex += self.loadBatch
                    var resp = JSON! as [NSDictionary]
                    resp.map({self.charities.append($0)})
                    self.tableView.reloadData()
                }
        }
        
    }
    
//  animation for loading table cells
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        if didAnimateCell[indexPath] == nil || didAnimateCell[indexPath]! == false {
//            didAnimateCell[indexPath] = true
//            TipInCellAnimator.animate(cell)
//        }
//    }
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as CharityTableCell
        
        NSLog("Populating cell")
        cell.populate(charities[indexPath.row])
        
        return cell
    }
    
    
    // add swipe and dismiss action
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            charities.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    // swipe to the bottom and load more data
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // when it's going to display the last charity
        if(indexPath.row == charities.count - 1){
            NSLog("hitting the talbe bottom... load more")
            populateCharities()
        }
    }

    
    // add search functionality
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
         if(segue.identifier != nil && segue.identifier! == "exploreToDetailPage") {
            
            NSLog("prepare for segue")
            
            var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var destView = segue.destinationViewController as DetailPageViewController
            
            NSLog("Selected charity: \(charities[indexPath.row])")
            
            destView.charity = charities[indexPath.row]
            
            NSLog("destView.charity populated")
        }
    }

    
    
}
