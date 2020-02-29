//
//  TopListViewModel.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 07/10/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

protocol TopListViewModelDelegate {
    func showError()
    func didRefreshRepositories()
}

class TopListViewModel: NSObject {
    
    var repositoriesArray: Array<Repository> = []
    var delegate: TopListViewModelDelegate? = nil
    let perPage: Int = 25
    
    override init() {
        super.init()
        self.fetchRepositories()
    }
    
    func refreshArray() {
        self.repositoriesArray.removeAll()
        self.fetchRepositories()
    }
    
    func getRepository(atIndex index:Int) -> Repository {
        return self.repositoriesArray[index]
    }
    
    func handleResponse(_ response: GitResponse) {
        self.repositoriesArray += response.items
        self.delegate?.didRefreshRepositories()
    }
    
    func getRepositoriesCount() -> Int {
        return self.repositoriesArray.count
    }
    
    func getCell(_ cell: RepositoryTableViewCell, forIndex indexPath: IndexPath) -> RepositoryTableViewCell {
        
        let repository = self.getRepository(atIndex: indexPath.row)
               cell.repositoryName.text = repository.name
               cell.stargazers.text = String(repository.stargazers)
               cell.ownerLogin.text = repository.owner.login
               cell.imgOwner.load.request(with: repository.owner.avatar_url)
               
               if indexPath.row == (self.repositoriesArray.count-5) {
                   self.fetchRepositories()
               }
        
        return cell
    }
    
    // MARK: - Fetching
    func fetchRepositories() {
        Api().getTopRepositories(row: 1+(repositoriesArray.count/25), completion: {(result) in
            switch result {
            case .success(let gitResponse):
                self.handleResponse(gitResponse)
                break
            case .failure( _):
                self.delegate?.showError()
                break
            }
        })
    }
}
