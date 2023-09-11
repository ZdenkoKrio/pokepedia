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
    let moves: [MoveSlot]
    let abilities: [AbilitySlot]
    // let baseExperience: Int
}

extension Pokemon {
    static let mock: Pokemon = Pokemon(id: 4,
                                       name: "charmander",
                                       height: 120,
                                       weight: 50,
                                       species: RowData(name: "charmander", url: ""),
                                       types: [TypeSlot(type: RowData(name: "grass", url: "https://pokeapi.co/api/v2/type/1/")),
                                               TypeSlot(type: RowData(name: "fire", url: "https://pokeapi.co/api/v2/type/1/"))],
                                       stats: [Stat(value: 10, effort: 0, info: RowData(name: "attack", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "attack-special", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "defense", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "defense-specil", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "speed", url: "")),
                                               Stat(value: 10, effort: 0, info: RowData(name: "hp", url: ""))],
                                       moves: [MoveSlot(move: RowData(name: "punch", url: "https://pokeapi.co/api/v2/move/5/")),
                                               MoveSlot(move: RowData(name: "punch", url: "https://pokeapi.co/api/v2/move/5/")),
                                               MoveSlot(move: RowData(name: "punch", url: "https://pokeapi.co/api/v2/move/5/"))],
                                       abilities: [AbilitySlot(ability: RowData(name: "static", url: "https://pokeapi.co/api/v2/ability/9/")),
                                                   AbilitySlot(ability: RowData(name: "static", url: "https://pokeapi.co/api/v2/ability/9/")),
                                                   AbilitySlot(ability: RowData(name: "static", url: "https://pokeapi.co/api/v2/ability/9/"))]
    )
}
