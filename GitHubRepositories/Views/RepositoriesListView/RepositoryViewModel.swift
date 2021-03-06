//
//  RepositoryViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 03.02.2022.
//

import Foundation

class RepositoryViewModel: ObservableObject, Identifiable {
    // MARK: - Public Properties
    // Model properties
    var id: Int {
        repository.id
    }
    var name: String {
        repository.name
    }
    var description: String? {
        repository.description
    }
    var language: String? {
        repository.language
    }
    var htmlUrl: String {
        repository.htmlUrl
    }
    var stargazersCount: Int {
        repository.stargazersCount
    }
    var forksCount: Int {
        repository.forksCount
    }
    var watchersCount: Int {
        repository.watchersCount
    }
    var defaultBranch: String {
        repository.defaultBranch
    }
    var license: LicenseViewModel? {
        guard let license = repository.license else { return nil }
        return LicenseViewModel(license: license)
    }
    var owner: OwnerViewModel {
        OwnerViewModel(owner: repository.owner)
    }
    
    // Self Properties
    var readme: String?
    var repoLinkName: String {
        htmlUrl.replacingOccurrences(of: "https://", with: "")
    }
    var repoUrl: URL {
        URL(string: htmlUrl)!
    }
    var pathToContent: String {
        RepositoryURL.content.rawValue + "\(owner.login)/" + "\(name)/" + "\(defaultBranch)/"
    }
    
    // MARK: - Private Properties
    private let repository: Repository
    
    // MARK: - Initializers
    init(repository: Repository) {
        self.repository = repository
        getReadme()
    }
    
    // MARK: - Public Methods
    func getLanguageColor() -> String {
        switch language {
        case "Swift": return "redMoon"
        case "Kotlin": return "orchid"
        case "JavaScript": return "sun"
        case "Objective-C": return "sky"
        default: return "forest"
        }
    }
    
    // MARK: - Private Methods
    private func getReadme() {
        NetworkManager.shared.fetchReadme(from: pathToContent) { [unowned self] result in
            switch result {
            case .success(let markdown):
                if markdown.contains("404") {
                    return print("Houston, we have a problem")
                }
                
                self.readme = markdown
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Ext. Equatable
extension RepositoryViewModel: Equatable {
    static func == (lhs: RepositoryViewModel, rhs: RepositoryViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
