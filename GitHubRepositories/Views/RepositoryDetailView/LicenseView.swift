//
//  LicenseView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import SwiftUI

struct LicenseView: View {
    // MARK: - Public Properties
    let itemViewModel: LicenseViewModel
    
    // MARK: - body Property
    var body: some View {
        HStack {
            Image("license")
            
            Text("License")
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            
            Text(itemViewModel.name)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

// MARK: - Preview Provider
struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        let preview = License.getLicense()
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            LicenseView(itemViewModel: LicenseViewModel(license: preview))
        }
    }
}
