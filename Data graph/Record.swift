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
    dynamic var y: Float!
    dynamic var x: String!
}

class Category: Object{
    dynamic var categorytitle: String!
    let records = List<Record>()
}
