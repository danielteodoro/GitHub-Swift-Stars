//
//  Repositorie.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

struct GitResponse: Codable {
    let totalCount: Int
    let imcompleteResult: Bool
    let items: [Repositorie]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case imcompleteResult = "incomplete_results"
        case items = "items"
    }
}

struct Repositorie: Codable {
    var name: String
    var stargazers: Int
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case stargazers = "stargazers_count"
        case owner = "owner"
    }
}

struct Owner: Codable {
    var login: String
    var avatar_url: String
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatar_url = "avatar_url"
    }
}

