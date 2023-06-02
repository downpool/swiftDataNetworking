//
//  urlSession.swift
//  swiftDataNetworking
//
//  Created by 최동현 on 2023/04/26.
//

import Foundation

struct MovieModel: Codable {
    let items: [Movie]
}

// MARK: - Item
struct Movie: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle, pubDate, director, actor: String
    let userRating: String
}
