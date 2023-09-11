//
//  LocationService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

protocol LocationService {
    func location(number: Int) async throws -> Location
}


class ProductionLocationService: LocationService {
    func location(number: Int) async throws -> Location {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/location/\(number)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(Location.self, from: data)
    }
}


class MockLocationService: LocationService {
    func location(number: Int) async throws -> Location {
        return Location.mock
    }
}
