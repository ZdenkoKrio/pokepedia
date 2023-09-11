//
//  File.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct TypeDamageRelations: Decodable {
    let doubleDamageFrom: [RowData]
    let doubleDamgeTo: [RowData]
    let halfDamageFrom: [RowData]
    let halfDamageTo: [RowData]
    let noDamageFrom: [RowData]
    let noDamageTo: [RowData]
    
    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamgeTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}
