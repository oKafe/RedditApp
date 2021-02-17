//
//  RedditTopNetworkManager.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation


final class RedditTopNetworkManager {
    static let baseUrl = URL(string: "https://www.reddit.com/top.json")
    
    class func getRedditTop(completion: @escaping (RedditTop?, URLResponse?, Error?) -> ()) {
        guard let baseUrl = baseUrl else {
            completion(nil, nil, nil)
            return
        }
        let task = URLSession.shared.customCodableTask(baseUrl, completion: completion)
        task.resume()
    }
    
}
