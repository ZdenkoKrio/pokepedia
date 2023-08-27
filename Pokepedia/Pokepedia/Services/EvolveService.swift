//
//  EvolveService.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

protocol EvolveService {
    func evolve(number: Int) async throws -> [Pokemon]
}


class ProductionEvolveService: EvolveService {
    
    let speciesService: SpeciesService
    
    init(speciesService: SpeciesService) {
        self.speciesService = speciesService
    }
    
    @MainActor
    func evolve(number: Int) async throws -> [Pokemon] {
        var spec = try await speciesService.species(number: number)
        let sesion = URLSession.shared
        //let url = URL(string: "https://pokeapi.co/api/v2/evolution-chain/\(number)")!
        let url = URL(string: spec.evolutionChain.url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, response) = try await sesion.data(for: request)
        var chain = try JSONDecoder().decode(EvolutionChain.self, from: data)
        
        //await speciesObject.loadData(number: number)
        //await evolutionChainObject.loadData(evolveUrl: (speciesObject.pokemonSpecies?.evolutionChain.url)!)
        var evolutionChain: [Int] = getEvolution(chain: chain.chain)
        
        var result: [Pokemon] = []
        for num in evolutionChain {
            try await result.append(pokemon(number: num))
        }
        
       return result
    }
    
    @MainActor
    private func pokemon(number: Int) async throws -> Pokemon {
        let sesion = URLSession.shared
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, response) = try await sesion.data(for: request)
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
    
    private func getEvolution(chain: [EvolvesTo]) -> [Int] {
        var result: [Int] = []
        addEvolve(chain: chain, result: &result)
        return result
    }
    
    private func addEvolve(chain: [EvolvesTo], result: inout [Int]) {
        guard !chain.isEmpty else {
            return
        }
        
        result.append(Int(chain[0].species.url.split(separator: "/")[5]) ??  0)
    }
}


class MockEvolveService: EvolveService {
    func evolve(number: Int) async throws -> [Pokemon] {
        return [Pokemon.mock, Pokemon.mock]
    }
}
