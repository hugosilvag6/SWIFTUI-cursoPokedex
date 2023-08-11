//
//  PokemonListItem.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 10/08/23.
//

import SwiftUI

struct PokemonListItem: View {
    var pokemon: PokemonIndex
    
    var body: some View {
        NavigationLink {
            PokemonDetailsView(viewModel: PokemonDetailsViewModel(pokemonIndex: pokemon))
        } label: {
            VStack {
                HStack(spacing: 24) {
                    Image("pokebola")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text(pokemon.name?.capitalized ?? "Quem é este pokemon?")
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .padding(.vertical)
                
                Divider()
            }
        }
    }
}

struct PokemonListItem_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListItem(pokemon: PokemonIndex(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/93/"))
    }
}
