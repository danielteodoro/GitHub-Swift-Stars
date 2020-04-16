//
//  TopStarListViewController.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 07/10/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

class TopStarListViewController: UIViewController, TopStarListScreenDelegate {
    
    weak var coordinator: MainCoordinator?
    
    let screen = TopStarListScreen()
    
    let viewModel: TopListViewModel = TopListViewModel()
    
    let kCellId = "RepositoryCell"
    
    override func loadView() {
        self.view = screen
        screen.tableView.dataSource = self
        screen.tableView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        screen.delegate = self
        screen.setRefreshControls()
        
        viewModel.delegate = self
        
        self.registerCustomCells()
    }
    
    // MARK: Controls
    @IBAction func refresh(sender:AnyObject) {
        viewModel.refreshArray()
        screen.tableView.reloadData()
    }
    
    func refreshList() {
        refresh(sender: self)
    }
}

extension TopStarListViewController: TopListViewModelDelegate {
    func showError() {
        let alert = UIAlertController(title: "Erro", message: "Algo deu errado, tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func didRefreshRepositories() {
        screen.tableView.reloadData()
        screen.tableView.refreshControl?.endRefreshing()
    }
}
