//
//  EvolutionButtonView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct EvolutionButtonView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: EvolveScene(state: EvolveSceneState())) {
                Image("evolve")
                    .resizable()
                    .frame(width: 60, height: 80)
            } // LINK
        } // NAVIGATION STACK
    }
}

struct EvolutionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionButtonView()
    }
}
