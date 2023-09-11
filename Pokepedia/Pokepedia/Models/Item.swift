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

extension Item {
    static let mock: Item = Item(attributes: [RowData(name: "countable", url: "https://pokeapi.co/api/v2/item-attribute/1/")],
                                 category: RowData(name: "vitamins", url: "https://pokeapi.co/api/v2/item-category/26/"),
                                 effectEntries: [EffectEntry(effect: "nothing", language: RowData(name: "en", url: ""), shortEffect: "something")],
                                 id: 1,
                                 cost: 11,
                                 name: "item",
                                 sprites: Sprites(defaultSprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/hp-up.png"))
}
