//
//  LoadingIndicatorView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 07.02.2022.
//

import SwiftUI

struct LoadingIndicatorView: View {
    // MARK: - body Property
    var body: some View {
        SpinnerView()
            .opacity(0.9)
            .scaleEffect()
            .frame(width: 16)
            .frame(idealWidth: .infinity, maxWidth: .infinity)
    }
}

// MARK: - Preview Provider
struct LoadingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            LoadingIndicatorView()
        }
    }
}
