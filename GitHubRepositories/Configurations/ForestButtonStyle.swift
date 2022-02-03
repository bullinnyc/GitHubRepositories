//
//  ForestButtonStyle.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct ForestButtonStyle: ButtonStyle {
    // MARK: - Public Properties
    let isLoading: Bool
    
    // MARK: - makeBody Method
    func makeBody(configuration: Self.Configuration) -> some View {
        Group {
            if isLoading {
                configuration.label
                    .overlay(
                        SpinnerView()
                            .frame(width: 24)
                    )
            } else {
                configuration.label
            }
        }
        .background(Color("forest"))
        .cornerRadius(8)
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
