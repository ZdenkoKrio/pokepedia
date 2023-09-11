//
//  LocationScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import SwiftUI

struct LocationScene: View {
    let state: LocationSceneState
    
    var body: some View {
        VStack {
            if state.isLoaded {
                CardTitleView(state: CardTitleViewState(number: state.number, name: state.name))
                HStack {
                    Text("Region")
                    Text("\(state.region)")
                } //HSTACK
            }
            Spacer()
        } // VSTACK
        .task {
            await state.fetch()
        }
    }
}

struct LocationScene_Previews: PreviewProvider {
    static var previews: some View {
        LocationScene(state: LocationSceneState(url: "https://pokeapi.co/api/v2/location/3/"))
    }
}
