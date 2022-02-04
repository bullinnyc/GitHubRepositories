//
//  StarterView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct StarterView: View {
    // MARK: - Property Wrappers
    @StateObject private var pageManager = PageManager.shared
    
    @State private var login = ""
    
    // MARK: - body Property
    var body: some View {
        Group {
            switch pageManager.currentPage {
            case .auth: AuthView(login: $login)
            case .repositories: RepositoriesListView(login: login)
            }
        }
        .environmentObject(pageManager)
    }
}

// MARK: - Preview Provider
struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
