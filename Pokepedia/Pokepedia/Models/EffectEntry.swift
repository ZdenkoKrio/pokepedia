//
//  EffectEntry.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct EffectEntry: Decodable {
    let effect: String
    let language: RowData
    let shortEffect: String?
    
    enum CodingKeys: String, CodingKey {
        case effect
        case language
        case shortEffect = "short_effect"
    }
}
