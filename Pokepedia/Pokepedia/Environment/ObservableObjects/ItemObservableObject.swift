//
//  ItemObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

final class ItemObservableObject: ObservableObject {
    @Published var item: Item?
    
    private let itemService: ItemService
    
    init(itemService: ItemService, item: Item? = nil) {
        self.itemService = itemService
        self.item = item
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            self.item = try await itemService.item(number: number)
        } catch {
            print("\(ObservableObjectError.evolutionChain) : \(error)")
        }
    }
}
