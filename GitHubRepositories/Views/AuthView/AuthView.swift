//
//  AuthView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import SwiftUI

struct AuthView: View {
    // MARK: - Property Wrappers
    @StateObject private var authViewModel = AuthViewModel()
    
    @State private var token = ""
    @State private var isLoading = false
    
    @Binding var login: String
    @Binding var currentPage: StarterPage
    
    // MARK: - body Property
    var body: some View {
        GeometryReader { geometry in
            let geoSize = geometry.size
            
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .bottom) {
                        VStack {
                            Image("logo")
                                .resizable().resizable()
                                .frame(
                                    width: UIWindow.isPortrait
                                    ? geoSize.width * 0.35
                                    : geoSize.width * 0.1,
                                    height: UIWindow.isPortrait
                                    ? geoSize.width * 0.35
                                    : geoSize.width * 0.1
                                )
                                .padding(
                                    EdgeInsets(
                                        top: 80, leading: 0, bottom: 60, trailing: 0
                                    )
                                )
                            
                            VStack(alignment: .leading) {
                                TextField("Personal access token", text: $token)
                                    .frame(width: 300)
                                    .textFieldStyle(
                                        BlackTextFieldStyle(isWrongToken: authViewModel.isWrongToken)
                                    )
                                
                                Text("Invalid token")
                                    .font(.footnote)
                                    .foregroundColor(.red)
                                    .hidden(!authViewModel.isWrongToken)
                            }
                            
                            Spacer()
                            
                            AuthButtonView(
                                isLoading: $isLoading,
                                text: "Sign In",
                                width: 300,
                                height: 48
                            ) {
                                guard !token.isEmpty else {
                                    return authViewModel.isWrongToken = true
                                }
                                
                                isLoading = true
                                
                                authViewModel.getUser(from: token) { page in
                                    login = authViewModel.user?.login ?? ""
                                    currentPage = page
                                    isLoading = false
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        .frame(width: geoSize.width, height: geoSize.height)
                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

// MARK: - Preview Provider
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(login: .constant("username"), currentPage: .constant(.auth))
    }
}
