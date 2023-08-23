//
//  RowPokemon.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import Foundation

struct RowPokemon: Decodable {
    static var counter: Int = 1
    
    let name: String
    //var number: Int? = 2
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        //self.number = RowPokemon.counter
        RowPokemon.counter += 1
        self.url = url
    }
}
