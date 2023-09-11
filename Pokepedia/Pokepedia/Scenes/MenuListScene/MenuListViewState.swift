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
    
    func fetch() async {
       await menuListObject.loadData(dataChoice: menuType)
    }
}

