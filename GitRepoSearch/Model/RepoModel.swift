//
//  RepoModel.swift
//  GitRepoSearch
//
//  Created by VJ's iMAC on 06/05/20.
//  Copyright © 2020 Deuglo. All rights reserved.
//

import Foundation
import ObjectMapper

struct RepoModel : Mappable {
    var id                  : Int?
    var node_id             : String?
    var name                : String?
    var full_name           : String?
    var iprivate            : Bool?
    var owner               : Owner?
    var html_url            : String?
    var description         : String?
    var fork                : Bool?
    var url                 : String?
    var forks_url           : String?
    var keys_url            : String?
    var collaborators_url   : String?
    var teams_url           : String?
    var hooks_url           : String?
    var issue_events_url    : String?
    var events_url          : String?
    var assignees_url       : String?
    var branches_url        : String?
    var tags_url            : String?
    var blobs_url           : String?
    var git_tags_url        : String?
    var git_refs_url        : String?
    var trees_url           : String?
    var statuses_url        : String?
    var languages_url       : String?
    var stargazers_url      : String?
    var contributors_url    : String?
    var subscribers_url     : String?
    var subscription_url    : String?
    var commits_url         : String?
    var git_commits_url     : String?
    var comments_url        : String?
    var issue_comment_url   : String?
    var contents_url        : String?
    var compare_url         : String?
    var merges_url          : String?
    var archive_url         : String?
    var downloads_url       : String?
    var issues_url          : String?
    var pulls_url           : String?
    var milestones_url      : String?
    var notifications_url   : String?
    var labels_url          : String?
    var releases_url        : String?
    var deployments_url     : String?
    var created_at          : String?
    var updated_at          : String?
    var pushed_at           : String?
    var git_url             : String?
    var ssh_url             : String?
    var clone_url           : String?
    var svn_url             : String?
    var homepage            : String?
    var size                : Int?
    var stargazers_count    : Int?
    var watchers_count      : Int?
    var language            : String?
    var has_issues          : Bool?
    var has_projects        : Bool?
    var has_downloads       : Bool?
    var has_wiki            : Bool?
    var has_pages           : Bool?
    var forks_count         : Int?
    var mirror_url          : String?
    var archived            : Bool?
    var disabled            : Bool?
    var open_issues_count   : Int?
    var license             : String?
    var forks               : Int?
    var open_issues         : Int?
    var watchers            : Int?
    var default_branch      : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

    id                      <- map["id"]
    node_id                 <- map["node_id"]
    name                    <- map["name"]
    full_name               <- map["full_name"]
    iprivate                <- map["private"]
    owner                   <- map["owner"]
    html_url                <- map["html_url"]
    description             <- map["description"]
    fork                    <- map["fork"]
    url                     <- map["url"]
    forks_url               <- map["forks_url"]
    keys_url                <- map["keys_url"]
    collaborators_url       <- map["collaborators_url"]
    teams_url               <- map["teams_url"]
    hooks_url               <- map["hooks_url"]
    issue_events_url        <- map["issue_events_url"]
    events_url              <- map["events_url"]
    assignees_url           <- map["assignees_url"]
    branches_url            <- map["branches_url"]
    tags_url                <- map["tags_url"]
    blobs_url               <- map["blobs_url"]
    git_tags_url            <- map["git_tags_url"]
    git_refs_url            <- map["git_refs_url"]
    trees_url               <- map["trees_url"]
    statuses_url            <- map["statuses_url"]
    languages_url           <- map["languages_url"]
    stargazers_url          <- map["stargazers_url"]
    contributors_url        <- map["contributors_url"]
    subscribers_url         <- map["subscribers_url"]
    subscription_url        <- map["subscription_url"]
    commits_url             <- map["commits_url"]
    git_commits_url         <- map["git_commits_url"]
    comments_url            <- map["comments_url"]
    issue_comment_url       <- map["issue_comment_url"]
    contents_url            <- map["contents_url"]
    compare_url             <- map["compare_url"]
    merges_url              <- map["merges_url"]
    archive_url             <- map["archive_url"]
    downloads_url           <- map["downloads_url"]
    issues_url              <- map["issues_url"]
    pulls_url               <- map["pulls_url"]
    milestones_url          <- map["milestones_url"]
    notifications_url       <- map["notifications_url"]
    labels_url              <- map["labels_url"]
    releases_url            <- map["releases_url"]
    deployments_url         <- map["deployments_url"]
    created_at              <- map["created_at"]
    updated_at              <- map["updated_at"]
    pushed_at               <- map["pushed_at"]
    git_url                 <- map["git_url"]
    ssh_url                 <- map["ssh_url"]
    clone_url               <- map["clone_url"]
    svn_url                 <- map["svn_url"]
    homepage                <- map["homepage"]
    size                    <- map["size"]
    stargazers_count        <- map["stargazers_count"]
    watchers_count          <- map["watchers_count"]
    language                <- map["language"]
    has_issues              <- map["has_issues"]
    has_projects            <- map["has_projects"]
    has_downloads           <- map["has_downloads"]
    has_wiki                <- map["has_wiki"]
    has_pages               <- map["has_pages"]
    forks_count             <- map["forks_count"]
    mirror_url              <- map["mirror_url"]
    archived                <- map["archived"]
    disabled                <- map["disabled"]
    open_issues_count       <- map["open_issues_count"]
    license                 <- map["license"]
    forks                   <- map["forks"]
    open_issues             <- map["open_issues"]
    watchers                <- map["watchers"]
    default_branch          <- map["default_branch"]
    }

}


struct Owner                : Mappable {
    var login               : String?
    var id                  : Int?
    var node_id             : String?
    var avatar_url          : String?
    var gravatar_id         : String?
    var url                 : String?
    var html_url            : String?
    var followers_url       : String?
    var following_url       : String?
    var gists_url           : String?
    var starred_url         : String?
    var subscriptions_url   : String?
    var organizations_url   : String?
    var repos_url           : String?
    var events_url          : String?
    var received_events_url : String?
    var type                : String?
    var site_admin          : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

    login                   <- map["login"]
    id                      <- map["id"]
    node_id                 <- map["node_id"]
    avatar_url              <- map["avatar_url"]
    gravatar_id             <- map["gravatar_id"]
    url                     <- map["url"]
    html_url                <- map["html_url"]
    followers_url           <- map["followers_url"]
    following_url           <- map["following_url"]
    gists_url               <- map["gists_url"]
    starred_url             <- map["starred_url"]
    subscriptions_url       <- map["subscriptions_url"]
    organizations_url       <- map["organizations_url"]
    repos_url               <- map["repos_url"]
    events_url              <- map["events_url"]
    received_events_url     <- map["received_events_url"]
    type                    <- map["type"]
    site_admin              <- map["site_admin"]
    }

}
