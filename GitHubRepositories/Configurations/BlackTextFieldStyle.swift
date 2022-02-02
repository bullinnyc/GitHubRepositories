//
//  BlackTextFieldStyle.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct BlackTextFieldStyle: TextFieldStyle {
    // MARK: - Public Properties
    let isWrongToken: Bool
    
    // MARK: - Initializers
    init(isWrongToken: Bool = false) {
        self.isWrongToken = isWrongToken
    }
    
    // MARK: - body Method
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .frame(height: 40)
        .padding(8)
        .background(Color.black)
        .foregroundColor(.white)
        .autocapitalization(.none)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isWrongToken ? Color(.red) : Color(.white))
        )
    }
}
