//
//  PokedexView.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import SwiftUI

struct PokedexView: View {
    
    @StateObject var viewModel = PokedexViewModel.shared
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 280)
                
                VStack(spacing: 24) {
                    search
                    pokemonScroll
                }
                .padding(24)
                .background(Color.white.cornerRadius(15))
                .padding()
            }
            .background(background)
        }
    }
}

extension PokedexView {
    var search: some View {
        HStack {
            TextField("Pesquisar", text: $searchText)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Button {
                searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            Capsule()
                .stroke(.gray)
        )
    }
    var pokemonScroll: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.pokemons) { pokemon in
                if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    PokemonListItem(pokemon: pokemon)
                } else if let name = pokemon.name, name.lowercased().contains(searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()) {
                    PokemonListItem(pokemon: pokemon)
                }
            }
        }
    }
    var background: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            Image("pokedexBackground")
                .resizable()
                .scaledToFill()
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}


