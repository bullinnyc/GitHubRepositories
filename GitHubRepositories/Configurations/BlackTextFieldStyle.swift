//
//  BlackTextFieldStyle.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct BlackTextFieldStyle: TextFieldStyle {
    // MARK: - Public Properties
    let text: String
    let placeholder: String
    let isEditingText: Bool
    let isWrongToken: Bool
    
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
