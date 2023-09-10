//
//  Type.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

struct PokemonType: Decodable{
    //let damageRelations: DamageRelations
    let pokemon: [PokemonSlot]
    let moves: [RowData]
}

extension PokemonType {
    static let mock: PokemonType = PokemonType(pokemon: [
        PokemonSlot(pokemon: RowData(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/16/"))
                                               ],
                                               moves: [
        RowData(name: "mega-punch", url: "https://pokeapi.co/api/v2/move/1/")
                                               ])
}
