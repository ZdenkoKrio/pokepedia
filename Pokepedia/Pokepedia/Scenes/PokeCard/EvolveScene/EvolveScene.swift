//
//  EvolveScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 02.08.2023.
//

import SwiftUI

struct EvolveScene: View {
    var state: EvolveSceneState
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Evolutions")
                .font(.largeTitle)
                .fontWeight(.bold)
            ScrollView(.horizontal) {
                HStack {
                    Group {
                        if !state.isEvolutionEmpty {
                            List(state.evolution ?? [], id: \.name) { pokemon in
                                VStack {
                                    CardTitleView(state: CardTitleViewState(number: pokemon.id, name: pokemon.name))
                                    PokeImageView(state: PokeImageViewState(shiny: .constant(false), pokemon: pokemon.id, types: state.getTypes(pokemon: pokemon)))
                                } // VSTACK
                            } // LIST
                            .listStyle(.plain)
                        } else {
                            ProgressView()
                        } // ELSE
                    } // GROUP
                } // HSTACK
            } // SCROLL
            .task{await state.fetch()}
        } // VSTACK
    }
}

struct EvolveScene_Previews: PreviewProvider {
    static var previews: some View {
        EvolveScene(state: EvolveSceneState(number: 1))
    }
}
