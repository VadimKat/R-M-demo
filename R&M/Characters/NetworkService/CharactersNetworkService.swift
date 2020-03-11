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
    
    static func getCharacters(completion: @escaping(CharactersResponse) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                print("CharacyersNS")
                let response = try CharactersResponse(json: json)
                print("This is response:\(response)")
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
