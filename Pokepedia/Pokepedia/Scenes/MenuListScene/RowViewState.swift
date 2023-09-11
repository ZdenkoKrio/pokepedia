//
//  PokeRowViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct RowViewState: DynamicProperty {
    @EnvironmentObject private var pokemonObject: PokemonObservableObject
    @EnvironmentObject private var menuListObject: MenuListObservableObject
    let url: String
    let name: String
    let rowType: MenuRow
    let imageLocation: ImageUrls
    let imgName: String
    @Binding var showToast: Bool
    @Binding var toastLabel: String
    
    @State var isFav: Bool
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var pokemon: Pokemon? {
        pokemonObject.pokemons[number]
    }
    
    var types: [PossibleTypes] {
        let nestedTypes = pokemon?.types ?? []
        var result: [PossibleTypes] = []
        for nType in nestedTypes {
            result.append(PossibleTypes(rawValue: nType.type.name)!)
        }
        return result
    }
    
    func fetch() async {
        await pokemonObject.loadData(number: number)
    }
    
    func getTypes() -> [PossibleTypes] {
        let nestedTypes = pokemon?.types ?? []
        var result: [PossibleTypes] = []
        for nType in nestedTypes {
            result.append(PossibleTypes(rawValue: nType.type.name)!)
        }
        return result
    }
    
    func favoritToggle() -> Void {
        isFav.toggle()
        showToast.toggle()
        menuListObject.updateFavourites(name: name, append: isFav)
        if isFav {
            toastLabel = "You add \(name) to favorites"
        } else {
            toastLabel = "You remove \(name) to favorites"
        }
    }
}
