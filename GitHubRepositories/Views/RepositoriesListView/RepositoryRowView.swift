//
//  RepositoryRowView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 03.02.2022.
//

import SwiftUI

struct RepositoryRowView: View {
    // MARK: - Property Wrappers
    @ObservedObject var itemViewModel: RepositoryViewModel
    
    // MARK: - bodyProperty
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(itemViewModel.name)
                    .lineLimit(1)
                    .foregroundColor(Color("sky"))
                
                Spacer()
                
                Text(itemViewModel.language ?? "")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(Color(itemViewModel.getLanguageColor()))
            }
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 16))
            .offset(y: -2)
            
            if let description = itemViewModel.description {
                Text(description)
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 16))
                    .offset(y: 2)
            }
            
            Divider()
                .background(Color.white.opacity(0.6))
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}

// MARK: - Preview Provider
struct RepositoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            RepositoryRowView(
                itemViewModel: RepositoryViewModel(repository: Repository.getRepository())
            )
        }
    }
}
