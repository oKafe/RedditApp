//
//  RedditTopListRequestsManager.swift
//  RedditTop
//
//  Created by Andy Orphan on 18.02.2021.
//

import Foundation


class RedditTopListRequestsManager {
    private var after: String?
    private var isUpdating = false
    private let limit: Int
    
    init(limit: Int) {
        self.limit = limit
    }
    
    func refresh(completion: @escaping (Model<RedditTop>?, Error?) -> ()) {
        self.after = nil
        ImageLoaderSingleton.shared.clearCache()
        self.getRedditTop(completion: completion)
    }
    
    func loadNext(completion: @escaping (Model<RedditTop>?, Error?) -> ()) {
        self.getRedditTop(completion: completion)
    }
    
    private func getRedditTop(completion: @escaping (Model<RedditTop>?, Error?) -> ()) {
        if !self.isUpdating {
            self.isUpdating = true
            let router = RedditTopRouter.redditTopList(limit: self.limit, after: self.after)
            RedditTopNetworkManager.getRedditTop(router: router) { (redditTop, response, error) in
                completion(redditTop, error)
                self.after = redditTop?.data?.after
                self.isUpdating = false
            }
        }
    }
}
