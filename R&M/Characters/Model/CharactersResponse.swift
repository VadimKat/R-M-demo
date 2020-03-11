//
//  CharactersResponse.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

struct CharactersResponse {
    typealias JSON = [String: AnyObject]
    let characters: [CharactersAPI]
    
    init(json: Any) throws {
        
        guard let array = json as? [JSON] else { throw NetworkError.failInternetError }
        
        var characters = [CharactersAPI]()
 
        for dictionary in array {
            guard let character = CharactersAPI(dict: dictionary) else { continue }
            characters.append(character)
        }
        self.characters = characters
    }
}
