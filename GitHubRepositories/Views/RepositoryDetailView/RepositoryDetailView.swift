//
//  RepositoryDetailView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import SwiftUI

struct RepositoryDetailView: View {
    // MARK: - Property Wrappers
    @EnvironmentObject private var pageManager: PageManager
    
    @ObservedObject var itemViewModel: RepositoryViewModel
    
    // MARK: - body Property
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                let size = geometry.size
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Link(destination: itemViewModel.repoUrl) {
                            Image("link")
                                .scaleEffect(0.7)
                            
                            Text(itemViewModel.repolinkName)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .foregroundColor(Color("sky"))
                        }
                        .padding(.top)
                        .frame(width: size.width)
                        
                        if itemViewModel.license != nil {
                            LicenseView(itemViewModel: itemViewModel)
                                .padding()
                        }
                        
                        InfoView(itemViewModel: itemViewModel)
                            .frame(width: size.width)
                        
                        Text(itemViewModel.name)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(
                                EdgeInsets(top: 6, leading: 8, bottom: 0, trailing: 8)
                            )
                        
                        Text(itemViewModel.description)
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(
                                EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
                            )
                            .offset(y: 2)
                    }
                }
            }
            .navigationTitle(itemViewModel.name)
            .navigationBarTitleDisplayMode(.inline)
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
    }
}

// MARK: - Preview Provider
struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let preview = Repository.getRepository()
        
        NavigationView {
            RepositoryDetailView(itemViewModel: RepositoryViewModel(repository: preview))
        }
        .navigationBarColor(backgroundColor: .black, titleColor: .white)
    }
}
