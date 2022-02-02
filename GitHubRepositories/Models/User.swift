//
//  User.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//
//  https://api.github.com/user

import Foundation

enum UserURL: String {
    case user = "https://api.github.com/user"
}

struct User: Decodable {
    // MARK: - Public Properties
    let login: String
    let name: String
}
