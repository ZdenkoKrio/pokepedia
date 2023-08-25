//
//  EvolvesTo.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

struct EvolvesTo: Decodable {
    let evolvesTo: [EvolvesTo]
    let isBaby: Bool
    let species: Species
    
    enum CodingKeys: String, CodingKey {
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}
