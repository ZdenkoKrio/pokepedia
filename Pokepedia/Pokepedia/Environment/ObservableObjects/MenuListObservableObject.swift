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
    
    private(set) var favouritePokemon: [String]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favouritesPokemon") as? [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favouritesPokemon")
        }
    }
    
    private(set) var favouriteItems: [String]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favouritesItems") as? [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favouritesItems")
        }
    }
    
    private(set) var favouriteLocations: [String]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favouritesLocations") as? [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favouritesLocations")
        }
    }
    
    private(set) var favouriteTypes: [String]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favouritesTypes") as? [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favouritesTypes")
        }
    }
    
    private(set) var favouriteMoves: [String]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favouritesMoves") as? [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favouritesMoves")
        }
    }
    
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
    
    func updateFavourites(token: MenuRow, name: String, append: Bool) {
        var favourites: [String] = []
        switch token {
        case .item:
            favourites = favouriteItems ?? []
        case .location:
            favourites = favouriteLocations ?? []
        case .move:
            favourites = favouriteMoves ?? []
        case .pokemon:
            favourites = favouritePokemon ?? []
        case .type:
            favourites = favouriteTypes ?? []
        case .region:
            favourites = []
        }
        
        if append {
            favourites.append(name.lowercased())
        } else {
            favourites = favourites.filter { $0 != name.lowercased() }
        }
        
        switch token {
        case .item:
            favouriteItems = favourites
        case .location:
            favouriteLocations = favourites
        case .move:
            favouriteMoves = favourites
        case .pokemon:
            favouritePokemon = favourites
        case .type:
            favouriteTypes = favourites
        case .region:
            print("underConstruction")
        }
    }
    
    func getFavourite(token: MenuRow) -> [String]? {
        switch token {
        case .item:
            return favouriteItems
        case .location:
            return favouriteLocations
        case .move:
            return favouriteMoves
        case .pokemon:
            return favouritePokemon
        case .type:
            return favouriteTypes
        case .region:
            return nil
        }
    }
}
