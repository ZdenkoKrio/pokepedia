//
//  CardInfoViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 23.08.2023.
//

import SwiftUI

struct CardInfoViewState: DynamicProperty {
    let stats: [Stat]
    @State var isPresentingStats: Bool = false
}
