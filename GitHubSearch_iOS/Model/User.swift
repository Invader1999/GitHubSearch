//
//  User.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 10/10/24.
//

import Foundation

struct User:Codable{
    let login:String
    let avatarUrl:String
    var name:String?
    var location:String?
    var bio:String?
    var publicRepos:Int
    var publicGists:Int
    var htmlUrl:String
    var following:Int
    var followers:Int
    var createdAt:Date
    
}


//{
//  "login": "octocat",
//  "id": 583231,
//  "node_id": "MDQ6VXNlcjU4MzIzMQ==",
//  "avatar_url": "https://avatars.githubusercontent.com/u/583231?v=4",
//  "gravatar_id": "",
//  "url": "https://api.github.com/users/octocat",
//  "html_url": "https://github.com/octocat",
//  "followers_url": "https://api.github.com/users/octocat/followers",
//  "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//  "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//  "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//  "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//  "organizations_url": "https://api.github.com/users/octocat/orgs",
//  "repos_url": "https://api.github.com/users/octocat/repos",
//  "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//  "received_events_url": "https://api.github.com/users/octocat/received_events",
//  "type": "User",
//  "site_admin": false,
//  "name": "The Octocat",
//  "company": "@github",
//  "blog": "https://github.blog",
//  "location": "San Francisco",
//  "email": null,
//  "hireable": null,
//  "bio": null,
//  "twitter_username": null,
//  "public_repos": 8,
//  "public_gists": 8,
//  "followers": 15290,
//  "following": 9,
//  "created_at": "2011-01-25T18:44:36Z",
//  "updated_at": "2024-09-22T11:25:27Z"
//}
