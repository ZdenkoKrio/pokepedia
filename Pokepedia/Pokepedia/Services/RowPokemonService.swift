//
//  PokemonService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation


protocol RowPokemonsService {
    func pokemons() async throws -> Pokemons
}


class ProductionRowPokemonsService: RowPokemonsService {
    @MainActor
    func pokemons() async throws -> Pokemons {
        let sesion = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10000&offset=0")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, response) = try await sesion.data(for: request)
        return try JSONDecoder().decode(Pokemons.self, from: data)
    }
}


class MockRowPokemonsService: RowPokemonsService {
    func pokemons() async throws -> Pokemons {
        return Pokemons.mock
    }
}

