//
//  MovesListScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct MenuListView<TargetView: View>: View {
    @EnvironmentObject var coordinator: Coordinator
    var state: MenuListViewState
    var nextView: TargetView
    
    var body: some View {
        NavigationStack {
            Group {
                if state.isRowsEmpty {
                    List(state.searchResults, id: \.url) { row in
                        NavigationLink(destination: nextView) {
                            //MenuRowView(url: row.url, name: row.name.capitalized)
                            RowView(state: RowViewState(url: row.url, name: row.name.capitalized, rowType: state.menuType,
                                                        imageLocation: state.imageLocation, imgName: row.name,
                                                        showToast: .constant(false), toastLabel: .constant(""),
                                                        isFav: false))
                        } // LINK
                    } // LIST
                    .listStyle(.plain)
                } else {
                    ProgressView()
                } // ELSE
            } // GROUP
            .searchable(text: state.$searchName)
            .navigationTitle("\(state.title)")
            .navigationBarTitleDisplayMode(.inline)
        } // NAVIGATION
        .task{
            await state.fetch()
        }
    }
}

struct MenuListScene_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(state: MenuListViewState(title: "Moves", url: "https://pokeapi.co/api/v2/move/1/", menuType: .move, imageLocation: .itemIcon), nextView: MoveScene())
            .injectPreviewsEnvironment()
    }
}
