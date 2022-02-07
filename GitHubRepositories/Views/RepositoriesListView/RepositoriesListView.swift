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
    let login: String
    
    // MARK: - body Property
    var body: some View {
        NavigationView {
            List {
                repositoriesList
                
                if listViewModel.canLoadNextPage {
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
                        }
                    }
                }
            }
        }
        .onAppear {
            listViewModel.getRepo(for: login)
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
                            listViewModel.onScrolledAtBottom(repository, for: login)
                        }
                }
            }
            .listRowBackground(Color.black)
            .listRowInsets(
                EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: -20)
            )
        }
    }

// MARK: - Preview Provider
struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesListView(login: "username")
        // Notes: Line 46 uncomment for use Preview Provider
    }
}