//
//  RegexHelper.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/19/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation


func matchesForRegexInText(regex: String!, text: String!) -> [String] {
    
    let regex = NSRegularExpression(pattern: regex,
        options: nil, error: nil)!
    let nsString = text as NSString
    let results = regex.matchesInString(nsString as String,
        options: nil, range: NSMakeRange(0, nsString.length))
        as! [NSTextCheckingResult]
    return map(results) { nsString.substringWithRange($0.range)}
}

func matchesRegexInText(regex: String!, text: String!) -> Bool {
    let matches = matchesForRegexInText(regex, text)
    if(matches.count > 0) {
        return true
    }
    return false
}

func deleteRegexMatches(regex: String!, text: String!) -> String? {
    let regex = NSRegularExpression(pattern: regex, options: nil, error: nil)
    let nsString = text as NSString
    let ret = regex?.stringByReplacingMatchesInString(nsString as String, options: nil, range: NSMakeRange(0, nsString.length), withTemplate: "")
    return ret!
}

