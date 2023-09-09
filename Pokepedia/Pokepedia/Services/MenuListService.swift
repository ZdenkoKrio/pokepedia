//
//  PokemonService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation


protocol MenuListService {
    func rows(urlString: String) async throws -> ListData
}


class ProductionMenuListService: MenuListService {
    func rows(urlString: String) async throws -> ListData {
        let session = URLSession.shared
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, response) = try await session.data(for: request)
        return try JSONDecoder().decode(ListData.self, from: data)
    }
}


class MockMenuListService: MenuListService {
    func rows(urlString: String) async throws -> ListData {
        switch urlString {
        case "pokemons":
            return ListData.mockPokemons
        case "moves":
            return ListData.mockMoves
        case "types":
            return ListData.mockTypes
        default:
            return ListData.mockPokemons
        }
    }
}

