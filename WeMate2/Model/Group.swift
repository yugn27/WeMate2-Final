//
//  Group.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//
import Foundation

class Group {
    private var _groupTitle: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    var groupTitle: String {
        return _groupTitle
    }
    
    var key: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }
    
    //test string new
    init(title: String, key: String, members: [String], memberCount: Int) {
        self._groupTitle = title
        self._key = key
        self._members = members
        self._memberCount = memberCount
    }
}
