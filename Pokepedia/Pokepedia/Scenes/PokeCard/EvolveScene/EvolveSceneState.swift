//
//  EvolveSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct EvolveSceneState: DynamicProperty {
    @EnvironmentObject private var evolutionChainObject: EvolutionChainObservableObject
    @State var backgroundNumber: Int = 0
    
    let number: Int
    
    var evolution: [Pokemon] {
        evolutionChainObject.evolutionChain ?? []
    }
    
    var isLoaded: Bool {
        evolution.contains { $0.id == number}
    }
    
    func getTypes(pokemon: Pokemon) -> [PossibleTypes] {
        let nestedTypes = pokemon.types
        var result: [PossibleTypes] = []
        for nType in nestedTypes {
            result.append(PossibleTypes(rawValue: nType.type.name)!)
        }
        return result
    }
    
    func fetch() async {
        await evolutionChainObject.loadData(number: number)
    }

}
