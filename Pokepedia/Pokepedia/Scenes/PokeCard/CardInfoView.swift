//
//  CardInfoView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct CardInfoView: View {
    @EnvironmentObject var coordinator: Coordinator
    let state: CardInfoViewState
    
    var body: some View {
        VStack {
            Button("Show stats") {
                state.isPresentingStats.toggle()
            } // BUTTON
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(.blue)
            .cornerRadius(15)
            .shadow(radius: 25)
            .padding()
            .sheet(isPresented: state.$isPresentingStats) {
                coordinator.statsScene(state: CardStatsViewState(stats: state.stats))
            } // SHEET
        } // VSTACK
    }
}


struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(state: CardInfoViewState(stats: Pokemon.mock.stats))
    }
}
