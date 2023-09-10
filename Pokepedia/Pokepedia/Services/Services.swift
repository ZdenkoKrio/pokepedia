//
//  Services.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class Services {
    let menuListService: MenuListService
    let pokemonService: PokemonService
    let evolveService: EvolveService
    let speciesService: SpeciesService
    let typeService: TypeService
    let generationService: GenerationService
    
    init(
        menuListService: MenuListService,
        pokemonService: PokemonService,
        evolveService: EvolveService,
        speciesService: SpeciesService,
        typeService: TypeService,
        generationService: GenerationService
    ) {
        self.menuListService = menuListService
        self.pokemonService = pokemonService
        self.evolveService = evolveService
        self.speciesService = speciesService
        self.typeService = typeService
        self.generationService = generationService
    }
}

extension Services {
    convenience init() {
        let menuListService = ProductionMenuListService()
        let pokemonService = ProductionPokemonService()
        let speciesService = ProductionSpeciesService()
        let evolveService = ProductionEvolveService(speciesService: speciesService, pokemonService: pokemonService)
        let typeService = ProductionTypeService()
        let generationService = ProductionGenerationService()

        self.init(
            menuListService: menuListService,
            pokemonService: pokemonService,
            evolveService: evolveService,
            speciesService: speciesService,
            typeService: typeService,
            generationService: generationService
        )
    }
}

// MARK: - Mocks
extension Services {
    static let mock = Services(
        menuListService: MockMenuListService(),
        pokemonService: MockPokemonService(),
        evolveService: MockEvolveService(),
        speciesService: MockSpeciesService(),
        typeService: MockTypeService(),
        generationService: MockGenerationService()
    )
}
