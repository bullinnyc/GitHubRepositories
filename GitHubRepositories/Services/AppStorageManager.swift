//
//  AppStorageManager.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 08.02.2022.
//

import SwiftUI

class AppStorageManager {
    // MARK: - Property Wrappers
    @AppStorage("user") private var user: String?
    
    // MARK: - Public Properties
    static let shared = AppStorageManager()
    
    // MARK: - Private Initializers
    private init() {}
    
    // MARK: - Public Methods
    func saveUser(_ user: String) {
        self.user = user
    }
    
    func deleteUser() {
        user = nil
    }
    
    func getUser() -> String? {
        guard let user = user else { return nil }
        return user
    }
}
