//
//  FavoritesScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 24.08.2023.
//

import SwiftUI

struct FavoritesScene: View {
    @EnvironmentObject var coordinator: Coordinator
    var state: FavoritesSceneState
    
    var body: some View {
        NavigationStack {
            Group {
                if state.isFavoritesEmpty {
                    List(state.favoritRowPokemons, id: \.url) { pokemon in
                        NavigationLink(destination: coordinator.pokeCardScene(state: PokeCardSceneState(url: pokemon.url))) {
                            PokeRowView(state: PokeRowViewState(url: pokemon.url, name: pokemon.name, favorites: state.$favorites, showToast: .constant(false), toastLabel: state.$toastLabel, isFav: state.favorites.contains(pokemon.name)))
                        } // LINK
                    } // LIST
                    .listStyle(.plain)
                } else {
                    Text("You dont have any favorites.")
                } // ELSE
            } // GROUP
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .simpleToast(isPresented: state.$showToast, options: state.toastOptions) {
                Spacer()
                Label(state.toastLabel, systemImage: "")
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .padding(.bottom)
            } // TOAST
        } // NAVIGATION
    }
}

struct FavoritesScene_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScene(state: FavoritesSceneState(favorites: .constant([]), favoritRowPokemons: []))
    }
}
