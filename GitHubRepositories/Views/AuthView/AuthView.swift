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
    @State private var isEditingText = false
    @State private var isWrongToken = false
    
    @Binding var login: String
    @Binding var currentPage: StarterPage
    
    // MARK: - body Property
    var body: some View {
        GeometryReader { geometry in
            let geoSize = geometry.size
            
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
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
                                    top: UIWindow.isPortrait
                                    ? UIDevice.current.iPhoneSE ? 20 : 80
                                    : 40,
                                    leading: 0,
                                    bottom: UIDevice.current.iPhoneSE ? 25 : 60,
                                    trailing: 0
                                )
                            )
                        
                        VStack(alignment: .leading) {
                            TextField(
                                "",
                                text: $token,
                                onEditingChanged: { isEditing in
                                    isEditingText = isEditing
                                    
                                    if isEditing {
                                        withAnimation { isWrongToken = false }
                                    }
                                }
                            )
                                .frame(width: 310)
                                .keyboardType(.alphabet)
                                .disableAutocorrection(true)
                                .textFieldStyle(
                                    BlackTextFieldStyle(
                                        text: token,
                                        placeholder: "Personal access token",
                                        isEditingText: isEditingText,
                                        isWrongToken: isWrongToken
                                    )
                                )
                            
                            Text("Invalid token")
                                .font(.footnote)
                                .foregroundColor(.red)
                                .offset(x: 16)
                                .hidden(!isWrongToken)
                        }
                        .padding(.bottom, 20)
                        
                        Spacer()
                        
                        AuthButtonView(
                            text: "Sign In",
                            isLoading: isLoading,
                            width: 310,
                            height: 48
                        ) {
                            guard !token.isEmpty else {
                                return withAnimation { isWrongToken = true }
                            }
                            
                            isLoading = true
                            
                            authViewModel.getUser(from: token) { isError in
                                isWrongToken = isError
                                isLoading = false
                                
                                guard !isError else { return }
                                
                                UIApplication.shared.endEditing()
                                login = authViewModel.user?.login ?? ""
                                withAnimation { currentPage = .repositories }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: geoSize.width, height: geoSize.height)
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
