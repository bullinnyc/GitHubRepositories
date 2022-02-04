//
//  License.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import Foundation

struct License: Decodable {
    // MARK: - Public Properties
    let key: String
    let name: String
    let spdxId: String
    let url: String
    let nodeId: String
}

// MARK: - Ext. Get license for preview
extension License {
    static func getLicense() -> License {
        License(
            key: "mit",
            name: "MIT License",
            spdxId: "MIT",
            url: "https://api.github.com/licenses/mit",
            nodeId: "VDsU6TGljSr3zZTEz"
        )
    }
}
