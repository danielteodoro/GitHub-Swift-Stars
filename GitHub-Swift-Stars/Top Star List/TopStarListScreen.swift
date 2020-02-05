//
//  TopStarListScreen.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/10/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

final class TopStarListScreen: UIView {
    
     var tableView: UITableView! = UITableView(frame: .zero)
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //adicionar subview
        addSubview(tableView)
        
        //adicionar constraints
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        //setup adicional
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
