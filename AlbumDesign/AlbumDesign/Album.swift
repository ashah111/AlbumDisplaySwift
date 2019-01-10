//
//  Album.swift
//  Album Design
//
//  Created by Ayushi shah on 2019-01-04.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

import Foundation

class Album: Codable{
    var id: Int
    var title:String
    var url: String
}

class mainURL{
    var url = "http://jsonplaceholder.typicode.com/albums/1/photos"
}
