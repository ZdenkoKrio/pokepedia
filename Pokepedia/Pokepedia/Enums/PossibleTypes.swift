//
//  PossibleTypes.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import Foundation

enum PossibleTypes: String, Identifiable, Decodable {
    var id: Self { self }
    
    case grass = "grass"
    case fire = "fire"
    case water = "water"
    case normal = "normal"
    case electric = "electric"
    case ice = "ice"
    case fighting = "fighting"
    case poison = "poison"
    case ground = "ground"
    case flying = "flying"
    case bug = "bug"
    case psychic = "psychic"
    case rock = "rock"
    case ghost = "ghost"
    case dragon = "dragon"
    case dark = "dark"
    case steel = "steel"
    case fairy = "fairy"
    case shadow = "shadow"
    case unknown = "unknown"
}
