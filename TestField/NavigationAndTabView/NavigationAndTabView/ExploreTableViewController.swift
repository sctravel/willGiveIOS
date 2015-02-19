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
        
        NSLog("******** in populateCharities ********")
        
//        // mapping is "JsonPath":"AttributeInObject"
//        let mapDict = [
//            "recipient_id":"recipientId",
//            "name":"name",
//            "status":"status",
//            "email":"email",
//            "EIN":"EIN",
//            "address":"address",
//            "zipcode":"zipcode",
//            "city":"city",
//            "state":"state",
//            "country":"country",
//            "phone":"phone",
//            "fax":"fax",
//            "website":"website",
//            "mission":"mission",
//            "facebookUrl":"facebookUrl",
//            "videoUrl":"videoUrl",
//            "imageUrl":"imageUrl",
//            "contactPersonName":"contactPersonName",
//            "contactPersonTitle":"contactPersonTitle",
//            "imagePath":"imagePath",
//            "rating":"rating"]
//        
//        let charityMapping = RKObjectMapping(forClass: Charity.self)
//        charityMapping.addAttributeMappingsFromDictionary(mapDict)
//        NSLog("\(charityMapping.objectClass)")
//        
//        let responseDescriptor = RKResponseDescriptor(
//            mapping: charityMapping,
//            method: RKRequestMethod.GET,
//            pathPattern: nil,
//            keyPath: nil,
//            statusCodes: nil
//        )
//        
//        let request = NSURLRequest(URL: NSURL(scheme: "https", host: "54.174.120.77", path: "/services/charities/listAllCharity?start=1&count=10")!)
//        
//        let operation = RKObjectRequestOperation(request: request, responseDescriptors: [responseDescriptor])
//        
//        operation.setCompletionBlockWithSuccess(
//            { (optration, result) -> Void in
//                NSLog("in success")
//                let data : [Charity] = result!.array() as [Charity]
//                /* Here the data is the rest response mapped as an array of FlashCard objects */
//                
//                NSLog("retrieved \(data.count) records")
//                
//                self.Charities.append(data[0])
//                self.Charities.append(data[1])
//                self.Charities.append(data[2])
//                self.Charities.append(data[3])
//                self.Charities.append(data[4])
//
//                NSLog("records in self.Charities")
//                
//                self.tableView.reloadData()
//                
//                NSLog("tableView reloaded")
//                
//            }, failure: { (operation, error) -> Void in
//                NSLog("ERRRRRRRRRROR: \(error)")
//            })
//        
//        NSLog("******** starting GET request ********")
//        
//        operation.start()
//        operation.waitUntilFinished()
//        
//        NSLog("******** finishing GET request ********")
        
    }
    
    
    // missing this function will not properly render the cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Charities.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCellWithIdentifier("CharityCell", forIndexPath: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = Charities[indexPath.row].name
        
        return Cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
        
        NSLog("Getting in \(Charities[indexPath.row].name)")
        
        var destView = segue.destinationViewController as DetailPageViewController
        
        destView.charity = Charities[indexPath.row]
    }

    
}
