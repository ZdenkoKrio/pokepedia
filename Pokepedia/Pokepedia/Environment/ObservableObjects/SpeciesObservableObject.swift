//
//  SpeciesObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

final class SpeciesObservableObject: ObservableObject {
    @Published var pokemonSpecies: PokemonSpecies? // = Pokemon.mock
    
    private let speciesService: SpeciesService
    
    init(speciesService: SpeciesService, pokemonSpecies: PokemonSpecies? = nil) {
        self.speciesService = speciesService
        self.pokemonSpecies = pokemonSpecies
    }
    
    func loadData(number: Int) async {
        do {
            pokemonSpecies = try await speciesService.species(number: number)
        } catch {
            print("Some Error species Service: \(error)")
        }
    }
}
