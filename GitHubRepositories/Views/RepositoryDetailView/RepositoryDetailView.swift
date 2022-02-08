//
//  RepositoryDetailView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import SwiftUI
import MarkdownUI

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
                    VStack {
                        Link(destination: itemViewModel.repoUrl) {
                            Image("link")
                                .scaleEffect(0.7)
                            
                            Text(itemViewModel.repoLinkName)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .foregroundColor(Color("sky"))
                        }
                        .padding(.top)
                        .frame(width: size.width)
                        
                        if let license = itemViewModel.license {
                            LicenseView(itemViewModel: license)
                                .padding()
                                .frame(minWidth: 320, maxWidth: 400)
                        }
                        
                        InfoView(itemViewModel: itemViewModel)
                            .frame(width: size.width)
                        
                        // Work with markdown
                        if let readme = itemViewModel.readme {
                            Markdown(
                                readme,
                                baseURL: URL(string: itemViewModel.pathToContent)
                            )
                                .markdownStyle(
                                    MarkdownStyle(
                                        font: .subheadline,
                                        foregroundColor: .white
                                    )
                                )
                                .padding(8)
                        } else {
                            HoustonView(text: "404 NOT FOUND")
                                .frame(
                                    width: UIWindow.isPortrait
                                    ? size.width
                                    : size.width * 0.4,
                                    height: UIWindow.isPortrait
                                    ? size.width
                                    : size.width * 0.4
                                )
                                .offset(
                                    y: UIWindow.isPortrait
                                    ? size.height * 0.12
                                    : 0
                                )
                        }
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
                            AppStorageManager.shared.deleteUser()
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
        
        if #available(iOS 15.0, *) {
            NavigationView {
                RepositoryDetailView(itemViewModel: RepositoryViewModel(repository: preview))
            }
            .navigationBarColor(backgroundColor: .black, titleColor: .white)
//            .previewInterfaceOrientation(.landscapeLeft)
        } else {
            NavigationView {
                RepositoryDetailView(itemViewModel: RepositoryViewModel(repository: preview))
            }
            .navigationBarColor(backgroundColor: .black, titleColor: .white)
        }
    }
}
