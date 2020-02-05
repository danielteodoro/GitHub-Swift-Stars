//
//  MainCoordinator.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 23/01/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TopStarListViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}
