//
//  Storyboarded.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 23/01/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instatiate() -> Self {
        return Self()
    }
}
