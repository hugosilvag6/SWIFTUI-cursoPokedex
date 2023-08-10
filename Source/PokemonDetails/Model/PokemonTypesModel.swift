//
//  PokemonTypesModel.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 17/07/23.
//

import Foundation

enum PokemonTypesModel: String, Equatable {
    case normal = "normal"
    case fighting = "fighting"
    case flying = "flying"
    case poison = "poison"
    case ground = "ground"
    case rock = "rock"
    case bug = "bug"
    case ghost = "ghost"
    case steel = "steel"
    case fire = "fire"
    case water = "water"
    case grass = "grass"
    case electric = "electric"
    case psychic = "psychic"
    case ice = "ice"
    case dragon = "dragon"
    case dark = "dark"
    case fairy = "fairy"
    case unknown = "unknown"
    case shadow = "shadow"
    
    var color: String {
        switch self {
        case .normal: return "CA98A7"
        case .fighting:  return "EF6138"
        case .flying: return "93B2C7"
        case .poison: return "9B69D9"
        case .ground: return "6E491F"
        case .rock: return "8B3E21"
        case .bug: return "3B9950"
        case .ghost: return "906790"
        case .steel: return "42BD94"
        case .fire: return "FD4C5A"
        case .water: return "86A8FC"
        case .grass: return "27CB4F"
        case .electric: return "FBFB72"
        case .psychic: return "F81C91"
        case .ice: return "B5E4F7"
        case .dragon: return "61CAD9"
        case .dark: return "5A5979"
        case .fairy: return "EA1369"
        case .unknown: return "A3A7AD"
        case .shadow: return "A3A7AD"
        }
    }
}
