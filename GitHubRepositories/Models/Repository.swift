//
//  Repository.swift
//  GitHubRepositories
//
//  Created by Dmitry Kononchuk on 02.02.2022.
//
//  https://api.github.com/users/USERNAME/repos

import Foundation

enum RepositoryURL: String {
    case repo = "https://api.github.com/users"
}

struct Repository: Decodable, Identifiable {
    // MARK: - Public Properties
    var id: Int
    var name: String
}




/*
// MARK: - RepositoryElement
struct Repository: Decodable {
    let id: Int
    let nodeID, name, fullName: String
    let repositoryPrivate: Bool
    let owner: Owner
    let htmlURL: String
    let repositoryDescription: String
    let fork: Bool
    let url, forksURL: String
    let keysURL, collaboratorsURL: String
    let teamsURL, hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL, branchesURL: String
    let tagsURL: String
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String
    let statusesURL: String
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
    let subscriptionURL: String
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String
    let contentsURL, compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String
    let labelsURL, releasesURL: String
    let deploymentsURL: String
    let createdAt, updatedAt, pushedAt: Date
    let gitURL, sshURL: String
    let cloneURL: String
    let svnURL: String
    let homepage: String?
    let size, stargazersCount, watchersCount: Int
    let language: String
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    let hasPages: Bool
    let forksCount: Int
//    let mirrorURL: NSNull
    let archived, disabled: Bool
    let openIssuesCount: Int
    let license: License?
    let allowForking, isTemplate: Bool
//    let topics: [Any?]
    let visibility: String
    let forks, openIssues, watchers: Int
    let defaultBranch: String
}

// MARK: - License
struct License: Decodable  {
    let key, name, spdxID: String
    let url: String
    let nodeID: String
}

// MARK: - Owner
struct Owner: Decodable  {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
}
*/
