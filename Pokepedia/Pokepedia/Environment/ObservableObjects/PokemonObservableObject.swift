//
//  PokemonObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class PokemonObservableObject: ObservableObject {
    @Published var pokemon: Pokemon? // = Pokemon.mock
    
    private let pokemonService: PokemonService
    
    init(pokemonService: PokemonService, pokemon: Pokemon? = nil) {
        self.pokemonService = pokemonService
        self.pokemon = pokemon
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            pokemon = try await pokemonService.pokemon(number: number)
        } catch {
             print("\(ObservableObjectError.pokemon) : \(error)")
        }
    }
}
