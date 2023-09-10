//
//  Generation.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

struct Generation: Decodable{
    let mainRegion: RowData
    let moves: [RowData]
    let pokemons: [RowData]
    
    enum CodingKeys: String, CodingKey {
        case mainRegion = "main_region"
        case moves
        case pokemons = "pokemon_species"
    }
}

extension Generation {
    static let mock: Generation = Generation(mainRegion: RowData(name: "kanto", url: "https://pokeapi.co/api/v2/region/1/"),
                                             moves: [
                                                RowData(name: "mega-punch", url: "https://pokeapi.co/api/v2/move/1/")
                                             ],
                                             pokemons: [
                                                 RowData(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/16/")
                                             ])
}
