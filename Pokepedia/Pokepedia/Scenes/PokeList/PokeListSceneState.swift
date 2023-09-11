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
    @EnvironmentObject private var generationObject: GenerationObservableObject
    @EnvironmentObject private var typeObject: PokemonTypeObservableObject
    @State var showFavorites: Bool = false
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    @State var searchName: String = ""
    @State var showFilters: Bool = false
    @State var rows: [RowData] = []

    var regions: [RowData] {
        menuListObject.rows[.region] ?? []
    }
    
    var types: [RowData] {
        menuListObject.rows[.type] ?? []
    }
    
    var isRowPokemonsEmpty: Bool {
        !rows.isEmpty
    }
    
    var isRegionsEmpty: Bool {
        !regions.isEmpty
    }
    
    var searchResults: [RowData] {
        if searchName.isEmpty {
            return rows
        } else {
            if searchName.isNumber {
                return rows.filter{
                    let num = $0.url.split(separator: "/")[5]
                    return num.contains(searchName.lowercased())
                }
            } else {
                return rows.filter{
                    $0.name.contains(searchName.lowercased())
                }
            }
        }
    }
    
    func fetchPokemon() async {
        await menuListObject.loadData(dataChoice: .pokemon)
        rows = menuListObject.rows[.pokemon] ?? []
    }
    
    func fetchRegions() async {
        await menuListObject.loadData(dataChoice: .region)
    }
    
    func fetchTypes() async {
        await menuListObject.loadData(dataChoice: .type)
    }
    
    func fetchRegionPokemons(region: String) async {
        await generationObject.loadData(number: Int(region.split(separator: "/")[5]) ?? 3)
        rows = generationObject.generation?.pokemons ?? []
    }
    
    func fetchTypePokemons(type: String) async {
        await typeObject.loadData(name: type)
        rows = getPokemons(slots: typeObject.pokemonType?.pokemon ?? [])
    }
    
    func getPokemons(slots: [PokemonSlot]) -> [RowData] {
        var result: [RowData] = []
        for slot in slots {
            result.append(slot.pokemon)
        }
        return result
    }
    
    func getFavoritesRows() -> [RowData] {
        guard let pokemons = menuListObject.favouritePokemons else {
            return []
        }
        return rows.filter{ pokemons.contains($0.name.lowercased()) }
    }
    
    func isFavourite(name: String) -> Bool {
        guard let pokemons = menuListObject.favouritePokemons else {
            return false
        }
        return pokemons.contains(name.lowercased())
    }
    
    let toastOptions = SimpleToastOptions(
            hideAfter: 1,
            modifierType: .scale
        )
}
