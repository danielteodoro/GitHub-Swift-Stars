//
//  GitResponse.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 26/02/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import Foundation

class GitResponse: Codable {
    let totalCount: Int?
    let imcompleteResult: Bool?
    let items: Array<Repository>
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case imcompleteResult = "incomplete_results"
        case items = "items"
    }
}
