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
    @Published var isShowRefresh = false
    
    // MARK: - Private Properties
    private var isCanLoadNextPage = true
    private var page = 1
    private let perPage = 10
    
    // MARK: - Public Methods
    func getRepo(for user: String) {
        guard isCanLoadNextPage else { return }
        
        NetworkManager.shared.fetchRepo(from: RepositoryURL.repo.rawValue, for: user, perPage: perPage, page: page) { [unowned self] result in
            switch result {
            case .success(let repositories):
                let repos = repositories.map { RepositoryViewModel(repository: $0) }
                
                if isShowRefresh {
                    self.repositories.removeAll()
                    isShowRefresh = false
                }
                
                self.repositories += repos
                page += 1
                isCanLoadNextPage = repos.count == perPage
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isCanLoadNextPage = false
                }
                
                print(error.rawValue)
            }
        }
    }
    
    func refreshRepo(for user: String) {
        page = 1
        isCanLoadNextPage = true
        getRepo(for: user)
    }
    
    func onScrolledAtBottom(_ repository: RepositoryViewModel, for user: String) {
        if repositories.last == repository {
            getRepo(for: user)
        }
    }
    
    func isShowLoading() -> Bool {
        guard isCanLoadNextPage, page != 1 else { return false }
        return true
    }
}

// MARK: - Ext. Repositories for preview
extension RepositoriesListViewModel {
    func getRepoForPreviewProvider() {
        let repositoriesPreview = Repository.getRepositories()
        self.repositories = repositoriesPreview.map { RepositoryViewModel(repository: $0) }
    }
}
