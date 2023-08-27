//
//  RowPokemonsObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class RowPokemonsObservableObject: ObservableObject {
    @Published var rowPokemons: [RowPokemon]
    
    private let rowPokemonsService: RowPokemonsService
    
    init(rowPokemonsService: RowPokemonsService, rowPokemons: [RowPokemon] = []) {
        self.rowPokemonsService = rowPokemonsService
        self.rowPokemons = rowPokemons
    }
    
    func loadData() async {
        do {
            rowPokemons = try await rowPokemonsService.pokemons().pokemons
        } catch {
            print("\(ObservableObjectError.rowPokemon) : \(error)")
        }
    }
}
