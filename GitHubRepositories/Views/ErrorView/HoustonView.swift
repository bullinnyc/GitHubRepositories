//
//  HoustonView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 06.02.2022.
//

import SwiftUI

struct HoustonView: View {
    // MARK: - Public Properties
    let text: String
    
    // MARK: - body Property
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size

            ZStack {
                Image("houston")
                    .resizable()
                    .scaledToFit()

                Text(text)
                    .font(.custom("ChalkboardSE-Bold", size: size.width * 0.024))
                    .foregroundColor(.white.opacity(0.9))
                    .offset(y: -size.width * 0.37)
            }
            .position(
                x: geometry.frame(in: .local).midX,
                y: geometry.frame(in: .local).midY
            )
        }
    }
}

// MARK: - Preview Provider
struct HoustonView_Previews: PreviewProvider {
    static var previews: some View {
        HoustonView(text: "404 NOT FOUND")
    }
}
