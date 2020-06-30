//
//  TopStarListScreen.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/10/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

@objc protocol TopStarListScreenDelegate {
    func refreshList()
}

final class TopStarListScreen: UIView {
    
    var tableView: UITableView! = UITableView(frame: .zero)
    
    var delegate: TopStarListScreenDelegate?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    func setRefreshControls() {
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl!.addTarget(delegate, action: #selector(TopStarListScreenDelegate.refreshList), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopStarListScreen: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func setupAdditionalConfigurations() {
        backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
