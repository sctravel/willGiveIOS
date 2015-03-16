//
//  LogEntriesHelper.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 3/16/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation

var leLogger : LELog?
func getLogger() ->  LELog {
    if leLogger == nil {
        leLogger = LELog.sharedInstance()
        leLogger!.token = LEToken
    }
    return leLogger!
}