//
//  BlackTextFieldStyle.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct BlackTextFieldStyle: TextFieldStyle {
    // MARK: - Property Wrappers
    @Binding var text: String
    @Binding var isEditingText: Bool
    
    // MARK: - Public Properties
    let placeholder: String
    let isWrongToken: Bool
    
    // MARK: - Initializers
    init(text: Binding<String>, isEditingText: Binding<Bool>, placeholder: String, isWrongToken: Bool = false) {
        _text = text
        _isEditingText = isEditingText
        self.placeholder = placeholder
        self.isWrongToken = isWrongToken
    }
    
    // MARK: - body Method
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
            }
            
            configuration
        }
        .frame(height: 32)
        .padding(8)
        .background(Color.black)
        .foregroundColor(.white)
        .cornerRadius(8)
        .autocapitalization(.none)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    isWrongToken
                    ? .red
                    : isEditingText ? .blue.opacity(0.8) : .gray.opacity(0.4)
                )
        )
    }
}
