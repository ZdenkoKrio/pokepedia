//
//  ObservableObjects.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

// MARK: - ObservableObjects
final class ObservableObjects {
    let menuList: MenuListObservableObject
    let pokemon: PokemonObservableObject
    let species: SpeciesObservableObject
    let evolutionChain: EvolutionChainObservableObject
    let type: PokemonTypeObservableObject
    let generation: GenerationObservableObject

    init(
        menuList: MenuListObservableObject,
        pokemon: PokemonObservableObject,
        species: SpeciesObservableObject,
        evolutionChain: EvolutionChainObservableObject,
        type: PokemonTypeObservableObject,
        generation: GenerationObservableObject
    ) {
        self.menuList = menuList
        self.pokemon = pokemon
        self.species = species
        self.evolutionChain = evolutionChain
        self.type = type
        self.generation = generation
    }
}

// MARK: - ObservableObjects + Extension
extension ObservableObjects {
    convenience init(services: Services) {
        let menuList = MenuListObservableObject(menuListService: services.menuListService)
        let pokemon = PokemonObservableObject(pokemonService: services.pokemonService)
        let species = SpeciesObservableObject(speciesService: services.speciesService)
        let evolutionChain = EvolutionChainObservableObject(evolutionChainService: services.evolveService)
        let type = PokemonTypeObservableObject(pokemonTypeService: services.typeService)
        let generation = GenerationObservableObject(generationService: services.generationService)

        self.init(
            menuList: menuList,
            pokemon: pokemon,
            species: species,
            evolutionChain: evolutionChain,
            type: type,
            generation: generation
        )
    }
}

// MARK: - Mocks
extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
