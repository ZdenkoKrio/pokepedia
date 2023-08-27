//
//  PokemonService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

protocol PokemonService {
    func pokemon(number: Int) async throws -> Pokemon
}


class ProductionPokemonService: PokemonService {
    // TODO wrapper for this number???
    func pokemon(number: Int) async throws -> Pokemon {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}


class MockPokemonService: PokemonService {
    func pokemon(number: Int) async throws -> Pokemon {
        return Pokemon.mock
    }
}
