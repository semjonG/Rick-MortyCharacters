//
//  CharacterService.swift
//  Rick&MortyCharacters
//
//  Created by mac on 18.04.2022.
//

import Foundation

final class CharacterService {
    
    func getCharactersByPage(stringURL: String,  completion: @escaping (CharacterViewModel)->()) {
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, response != nil, error == nil else {
                return
            }
            do {
                let characterResponse = try JSONDecoder().decode(CharacterPageResponse.self, from: data)
                
                let viewModel = CharacterViewModel()
                
                viewModel.next = characterResponse.info.next ?? ""
                viewModel.prev = characterResponse.info.prev ?? ""
                
                viewModel.characters = characterResponse.results
                
                DispatchQueue.main.async {
                    completion(viewModel)
                }
            } catch {
                print("Characters page decode Error.")
            }
        }.resume()
    }
}
