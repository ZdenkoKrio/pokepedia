//
//  Stat.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 23.08.2023.
//

import Foundation

struct Stat: Decodable {
    let value: Int
    let effort: Int
    let info: StatInfo
    
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
        case effort
        case info = "stat"
    }
}
