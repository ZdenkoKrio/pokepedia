//
//  Location.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

struct Location: Decodable {
    let id: Int
    let name: String
    let region: RowData
}

extension Location {
    static let mock: Location = Location(id: 2, name: "Location2", region: RowData(name: "sinoh", url: "https://pokeapi.co/api/v2/location/3/"))
}
