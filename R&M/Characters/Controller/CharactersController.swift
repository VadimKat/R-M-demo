//
//  CharactersController.swift
//  R&M
//
//  Created by Vadim Katenin on 11.03.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class CharactersController: UIViewController {
    
    var characters: [CharactersAPI] = []
    var isDownloading: Bool = false
    
    var sorted = false {
        didSet {
            if sorted == false {
                sortBarButton.title = "A-Z"
            } else if sorted == true {
                sortBarButton.title = "Standart"
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortBarButton: UIBarButtonItem! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.setNavigationItem()
        
        CharactersNetworkService.getCharacters { (response) in
            self.characters += response.characters
            //            print("This is our characters \(self.characters)")
            self.isDownloading = false
            self.tableView.reloadData()
            
        }
    }
    
    @IBAction func sortAction(_ sender: UIBarButtonItem) {
        if sorted == false {
            characters.sort(by: {$0.name < $1.name})
            sorted = true
            tableView.reloadData()
        } else {
            characters.sort(by: {$0.id < $1.id})
            sorted = false
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? CharactersAPI, let nextViewController = segue.destination as? CharacterDetailsVC {
            nextViewController.character = cell
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let userDafault = UserDefaults.standard
        let wasIntroWatched = userDafault.bool(forKey: "wasIntroWatched")
        guard !wasIntroWatched else { return }
        
        if let pageVC = storyboard?.instantiateViewController(identifier: "pageVC") as? PageVC {
            present(pageVC, animated: true, completion: nil)
        }
    }
}

extension CharactersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sender = characters[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: sender)
        
    }
}

extension CharactersController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)  as! CharacterTableViewCell
        let character = characters[indexPath.row]
        
        cell.configure(with: character)
        
        
        if indexPath.row + 1 == characters.count && isDownloading == false {
            print("hello")
            isDownloading = true
            CharactersNetworkService.getCharacters { (response) in
                self.characters += response.characters
                
                self.isDownloading = false
                self.tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
}













