//
//  NetworkService.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

class NetworkService {
    
    private init() {}
    
    static let shared = NetworkService()
    
    func getData(url: URL, completionHandler: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with:data, options: []) as? [String: Any], let charactersResult = json["results"] as? [[String: AnyObject]] {
                    
                    DispatchQueue.main.async(execute: {
                        completionHandler(charactersResult)
                    })
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

