//
//  TableViewCell.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterName: UILabel!
    
    func configure(with character: CharactersAPI) {
        self.characterName.text = character.name
    }
    
}
