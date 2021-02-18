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
    let author: String?
    let name: String?
    let numberOfComments: Int?
    let url: String?
    let thumbnail: String?
    let isVideo: Bool?
    let createdUTC: Double?
    
    enum CodingKeys: String, CodingKey {
        case authorFullname = "author_fullname"
        case author
        case title
        case name
        case numberOfComments = "num_comments"
        case url
        case isVideo = "is_video"
        case createdUTC = "created_utc"
        case thumbnail
    }
}
