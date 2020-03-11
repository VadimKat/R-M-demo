//
//  CharactersAPI.swift
//  R&M
//
//  Created by Vadim Katenin on 10.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

struct CharactersAPI {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    
    init?(dict: [String: AnyObject]) {
        guard let id = dict["id"] as? Int,
        let name = dict["name"] as? String,
        let status = dict["status"] as? String,
        let species = dict["species"] as? String,
        let gender = dict["gender"] as? String
        else { return nil }
        
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
    }
}
