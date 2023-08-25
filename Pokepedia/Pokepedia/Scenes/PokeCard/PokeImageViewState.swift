//
//  PokeImageViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 23.08.2023.
//

import SwiftUI

struct PokeImageViewState: DynamicProperty {
    @Binding var shiny: Bool
    let backgroundNumber: Int
    let pokemon: Int
    let types: [PossibleTypes]
}
