//
//  File.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct Sprites: Decodable {
    let defaultSprite: String
    
    enum CodingKeys: String, CodingKey {
        case defaultSprite = "default"
    }
}
