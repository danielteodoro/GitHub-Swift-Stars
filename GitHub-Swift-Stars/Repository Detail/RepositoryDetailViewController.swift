//
//  RepositoryDetailViewController.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 26/02/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let screen = RepositoryDetailScreen()
    let viewModel: RepositoryDetailViewModel = RepositoryDetailViewModel()
    
    override func loadView() {
         self.view = screen
        screen.setContent(repository: viewModel.repository!)
     }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
