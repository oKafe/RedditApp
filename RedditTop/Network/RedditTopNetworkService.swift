//
//  RedditTopNetworkManager.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation


final class RedditTopNetworkManager {
    class func getRedditTop(router: RedditTopRouter, completion: @escaping (Model<RedditTop>?, URLResponse?, Error?) -> ()) {
        guard let request = router.asURLRequest() else { return }
        let task = URLSession.shared.customCodableTask(request, completion: completion)
        task.resume()
    }
}
