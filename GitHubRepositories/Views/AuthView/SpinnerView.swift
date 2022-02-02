//
//  SpinnerView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct SpinnerView: View {
    // MARK: - Property Wrappers
    @State private var animate = false
    
    // MARK: - body Property
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(
                Color.white,
                style: StrokeStyle(lineWidth: 3, lineCap: .round)
            )
            .rotationEffect(Angle(degrees: animate ? 360 : 0))
            .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: animate)
            .onAppear {
                animate = true
            }
    }
}

// MARK: - Preview Provider
struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("forest")
                .ignoresSafeArea()
            
            SpinnerView()
        }
    }
}
