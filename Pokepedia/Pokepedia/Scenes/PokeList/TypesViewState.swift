//
//  TypesViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct TypesViewState: DynamicProperty {
    @Binding var backgroundNumber: Int
    let types: [PossibleTypes]
    
    func setBackground(num: Int) -> Void {
        backgroundNumber = num
    }
}
