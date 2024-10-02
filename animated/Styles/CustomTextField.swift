//
//  CustomTextField.swift
//  animated
//
//  Created by Mpore on 19/09/2024.
//

import SwiftUI

struct CustomTextField: ViewModifier{
    
    var image: Image
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke()
                .fill(.opacity(0.1)))
            .overlay(
                image
                    .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
        )
    }
}

extension View {
    func customTextField(image: Image = Image("Icon Email")) -> some View {
        modifier(CustomTextField(image: image))
    }
}
