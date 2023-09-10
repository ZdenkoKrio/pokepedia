//
//  GenerationObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import Foundation

final class GenerationObservableObject: ObservableObject {
    @Published var generation: Generation?
    
    private let generationService: GenerationService
    
    init(generationService: GenerationService, generation: Generation? = nil) {
        self.generationService = generationService
        self.generation = generation
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            self.generation = try await generationService.generation(number: number)
        } catch {
            print("\(ObservableObjectError.evolutionChain) : \(error)")
        }
    }
}
