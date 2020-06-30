//
//  ViewCodeProtocol.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 26/02/20.
//  Copyright © 2020 DanielTeodoro. All rights reserved.
//

import UIKit

protocol  ViewCodeProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfigurations()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfigurations()
    }
}
