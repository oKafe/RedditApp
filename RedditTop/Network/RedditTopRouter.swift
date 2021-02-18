//
//  File.swift
//  RedditTop
//
//  Created by Andy Orphan on 18.02.2021.
//

import Foundation

enum RedditTopRouter: Router {
    
    case redditTopList(limit: Int, after: String?)
    
    var urlString: String {
        return "\(AppConstants.baseUrlString)/top.json"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        switch self {
        case .redditTopList(let limit, let after):
            var parameters: [String: Any] = ["limit": limit]
            if let after = after { parameters["after"] = after }
            return parameters
        }
    }
    
    
    func asURLRequest() -> URLRequest? {
        guard var components = URLComponents(string: urlString) else { return nil }
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: "\(value)")
        }
        //components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        return request
    }
}
