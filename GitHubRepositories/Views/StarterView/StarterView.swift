//
//  StarterView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

enum StarterPage {
    case auth
    case repositories
}

struct StarterView: View {
    // MARK: - Property Wrappers
    @State private var currentPage: StarterPage = .auth
    @State private var login = ""
    
    // MARK: - body Property
    var body: some View {
        switch currentPage {
        case .auth: AuthView(login: $login, currentPage: $currentPage)
        case .repositories: RepositoriesListView(login: login)
        }
    }
}

// MARK: - Preview Provider
struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
