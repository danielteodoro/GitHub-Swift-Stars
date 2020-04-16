//
//  RepositoryDetailScreen.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 29/02/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import UIKit

final class RepositoryDetailScreen: UIView {
    
    var ownerAvatarImageView: UIImageView = UIImageView()
    var ownerNameLabel: UILabel = UILabel()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(repository: Repository) {
        
        ownerAvatarImageView.load.request(with: repository.owner.avatar_url)
        ownerNameLabel.text = repository.owner.login
    }
}

extension RepositoryDetailScreen: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(ownerAvatarImageView)
        addSubview(ownerNameLabel)
    }
    
    func setupConstraints() {
        ownerAvatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        ownerAvatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        ownerAvatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ownerAvatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        

        ownerNameLabel.leadingAnchor.constraint(equalTo: ownerAvatarImageView.trailingAnchor, constant: 8).isActive = true
        ownerNameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        ownerNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        ownerNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupAdditionalConfigurations() {
        ownerAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        ownerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        ownerNameLabel.textColor = .white
    }
    
}
