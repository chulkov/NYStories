//
//  Story.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

struct Story: Codable {
    let title: String
    let description: String
    let author: String
    let url: URL
    let images: [Multimedia]?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "abstract"
        case author = "byline"
        case url = "url"
        case images = "multimedia"
    }
}

struct Multimedia: Codable {
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "url"
    }
}
