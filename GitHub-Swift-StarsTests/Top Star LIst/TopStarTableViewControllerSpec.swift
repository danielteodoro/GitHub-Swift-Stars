//
//  TopStarTableViewControllerSpec.swift
//  GitHub-Swift-StarsTests
//
//  Created by Daniel Teodoro on 11/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import Quick
import Nimble

@testable import GitHub_Swift_Stars

class TopStarTableViewControllerSpec: QuickSpec {

    var controller = TopStarTableViewController()
    
    override func spec() {
        describe("the 'Documentation' directory") {
            
            beforeEach {
                _ = self.controller.view
            }
            
            it("has everything you need to get started") {
                self.controller.showError()
                expect(self.controller.perPage).to(equal(25))
            }
        }
    }
}
