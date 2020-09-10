//
//  Record.swift
//  Data graph
//
//  Created by satsuki nakai on 2020/06/18.
//  Copyright © 2020 satsuki nakai. All rights reserved.
//

import Foundation
import RealmSwift

class Record: Object{
    @objc dynamic var resultnumber: Double = 0.00
    @objc dynamic var datenumber: String!
}

class Category: Object{
    @objc dynamic var categorytitle: String!
    let records = List<Record>()
}
