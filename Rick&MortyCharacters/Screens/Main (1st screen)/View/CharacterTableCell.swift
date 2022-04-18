//
//  CharacterTableCell.swift
//  Rick&MortyCharacters
//
//  Created by mac on 18.04.2022.
//

import UIKit

final class CharacterTableCell: UITableViewCell {
    
    static let identifier = "CharacterTableCell"

    @IBOutlet var characterCellView: UIView!
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var characterGenderLabel: UILabel!
    @IBOutlet var characterImage: UIImageView!
    
    //MARK: - Public
    func configure(character: CharacterModel) {
        self.characterNameLabel.text = character.name
        self.speciesLabel.text = character.species
        self.characterGenderLabel.text = character.gender
        self.characterImage.loadThumbnail(urlSting: character.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterCellView.layer.shadowColor = UIColor.black.cgColor
        characterCellView.layer.shadowOpacity = 0.2
        characterCellView.layer.shadowOffset = .zero
        characterCellView.layer.shadowRadius = 5
        characterCellView.layer.cornerRadius = 15
        characterImage.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
