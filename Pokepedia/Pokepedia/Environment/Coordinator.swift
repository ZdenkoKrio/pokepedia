//
//  Coordinator.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI


final class Coordinator: ObservableObject {
    
    var pokeListScene: some View {
        PokeListScene(state: PokeListSceneState())
    }
    
    func pokeCardScene(state: PokeCardSceneState) -> some View {
        PokeCardScene(state: state)
    }
    
    var evolveScene: some View {
        Text("Zatím tady nic není")
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
    }
    
    func statsScene(state: CardStatsViewState) -> some View {
        CardStatsView(state: state)
    }
}
