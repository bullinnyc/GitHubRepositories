//
//  NetworkMonitor.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 07.02.2022.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    // MARK: - Property Wrappers
    @Published var isErrorNetwork = false
    
    // MARK: - Public Properties
    var currentPage: CurrentPage?
    
    // MARK: - Private Properties
    private let monitor = NWPathMonitor()
    
    // MARK: - Initializers
    init() {
        startNetworkMonitoring()
    }
    
    // MARK: - Private Methods
    private func startNetworkMonitoring() {
        pathUpdateHandler()
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    private func pathUpdateHandler() {
        monitor.pathUpdateHandler = { [unowned self] path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.isErrorNetwork = false
                }
                
                print("We're connected.")
            } else {
                DispatchQueue.main.async {
                    self.isErrorNetwork = true
                }
                
                print("No connection.")
            }
            
            print(path.isExpensive)
        }
    }
}
