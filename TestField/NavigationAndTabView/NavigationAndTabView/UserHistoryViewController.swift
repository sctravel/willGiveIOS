//
//  UserTranscationHistoryViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 3/16/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class UserHistoryViewController : UITableViewController {
    
    var user : NSDictionary?
    var history = [NSDictionary]()
    
    override func viewDidLoad(){
    
        // user can be fetched from user defaults
        user = getUserObj()
        
        if user != nil {
            request(.GET, UserHistoryURL)
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
                        resp.map({self.history.append($0)})
                        NSLog("Operation SUCCESS");
                    }
            }
        }
    }
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as CharityTableCell
        
        NSLog("Populating cell")
        cell.populate(history[indexPath.row])
        
        return cell
    }

    
}