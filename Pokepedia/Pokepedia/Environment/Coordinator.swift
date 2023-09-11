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
        MenuListView(state: MenuListViewState(title: "Moves",
                                              url: "https://pokeapi.co/api/v2/move?limit=100000&offset=0",
                                              menuType: .move,
                                              imageLocation: .movesIcon),
                     nextView: moveScene)
    }
    
    var locationsListScene: some View {
        MenuListView(state: MenuListViewState(title: "Locations",
                                              url: "https://pokeapi.co/api/v2/location?limit=100000&offset=0",
                                              menuType: .location,
                                              imageLocation: .locationIcon),
                     nextView: locationScene)
    }
    
    var itemsListScene: some View {
        MenuListView(state: MenuListViewState(title: "Items",
                                              url: "https://pokeapi.co/api/v2/item?limit=100000&offset=0",
                                              menuType: .item,
                                              imageLocation: .itemIcon),
                     nextView: itemScene)
    }
    
    var typesListScene: some View {
        MenuListView(state: MenuListViewState(title: "Types",
                                              url: "https://pokeapi.co/api/v2/type?limit=100000&offset=0",
                                              menuType: .type,
                                              imageLocation: .typeIcon),
                     nextView: typeScene)
    }
    
    var moveScene: some View {
        MoveScene()
    }
    
    var locationScene: some View {
        LocationScene()
    }
    
    var itemScene: some View {
        ItemScene()
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
    
    func filterScene(showFilters: Binding<Bool>, regions: [RowData], types: [RowData], rows: Binding<[RowData]>) -> some View {
        FilterScene(state: FilterSceneState(showFilters: showFilters, rows: rows, regions: regions, types: types))
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
    }
}
