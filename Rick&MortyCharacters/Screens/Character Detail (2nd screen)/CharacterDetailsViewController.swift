//
//  CharacterDetailsViewController.swift
//  Rick&MortyCharacters
//
//  Created by mac on 18.04.2022.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var characterDetailsNameLabel: UILabel!
    @IBOutlet weak var characterDetailsImage: UIImageView!
    @IBOutlet weak var characterDetailsLocationLabel: UILabel!
    @IBOutlet weak var characterDetailsEpisodeLabel: UILabel!
    @IBOutlet weak var characterDetailsStatusLabel: UILabel!
    @IBOutlet weak var characterDetailsRaceLabel: UILabel!
    @IBOutlet weak var characterDetailsGenderLabel: UILabel!
    
    var receivedCharacterDetails: CharacterModel?
    var characterDetails: CharacterModel?
    
    var residentsUrls = [String]()
    var charactersOfLocation = [CharacterModel]()
    
    var characterEpisodeName: String?
    
    var limitResidentsInList: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        characterDetails = receivedCharacterDetails
        
        characterDetailsNameLabel.text = characterDetails?.name
        characterDetailsLocationLabel.text = characterDetails?.location.name
        characterDetailsStatusLabel.text = characterDetails!.status
        characterDetailsRaceLabel.text = characterDetails?.species
        characterDetailsGenderLabel.text = characterDetails?.gender
        characterDetailsEpisodeLabel.text = "\(characterDetails?.episode.count ?? 0)"
        
        // Display selected character image from previous view
        self.characterDetailsImage.layer.cornerRadius = 15
        self.characterDetailsImage.loadThumbnail(urlSting: characterDetails!.image)
    }
}
