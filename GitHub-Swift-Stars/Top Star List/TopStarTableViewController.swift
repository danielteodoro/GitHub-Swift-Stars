//
//  TopStarTableViewController.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 09/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

class TopStarTableViewController: UITableViewController {
    
    var repositoriesArray: Array<Repository> = []
    
    let perPage: Int = 25
    
    let kCellId = "RepositoryCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)

        
        self.fetchRepositories(forRow: 1)
        
        self.registerCustomCells()
    }
    
    // MARK: Controls
    
    @IBAction func refresh(sender:AnyObject) {
        repositoriesArray.removeAll()
        self.tableView.reloadData()
        self.fetchRepositories(forRow: 1)
    }
    
    func registerCustomCells() {
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: kCellId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repositoriesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: kCellId, for: indexPath) as! RepositoryTableViewCell
        let repository = repositoriesArray[indexPath.row]
        cell.repositoryName.text = repository.name
        cell.stargazers.text = String(repository.stargazers)
        cell.ownerLogin.text = repository.owner.login
        cell.imgOwner.load.request(with: repository.owner.avatar_url)
        
        if indexPath.row == (self.repositoriesArray.count-5) {
            self.fetchRepositories(forRow: (self.repositoriesArray.count/2)+1)
        }
        
        return cell
    }

  

    // MARK: - Fetching
    func fetchRepositories(forRow row: Int) {
        Api().getTopRepositories(row: row, completion: {(result) in
            switch result {
            case .success(let gitResponse):
                self.handleResponse(gitResponse)
                break
            case .failure( _):
                self.showError()
                break
            }
        })
    }
    
    func handleResponse(_ response: GitResponse) {
        self.repositoriesArray += response.items
        print(self.repositoriesArray)
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    
    // MARK: - Error
    func showError() {
        let alert = UIAlertController(title: "Erro", message: "Algo deu errado, tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
