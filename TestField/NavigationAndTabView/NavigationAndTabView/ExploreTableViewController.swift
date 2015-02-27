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
    
    let imageCache = NSCache()
    var charities = [NSDictionary]()
    var didAnimateCell:[NSIndexPath: Bool] = [:]
    
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
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if didAnimateCell[indexPath] == nil || didAnimateCell[indexPath]! == false {
            didAnimateCell[indexPath] = true
            TipInCellAnimator.animate(cell)
        }
    }
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as CharityTableCell
        
        NSLog("Populating cell")
        cell.populate(charities[indexPath.row])
        
        // add image for the cell view
//        if let image = self.imageCache.objectForKey(imageURL!) as? UIImage {
//            cell.imageView.image = image
//        } else {
//            // 3
//            cell.imageView.image = nil
//            
//            // 4
//            cell.request = Alamofire.request(.GET, imageURL).validate(contentType: ["image/*"]).responseImage() {
//                (request, _, image, error) in
//                if error == nil && image != nil {
//                    // 5
//                    self.imageCache.setObject(image!, forKey: request.URLString)
//                    
//                    // 6
//                    if request.URLString == cell.request?.request.URLString {
//                        cell.imageView.image = image
//                    }
//                } else {
//                    /*
//                    If the cell went off-screen before the image was downloaded, we cancel it and
//                    an NSURLErrorDomain (-999: cancelled) is returned. This is a normal behavior.
//                    */
//                }
//            }
//        }
        
        return cell
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
