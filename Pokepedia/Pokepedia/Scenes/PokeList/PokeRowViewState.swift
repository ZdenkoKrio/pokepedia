//
//  PokeRowViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeRowViewState: DynamicProperty {
    let url: String
    let name: String
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
}
