//
//  ForestButtonView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct ForestButtonView: View {
    // MARK: - Public Properties
    let text: String
    let width: CGFloat
    let height: CGFloat
    var isLoading: Bool = false
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
        ForestButtonView(
            text: "Sign In",
            width: 300,
            height: 48,
            isLoading: false
        ) {}
        .previewLayout(.sizeThatFits)
        
        ForestButtonView(
            text: "Sign In",
            width: 300,
            height: 48,
            isLoading: true
        ) {}
        .previewLayout(.sizeThatFits)
    }
}
