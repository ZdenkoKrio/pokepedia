//
//  MoveObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

final class MoveObservableObject: ObservableObject {
    @Published var move: Move?
    
    private let moveService: MoveService
    
    init(moveService: MoveService, move: Move? = nil) {
        self.moveService = moveService
        self.move = move
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            self.move = try await moveService.move(number: number)
        } catch {
            print("\(ObservableObjectError.evolutionChain) : \(error)")
        }
    }
}
