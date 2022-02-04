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
    let htmlUrl: String
    let stargazersCount: Int
    let forksCount: Int
    let watchersCount: Int
    let license: License?
}

// MARK: - Ext. Get repositories for preview
extension Repository {
    static func getRepository() -> Repository {
        Repository(
            id: 454767611,
            name: "Project 1. In which there are a lot of letters.",
            description: "Some long description of the project. And again 😜",
            language: "Swift",
            htmlUrl: "https://github.com/user/Project1InWhichThereAreALotOfLetters",
            stargazersCount: 842,
            forksCount: 8,
            watchersCount: 1088,
            license: License.getLicense()
        )
    }
    
    static func getRepositories() -> [Repository] {
        [
            Repository(
                id: 454767611,
                name: "Project 1. In which there are a lot of letters.",
                description: "Some long description of the project. And again 😜",
                language: "Swift",
                htmlUrl: "https://github.com/user/Project1InWhichThereAreALotOfLetters",
                stargazersCount: 842,
                forksCount: 8,
                watchersCount: 1088,
                license: License.getLicense()
            ),
            Repository(
                id: 122456566,
                name: "Project 2",
                description: "Some long description of the project. And again, and again, and again 😋",
                language: "Kotlin",
                htmlUrl: "https://github.com/user/project2",
                stargazersCount: 56,
                forksCount: 3,
                watchersCount: 784,
                license: nil
            ),
            Repository(
                id: 987754545,
                name: "Project 3",
                description: letterImitation(2000),
                language: "Ruby",
                htmlUrl: "https://github.com/user/project3",
                stargazersCount: 0,
                forksCount: 48,
                watchersCount: 369,
                license: nil
            ),
            Repository(
                id: 843547611,
                name: "Project 4",
                description: "Some long description of the project. And again 😜",
                language: "Swift",
                htmlUrl: "https://github.com/user/project4",
                stargazersCount: 42,
                forksCount: 158,
                watchersCount: 4082,
                license: nil
            ),
            Repository(
                id: 295852020,
                name: "Project 5",
                description: letterImitation(200),
                language: "JavaScript",
                htmlUrl: "https://github.com/user/project5",
                stargazersCount: 1,
                forksCount: 0,
                watchersCount: 5,
                license: nil
            ),
            Repository(
                id: 783417087,
                name: "Project 6",
                description: "Some long description of the project. And again, and again, and again 😋",
                language: "Kotlin",
                htmlUrl: "https://github.com/user/project6",
                stargazersCount: 439,
                forksCount: 758,
                watchersCount: 12326,
                license: nil
            )
        ]
    }
}
