//
//  Owner.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 05.02.2022.
//

import Foundation

struct Owner: Decodable {
    // MARK: - Public Properties
    let login: String
}

// MARK: - Ext. Get owner for preview
extension Owner {
    static func getOwner() -> Owner {
        Owner(login: "bullinnyc")
    }
}
