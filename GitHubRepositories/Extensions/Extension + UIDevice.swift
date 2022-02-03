//
//  Extension + UIDevice.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 03.02.2022.
//

import UIKit

extension UIDevice {
    // MARK: - Public Properties
    var iPhoneSE: Bool { UIScreen.main.nativeBounds.height == 1136 }
    var iPad: Bool { userInterfaceIdiom == .pad }
}
