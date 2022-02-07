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
    case content = "https://raw.githubusercontent.com/"
}

struct Repository: Decodable {
    // MARK: - Public Properties
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let htmlUrl: String
    let stargazersCount: Int
    let forksCount: Int
    let watchersCount: Int
    let defaultBranch: String
    let license: License?
    let owner: Owner
}

// MARK: - Ext. Get repositories for preview
extension Repository {
    static func getRepository() -> Repository {
        Repository(
            id: 68730555,
            name: "Movie",
            description: "Movies list with detailed view built with the MVVM architecture and SwiftUI framework.",
            language: "Swift",
            htmlUrl: "https://github.com/bullinnyc/Movie",
            stargazersCount: 42,
            forksCount: 8,
            watchersCount: 1024,
            defaultBranch: "main",
            license: License.getLicense(),
            owner: Owner.getOwner()
        )
    }
    
    static func getRepositories() -> [Repository] {
        [
            Repository(
                id: 68730555,
                name: "Movie",
                description: "Movies list with detailed view built with the MVVM architecture and SwiftUI framework.",
                language: "Swift",
                htmlUrl: "https://github.com/bullinnyc/Movie",
                stargazersCount: 42,
                forksCount: 8,
                watchersCount: 1024,
                defaultBranch: "main",
                license: License.getLicense(),
                owner: Owner.getOwner()
            ),
            Repository(
                id: 12245656,
                name: "Project 2",
                description: "Some long description of the project. And again, and again, and again 😋",
                language: "Kotlin",
                htmlUrl: "https://github.com/user/project2",
                stargazersCount: 56,
                forksCount: 3,
                watchersCount: 784,
                defaultBranch: "main",
                license: nil,
                owner: Owner.getOwner()
            ),
            Repository(
                id: 98775454,
                name: "Project 3",
                description: letterImitation(2000),
                language: "Ruby",
                htmlUrl: "https://github.com/user/project3",
                stargazersCount: 0,
                forksCount: 48,
                watchersCount: 369,
                defaultBranch: "main",
                license: nil,
                owner: Owner.getOwner()
            ),
            Repository(
                id: 84354761,
                name: "Project 4",
                description: "Some long description of the project. And again 😜",
                language: "Swift",
                htmlUrl: "https://github.com/user/project4",
                stargazersCount: 42,
                forksCount: 158,
                watchersCount: 4082,
                defaultBranch: "main",
                license: nil,
                owner: Owner.getOwner()
            ),
            Repository(
                id: 29585202,
                name: "Project 5",
                description: letterImitation(200),
                language: "JavaScript",
                htmlUrl: "https://github.com/user/project5",
                stargazersCount: 1,
                forksCount: 0,
                watchersCount: 5,
                defaultBranch: "main",
                license: nil,
                owner: Owner.getOwner()
            ),
            Repository(
                id: 78341708,
                name: "Project 6",
                description: "Some long description of the project. And again, and again, and again 😋",
                language: "Kotlin",
                htmlUrl: "https://github.com/user/project6",
                stargazersCount: 439,
                forksCount: 758,
                watchersCount: 12326,
                defaultBranch: "main",
                license: nil,
                owner: Owner.getOwner()
            )
        ]
    }
}
