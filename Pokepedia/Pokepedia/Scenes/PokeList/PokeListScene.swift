//
//  PokeListScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeListScene: View {
    @EnvironmentObject var coordinator: Coordinator
    var state: PokeListSceneState
    
    var body: some View {
        NavigationStack {
            Group {
                if state.isRowPokemonsEmpty {
                    List(state.rowPokemons, id: \.url) { pokemon in
                        // TODO isFav is dump parameter
                        NavigationLink(destination: coordinator.pokeCardScene(state: PokeCardSceneState(isFav: false, favorites: state.$favorites, url: pokemon.url))) {
                            PokeRowView(state: PokeRowViewState(url: pokemon.url, name: pokemon.name))
                        } // LINK
                    } // LIST
                    .listStyle(.plain)
                } else {
                    ProgressView()
                } // ELSE
            } // GROUP
            .navigationTitle("Pokepedia")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {state.showFavorites = true}) {
                        Label("", systemImage: "heart.fill")
                            .foregroundColor(.black)
                    } // BUTTON
                } // TOOLBAR ITEM
            } // TOOLBAR
        } // NAVIGATION
        .task{await state.fetch()}
        .sheet(isPresented: state.$showFavorites) {
            Text("Zatím tady nic neni.")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        } // SHEET
    }
}

struct PokeListScene_Previews: PreviewProvider {
    static var previews: some View {
        PokeListScene(state: PokeListSceneState())
            .injectPreviewsEnvironment()
    }
}
