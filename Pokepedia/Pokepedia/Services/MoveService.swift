//
//  MoveService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

protocol MoveService {
    func move(number: Int) async throws -> Move
}


class ProductionMoveService: MoveService {
    func move(number: Int) async throws -> Move {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/move/\(number)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(Move.self, from: data)
    }
}


class MockMoveService: MoveService {
    func move(number: Int) async throws -> Move {
        return Move.mock
    }
}
