//
//  NavigationBarModifier.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 03.02.2022.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    // MARK: - Public Properties
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    // MARK: - Initializers
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        barAppearance.backgroundColor = backgroundColor
        barAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        barAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        
        let appearance = UINavigationBar.appearance()
        appearance.standardAppearance = barAppearance
        appearance.compactAppearance = barAppearance
        appearance.scrollEdgeAppearance = barAppearance
    }
    
    // MARK: - body Method
    func body(content: Content) -> some View {
        ZStack{
            content
            
            VStack {
                GeometryReader { geometry in
                    Color(backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                }
            }
        }
    }
}

// MARK: - Ext. View
extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        modifier(
            NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor)
        )
    }
}
