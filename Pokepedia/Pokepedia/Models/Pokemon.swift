//
//  Pokemon.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let species: RowData
    let types: [TypeSlot]
    let stats: [Stat]
}

extension Pokemon {
    static let mock: Pokemon = Pokemon(id: 4,
                                       name: "charmander",
                                       height: 120,
                                       weight: 50,
                                       species: RowData(name: "charmander", url: ""),
                                       types: [TypeSlot(type: RowData(name: "grass", url: "")),
                                               TypeSlot(type: RowData(name: "fire", url: ""))],
                                       stats: [Stat(value: 10, effort: 0, info: RowData(name: "attack", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "attack-special", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "defense", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "defense-specil", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "speed", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "hp", url: ""))])
}
