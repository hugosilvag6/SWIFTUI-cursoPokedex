//
//  RegisterView.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var passwordConfirmation = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 24) {
            mainImage
            
            CustomTextfield(placeholder: "Digite seu email", text: $email)
            CustomTextfield(placeholder: "Digite sua senha", text: $password)
            CustomTextfield(placeholder: "Confirme sua senha", text: $passwordConfirmation)
            
            CustomButton(text: "Cadastrar") {
                print("email \(email) | senha \(password) | confirmação \(passwordConfirmation)")
            }
            
            switchButton
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

extension RegisterView {
    var mainImage: some View {
        Image("LoginPokemonImage")
            .resizable()
            .scaledToFit()
    }
    var switchButton: some View {
        HStack {
            Text("Já tem uma conta?")
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Entrar")
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
