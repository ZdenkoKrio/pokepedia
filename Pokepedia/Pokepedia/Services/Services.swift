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
    let evolveService: EvolveService
    let speciesService: SpeciesService
    
    init(
        rowPokemonsService: RowPokemonsService,
        pokemonService: PokemonService,
        evolveService: EvolveService,
        speciesService: SpeciesService
    ) {
        self.rowPokemonsService = rowPokemonsService
        self.pokemonService = pokemonService
        self.evolveService = evolveService
        self.speciesService = speciesService
    }
}

extension Services {
    convenience init() {
        let rowPokemonsService = ProductionRowPokemonsService()
        let pokemonService = ProductionPokemonService()
        let speciesService = ProductionSpeciesService()
        let evolveService = ProductionEvolveService(speciesService: speciesService, pokemonService: pokemonService)

        self.init(
            rowPokemonsService: rowPokemonsService,
            pokemonService: pokemonService,
            evolveService: evolveService,
            speciesService: speciesService
        )
    }
}

// MARK: - Mocks
extension Services {
    static let mock = Services(
        rowPokemonsService: MockRowPokemonsService(),
        pokemonService: MockPokemonService(),
        evolveService: MockEvolveService(),
        speciesService: MockSpeciesService()
    )
}
