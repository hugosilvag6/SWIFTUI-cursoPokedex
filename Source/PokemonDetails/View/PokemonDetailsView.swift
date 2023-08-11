//
//  PokemonDetailsView.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 16/07/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @ObservedObject var viewModel: PokemonDetailsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 24) {
            if let pokemon = viewModel.pokemon {
                
                viewModel.getHexColor(hex: pokemon.types.first!.color)
                    .cornerRadius(50)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                    .overlay(image(pokemon))
                    .overlay(backButton, alignment: .topLeading)
                

                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        name(pokemon)
                        
                        HStack(spacing: 24) {
                            ForEach(pokemon.types, id: \.self) { tipo in
                                Text(tipo.rawValue)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal)
                                    .background(
                                        Capsule()
                                            .fill(viewModel.getHexColor(hex: tipo.color))
                                    )
                            }
                        }
                        
                        HStack {
                            weight(pokemon)
                            Spacer()
                            height(pokemon)
                        }
                        
                        VStack(spacing: 24) {
                            Text("Detalhes")
                                .font(.title)
                                .fontWeight(.heavy)
                            ForEach(pokemon.stats) { stat in
                                HStack {
                                    Text(stat.name.capitalized)
                                    Spacer()
                                    Text("\(stat.value)")
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 64)
                }
            } else {
                ProgressView()
            }
        }
        .navigationBarHidden(true)
        .onAppear { viewModel.getPokemon() }
    }
}

extension PokemonDetailsView {
    func image(_ pokemon: Pokemon) -> some View {
        AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        } placeholder: {
            ProgressView()
        }
    }
    func name(_ pokemon: Pokemon) -> some View {
        HStack {
            Text(pokemon.name.capitalized)
                .fontWeight(.heavy)
            Text("#\(viewModel.formatNumber(pokemon.id))")
                .fontWeight(.bold)
                .foregroundColor(.gray.opacity(0.5))
        }
        .font(.title)
    }
    func weight(_ pokemon: Pokemon) -> some View {
        VStack {
            Text("Peso")
                .font(.title3)
            Text("\(String(format: "%.1f", pokemon.weight / 10))kg")
                .font(.title)
                .fontWeight(.bold)
        }
    }
    func height(_ pokemon: Pokemon) -> some View {
        VStack {
            Text("Altura")
                .font(.title3)
            Text("\(String(format: "%.1f", pokemon.height / 10))m")
                .font(.title)
                .fontWeight(.bold)
        }
    }
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
        }

    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(viewModel: PokemonDetailsViewModel(pokemonIndex: PokemonIndex(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/93/")))
    }
}
