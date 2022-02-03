//
//  RepositoriesViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import Foundation

class RepositoriesViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var repositories: [Repository] = []
    
    // MARK: - Public Methods
    func getRepo(for user: String) {
        NetworkManager.shared.fetchRepo(from: RepositoryURL.repo.rawValue, for: user) { [unowned self] result in
            switch result {
            case .success(let repositories):
                self.repositories = repositories
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
