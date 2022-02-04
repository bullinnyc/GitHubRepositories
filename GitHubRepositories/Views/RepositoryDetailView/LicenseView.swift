//
//  LicenseView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import SwiftUI

struct LicenseView: View {
    // MARK: - Public Properties
    let itemViewModel: RepositoryViewModel
    
    // MARK: - body Property
    var body: some View {
        HStack {
            Image("license")
            
            Text("License")
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            
            Text(itemViewModel.license?.name ?? "")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.trailing)
        }
    }
}

// MARK: - Preview Provider
struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        let preview = Repository.getRepository()
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            LicenseView(itemViewModel: RepositoryViewModel(repository: preview))
        }
    }
}
