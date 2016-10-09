//
//  data.swift
//  DataR
//
//  Created by daniel martinez gonzalez on 6/10/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Language: Object
{
    dynamic var id = 0
    dynamic var name = ""
    dynamic var text = ""
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
}

