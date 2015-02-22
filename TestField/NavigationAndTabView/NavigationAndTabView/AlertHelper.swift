//
//  AlertHelper.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/19/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation
import UIKit

func showAlert(title: String!, message: String!, superView : UIViewController) {
    var alertView:UIAlertView = UIAlertView()
    alertView.title = title
    alertView.message = message
    alertView.delegate = superView
    alertView.addButtonWithTitle("OK")
    alertView.show()
}