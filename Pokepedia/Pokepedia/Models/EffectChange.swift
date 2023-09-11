//
//  EffectChange.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct EffectChange: Decodable {
    let effectEntries: [EffectEntry]
    
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
    }
}
