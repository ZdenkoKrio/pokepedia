//
//  CardStatsView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct CardStatsView: View {
    let state: CardStatsViewState
    
    var body: some View {
        List(state.stats, id: \.info.url) {stat in
            HStack {
                Text(stat.info.name.capitalized)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("\(stat.value)")
                    .font(.title2)
                    .fontWeight(.bold)
            } // HSTACK
            .padding(5)
        } // LIST
    }
}

struct CardStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CardStatsView(state: CardStatsViewState(stats: Pokemon.mock.stats))
    }
}
