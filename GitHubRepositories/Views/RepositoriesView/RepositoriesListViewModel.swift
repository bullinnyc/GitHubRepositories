//
//  RepositoriesListViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import Foundation

class RepositoriesListViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var repositories: [RepositoryViewModel] = []
    
    // MARK: - Public Methods
    func getRepo(for user: String) {
        NetworkManager.shared.fetchRepo(from: RepositoryURL.repo.rawValue, for: user) { [unowned self] result in
            switch result {
            case .success(let repositories):
                self.repositories = repositories.map { RepositoryViewModel(repository: $0) }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}

// MARK: - Ext. Repositories for preview
extension RepositoriesListViewModel {
    func getRepoForPreviewProvider() {
        let repositoriesPreview = Repository.getRepositories()
        self.repositories = repositoriesPreview.map { RepositoryViewModel(repository: $0) }
    }
}
