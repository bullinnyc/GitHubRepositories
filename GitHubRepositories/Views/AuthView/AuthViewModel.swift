//
//  AuthViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var user: User?
    
    // MARK: - Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Public Methods
    func getUser(from token: String, completion: @escaping (Bool) -> Void) {
        NetworkManager.shared.fetchUser(from: UserURL.user.rawValue, with: token)
            .sink(
                receiveCompletion: { completionError in
                    switch completionError {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion(true)
                    }
                }, receiveValue: { [unowned self] batch in
                    self.user = batch
                    completion(false)
                }
            )
            .store(in: &subscriptions)
    }
}
