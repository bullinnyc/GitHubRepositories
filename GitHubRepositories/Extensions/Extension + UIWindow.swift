//
//  Extension + UIWindow.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//

import UIKit

extension UIWindow {
    // MARK: - Public Properties
    static var isPortrait: Bool {
        return UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first?
            .windowScene?
            .interfaceOrientation.isPortrait ?? false
    }
}
