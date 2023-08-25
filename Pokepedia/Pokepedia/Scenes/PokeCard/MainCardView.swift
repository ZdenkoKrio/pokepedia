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
                                                    pokemon: state.number,
                                                    types: state.types))
            HStack(alignment: .center) {
                Spacer()
                TypesView(state: TypesViewState(types: state.types))
                    .padding([.horizontal], 60)
            } // HSTACK
        } // VSTACK
            ShinyButtonView(state: ShinyButtonViewState(shiny: state.$shiny))
                .padding(40)
                
            ZStack (alignment: .bottomTrailing) {
                EvolutionButtonView(state: EvolutionButtonViewState(number: state.number))
                    .padding(50)
                    .padding([.top], 240)
                    
            }
        } // ZSTACK
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(state: MainCardViewState(number: 4, types: [.fire]))
    }
}
