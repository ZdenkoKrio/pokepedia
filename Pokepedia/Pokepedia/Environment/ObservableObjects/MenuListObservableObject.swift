//
//  RowPokemonsObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class MenuListObservableObject: NSObject, ObservableObject {
    @Published var rows: [MenuRow: [RowData]]
    private let menuListService: MenuListService
    
    init(menuListService: MenuListService, pokemonRows: [RowData] = [], regionRows: [RowData] = [],
         typeRows: [RowData] = [], moveRows: [RowData] = []) {
        self.menuListService = menuListService
        self.rows = [:]
        super.init()
        self.rows[.pokemon] = pokemonRows
        self.rows[.region] = regionRows
        self.rows[.type] = typeRows
        self.rows[.move] = moveRows
    }
    
    @MainActor
    func loadData(dataChoice: MenuRow) async {
        do {
            self.rows[dataChoice] = try await menuListService.rows(urlString: "https://pokeapi.co/api/v2/\(dataChoice.rawValue)/?limit=100000&offset=0").results
        } catch {
            print("\(ObservableObjectError.rowPokemon) : \(error)")
        }
    }
}
