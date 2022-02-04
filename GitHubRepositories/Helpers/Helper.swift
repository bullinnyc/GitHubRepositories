//
//  Helper.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 04.02.2022.
//

import Foundation

func letterImitation(_ length: Int) -> String {
    let simbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789"
    let letters = (0..<length).map { _ in simbols.randomElement() ?? " " }
    return "Letter imitation \(String(letters))"
}
