//
//  CardStatsView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct CardStatsView: View {
    let stats: [String]
    
    var body: some View {
        List(stats, id: \.count) {stat in
            Text(stat)
        }
    }
}

struct CardStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CardStatsView(stats: ["Health", "Attack", "Defense"])
    }
}
