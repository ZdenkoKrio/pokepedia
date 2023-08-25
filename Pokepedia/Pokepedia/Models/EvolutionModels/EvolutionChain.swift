//
//  File.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

struct EvolutionChain: Decodable {
    let chain: [EvolvesTo] // generally only one item
}


extension EvolutionChain {
    static let mock: EvolutionChain = EvolutionChain(chain: [
        EvolvesTo(evolvesTo: [
            EvolvesTo(evolvesTo: [
                EvolvesTo(evolvesTo: [
                ], isBaby: false, species: Species(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon-species/3/"))
            ], isBaby: false, species: Species(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon-species/2/"))
        ], isBaby: false, species: Species(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"))
    ])
    
}
