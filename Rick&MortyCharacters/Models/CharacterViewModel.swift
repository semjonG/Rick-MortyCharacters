//
//  API Models.swift
//  Rick&MortyCharacters
//
//  Created by mac on 15.04.2022.
//

import Foundation

struct Character {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var gender: String
    var location: CharacterLocation
    var image: String
    var episode: [String]
}

final class CharacterViewModel {
    
    var next: String = ""
    var prev: String = ""
    
    var characters: [CharacterModel] = []
}
