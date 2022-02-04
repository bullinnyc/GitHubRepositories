//
//  RepositoryViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 03.02.2022.
//

import Foundation

class RepositoryViewModel: ObservableObject, Identifiable {
    // MARK: - Public Properties
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
    
    // MARK: - Private Properties
    private let repository: Repository
    
    // MARK: - Initializers
    required init(repository: Repository) {
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
