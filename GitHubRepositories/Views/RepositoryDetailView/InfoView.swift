//
//  InfoView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import SwiftUI

struct InfoView: View {
    // MARK: - Public Properties
    let itemViewModel: RepositoryViewModel
    
    // MARK: - body Property
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Image("star")
                    .scaleEffect(0.8)
                
                Text("\(itemViewModel.stargazersCount)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("autumn"))
                
                Text("stars")
            }
            
            Spacer()
            
            HStack {
                Image("fork")
                    .scaleEffect(0.8)
                
                Text("\(itemViewModel.forksCount)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("summer"))
                
                Text("forks")
            }
            
            Spacer()
            
            HStack {
                Image("watcher")
                    .scaleEffect(0.8)
                
                Text("\(itemViewModel.watchersCount)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("winter"))
                
                Text("watchers")
            }
        }
        .font(.footnote)
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .scaleEffect(0.9)
        .frame(width: 340)
    }
}

// MARK: - Preview Provider
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        let preview = Repository.getRepository()
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            InfoView(itemViewModel: RepositoryViewModel(repository: preview))
        }
    }
}
