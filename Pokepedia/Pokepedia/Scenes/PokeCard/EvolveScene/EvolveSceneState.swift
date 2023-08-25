//
//  EvolveSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct EvolveSceneState: DynamicProperty {
    @EnvironmentObject private var evolutionChainObject: EvolutionChainObservableObject
    
    let number: Int
    
    /*
    private func getEvolution() -> [Int] {
        var result: [Int] = []
        addEvolve(chain: evolutionChainObject.evolutionChain?.chain ?? [], result: &result)
        return result
    }
    
    private func addEvolve(chain: [EvolvesTo], result: inout [Int]) {
        guard !chain.isEmpty else {
            return
        }
        
        result.append(Int(chain[0].species.url.split(separator: "/")[5]) ??  0)
    }
    */
    
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
    
    /*
    mutating func fetch() async {
        await speciesObject.loadData(number: number)
        await evolutionChainObject.loadData(evolveUrl: (speciesObject.pokemonSpecies?.evolutionChain.url)!)
        var evolutionChain: [Int] = getEvolution()
        
        var result: [Pokemon] = []
        for num in evolutionChain {
            await pokemonObject.loadData(number: num)
            result.append(pokemonObject.pokemon ?? Pokemon.mock)
        }
        
        evolution = result
    }
*/
    var evolution: [Pokemon]? {
        evolutionChainObject.evolutionChain ?? []
    }
    
    var isEvolutionEmpty: Bool {
        evolution?.isEmpty ?? true
    }
}
