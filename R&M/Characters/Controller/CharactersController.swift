//
//  CharactersController.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class CharactersController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var characters: [CharactersAPI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        CharactersNetworkService.getCharacters { (response) in
            self.characters = response.characters
            print("This is our characters \(self.characters)")
            self.tableView.reloadData()

        }
        }
    }

extension CharactersController: UITableViewDelegate {}

extension CharactersController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! CharacterTableViewCell
        let character = characters[indexPath.row]
        print("There are \(characters.count) characters")
        print("This characters are: \(characters)")
        print("hello")
        cell.configure(with: character)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
//        return 5
    }
}












