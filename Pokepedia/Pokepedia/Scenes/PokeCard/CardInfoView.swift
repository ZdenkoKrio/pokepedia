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
    @State var isPresentingStats: Bool = false
    
    var body: some View {
        VStack {
            Button("Show stats") {
                isPresentingStats.toggle()
            }
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(.blue)
            .cornerRadius(15)
            .shadow(radius: 25)
            .padding()
            .sheet(isPresented: $isPresentingStats) {
                CardStatsView(stats: stats)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            Text(info)
        }
    }
}


struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(stats: ["Health", "DEF", "ATCK"], info: "Poketext")
    }
}
