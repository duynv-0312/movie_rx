//
//  Video.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 02/05/2024.
//

import Foundation
import ObjectMapper

struct Video: Mappable {
    var key: String?
    var name: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        key <- map["key"]
        name <- map["name"]
    }
}
