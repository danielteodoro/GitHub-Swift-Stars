//
//  TopStarTableViewController.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 09/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

class TopStarTableViewController: UITableViewController {
    
    var repositoriesArray: Array<Repositorie> = []
    
    let perPage: Int = 25

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)

        
        self.fetchRepositories(forRow: 1)
        
        self.registerCustomCells()
    }
    
    @IBAction func refresh(sender:AnyObject) {
        repositoriesArray.removeAll()
        self.tableView.reloadData()
        self.fetchRepositories(forRow: 1)
    }
    
    func registerCustomCells() {
        tableView.register(RepositorieTableViewCell.self, forCellReuseIdentifier: "RepositorieCell")
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
        let cell: RepositorieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RepositorieCell", for: indexPath) as! RepositorieTableViewCell
        let repositorie = repositoriesArray[indexPath.row]
        cell.repositorieName.text = repositorie.name
        cell.stargazers.text = String(repositorie.stargazers)
        cell.ownerLogin.text = repositorie.owner.login
        cell.imgOwner.load.request(with: repositorie.owner.avatar_url)
        
        if indexPath.row == (self.repositoriesArray.count-5) {
            self.fetchRepositories(forRow: (self.repositoriesArray.count/2)+1)
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        // calculates where the user is in the y-axis
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//
//        if offsetY > contentHeight - scrollView.frame.size.height {
//            self.fetchRepositories(forRow: (self.repositoriesArray.count/2)+1)
//        }
//    }

    // MARK: - Navigation
    func fetchRepositories(forRow row: Int) {
        Api().getTopRepositories(row: row, completion: {(result) in
            switch result {
            case .success(let gitResponse):
                self.repositoriesArray += gitResponse.items
                print(self.repositoriesArray)
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
                break
            case .failure( _):
                self.showError()
                break
            }
        })
    }
    
    func showError() {
        let alert = UIAlertController(title: "Erro", message: "Algo deu errado, tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
