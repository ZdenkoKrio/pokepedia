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
            Group {
                if state.isLoaded {
                    TabView {
                        ForEach(state.evolution, id: \.name) { pokemon in
                            VStack {
                                CardTitleView(state: CardTitleViewState(number: pokemon.id, name: pokemon.name))
                                MainCardView(state: MainCardViewState(isEvolutionsAlowed: false, number: pokemon.id, types: state.getTypes(pokemon: pokemon)))
                            } // VSTACK   
                        } // LIST
                        .listStyle(.plain)
                    } // TAB
                    .tabViewStyle(.page(indexDisplayMode: .never))
                } else {
                    ProgressView()
                } // ELSE
            } // GROUP
            .task{await state.fetch()}
        } // VSTACK
    }
}

struct EvolveScene_Previews: PreviewProvider {
    static var previews: some View {
        EvolveScene(state: EvolveSceneState(number: 1))
    }
}
