//
//  NetworkManager.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import Foundation
import Combine

class NetworkManager {
    // MARK: - Public Properties
    static let shared = NetworkManager()
    
    // MARK: - Private Initializers
    private init() {}
    
    // MARK: - Public Methods
    func fetchUser(from url: String, with token: String) -> AnyPublisher<User, Error> {
        guard let url = URL(string: url) else {
            return AnyPublisher(Fail<User, Error>(error: URLError(.badURL)))
        }
        
        var request = URLRequest(url: url)
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: User.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchRepo(from url: String, for user: String, perPage: Int, page: Int) -> AnyPublisher<[Repository], Error> {
        guard let url = URL(string: "\(url)/\(user)/repos?per_page=\(perPage)&page=\(page)") else {
            return AnyPublisher(Fail<[Repository], Error>(error: URLError(.badURL)))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Repository].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchReadme(from url: String) -> AnyPublisher<String, Error> {
        let path = url + "README.md"
        guard let url = URL(string: path) else {
            return AnyPublisher(Fail<String, Error>(error: URLError(.badURL)))
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap() { tuple -> String in
                if let httpResponse = tuple.response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                guard let string = String(data: tuple.data, encoding: .utf8) else {
                    throw URLError(.cannotDecodeContentData)
                }
                
                return string
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
