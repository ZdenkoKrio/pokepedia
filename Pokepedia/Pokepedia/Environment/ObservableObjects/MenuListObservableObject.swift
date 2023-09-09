//
//  RowPokemonsObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class MenuListObservableObject: ObservableObject {
    @Published var rows: [RowData]
    
    private let menuListService: MenuListService
    
    init(menuListService: MenuListService, rows: [RowData] = []) {
        self.menuListService = menuListService
        self.rows = rows
    }
    
    @MainActor
    func loadData(urlString: String) async {
        do {
            rows = try await menuListService.rows(urlString: urlString).results
        } catch {
            print("\(ObservableObjectError.rowPokemon) : \(error)")
        }
    }
}
