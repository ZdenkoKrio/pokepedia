//
//  MoveSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 12.09.2023.
//

import SwiftUI

struct MoveSceneState: DynamicProperty {
    @EnvironmentObject private var moveObject: MoveObservableObject
    @EnvironmentObject private var menuListObject: MenuListObservableObject
    
    @State var showFavorites: Bool = false
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    
    let url: String
    
    var move: Move? {
        moveObject.move
    }
    
    var learnedByPokemon: [RowData] {
        move?.learnedByPokemon ?? []
    }
    
    var effects: [EffectEntry] {
        move?.effectEntries ?? []
    }
    
    var accuracy: Int {
        move?.accuracy ?? -1
    }
    
    var power: Int {
        move?.power ?? -1
    }
    
    var pp: Int {
        move?.pp ?? -1
    }
    
    var priority: Int {
        move?.priority ?? -1
    }
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var name: String {
        move?.name ?? ""
    }
    
    var type: String {
        move?.type.name ?? ""
    }
    
    func fetch() async {
       await moveObject.loadData(number: number)
    }
    
    var isLoaded: Bool {
        move != nil
    }
    
    func isFavourite(name: String) -> Bool {
        guard let favourite = menuListObject.getFavourite(token: .pokemon) else {
            return false
        }
        return favourite.contains(name.lowercased())
    }
}


