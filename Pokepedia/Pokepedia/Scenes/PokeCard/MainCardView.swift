//
//  MainCardView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct MainCardView: View {
    let number: Int
    let types: [PossibleTypes]
    @State var shiny: Bool = false
    
    var body: some View {
        ZStack {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork\(shiny ? "/shiny" : "")/\(number).png")) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
                
            } placeholder: {
                EmptyView()
            }
            
            .frame(width: 350, height: 350)
            .background(Gradient(colors: [Color(types[0].rawValue), Color(types[1].rawValue)]))
            .clipShape(Circle())
            .padding(30)
            
            HStack(alignment: .center) {
                Spacer()
                TypesView(types: types)
            } // HSTACK
        } // VSTACK
            ShinyButtonView(shiny: $shiny)
                .position(x: 300, y: 70)
            EvolutionButtonView()
                .position(x: 330, y: 320)
        } // ZSTACK
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(number: 4, types: [.fire, .grass, .water, .fire])
    }
}
