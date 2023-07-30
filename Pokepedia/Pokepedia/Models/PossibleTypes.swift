//
//  PossibleTypes.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import Foundation

enum PossibleTypes: String, Identifiable {
    var id: Self { self }
    
    case grass = "Grass"
    case fire = "Fire"
    case water = "Water"
}
