//
//  RowPokemonsObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class RowPokemonsObservableObject: ObservableObject {
    @Published var rowPokemons: [RowPokemon] = []
    
    private let rowPokemonsService: RowPokemonsService = ProductionRowPokemonsService()
    
    func loadData() async {
        do {
            rowPokemons = try await rowPokemonsService.pokemons().pokemons
        } catch {
            print("Some Error pokemon row: \(error)")
        }
    }
}
