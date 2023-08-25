//
//  ObservablObjectError.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 25.08.2023.
//

import Foundation

enum ObservableObjectError: String, Error {
    case rowPokemon = "PokemonRowError"
    case pokemon = "PokemonError"
    case species = "SpeciesError"
    case evolutionChain = "EvolutionChainError"
}
