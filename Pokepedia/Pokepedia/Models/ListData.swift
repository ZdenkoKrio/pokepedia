//
//  Pokemons.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

struct ListData: Decodable {
    let results: [RowData]
    
}

extension ListData {
    static let mockPokemons: ListData = ListData(results: [
    RowData(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/26")
    ])
    
    static let mockTypes: ListData = ListData(results: [
    RowData(name: "normal", url: "https://pokeapi.co/api/v2/type/1/")
    ])
    
    static let mockMoves: ListData = ListData(results: [
    RowData(name: "punch", url: "https://pokeapi.co/api/v2/move/1/")
    ])
}
