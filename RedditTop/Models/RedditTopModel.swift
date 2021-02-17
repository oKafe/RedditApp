//
//  RedditTopModel.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation

struct Model<T: Codable>: Codable {
    let kind: String?
    let data: T?
}

struct RedditTop: Codable {
    let children: [Model<Child>]?
    let after: String?
    let before: String?
}

struct Child: Codable {
    let title: String?
    let authorFullname: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case authorFullname = "author_fullname"
        case title
        case name
    }
}
