//
//  Owner.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 26/02/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import Foundation

class Owner: Codable {
    var login: String
    var avatar_url: String
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatar_url = "avatar_url"
    }
}
