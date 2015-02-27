//
//  DetailWebViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/25/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

class DetailWebViewController : UIViewController {
 
    var url : String?
    @IBOutlet weak var webview: UIWebView!
    
    func loadAddressUrl() {
        if(url != nil) {
            NSLog("load url \(url)")
            let requestUrl = NSURL(string: url!)
            let request = NSURLRequest(URL: requestUrl!)
            webview.loadRequest(request)
        }
        else
        {
            NSLog("no valid url is read")
            // show html saying not found
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadAddressUrl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
