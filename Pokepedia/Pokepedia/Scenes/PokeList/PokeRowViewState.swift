//
//  PokeRowViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeRowViewState: DynamicProperty {
    @EnvironmentObject private var pokemonObject: PokemonObservableObject
    let url: String
    let name: String
    @Binding var favorites: [String]
    @Binding var showToast: Bool
    @Binding var toastLabel: String
    
    @State var isFav: Bool
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var pokemon: Pokemon? {
        pokemonObject.pokemon
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
        if isFav {
            favorites.append(name.lowercased())
            toastLabel = "You add \(name) to favorites"
        } else {
            favorites = favorites.filter { $0 != name.lowercased() }
            toastLabel = "You remove \(name) to favorites"
        }
    }
}
