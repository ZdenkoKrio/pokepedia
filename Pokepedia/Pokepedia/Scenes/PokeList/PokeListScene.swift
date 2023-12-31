//
//  PokeListScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI
import SimpleToast

struct PokeListScene: View {
    @EnvironmentObject var coordinator: Coordinator
    var state: PokeListSceneState
    
    var body: some View {
        NavigationStack {
            Group {
                if state.isRowPokemonsEmpty {
                    List(state.showFavorites ? state.getFavoritesRows() : state.searchResults, id: \.url) { pokemon in
                        NavigationLink(destination: coordinator.pokeCardScene(state: PokeCardSceneState(url: pokemon.url))) {
                            RowView(state: RowViewState(url: pokemon.url, name: pokemon.name.capitalized, rowType: .pokemon, imageLocation: .pokemonIcon, imgName: String(pokemon.url.split(separator: "/")[5]), showToast: state.$showToast, toastLabel: state.$toastLabel, isFav: state.isFavourite(name: pokemon.name)))
                        } // LINK
                    } // LIST
                    .listStyle(.plain)
                } else {
                    ProgressView()
                } // ELSE
            } // GROUP
            .searchable(text: state.$searchName, prompt: "Type name or number")
            .navigationTitle("Pokepedia")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {state.showFilters = true}) {
                        Text("Filters")
                            .foregroundColor(.blue)
                    } // BUTTON
                } // TOOLBAR ITEM
                ToolbarItem(placement: .automatic) {
                    Button(action: {state.showFavorites.toggle()}) {
                        Label("", systemImage: state.showFavorites ? "heart.fill" : "heart")
                            .foregroundColor(.blue)
                    } // BUTTON
                } // TOOLBAR ITEM
            } // TOOLBAR
        } // NAVIGATION
        .task{
            await state.fetchPokemon()
            await state.fetchRegions()
            await state.fetchTypes()
        }
        .sheet(isPresented: state.$showFilters) {
            coordinator.filterScene(showFilters: state.$showFilters ,regions: state.regions, types: state.types, rows: state.$rows)
        } // SHEET
        .simpleToast(isPresented: state.$showToast, options: state.toastOptions) {
            Spacer()
            Label(state.toastLabel, systemImage: "")
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .padding(.bottom)
        } // TOAST
    }
}

struct PokeListScene_Previews: PreviewProvider {
    static var previews: some View {
        PokeListScene(state: PokeListSceneState())
            .injectPreviewsEnvironment()
    }
}
