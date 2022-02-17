//
//  UserViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 17.02.2022.
//

import Foundation

class UserViewModel {
    // MARK: - Public Properties
    var login: String {
        user.login
    }
    var name: String {
        user.name
    }
    
    // MARK: - Private Properties
    private let user: User
    
    // MARK: - Initializers
    init(user: User) {
        self.user = user
    }
}
