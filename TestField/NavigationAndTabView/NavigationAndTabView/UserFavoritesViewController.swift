//
//  UserFavoritesViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 3/16/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class UserFavoritesViewController : UITableViewController {
    
    var user : NSDictionary?
    var favorites = [NSDictionary]()
    
    override func viewDidLoad() {
        
        // user can be fetched from user defaults
        user = getUserObj()
        
        if user != nil {
            request(.GET, UserFavoritesURL)
                .responseJSON { (request, response, JSON, error) in
                    println("request: \(request)")
                    println("response: \(response)")
                    // TODO furhter drill down of error scenarios, based on response.statusCode
                    if(error != nil || JSON == nil) {
                        showAlert("Service error!", "Cannot retrieve transaction history", self)
                        NSLog(error!.localizedDescription)
                    }
                    else {
                        var resp = JSON! as [NSDictionary]
                        NSLog("\(resp)")
                        resp.map({self.favorites.append($0)})
                        NSLog("Operation SUCCESS");
                        self.tableView.reloadData()
                    }
            }
        }

    }
    
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("Count of favorites entries: \(favorites.count)")
        return favorites.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as CharityTableCell
        
        NSLog("Populating cell")
        cell.populate(favorites[indexPath.row])
        
        return cell
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier != nil && segue.identifier! == "favoriteToDetailPage") {
            
            NSLog("prepare for segue")
            
            var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var destView = segue.destinationViewController as DetailPageViewController
            
            NSLog("Selected charity: \(favorites[indexPath.row])")
            
            destView.charity = favorites[indexPath.row]
            
            NSLog("destView.charity populated")
        }
    }

    
}