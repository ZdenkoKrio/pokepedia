//
//  Move.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct Move: Decodable {
    let accuracy: Int
    let name: String
    let power: Int
    let pp: Int
    let priority: Int
    let learnedByPokemon: [RowData]
    let effectEntries: [EffectEntry]
    let type: RowData
    
    enum CodingKeys: String, CodingKey {
        case accuracy
        case name
        case power
        case pp
        case priority
        case learnedByPokemon = "learned_by_pokemon"
        case effectEntries = "effect_Entries"
        case type
    }
}
