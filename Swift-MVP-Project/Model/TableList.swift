//
//  Video.swift
//  BeginnerTableView
//
//  Created by Sean Allen on 5/19/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import Foundation
import UIKit

class TableList {
    var title: String
    var description: String
    var image: UIImage
    var id: String
    var type: String
    
    init(image: UIImage, title: String, description: String,id:String,type:String) {
        self.image = image
        self.title = title
        self.description = description
        self.id = id
        self.type = type
    }
}
