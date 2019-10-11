//
//  TopStarListViewController+TableView.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 07/10/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

extension TopStarListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerCustomCells() {
        screen.tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: kCellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRepositoriesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! RepositoryTableViewCell
        
        return viewModel.getCell(cell, forIndex: indexPath)
    }
}
