//
//  AuthView.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 01.02.2022.
//

import SwiftUI

struct AuthView: View {
    // MARK: - Property Wrappers
    @EnvironmentObject private var pageManager: PageManager
    
    @StateObject private var authViewModel = AuthViewModel()
    
    @State private var token = ""
    @State private var isLoading = false
    @State private var isEditingText = false
    @State private var isWrongToken = false
    
    @Binding var user: String
    
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
                            .resizable()
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
                        
                        ForestButtonView(
                            text: "Sign In",
                            width: 310,
                            height: 48,
                            isLoading: isLoading
                        ) {
                            guard !token.isEmpty else {
                                return withAnimation { isWrongToken = true }
                            }
                            
                            isLoading = true
                            
                            authViewModel.getUser(from: token) { isError in
                                isWrongToken = isError
                                isLoading = false
                                
                                guard !isError else { return }
                                
                                user = authViewModel.user?.login ?? ""
                                AppStorageManager.shared.saveUser(user)
                                UIApplication.shared.endEditing()
                                pageManager.currentPage = .repositories
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
        AuthView(user: .constant("username"))
    }
}
