//
//  Type.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

struct PokemonType: Decodable{
    let damageRelations: TypeDamageRelations
    let pokemon: [PokemonSlot]
    let moves: [RowData]
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case pokemon
        case moves
        case name
    }
}

extension PokemonType {
    static let mock: PokemonType = PokemonType(damageRelations:
                                                TypeDamageRelations(doubleDamageFrom: [RowData(name: "fire", url: "https://pokeapi.co/api/v2/type/1/")],
                                                                    doubleDamgeTo: [RowData(name: "fire", url: "https://pokeapi.co/api/v2/type/1/")],
                                                                    halfDamageFrom: [RowData(name: "fire", url: "https://pokeapi.co/api/v2/type/1/")],
                                                                    halfDamageTo: [RowData(name: "fire", url: "https://pokeapi.co/api/v2/type/1/")],
                                                                    noDamageFrom: [],
                                                                    noDamageTo: []),
                                               pokemon: [
        PokemonSlot(pokemon: RowData(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/16/"))
                                               ],
                                               moves: [
        RowData(name: "mega-punch", url: "https://pokeapi.co/api/v2/move/1/")
                                               ], name: "normal")
}
