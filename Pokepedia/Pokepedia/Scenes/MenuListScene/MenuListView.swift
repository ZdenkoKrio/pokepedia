//
//  MovesListScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject var coordinator: Coordinator
    var state: MenuListViewState
    
    var body: some View {
        NavigationStack {
            Group {
                if state.isRowsEmpty {
                    List(state.showFavorites ? state.getFavoritesRows() : state.searchResults, id: \.url) { row in
                        NavigationLink(destination: coordinator.nextView(token: state.menuType, url: row.url)) {
                            RowView(state: RowViewState(url: row.url, name: row.name.capitalized, rowType: state.menuType,
                                                        imageLocation: state.imageLocation, imgName: row.name,
                                                        showToast: state.$showToast, toastLabel: state.$toastLabel,
                                                        isFav: state.isFavourite(name: row.name)))
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
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {state.showFavorites.toggle()}) {
                        Label("", systemImage: state.showFavorites ? "heart.fill" : "heart")
                            .foregroundColor(.blue)
                    } // BUTTON
                } // TOOLBAR ITEM
            } // TOOLBAR
        } // NAVIGATION
        .task{
            await state.fetch()
        }
    }
}

struct MenuListScene_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(state: MenuListViewState(title: "Moves", url: "https://pokeapi.co/api/v2/move/1/", menuType: .move, imageLocation: .itemIcon))
            .injectPreviewsEnvironment()
    }
}
