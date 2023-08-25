//
//  SpeciesObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

final class SpeciesObservableObject: ObservableObject {
    @Published var pokemonSpecies: PokemonSpecies? // = Pokemon.mock
    
    private let speciesService: SpeciesService = ProductionSpeciesService()
    
    func loadData(number: Int) async {
        do {
            pokemonSpecies = try await speciesService.species(number: number)
        } catch {
            print("\(ObservableObjectError.species) : \(error)")
        }
    }
}
