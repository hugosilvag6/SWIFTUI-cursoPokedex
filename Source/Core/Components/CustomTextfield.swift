//
//  CustomTextfield.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import SwiftUI

struct CustomTextfield: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: 50)
            .padding(.horizontal)
            .background(
                Capsule()
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(placeholder: "Digite seu email", text: .constant(""))
    }
}
