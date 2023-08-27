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
                        if state.isLoaded {
                            ForEach(state.evolution, id: \.name) { pokemon in
                                // why LIST is display nothing? and Foreach is working?
                                VStack {
                                    CardTitleView(state: CardTitleViewState(number: pokemon.id, name: pokemon.name))
                                    MainCardView(state: MainCardViewState(isEvolutionsAlowed: false, number: pokemon.id, types: state.getTypes(pokemon: pokemon)))
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
