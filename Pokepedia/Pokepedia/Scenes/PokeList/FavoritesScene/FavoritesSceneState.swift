//
//  FavoritesSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import SwiftUI
import SimpleToast

struct FavoritesSceneState: DynamicProperty {
    @Binding var favorites: [String]
    @State var favoritRowPokemons: [RowData]
    @State var toastLabel: String = ""
    @State var showToast: Bool = false
    
    var isFavoritesEmpty: Bool {
        !favorites.isEmpty
    }
    
    let toastOptions = SimpleToastOptions(
            hideAfter: 1,
            modifierType: .scale
        )
}
