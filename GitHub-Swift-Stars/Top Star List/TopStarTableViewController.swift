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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Api().getTopRepositories(completion: {(result) in
            switch result {
            case .success(let gitResponse):
//                print(gitResponse)
                self.repositoriesArray += gitResponse.items
                print(self.repositoriesArray)
                self.tableView.reloadData()
                break
            case .failure( _):
                print("Erro")
                break
            }
        })
        self.registerCustomCells()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
