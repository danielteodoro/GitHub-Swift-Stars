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
    
    weak var repository: Repository?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemPink
        print(repository?.name)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
