//
//  PokeRowViewState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeRowViewState: DynamicProperty {
    let url: String
    let name: String
    @Binding var favorites: [String]
    @Binding var showToast: Bool
    @Binding var toastLabel: String
    
    @State var isFav: Bool
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    func favoritToggle() -> Void {
        isFav.toggle()
        showToast.toggle()
        if isFav {
            favorites.append(name)
            toastLabel = "You add \(name) to favorites"
        } else {
             favorites = favorites.filter { $0 != name }
            toastLabel = "You remove \(name) to favorites"
        }
    }
}
