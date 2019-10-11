//
//  TopStarListViewController.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 07/10/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

class TopStarListViewController: UIViewController {
    
    let screen = TopStarListScreen()
    
    //    var repositoriesArray: Array<Repository> = []
//    var tableView: UITableView! = UITableView()
    
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
        screen.tableView.refreshControl = UIRefreshControl()
        screen.tableView.refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        viewModel.delegate = self
        
        self.registerCustomCells()
    }
    
    // MARK: Controls
    @IBAction func refresh(sender:AnyObject) {
        viewModel.refreshArray()
        screen.tableView.reloadData()
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
