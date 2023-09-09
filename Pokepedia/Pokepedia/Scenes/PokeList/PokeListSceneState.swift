//
//  PokeListSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI
import SimpleToast

extension String {
    var isNumber: Bool {
        return self.allSatisfy { character in
            character.isWholeNumber

        }
    }
}

struct PokeListSceneState: DynamicProperty {
    @EnvironmentObject private var rowPokemonsObject: RowPokemonsObservableObject
    @State var showFavorites: Bool = false
    @State var favorites: [String] = []
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    @State var searchName: String = ""
    
    var rowPokemons: [RowPokemon] {
        rowPokemonsObject.rowPokemons
    }
    
    var isRowPokemonsEmpty: Bool {
        !rowPokemons.isEmpty
    }
    
    var searchResults: [RowPokemon] {
        if searchName.isEmpty {
            return rowPokemons
        } else {
            if searchName.isNumber {
                return rowPokemons.filter{
                    let num = $0.url.split(separator: "/")[5]
                    return num.contains(searchName.lowercased())
                }
            } else {
                return rowPokemons.filter{
                    $0.name.contains(searchName.lowercased())
                }
            }
        }
    }
    
    func fetch() async {
       await rowPokemonsObject.loadData()
    }
    
    func fetchFavorites() {
        print("Load from memory")
    }
    
    func favoritRows() -> [RowPokemon] {
        rowPokemons.filter{ favorites.contains($0.name.lowercased()) }
    }
    
    let toastOptions = SimpleToastOptions(
            hideAfter: 1,
            modifierType: .scale
        )
}
