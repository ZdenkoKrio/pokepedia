//
//  File.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

struct EvolutionChain: Decodable {
    let chain: EvolvesTo 
}


extension EvolutionChain {
    static let mock: EvolutionChain = EvolutionChain(chain:
        EvolvesTo(evolvesTo: [
            EvolvesTo(evolvesTo: [
                EvolvesTo(evolvesTo: [
                ], isBaby: false, species: RowData(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon-species/3/"))
            ], isBaby: false, species: RowData(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon-species/2/"))
        ], isBaby: false, species: RowData(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"))
    )
    
}
