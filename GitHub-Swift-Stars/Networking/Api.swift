//
//  Api.swift
//  GitHub-Swift-Stars
//
//  Created by Daniel Teodoro on 10/06/19.
//  Copyright © 2019 DanielTeodoro. All rights reserved.
//

import UIKit

class Api: URLSession {
    
    enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
    
    func getTopRepositories(completion: ((Result<GitResponse>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.github.com"
        urlComponents.path = "/search/repositories"
        urlComponents.query = "q=language:swift&sort=stars&page=1&per_page=25"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    
                    do {
                        let posts = try decoder.decode(GitResponse.self, from: jsonData)
                        completion?(.success(posts))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
}
