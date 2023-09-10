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
            HStack(alignment: .center) {
                if state.isRegionsEmpty {
                    ForEach(state.regions, id: \.url) { region in
                        Text("\(region.name)")
                    }
                }
            } // HSTACK
            .task {
                await state.fetchRegions()
            }
            Group {
                if state.isRowPokemonsEmpty {
                    List(state.searchResults, id: \.url) { pokemon in
                        NavigationLink(destination: coordinator.pokeCardScene(state: PokeCardSceneState(url: pokemon.url))) {
                            PokeRowView(state: PokeRowViewState(url: pokemon.url, name: pokemon.name.capitalized, favorites: state.$favorites, showToast: state.$showToast, toastLabel: state.$toastLabel, isFav: state.favorites.contains(pokemon.name)))
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
                    Button(action: {state.showFavorites = true}) {
                        Label("", systemImage: "heart.fill")
                            .foregroundColor(.blue)
                    } // BUTTON
                } // TOOLBAR ITEM
            } // TOOLBAR
        } // NAVIGATION
        
        .task{
            await state.fetchPokemon()
        }
        .sheet(isPresented: state.$showFavorites) {
            coordinator.favoritesScene(state: FavoritesSceneState(favorites: state.$favorites, favoritRowPokemons: state.favoritRows()))
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
