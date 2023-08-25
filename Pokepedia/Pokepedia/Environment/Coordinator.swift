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
    
    func evolveScene(state: EvolveSceneState) -> some View {
       EvolveScene(state: state)
    }
    
    func statsScene(state: CardStatsViewState) -> some View {
        CardStatsView(state: state)
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
    }
    
    func favoritesScene(state: FavoritesSceneState) -> some View {
        FavoritesScene(state: state)
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
    }
}
