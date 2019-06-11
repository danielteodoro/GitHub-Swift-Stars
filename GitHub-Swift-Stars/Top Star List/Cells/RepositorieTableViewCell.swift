//
//  RepositorieTableViewCell.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

class RepositorieTableViewCell: UITableViewCell {
    
    let imgOwner = UIImageView()
    let repositorieName = UILabel()
    let stargazers = UILabel()
    let ownerLogin = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        imgOwner.backgroundColor = UIColor.blue
        
        imgOwner.translatesAutoresizingMaskIntoConstraints = false
        repositorieName.translatesAutoresizingMaskIntoConstraints = false
        stargazers.translatesAutoresizingMaskIntoConstraints = false
        ownerLogin.translatesAutoresizingMaskIntoConstraints = false
        
        repositorieName.textAlignment = NSTextAlignment.left
        stargazers.textAlignment = NSTextAlignment.left
        ownerLogin.textAlignment = NSTextAlignment.right
        
        contentView.addSubview(imgOwner)
        contentView.addSubview(repositorieName)
        contentView.addSubview(stargazers)
        contentView.addSubview(ownerLogin)
        
        let viewsDict = [
            "image" : imgOwner,
            "repositorie" : repositorieName,
            "stargazers" : stargazers,
            "ownerLogin" : ownerLogin,
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(10)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[ownerLogin]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[repositorie]-[stargazers]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[repositorie]-[image(10)]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[stargazers]-[ownerLogin]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
