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

    init(
        rowPokemons: RowPokemonsObservableObject,
        pokemon: PokemonObservableObject
    ) {
        self.rowPokemons = rowPokemons
        self.pokemon = pokemon
    }
}

// MARK: - ObservableObjects + Extension
extension ObservableObjects {
    convenience init(services: Services) {
        let rowPokemons = RowPokemonsObservableObject()
        let pokemon = PokemonObservableObject()

        self.init(
            rowPokemons: rowPokemons,
            pokemon: pokemon
        )
    }
}

// MARK: - Mocks
extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
