//
//  CharactersNetworkService.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

class CharactersNetworkService {
    private init() {}
    
    static var page: Int = 1
    
    static func getCharacters(completion: @escaping(CharactersResponse) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try CharactersResponse(charactersResult: json)
                page += 1
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
