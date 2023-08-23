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
    let species: Species
    let types: [TypeSlot]
    let stats: [Stat]
}

extension Pokemon {
    static let mock: Pokemon = Pokemon(id: 4,
                                       name: "charmander",
                                       height: 120,
                                       weight: 50,
                                       species: Species(name: "charmander", url: ""),
                                       types: [TypeSlot(type: PokeType(name: "grass", url: "")),
                                               TypeSlot(type: PokeType(name: "fire", url: ""))],
                                       stats: [Stat(value: 10, effort: 0, info: StatInfo(name: "attack", url: "")),
                                               Stat(value: 10, effort: 0, info: StatInfo(name: "attack-special", url: "")),
                                               Stat(value: 10, effort: 0, info: StatInfo(name: "defense", url: "")),
                                               Stat(value: 10, effort: 0, info: StatInfo(name: "defense-specil", url: "")),
                                               Stat(value: 10, effort: 0, info: StatInfo(name: "speed", url: "")),
                                               Stat(value: 10, effort: 0, info: StatInfo(name: "hp", url: ""))])
}
