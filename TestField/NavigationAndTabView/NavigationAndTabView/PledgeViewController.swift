//
//  PledgeViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 3/3/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class PledgeViewController : UIViewController {
    
    var recipientId : Int?
    
    @IBOutlet var amount: UILabel!
    
    @IBAction func sliderChanged(sender: AnyObject) {
        var sliderValue = getNearestAmount(lroundf(sender.value))
        amount.text = "\(sliderValue)"
    }
    
    // logic for deiciding amounts
    func getNearestAmount(value : Int) -> Int {
        var ret : Int
        if value < 100 { ret = lroundf(Float(value)/5)*5 }
        if value < 300 { ret = lroundf(Float(value)/10)*10}
        else { ret = lroundf(Float(value)/20)*20 }
        return ret
    }
    
    
    @IBAction func confirmPressed(sender: AnyObject) {
        var userId = getUserId()
        if recipientId != nil && userId != nil {
            var pledgeInfo : [String:AnyObject] = ["userId" : userId!, "recipientId" : recipientId!, "amount" : amount.text!]
            request(.POST, PledgeURL, parameters: pledgeInfo)
                .responseJSON { (request, response, JSON, error) in
                    println("request: \(request)")
                    println("response: \(response)")
                    // TODO furhter drill down of error scenarios, based on response.statusCode
                    if error != nil && response != nil && response!.statusCode != 200 {
                        NSLog(error!.localizedDescription)
                        showAlert("Pledge failed!", "Please try again", self)
                    }
                    else {
                        NSLog("Pledge SUCCESS");
                        showAlert("Pledge Success!", "Thanks for your contribution!", self)
                    }
            }
            
        }
    }
}