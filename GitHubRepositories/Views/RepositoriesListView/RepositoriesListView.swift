//
//  RepositoriesListView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import SwiftUI

struct RepositoriesListView: View {
    // MARK: - Property Wrappers
    @EnvironmentObject private var pageManager: PageManager
    
    @StateObject private var listViewModel = RepositoriesListViewModel()
    
    // MARK: - Public Properties
    let user: String
    
    // MARK: - body Property
    var body: some View {
        NavigationView {
            List {
                repositoriesList
                
                if listViewModel.isShowLoading() {
                    LoadingIndicatorView()
                        .listRowBackground(Color.black)
                }
            }
            .listStyle(.plain)
            .background(Color.black.ignoresSafeArea())
            .navigationBarColor(backgroundColor: .black, titleColor: .white)
            .navigationTitle("Repositories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarExitButtonView(image: "exit") {
                        withAnimation {
                            pageManager.currentPage = .auth
                            AppStorageManager.shared.deleteUser()
                        }
                    }
                }
            }
        }
        .onAppear {
            listViewModel.getRepo(for: user)
//            listViewModel.getRepoForPreviewProvider() // Using for preview
        }
    }
    
    // MARK: - repositoriesList Private Property
        private var repositoriesList: some View {
            ForEach(listViewModel.repositories) { repository in
                NavigationLink(
                    destination: RepositoryDetailView(itemViewModel: repository)
                ) {
                    RepositoryRowView(itemViewModel: repository)
                        .onAppear {
                            listViewModel.onScrolledAtBottom(repository, for: user)
                        }
                }
            }
            .listRowBackground(Color.black)
            .listRowInsets(
                EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -62)
            )
        }
    }

// MARK: - Preview Provider
struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListView(user: "username")
        // Notes: Line 47 uncomment for use Preview Provider
    }
}
