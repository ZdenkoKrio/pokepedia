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
                                              imageLocation: .movesIcon))
    }
    
    var locationsListScene: some View {
        MenuListView(state: MenuListViewState(title: "Locations",
                                              url: "https://pokeapi.co/api/v2/location?limit=100000&offset=0",
                                              menuType: .location,
                                              imageLocation: .locationIcon))
    }
    
    var itemsListScene: some View {
        MenuListView(state: MenuListViewState(title: "Items",
                                              url: "https://pokeapi.co/api/v2/item?limit=100000&offset=0",
                                              menuType: .item,
                                              imageLocation: .itemIcon))
    }
    
    var typesListScene: some View {
        MenuListView(state: MenuListViewState(title: "Types",
                                              url: "https://pokeapi.co/api/v2/type?limit=100000&offset=0",
                                              menuType: .type,
                                              imageLocation: .typeIcon))
    }
    
    func locationScene(url: String) -> some View {
        LocationScene(state: LocationSceneState(url: url))
    }
    
    @ViewBuilder
    func nextView(token: MenuRow, url: String) -> some View {
        switch token {
        case .item:
            ItemScene()
        case .location:
            LocationScene(state: LocationSceneState(url: url))
        case .move:
            MoveScene(state: MoveSceneState(url: url))
        case .pokemon:
            EmptyView()
        case .type:
            TypeScene(state: TypeSceneState(url: url))
        case .region:
            EmptyView()
        }
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
