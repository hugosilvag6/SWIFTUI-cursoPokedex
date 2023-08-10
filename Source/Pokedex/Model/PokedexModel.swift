//
//  PokedexModel.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import Foundation

// MARK: - Decodables
struct PokemonList: Decodable {
    let results: [PokemonIndex]?
}
struct PokemonIndex: Decodable, Identifiable {
    let name, url: String?
    
    var id: UUID {
        UUID()
    }
}
struct PokemonDetails: Decodable {
    let name: String?
    let height, weight: Double?
    let id: Int?
    let sprites: PokemonDetailsSprites?
    let types: [PokemonDetailsTypes]?
    let stats: [PokemonDetailsStat]?
}
struct PokemonDetailsSprites: Decodable {
    let front_default: String?
}
struct PokemonDetailsTypes: Decodable {
    let type: PokemonDetailsTypesType?
}
struct PokemonDetailsTypesType: Decodable {
    let name: String?
}
struct PokemonDetailsStat: Decodable {
    let base_stat: Int?
    let stat: PokemonDetailsStatName?
}
struct PokemonDetailsStatName: Decodable {
    let name: String?
}
