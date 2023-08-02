//
//  PokeListScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeListScene: View {
    @State var pokemons: [Pokemon] = []
    @State var showFavorites: Bool = false
    @State var favorites: [Int] = []
    
    
    var body: some View {
        NavigationStack {
            Group {
                if !pokemons.isEmpty {
                    List(pokemons, id: \.number) { pokemon in
                        NavigationLink(destination: PokeCardScene(pokemon: pokemon, isFav: favorites.contains(pokemon.number), favorites: $favorites)) {
                            PokeRowView(pokemon: pokemon)
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
                    Button(action: {showFavorites = true}) {
                        Label("", systemImage: "heart.fill")
                            .foregroundColor(.black)
                    } // BUTTON
                } // TOOLBAR ITEM
            } // TOOLBAR
        } // NAVIGATION
        //.onAppear(perform: fetch)
        .sheet(isPresented: $showFavorites) {
            Text("Zatím tady nic neni.")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        } // SHEET
    }
}

struct PokeListScene_Previews: PreviewProvider {
    static var previews: some View {
        PokeListScene(pokemons: [Pokemon(number: 4, name: "Charmander", types: [.fire, .water], stats: ["ATTACK", "DEFENSE"], info: "SOme text about charmander"), Pokemon(number: 5, name: "Charmander", types: [.fire, .water], stats: ["ATTACK", "DEFENSE"], info: "SOme text about charmander")])
    }
}
