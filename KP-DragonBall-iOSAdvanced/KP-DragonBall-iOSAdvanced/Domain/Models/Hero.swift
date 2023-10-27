//
//  Hero.swift
//  KP-DragonBall-iOSAdvanced
//
//  Created by Daniel Cazorro Frías on 27/10/23.
//

import Foundation

typealias Heroes = [Hero]

struct Hero: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case photo
        case isFavorite = "favorite"
    }
    
    
    let id: String?
    let name: String?
    let description: String?
    let photo: URL?
    let isFavorite: Bool?
}
