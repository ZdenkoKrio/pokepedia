//
//  MainCardView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct MainCardView: View {
    let state: MainCardViewState
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
        VStack(alignment: .center){
            PokeImageView(state: PokeImageViewState(shiny: state.$shiny,
                                                    backgroundNumber: state.backgroundNumber,
                                                    pokemon: state.number,
                                                    types: state.types
                                                   ))
            HStack(alignment: .center) {
                Spacer()
                TypesView(state: TypesViewState(backgroundNumber: state.$backgroundNumber, types: state.types))
                    .padding([.horizontal], 60)
            } // HSTACK
        } // VSTACK
            ShinyButtonView(state: ShinyButtonViewState(shiny: state.$shiny))
                .padding(40)
            if state.isEvolutionsAlowed {
                ZStack (alignment: .bottomTrailing) {
                    EvolutionButtonView(state: EvolutionButtonViewState(number: state.number))
                        .padding(50)
                        .padding([.top], 240)
                } // ZSTACK
            } // IF
        } // ZSTACK
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(state: MainCardViewState(number: 4, types: [.fire]))
    }
}
