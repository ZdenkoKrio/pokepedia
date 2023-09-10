//
//  PokemonTypeObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

final class PokemonTypeObservableObject: ObservableObject {
    @Published var pokemonType: PokemonType?
    
    private let pokemonTypeService: TypeService
    
    init(pokemonTypeService: TypeService, pokemonType: PokemonType? = nil) {
        self.pokemonTypeService = pokemonTypeService
        self.pokemonType = pokemonType
    }
    
    @MainActor
    func loadData(name: String) async {
        do {
            self.pokemonType = try await pokemonTypeService.pokemonType(name: name)
        } catch {
            print("\(ObservableObjectError.evolutionChain) : \(error)")
        }
    }
}
