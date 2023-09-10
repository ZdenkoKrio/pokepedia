//
//  GenerationService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

protocol GenerationService {
    func generation(number: Int) async throws -> Generation
}


class ProductionGenerationService: GenerationService {
    func generation(number: Int) async throws -> Generation {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/generation/\(number)/")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(Generation.self, from: data)
    }
}


class MockGenerationService: GenerationService {
    func generation(number: Int) async throws -> Generation {
        return Generation.mock
    }
}
