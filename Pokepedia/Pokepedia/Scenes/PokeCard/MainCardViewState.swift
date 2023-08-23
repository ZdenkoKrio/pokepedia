//
//  MainCardViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 23.08.2023.
//

import SwiftUI

struct MainCardViewState: DynamicProperty {
    @State var shiny: Bool = false
    
    let number: Int
    let types: [PossibleTypes]
}
