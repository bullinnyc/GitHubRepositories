//
//  StarterView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import SwiftUI

struct StarterView: View {
    // MARK: - Property Wrappers
    @StateObject private var pageManager = PageManager.shared
    @StateObject private var networkMonitor = NetworkMonitor()
    
    @State private var user = ""
    
    // MARK: - body Property
    var body: some View {
        Group {
            switch pageManager.currentPage {
            case .auth: AuthView(user: $user)
            case .repositories: RepositoriesListView(user: user)
            case .errorNetwork: ErrorNetworkView()
            }
        }
        .environmentObject(pageManager)
        .onReceive(networkMonitor.$isErrorNetwork) { isErrorNetwork in
            if isErrorNetwork {
                networkMonitor.currentPage = pageManager.currentPage
                pageManager.currentPage = .errorNetwork
            } else {
                guard let currentPage = networkMonitor.currentPage else { return }
                pageManager.currentPage = currentPage
            }
        }
    }
}

// MARK: - Preview Provider
struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
