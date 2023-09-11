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
    
    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case pokemon
        case moves
    }
}

extension PokemonType {
    static let mock: PokemonType = PokemonType(pokemon: [
        PokemonSlot(pokemon: RowData(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/16/"))
                                               ],
                                               moves: [
        RowData(name: "mega-punch", url: "https://pokeapi.co/api/v2/move/1/")
                                               ])
}
