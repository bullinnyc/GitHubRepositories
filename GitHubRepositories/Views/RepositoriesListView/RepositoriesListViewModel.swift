//
//  RepositoriesListViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import Foundation
import Combine

class RepositoriesListViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var repositories: [RepositoryViewModel] = []
    
    // MARK: - Public Properties
    var isCanLoadNextPage = true
    
    // MARK: - Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    private var perPage = 10
    private var page = 1
    
    // MARK: - Public Methods
    func getRepo(for user: String) {
        guard isCanLoadNextPage else { return }
        
        NetworkManager.shared.fetchRepo(from: RepositoryURL.repo.rawValue, for: user, perPage: perPage, page: page)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    func onScrolledAtBottom(_ repository: RepositoryViewModel, for user: String) {
        if repositories.last == repository {
            getRepo(for: user)
        }
    }
    
    // MARK: - Private Methods
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            isCanLoadNextPage = false
        }
    }
    
    private func onReceive(_ batch: [Repository]) {
        let repos = batch.map { RepositoryViewModel(repository: $0) }
        
        repositories += repos
        page += 1
        isCanLoadNextPage = repos.count == perPage
    }
}

// MARK: - Ext. Repositories for preview
extension RepositoriesListViewModel {
    func getRepoForPreviewProvider() {
        let repositoriesPreview = Repository.getRepositories()
        self.repositories = repositoriesPreview.map { RepositoryViewModel(repository: $0) }
    }
}
