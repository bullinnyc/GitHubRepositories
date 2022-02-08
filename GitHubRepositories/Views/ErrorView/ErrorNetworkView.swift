//
//  ErrorNetworkView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 07.02.2022.
//

import SwiftUI

struct ErrorNetworkView: View {
    // MARK: - body Property
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                let size = geometry.size
                
                HoustonView(text: "ERROR NETWORK")
                    .frame(
                        width: UIWindow.isPortrait
                        ? size.width
                        : size.width * 0.4,
                        height: UIWindow.isPortrait
                        ? size.width
                        : size.width * 0.4
                    )
                    .position(
                        x: geometry.frame(in: .local).midX,
                        y: geometry.frame(in: .local).midY
                    )
            }
        }
    }
}

// MARK: - Preview Provider
struct ErrorNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ErrorNetworkView()
//                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            ErrorNetworkView()
        }
    }
}
