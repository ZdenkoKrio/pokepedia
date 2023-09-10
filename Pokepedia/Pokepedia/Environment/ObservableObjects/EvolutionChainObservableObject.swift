//
//  EvolutionChainObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import Foundation

final class EvolutionChainObservableObject: ObservableObject {
    @Published var evolutionChain: [Pokemon]?
    
    private let evolutionChainService: EvolveService
    
    init(evolutionChainService: EvolveService, evolutionChain: [Pokemon]? = nil) {
        self.evolutionChainService = evolutionChainService
        self.evolutionChain = evolutionChain
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            self.evolutionChain = try await evolutionChainService.evolve(number: number)
        } catch {
            print("\(ObservableObjectError.evolutionChain) : \(error)")
        }
    }
}
