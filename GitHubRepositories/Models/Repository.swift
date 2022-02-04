//
//  Repository.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//
//  https://api.github.com/users/USERNAME/repos

import Foundation

enum RepositoryURL: String {
    case repo = "https://api.github.com/users"
}

struct Repository: Decodable {
    // MARK: - Public Properties
    let id: Int
    let name: String
    let description: String
    let language: String
}

// MARK: - Ext. Get repositories for preview
extension Repository {
    static func getRepository() -> Repository {
        Repository(
            id: 454767611,
            name: "Project 1",
            description: "Some long description of the project. And again 😜",
            language: "Swift"
        )
    }
    
    static func getRepositories() -> [Repository] {
        [
            Repository(
                id: 454767611,
                name: "Project 1",
                description: "Some long description of the project. And again 😜",
                language: "Swift"
            ),
            Repository(
                id: 122456566,
                name: "Project 2",
                description: "Some long description of the project. And again, and again, and again 😋",
                language: "Kotlin"
            ),
            Repository(
                id: 987754545,
                name: "Project 3",
                description: "Some long description of the project. And again, and again, and again, and again, and again, and again, and again, and again, and again, and again, and again, and again, and again, and again 🤯",
                language: "Ruby"
            ),
            Repository(
                id: 843547611,
                name: "Project 4",
                description: "Some long description of the project. And again 😜",
                language: "Swift"
            ),
            Repository(
                id: 295852020,
                name: "Project 5",
                description: "Some long description of the project. And again, and again, and again, and again, and again, and again, and again, and again 🤯",
                language: "JavaScript"
            ),
            Repository(
                id: 783417087,
                name: "Project 6",
                description: "Some long description of the project. And again, and again, and again 😋",
                language: "Kotlin"
            ),
        ]
    }
}
