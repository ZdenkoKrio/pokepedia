//
//  CardInfoView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct CardInfoView: View {
    let stats: [String]
    let info: String
    
    var body: some View {
        VStack {
            CardStatsView(stats: stats)
            Text(info)
        }
    }
}


struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(stats: ["Health", "DEF", "ATCK"], info: "Poketext")
    }
}
