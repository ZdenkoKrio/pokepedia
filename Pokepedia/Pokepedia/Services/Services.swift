//
//  Services.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class Services {
    let rowPokemonsService: RowPokemonsService
    let pokemonService: PokemonService
    
    init(
        rowPokemonsService: RowPokemonsService,
        pokemonService: PokemonService
    ) {
        self.rowPokemonsService = rowPokemonsService
        self.pokemonService = pokemonService
    }
}

extension Services {
    convenience init() {
        let rowPokemonsService = ProductionRowPokemonsService()
        let pokemonService = ProductionPokemonService()

        self.init(
            rowPokemonsService: rowPokemonsService,
            pokemonService: pokemonService
        )
    }
}

// MARK: - Mocks
extension Services {
    static let mock = Services(
        rowPokemonsService: MockRowPokemonsService(),
        pokemonService: MockPokemonService()
    )
}
