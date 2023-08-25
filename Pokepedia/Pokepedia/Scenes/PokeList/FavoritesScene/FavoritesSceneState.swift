//
//  FavoritesSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import SwiftUI

struct FavoritesSceneState: DynamicProperty {
    @Binding var favorites: [String]
    @State var favoritRowPokemons: [RowPokemon]
    
    var isFavoritesEmpty: Bool {
        !favorites.isEmpty
    }
}
