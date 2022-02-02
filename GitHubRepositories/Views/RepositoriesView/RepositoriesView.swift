//
//  RepositoriesView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import SwiftUI

struct RepositoriesView: View {
    // MARK: - Property Wrappers
    @StateObject private var repositoriesViewModel = RepositoriesViewModel()
    
    // MARK: - Public Properties
    let login: String
    
    // MARK: - body Property
    var body: some View {
        NavigationView {
            Text("Hello! \(login)")
        }
        .onAppear {
            repositoriesViewModel.getRepo(for: login)
        }
    }
}

// MARK: - Preview Provider
struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesView(login: "username")
    }
}
