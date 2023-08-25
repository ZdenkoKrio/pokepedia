//
//  PokeListSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeListSceneState: DynamicProperty {
    @EnvironmentObject private var rowPokemonsObject: RowPokemonsObservableObject
    @State var showFavorites: Bool = false
    @State var favorites: [String] = []
    
    var rowPokemons: [RowPokemon] {
        rowPokemonsObject.rowPokemons
    }
    
    var isRowPokemonsEmpty: Bool {
        !rowPokemons.isEmpty
    }
    
    func fetch() async {
       await rowPokemonsObject.loadData()
    }
    
    func fetchFavorites() {
        print("Load from memory")
    }
    
    func favoritRows() -> [RowPokemon] {
        rowPokemons.filter{ favorites.contains($0.name) }
    }
}
