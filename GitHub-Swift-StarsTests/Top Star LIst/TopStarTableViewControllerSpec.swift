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

    
    
    override func spec() {
        describe("the 'Documentation' directory") {
            
            var controller = TopStarTableViewController()
            
            beforeEach {
                _ = controller.view
            }
            
            it("has everything you need to get started") { controller.handleResponse(self.getMockedGitResponse()!)
                expect(controller.repositoriesArray[1].name).to(equal( self.getMockedGitResponse()!.items[1].name))
            }
        }
    }
    
    func getMockedGitResponse() -> GitResponse? {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: "GitHubTopListMock", withExtension: "json")
        let data = try! Data(contentsOf: fileUrl!)
        
        let decoder = JSONDecoder()
        do {
            let gitResponse = try decoder.decode(GitResponse.self, from: data)
            return gitResponse
        } catch {
            return nil
        }
    }
}
