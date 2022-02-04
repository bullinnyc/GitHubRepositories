//
//  ToolbarExitButtonView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import SwiftUI

struct ToolbarExitButtonView: View {
    // MARK: - Public Properties
    let image: String
    let action: () -> Void
    
    // MARK: - body Property
    var body: some View {
        Button(action: action) {
            Image(image)
                .imageScale(.large)
        }
    }
}

// MARK: - Preview Provider
struct ToolbarExitButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ToolbarExitButtonView(image: "exit", action: {})
        }
    }
}
