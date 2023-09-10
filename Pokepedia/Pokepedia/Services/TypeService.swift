//
//  TypeService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

protocol TypeService {
    func pokemonType(name: String) async throws -> PokemonType
}


class ProductionTypeService: TypeService {
    func pokemonType(name: String) async throws -> PokemonType {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/type/\(name)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(PokemonType.self, from: data)
    }
}


class MockTypeService: TypeService {
    func pokemonType(name: String) async throws -> PokemonType {
        return PokemonType.mock
    }
}
