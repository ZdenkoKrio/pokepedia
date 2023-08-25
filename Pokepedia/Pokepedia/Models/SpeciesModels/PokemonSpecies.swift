//
//  PokemonSpecies.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

struct PokemonSpecies: Decodable {
    let evolutionChain: UrlChain
    let happiness: Int
    let captureRate: Int
    // let texts: String some strings about evolution
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
        case happiness = "base_happiness"
        case captureRate = "capture_rate"
    }
}


extension PokemonSpecies {
    static let mock: PokemonSpecies = PokemonSpecies(evolutionChain: UrlChain(url: "https://pokeapi.co/api/v2/evolution-chain/1/"),
                                                     happiness: 50,
                                                     captureRate: 30)
}
    
