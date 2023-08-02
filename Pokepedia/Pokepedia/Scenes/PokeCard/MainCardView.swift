//
//  MainCardView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct MainCardView: View {
    let pokemon: Pokemon
    @State var shiny: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork\(shiny ? "/shiny" : "")/\(pokemon.number).png")) {
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
            .background(Gradient(colors: [Color(""), Color(pokemon.types[0].rawValue), Color("Dark\(pokemon.types[0].rawValue)")]))
            .clipShape(Circle())
            .padding(30)
            
            HStack(alignment: .center) {
                Spacer()
                TypesView(types: pokemon.types)
                    .padding([.horizontal], 60)
            } // HSTACK
        } // VSTACK
            ShinyButtonView(shiny: $shiny)
                .padding(40)
                
            ZStack (alignment: .bottomTrailing) {
                EvolutionButtonView()
                    .padding(50)
                    .padding([.top], 240)
                    
            }
        } // ZSTACK
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(pokemon: Pokemon(number: 4, name: "Charmander", types: [.fire],
                                      stats: ["Attack", "Defense"], info: "TExt about pokemon"))
    }
}
