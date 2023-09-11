//
//  ItemService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

protocol ItemService {
    func item(number: Int) async throws -> Item
}


class ProductionItemService: ItemService {
    func item(number: Int) async throws -> Item {
        let session = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/item/\(number)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(Item.self, from: data)
    }
}


class MockItemService: ItemService {
    func item(number: Int) async throws -> Item {
        return Item.mock
    }
}
