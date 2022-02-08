//
//  PageManager.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import Foundation

enum CurrentPage {
    case auth
    case repositories
    case errorNetwork
}

class PageManager: ObservableObject {
    // MARK: - Property Wrappers
    @Published var currentPage: CurrentPage = .auth
    
    // MARK: - Public Properties
    static let shared = PageManager()
    
    // MARK: - Private Initializers
    private init() {}
}
