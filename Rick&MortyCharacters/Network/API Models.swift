//
//  API Models.swift
//  Rick&MortyCharacters
//
//  Created by mac on 15.04.2022.
//

import Foundation

struct CharacterPageResponse: Codable {
    let info: PageInfo
    let results: [CharacterModel]
}

struct PageInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

public struct CharacterModel: Codable, Identifiable {
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let gender: String
    public let location: CharacterLocation
    public let image: String
    public let episode: [String]
}

public struct CharacterLocation: Codable {
    public let name: String
}

struct Episode: Codable {
   let name: String
}
