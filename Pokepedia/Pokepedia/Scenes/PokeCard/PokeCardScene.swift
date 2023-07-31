//
//  PokeProfileScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeCardScene: View {
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView([.vertical]) {
            VStack(alignment: .center) {
                CardTitleView(number: pokemon.number, name: pokemon.name)
                MainCardView(number: pokemon.number, types: pokemon.types)
                CardStatsView(stats: pokemon.stats)
                
                CardInfoView(stats: pokemon.stats, info: pokemon.info)
            } // VSTACK
        } // SCROLL
    }
}

struct PokeCardScene_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardScene(pokemon: Pokemon(number: 4, name: "Charmander", types: [.fire],
                                       stats: ["Attack", "Defense"], info: "TExt about pokemon"))
    }
}
