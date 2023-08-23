//
//  PokeProfileScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeCardScene: View {
    let state: PokeCardSceneState
    
    var body: some View {
        ScrollView([.vertical]) {
            VStack(alignment: .center) {
                if state.isLoaded {
                    //Text("\(state.getTypes()[0].rawValue)")
                    CardTitleView(state: CardTitleViewState(number: state.number, name: state.name))
                    MainCardView(state: MainCardViewState(number: state.number, types: state.getTypes()))
                    CardStatsView(state: CardStatsViewState(stats: state.stats))
                    
                    CardInfoView(state: CardInfoViewState(stats: state.stats))
                } // IF
            } // VSTACK
        } // SCROLL
        .task{await state.fetch()}
    }
}

struct PokeCardScene_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardScene(state: PokeCardSceneState(isFav: false, favorites: .constant([]), url: "https://pokeapi.co/api/v2/pokemon/3/"))
            .injectPreviewsEnvironment()
    }
}
