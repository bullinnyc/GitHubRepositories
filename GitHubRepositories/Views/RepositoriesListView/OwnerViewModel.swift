//
//  OwnerViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 05.02.2022.
//

import Foundation

class OwnerViewModel {
    // MARK: - Public Properties
    var login: String {
        owner.login
    }
    
    // MARK: - Private Properties
    private let owner: Owner
    
    // MARK: - Initializers
    init(owner: Owner) {
        self.owner = owner
    }
}
