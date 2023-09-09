//
//  PokeListSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI
import SimpleToast

struct PokeListSceneState: DynamicProperty {
    @EnvironmentObject private var menuListObject: MenuListObservableObject
    @State var showFavorites: Bool = false
    @State var favorites: [String] = []
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    @State var searchName: String = ""
    
    var rowPokemons: [RowData] {
        menuListObject.rows
    }
    
    var isRowPokemonsEmpty: Bool {
        !rowPokemons.isEmpty
    }
    
    var searchResults: [RowData] {
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
       await menuListObject.loadData(urlString: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0")
    }
    
    func fetchFavorites() {
        print("Load from memory")
    }
    
    func favoritRows() -> [RowData] {
        rowPokemons.filter{ favorites.contains($0.name.lowercased()) }
    }
    
    let toastOptions = SimpleToastOptions(
            hideAfter: 1,
            modifierType: .scale
        )
}
