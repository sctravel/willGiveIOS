//
//  SearchViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 3/8/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController : UITableViewController, UISearchBarDelegate
{
    var charities = [NSDictionary]()

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("search count: \(charities.count)")
        return charities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as! CharityTableCell
        
        NSLog("Populating cell")
        cell.populate(charities[indexPath.row])
        
        return cell
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        // string searchUrl = SearchURL + searchBar.text
        request(.GET, SearchURL, parameters: ["keyword" : searchBar.text])
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
                    var resp = JSON as! [NSDictionary]
                    NSLog("reloading data... search returned \(resp.count) entries")
                    resp.map({self.charities.append($0)})
                    self.tableView.reloadData()
                    self.view.endEditing(true)
                }
            }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier != nil && segue.identifier! == "searchToDetailPage") {
            
            NSLog("prepare for segue")
            
            var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var destView = segue.destinationViewController as! DetailPageViewController
            
            NSLog("Selected charity: \(charities[indexPath.row])")
            
            destView.charity = charities[indexPath.row]
            
        }
        
    }
    
}