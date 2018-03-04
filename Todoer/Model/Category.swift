//
//  Category.swift
//  Todoer
//
//  Created by Noah Wilder on 2018-03-04.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    
    @objc dynamic var colour : String = ""
    
    let items = List<Item>()
}
