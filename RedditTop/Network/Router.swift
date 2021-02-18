//
//  Router.swift
//  RedditTop
//
//  Created by Andy Orphan on 18.02.2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    ///
}

protocol Router {
    typealias Parameters = [String: Any]
    var urlString: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
}
