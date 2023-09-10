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
    
    var movesListScene: some View {
        MenuListView(state: MenuListViewState(title: "Moves", url: "https://pokeapi.co/api/v2/move?limit=100000&offset=0", menuType: .move), nextView: moveScene)
    }
    
    var typesListScene: some View {
        MenuListView(state: MenuListViewState(title: "Types", url: "https://pokeapi.co/api/v2/type?limit=100000&offset=0", menuType: .type), nextView: typeScene)
    }
    
    var moveScene: some View {
        MoveScene()
    }
    
    var typeScene: some View {
        TypeScene()
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
