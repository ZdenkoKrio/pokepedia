//
//  Pokemons.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

struct Pokemons: Decodable {
    let pokemons: [RowPokemon]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
}

extension Pokemons {
    static let mock: Pokemons = Pokemons(pokemons: [])
}
