//
//  RedditTopModel.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation


struct RedditTop: Codable {
    let kind: String?
    let data: RedditTopData?
}

struct RedditTopData: Codable {
    let children: [Child]?
    let after: String?
    let before: String?
}

struct Child: Codable {
    let kind: String?
    let data: ChildData?
}

struct ChildData: Codable {
    let title: String?
    let authorFullname: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case authorFullname = "author_fullname"
        case title
        case name
    }
}
