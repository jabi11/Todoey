//
//  Category.swift
//  Todoey
//
//  Created by Jan Biernacki on 14/05/2019.
//  Copyright © 2019 Jan Biernacki. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    let items = List<Item>()
}
