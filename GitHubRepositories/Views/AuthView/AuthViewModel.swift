//
//  AuthViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import Foundation

class AuthViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var user: UserViewModel?
    
    // MARK: - Public Methods
    func getUser(from token: String, completion: @escaping (Bool) -> Void) {
        NetworkManager.shared.fetchUser(from: UserURL.user.rawValue, with: token) { [unowned self] result in
            switch result {
            case .success(let user):
                self.user = UserViewModel(user: user)
                completion(false)
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(true)
                }
                print(error.rawValue)
            }
        }
    }
}
