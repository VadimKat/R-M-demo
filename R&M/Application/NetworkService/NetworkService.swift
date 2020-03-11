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
                   let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    DispatchQueue.main.async(execute: {
//                        print(json)
                         print("NetworkService")
                        completionHandler(json)
                        print("json")
                    })
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
    
