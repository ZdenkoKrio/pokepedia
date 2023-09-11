//
//  TypeSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import SwiftUI

struct TypeSceneState: DynamicProperty {
    @EnvironmentObject private var pokemonTypeObject: PokemonTypeObservableObject
    @EnvironmentObject private var menuListObject: MenuListObservableObject
    
    @State var showFavorites: Bool = false
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    
    let url: String
    
    var pokemonType: PokemonType? {
        pokemonTypeObject.pokemonType
    }
    
    var moves: [RowData] {
        pokemonType?.moves ?? []
    }
    
    var pokemon: [RowData] {
        getPokemons(slots: pokemonType?.pokemon ?? [])
    }
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var name: String {
        pokemonType?.name ?? ""
    }
    
    func fetch() async {
       await pokemonTypeObject.loadData(name: String(number))
    }
    
    var isLoaded: Bool {
        pokemonType != nil
    }
    
    func isFavourite(name: String) -> Bool {
        guard let favourite = menuListObject.getFavourite(token: .move) else {
            return false
        }
        return favourite.contains(name.lowercased())
    }
    
    func getPokemons(slots: [PokemonSlot]) -> [RowData] {
        var result: [RowData] = []
        for slot in slots {
            result.append(slot.pokemon)
        }
        return result
    }
}

