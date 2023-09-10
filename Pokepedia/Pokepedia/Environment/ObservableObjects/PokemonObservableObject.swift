//
//  PokemonObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class PokemonObservableObject: ObservableObject {
    @Published var pokemons: [Int : Pokemon]
    
    private let pokemonService: PokemonService
    
    init(pokemonService: PokemonService, pokemons: [Int : Pokemon] = [:]) {
        self.pokemonService = pokemonService
        self.pokemons = pokemons
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            pokemons[number] = try await pokemonService.pokemon(number: number)
        } catch {
             print("\(ObservableObjectError.pokemon) : \(error)")
        }
    }
}
