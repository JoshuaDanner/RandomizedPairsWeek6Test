//
//  Name.swift
//  RandomizedPairsWeek6Test
//
//  Created by Joshua Danner on 6/22/18.
//  Copyright © 2018 JoshuaDanner. All rights reserved.
//

import Foundation


class Name: Equatable, Codable {
    
    let name: String
    init(name: String) {
        self.name = name
    }
}

func ==(lhs: Name, rhs: Name) -> Bool {
    if lhs.name != rhs.name { return false }
    return true
}
