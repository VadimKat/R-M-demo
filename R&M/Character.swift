//
//  Character.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

struct Origin: Decodable {
    
    let planetName: String
    
    enum CodingKeys: String, CodingKey {
        case planetName = "name"
    }
    
}//END OF STRUCT

struct Character: Decodable {
    
    let name: String
    let status: String
    let origin: Origin
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case status
        case origin
        case image
    }
    
}//END OF STRUCT

struct TopLevelJSON: Decodable {
    
    let results: [Character]
    
}//END OF STRUCT

