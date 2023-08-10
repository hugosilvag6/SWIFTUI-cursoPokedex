//
//  PokemonModel.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 17/07/23.
//

import Foundation

struct Pokemon {
    let name: String
    let id: Int
    let height, weight: Double
    let imageUrl: String
    let types: [PokemonTypesModel]
    let stats: [PokemonStat]
}
struct PokemonStat: Identifiable {
    let id = UUID().uuidString
    let name: String
    let value: Int
}
