//
//  Ability.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct Ability: Decodable {
    let effectChanges: [EffectChange]
    let effectEntries: [EffectEntry]
    //let flavorTextEntries -> short description
    let name: String
    let pokemon: [PokemonSlot]
    
    enum CodingKeys: String, CodingKey {
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case name
        case pokemon
    }
}
