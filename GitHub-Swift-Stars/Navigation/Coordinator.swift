//
//  Coordinator.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 23/01/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
