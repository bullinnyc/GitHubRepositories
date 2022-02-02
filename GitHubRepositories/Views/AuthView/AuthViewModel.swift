//
//  AuthViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import Foundation

class AuthViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var user: User?
    @Published var isWrongToken = false
    
    // MARK: - Public Methods
    func getUser(from token: String, completion: @escaping (StarterPage) -> Void) {
        isWrongToken = false
        
        NetworkManager.shared.fetchUser(from: UserURL.user.rawValue, with: token) { [unowned self] result in
            switch result {
            case .success(let user):
                self.user = user
                completion(.repositories)
            case .failure(let error):
                DispatchQueue.main.async {
                    isWrongToken = true
                    completion(.auth)
                }
                print(error.rawValue)
            }
        }
    }
}
