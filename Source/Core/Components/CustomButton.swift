//
//  CustomButton.swift
//  PokedexTutorial
//
//  Created by Hugo Silva on 15/07/23.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    Capsule()
                        .fill(.orange)
                )
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Login", action: {})
    }
}
