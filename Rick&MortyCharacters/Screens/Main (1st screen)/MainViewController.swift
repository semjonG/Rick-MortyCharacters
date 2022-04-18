//
//  ViewController.swift
//  Rick&MortyCharacters
//
//  Created by mac on 14.04.2022.
//

import UIKit

final class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private var charactersTableView: UITableView!
    @IBOutlet private var prevButton: UIButton!
    @IBOutlet private var nextButton: UIButton!
    @IBOutlet private var pageNumberLabel: UILabel!
    
    //MARK: - Private
    private var charactersList = [CharacterModel]()
    private var nextPage = String()
    private var prevPage = String()
    private var pageCounter: Int = 1
    private var characterGender: String?
    
    var characterService = CharacterService()
    
    var viewModel: CharacterViewModel?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterService.getCharactersByPage(stringURL: APIConstants.charactersURL) { viewModel in
            self.viewModel = viewModel
            
            self.nextPage = viewModel.next
            self.prevPage  = viewModel.prev
            
            self.charactersTableView.reloadData()
        }
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
    }
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableCell.identifier) as? CharacterTableCell else { return UITableViewCell() }
        
        guard let character = viewModel?.characters[indexPath.row] else { return cell }
        cell.configure(character: character)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showCharacterDetails", sender: self)
        
        charactersTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterDetailsViewController {
            
            let character = viewModel?.characters[(charactersTableView.indexPathForSelectedRow?.row)!]
            
            destination.receivedCharacterDetails = character
        }
    }
    
    // MARK: - Actions
    
    @IBAction func prevButton(_ sender: Any) {
        
        if self.prevPage != "", pageCounter > 1 {
            
            characterService.getCharactersByPage(stringURL: viewModel?.prev ?? "") { viewModel in
                self.viewModel = viewModel
                
                self.nextPage = viewModel.next
                self.prevPage  = viewModel.prev
                
                self.charactersTableView.reloadData()
            }
            
            pageCounter -= 1
            pageNumberLabel.text = "Page \(pageCounter)/34"
            self.nextButton.isHidden = false
        }
        else { prevButton.isHidden = true}
    }

    @IBAction func nextButton(_ sender: Any) {
        
        if self.nextPage != "", pageCounter < 34 {
            
            characterService.getCharactersByPage(stringURL: viewModel?.next ?? "") { viewModel in
                self.viewModel = viewModel
                
                self.nextPage = viewModel.next
                self.prevPage  = viewModel.prev
                
                self.charactersTableView.reloadData()
            }
            
            pageCounter += 1
            pageNumberLabel.text = "Page \(pageCounter)/34"
            self.prevButton.isHidden = false
        }
        else { nextButton.isHidden = true}
    }
}


