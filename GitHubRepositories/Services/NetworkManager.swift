//
//  NetworkManager.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import Foundation

enum NetworkError: String, Error {
    case badURL = "Bad URL or nil"
    case noData = "Unable to get data"
    case noDecodedData = "The data couldn’t be read because it isn’t in the correct format"
}

class NetworkManager {
    // MARK: - Public Properties
    static let shared = NetworkManager()
    
    // MARK: - Private Initializers
    private init() {}
    
    // MARK: - Public Methods
    func fetchUser(from url: String, with token: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            return completion(.failure(.badURL))
        }
        
        var request = URLRequest(url: url)
        request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decode = try decoder.decode(User.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decode))
                }
                print(decode)
            } catch {
                print(error)
                completion(.failure(.noDecodedData))
            }
        }.resume()
    }
    
    func fetchRepo(from url: String, for user: String, completion: @escaping (Result<[Repository], NetworkError>) -> Void) {
        guard let url = URL(string: "\(url)/\(user)/repos") else {
            return completion(.failure(.badURL))
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decode = try decoder.decode([Repository].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decode))
                }
                print(decode)
            } catch {
                print(error)
                completion(.failure(.noDecodedData))
            }
        }.resume()
    }
}
