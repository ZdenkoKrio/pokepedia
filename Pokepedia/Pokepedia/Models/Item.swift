//
//  Item.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct Item: Decodable {
    let attributes: [RowData]
    let category: RowData
    let effectEntries: [EffectEntry]
    let id: Int
    let cost: Int
    let name: String
    let sprites: Sprites
    
    enum CodingKeys: String, CodingKey {
        case attributes
        case category
        case effectEntries = "effect_entries"
        case id
        case cost
        case name
        case sprites
    }
}
