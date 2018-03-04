//
//  Item.swift
//  Todoer
//
//  Created by Noah Wilder on 2018-03-04.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date = Date()
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
