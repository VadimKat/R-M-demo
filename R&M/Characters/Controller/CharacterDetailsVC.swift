//
//  CharacterDetailsVC.swift
//  R&M
//
//  Created by Vadim Katenin on 12.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class CharacterDetailsVC: UITableViewController {
      
    var character: CharactersAPI?
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = character?.name
        statusLabel.text = "Status: \(character?.status ?? "loading error")"
        speciesLabel.text = "Species: \(character?.species ?? "loading error")"
        genderLabel.text = "Gender: \(character?.gender ?? "loading error")"
        if let path = character?.imagePath {
            imageView.download(path)
        }
        
         nameLabel.addLine(position: .LINE_POSITION_BOTTOM, color: .black, width: 1)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
    }

}
