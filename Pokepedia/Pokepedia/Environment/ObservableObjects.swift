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

    init(
        menuList: MenuListObservableObject,
        pokemon: PokemonObservableObject,
        species: SpeciesObservableObject,
        evolutionChain: EvolutionChainObservableObject
    ) {
        self.menuList = menuList
        self.pokemon = pokemon
        self.species = species
        self.evolutionChain = evolutionChain
    }
}

// MARK: - ObservableObjects + Extension
extension ObservableObjects {
    convenience init(services: Services) {
        let menuList = MenuListObservableObject(menuListService: services.menuListService)
        let pokemon = PokemonObservableObject(pokemonService: services.pokemonService)
        let species = SpeciesObservableObject(speciesService: services.speciesService)
        let evolutionChain = EvolutionChainObservableObject(evolutionChainService: services.evolveService)

        self.init(
            menuList: menuList,
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
