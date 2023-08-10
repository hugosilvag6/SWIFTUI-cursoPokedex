//
//  PokedexView.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import SwiftUI

struct PokedexView: View {
    
    @ObservedObject var viewModel = PokedexViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.pokemons) { pokemon in
                        listItem(pokemon)
                    }
                }
            }
            .padding(.horizontal)
            .onAppear {
                viewModel.getPokemonList()
            }
        }
    }
}

extension PokedexView {
    func listItem(_ pokemon: PokemonIndex) -> some View {
        NavigationLink {
            PokemonDetailsView(viewModel: PokemonDetailsViewModel(pokemonIndex: pokemon))
        } label: {
            VStack {
                HStack {
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

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
