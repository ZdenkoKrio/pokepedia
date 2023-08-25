//
//  EvolutionButtonView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct EvolutionButtonView: View {
    @EnvironmentObject var coordinator: Coordinator
    let state: EvolutionButtonViewState
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: coordinator.evolveScene(state: EvolveSceneState(number: state.number))) {
                Image("evolve")
                    .resizable()
                    .frame(width: 60, height: 80)
            } // LINK
        } // NAVIGATION STACK
    }
}

struct EvolutionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionButtonView(state: EvolutionButtonViewState(number: 1))
    }
}
