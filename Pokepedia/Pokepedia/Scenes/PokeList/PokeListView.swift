//
//  PokeListView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeListView: View {
    @State var pokemons: [Pokemon]
    
    var body: some View {
        NavigationStack {
            Group {
                if !pokemons.isEmpty {
                    List(pokemons, id: \.number) { pokemon in
                        PokeRowView(pokemon: pokemon)
                    } // LIST
                    .listStyle(.plain)
                } else {
                    ProgressView()
                } // ELSE
            } // GROUP
            .navigationTitle("PokePedia")
        } // NAVIGATION
        //.onAppear(perform: fetch)
    }
}

struct PokeListView_Previews: PreviewProvider {
    static var previews: some View {
        PokeListView(pokemons: [Pokemon(number: 1, name: "Bulbasaur", types: [.grass]),
                     Pokemon(number: 4, name: "Charmander", types: [.fire])])
    }
}
