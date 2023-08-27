//
//  SpeciesService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

protocol SpeciesService {
    func species(number: Int) async throws -> PokemonSpecies
}


class ProductionSpeciesService: SpeciesService {
    func species(number: Int) async throws -> PokemonSpecies {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(number)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(PokemonSpecies.self, from: data)
    }
}


class MockSpeciesService: SpeciesService {
    func species(number: Int) async throws -> PokemonSpecies {
        return PokemonSpecies.mock
    }
}
