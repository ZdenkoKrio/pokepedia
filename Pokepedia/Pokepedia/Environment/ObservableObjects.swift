//
//  ObservableObjects.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

// MARK: - ObservableObjects
final class ObservableObjects {
    let rowPokemons: RowPokemonsObservableObject
    let pokemon: PokemonObservableObject
    let species: SpeciesObservableObject
    let evolutionChain: EvolutionChainObservableObject

    init(
        rowPokemons: RowPokemonsObservableObject,
        pokemon: PokemonObservableObject,
        species: SpeciesObservableObject,
        evolutionChain: EvolutionChainObservableObject
    ) {
        self.rowPokemons = rowPokemons
        self.pokemon = pokemon
        self.species = species
        self.evolutionChain = evolutionChain
    }
}

// MARK: - ObservableObjects + Extension
extension ObservableObjects {
    convenience init(services: Services) {
        let rowPokemons = RowPokemonsObservableObject()
        let pokemon = PokemonObservableObject()
        let species = SpeciesObservableObject()
        let evolutionChain = EvolutionChainObservableObject()

        self.init(
            rowPokemons: rowPokemons,
            pokemon: pokemon,
            species: species,
            evolutionChain: evolutionChain
        )
    }
}

// MARK: - Mocks
extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
