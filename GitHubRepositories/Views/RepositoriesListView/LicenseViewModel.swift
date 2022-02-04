//
//  LicenseViewModel.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import Foundation

class LicenseViewModel {
    // MARK: - Public Properties
    var key: String {
        license.key
    }
    var name: String {
        license.name
    }
    var spdxId: String {
        license.spdxId
    }
    var url: String {
        license.url
    }
    var nodeId: String {
        license.nodeId
    }
    
    // MARK: - Private Properties
    private let license: License
    
    // MARK: - Initializers
    init(license: License) {
        self.license = license
    }
}
