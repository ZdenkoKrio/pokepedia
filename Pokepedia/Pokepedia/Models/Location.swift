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
