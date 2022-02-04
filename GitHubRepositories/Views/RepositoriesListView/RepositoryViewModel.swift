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
    var description: String {
        repository.description
    }
    var language: String {
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
    var license: LicenseViewModel? {
        guard let license = repository.license else { return nil }
        return LicenseViewModel(license: license)
    }
    
    // Self Properties
    var repolinkName: String {
        htmlUrl.replacingOccurrences(of: "https://", with: "")
    }
    var repoUrl: URL {
        URL(string: htmlUrl)!
    }
    
    // MARK: - Private Properties
    private let repository: Repository
    
    // MARK: - Initializers
    init(repository: Repository) {
        self.repository = repository
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
}
