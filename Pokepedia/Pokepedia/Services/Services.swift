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
    let moveService: MoveService
    let itemService: ItemService
    let locationService: LocationService
    
    init(
        menuListService: MenuListService,
        pokemonService: PokemonService,
        evolveService: EvolveService,
        speciesService: SpeciesService,
        typeService: TypeService,
        generationService: GenerationService,
        moveService: MoveService,
        itemService: ItemService,
        locationService: LocationService
    ) {
        self.menuListService = menuListService
        self.pokemonService = pokemonService
        self.evolveService = evolveService
        self.speciesService = speciesService
        self.typeService = typeService
        self.generationService = generationService
        self.moveService = moveService
        self.itemService = itemService
        self.locationService = locationService
    }
}

extension Services {
    convenience init() {
        URLSession.shared.configuration.urlCache = URLCache(
            memoryCapacity: 50 * 1024 * 1024,
            diskCapacity: 50 * 1024 * 1024
        )
        
        let menuListService = ProductionMenuListService()
        let pokemonService = ProductionPokemonService()
        let speciesService = ProductionSpeciesService()
        let evolveService = ProductionEvolveService(speciesService: speciesService, pokemonService: pokemonService)
        let typeService = ProductionTypeService()
        let generationService = ProductionGenerationService()
        let moveService = ProductionMoveService()
        let itemService = ProductionItemService()
        let locationService = ProductionLocationService()

        self.init(
            menuListService: menuListService,
            pokemonService: pokemonService,
            evolveService: evolveService,
            speciesService: speciesService,
            typeService: typeService,
            generationService: generationService,
            moveService: moveService,
            itemService: itemService,
            locationService: locationService
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
        generationService: MockGenerationService(),
        moveService: MockMoveService(),
        itemService: MockItemService(),
        locationService: MockLocationService()
    )
}
