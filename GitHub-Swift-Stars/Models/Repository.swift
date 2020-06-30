//
//  Repository.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import Foundation

class Repository: Codable {
    var name: String
    var stargazers: Int
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case stargazers = "stargazers_count"
        case owner = "owner"
    }
}
