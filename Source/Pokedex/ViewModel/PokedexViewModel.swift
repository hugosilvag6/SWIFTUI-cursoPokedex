//
//  PokedexViewModel.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 17/07/23.
//

import SwiftUI

class PokedexViewModel: ObservableObject {
    @Published var pokemons = [PokemonIndex]()
    
    static let shared = PokedexViewModel()
    
    private init() {
        getPokemonList()
    }
}

extension PokedexViewModel {
    func getPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data)
                DispatchQueue.main.async {
                    self.pokemons = pokemonList?.results ?? []
                }
            }
        }.resume()
    }
}
