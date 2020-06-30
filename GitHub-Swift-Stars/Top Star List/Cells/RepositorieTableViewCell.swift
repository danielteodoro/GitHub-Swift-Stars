//
//  RepositoryTableViewCell.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit
import ImageLoader

class RepositoryTableViewCell: UITableViewCell {
    
    let imgOwner = UIImageView()
    let repositoryName = UILabel()
    let stargazers = UILabel()
    let ownerLogin = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension RepositoryTableViewCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(imgOwner)
        contentView.addSubview(repositoryName)
        contentView.addSubview(stargazers)
        contentView.addSubview(ownerLogin)
    }
    
    func setupConstraints() {
                
        contentView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        imgOwner.heightAnchor.constraint(equalToConstant: 45).isActive = true
        imgOwner.widthAnchor.constraint(equalToConstant: 45).isActive = true
        imgOwner.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        imgOwner.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        
        ownerLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        ownerLogin.topAnchor.constraint(equalTo: imgOwner.bottomAnchor, constant: 8).isActive = true
        contentView.bottomAnchor.constraint(equalTo: ownerLogin.bottomAnchor, constant: 8).isActive = true
        ownerLogin.heightAnchor.constraint(equalToConstant: 15).isActive = true
        ownerLogin.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        stargazers.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        stargazers.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        stargazers.heightAnchor.constraint(equalToConstant: 15).isActive = true
        stargazers.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        repositoryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        repositoryName.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        repositoryName.heightAnchor.constraint(equalToConstant: 15).isActive = true
        repositoryName.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupAdditionalConfigurations() {
        imgOwner.translatesAutoresizingMaskIntoConstraints = false
        repositoryName.translatesAutoresizingMaskIntoConstraints = false
        stargazers.translatesAutoresizingMaskIntoConstraints = false
        ownerLogin.translatesAutoresizingMaskIntoConstraints = false
        
        repositoryName.textAlignment = NSTextAlignment.left
        stargazers.textAlignment = NSTextAlignment.left
        ownerLogin.textAlignment = NSTextAlignment.right
    }
}
