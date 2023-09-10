//
//  PokeCardSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeCardSceneState: DynamicProperty {
    @EnvironmentObject private var pokemonObject: PokemonObservableObject
    
    let url: String
    
    var pokemon: Pokemon? {
        pokemonObject.pokemons[number]
    }
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var name: String {
        pokemon?.name ?? ""
    }
    
    var stats: [Stat] {
        pokemon?.stats ?? []
    }
    
    func getTypes() -> [PossibleTypes] {
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
    
    var isLoaded: Bool {
        pokemon != nil
    }
}
