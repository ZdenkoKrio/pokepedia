//
//  MovesListSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct MenuListViewState: DynamicProperty {
    @EnvironmentObject private var menuListObject: MenuListObservableObject
    @State var searchName: String = ""
    @State var showFavorites: Bool = false
    @State var showToast: Bool = false
    @State var toastLabel: String = ""
    let title: String
    let url: String
    let menuType: MenuRow
    let imageLocation: ImageUrls

    
    var rows: [RowData] {
        menuListObject.rows[menuType] ?? []
    }
    
    var isRowsEmpty: Bool {
        !rows.isEmpty
    }
    
    var searchResults: [RowData] {
        if searchName.isEmpty {
            return rows
        } else {
            return rows.filter{
                $0.name.contains(searchName.lowercased())
            }
        }
    }
    
    func getFavoritesRows() -> [RowData] {
        guard let favourite = menuListObject.getFavourite(token: menuType) else {
            return []
        }
        return rows.filter{ favourite.contains($0.name.lowercased()) }
    }
    
    func isFavourite(name: String) -> Bool {
        guard let favourite = menuListObject.getFavourite(token: menuType) else {
            return false
        }
        return favourite.contains(name.lowercased())
    }
    
    func fetch() async {
       await menuListObject.loadData(dataChoice: menuType)
    }
}

