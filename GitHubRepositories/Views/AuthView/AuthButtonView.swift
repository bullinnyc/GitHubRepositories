//
//  AuthButtonView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct AuthButtonView: View {
    // MARK: - Public Properties
    let text: String
    let isLoading: Bool
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    // MARK: - body Property
    var body: some View {
        ZStack {
            Button(action: action) {
                Text(isLoading ? "" : text)
                    .fontWeight(.semibold)
                    .font(.callout)
                    .foregroundColor(.white)
                    .frame(width: width, height: height)
            }
            .buttonStyle(ForestButtonStyle(isLoading: isLoading))
        }
        .frame(height: height)
    }
}

// MARK: - Preview Provider
struct AuthButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            AuthButtonView(text: "Sign In", isLoading: true, width: 300, height: 48) {}
        }
    }
}
