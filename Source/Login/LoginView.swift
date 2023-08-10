//
//  LoginView.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                mainImage
                
                CustomTextfield(placeholder: "Digite seu email", text: $email)
                CustomTextfield(placeholder: "Digite sua senha", text: $password)
                
                CustomButton(text: "Login") {
                    print("email \(email) | senha \(password)")
                }
                
                switchButton
            }
            .padding(.horizontal)
        }
    }
}

extension LoginView {
    var mainImage: some View {
        Image("LoginPokemonImage")
            .resizable()
            .scaledToFit()
    }
    var switchButton: some View {
        HStack {
            Text("Ainda não tem uma conta?")
            
            NavigationLink {
                RegisterView()
            } label: {
                Text("Cadastrar")
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
