//
//  FilterSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import SwiftUI
import SimpleToast

struct FilterSceneState: DynamicProperty {
    @EnvironmentObject private var menuListObject: MenuListObservableObject
    @EnvironmentObject private var generationObject: GenerationObservableObject
    @EnvironmentObject private var typeObject: PokemonTypeObservableObject
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    @Binding var showFilters: Bool
    @Binding var rows: [RowData]
    let regions: [RowData]
    let types: [RowData]

    
    func fetchRegionPokemons(region: String) async {
        await generationObject.loadData(number: Int(region.split(separator: "/")[5]) ?? 3)
        rows = generationObject.generation?.pokemons ?? []
    }
    
    func fetchTypePokemons(type: String) async {
        await typeObject.loadData(name: getTypeString(url: type))
        rows = getPokemons(slots: typeObject.pokemonType?.pokemon ?? [])
    }
    
    func fetchPokemon() async {
        await menuListObject.loadData(dataChoice: .pokemon)
        rows = menuListObject.rows[.pokemon] ?? []
    }
    
    func getPokemons(slots: [PokemonSlot]) -> [RowData] {
        var result: [RowData] = []
        for slot in slots {
            result.append(slot.pokemon)
        }
        return result
    }
    
    func getTypeString(url: String) -> String {
        return String(url.split(separator: "/")[5])
    }
    
    let toastOptions = SimpleToastOptions(
            hideAfter: 1,
            modifierType: .scale
        )
}
