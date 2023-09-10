//
//  RowPokemonsObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

final class MenuListObservableObject: NSObject, ObservableObject {
    @Published var rows: [MenuRow: [RowData]]
    /*@Published var pokemonRows: [RowData]
    @Published var regionRows: [RowData]
    @Published var typeRows: [RowData]
    @Published var moveRows: [RowData]
    */
    private let menuListService: MenuListService
    
    init(menuListService: MenuListService, pokemonRows: [RowData] = [], regionRows: [RowData] = [],
         typeRows: [RowData] = [], moveRows: [RowData] = []) {
        self.menuListService = menuListService
        /*self.pokemonRows = pokemonRows
        self.regionRows = regionRows
        self.typeRows = typeRows
        self.moveRows = moveRows
         */
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
            /*switch dataChoice {
            case .move:
                moveRows = try await menuListService.rows(urlString: "https://pokeapi.co/api/v2/move/?limit=100000&offset=0").results
            case .pokemon:
                pokemonRows = try await menuListService.rows(urlString: "https://pokeapi.co/api/v2/pokemon/?limit=100000&offset=0").results
            case .region:
                regionRows = try await menuListService.rows(urlString: "https://pokeapi.co/api/v2/region/?limit=100000&offset=0").results
            case .type:
                typeRows = try await menuListService.rows(urlString: "https://pokeapi.co/api/v2/type/?limit=100000&offset=0").results
            }
            */
        } catch {
            print("\(ObservableObjectError.rowPokemon) : \(error)")
        }
    }
}
