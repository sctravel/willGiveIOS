//
//  String.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 2/26/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import Foundation

extension String
{
    subscript(integerIndex: Int) -> Character
    {
        let index = advance(startIndex, integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String
    {
        let start = advance(startIndex, integerRange.startIndex)
        let end = advance(startIndex, integerRange.endIndex)
        let range = start..<end
        return self[range]
    }

    func characterIndex(character: Character) -> Int
    {
        if let characterIndex = find(self, character) {
            return distance(self.startIndex, characterIndex)
        } else {
            return -1
        }
    }

    func replaceCharacterInString(orig : Character, replace : Character) -> String {
        return String(map(self.generate()) {
            $0 == orig ? replace : $0
            })
    }
    
}
