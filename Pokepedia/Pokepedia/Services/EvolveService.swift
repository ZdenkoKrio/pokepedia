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
    let pokemonService: PokemonService
    
    init(speciesService: SpeciesService, pokemonService: PokemonService) {
        self.speciesService = speciesService
        self.pokemonService = pokemonService
    }
    
    func evolve(number: Int) async throws -> [Pokemon] {
        let species = try await speciesService.species(number: number)
        
        let session = URLSession.shared
        let url = URL(string: species.evolutionChain.url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, response) = try await session.data(for: request)
        let evolutionChain = try JSONDecoder().decode(EvolutionChain.self, from: data)
        
        var pokemonNumbers: [Int] = [Int(evolutionChain.chain.species.url.split(separator: "/")[5]) ?? 0]
        getEvolves(chain: evolutionChain.chain.evolvesTo, result: &pokemonNumbers)
        
        var result: [Pokemon] = []
        for num in pokemonNumbers {
            try await result.append(pokemonService.pokemon(number: num))
        }
        
        print("pokeNums: \(result)")
        return result
    }
    
    private func getEvolves(chain: [EvolvesTo], result: inout [Int]) {
        guard !chain.isEmpty else {
            return
        }
        
        result.append(Int(chain[0].species.url.split(separator: "/")[5]) ??  0)
        getEvolves(chain: chain[0].evolvesTo, result: &result)
    }
}


class MockEvolveService: EvolveService {
    func evolve(number: Int) async throws -> [Pokemon] {
        return [Pokemon.mock, Pokemon.mock]
    }
}
