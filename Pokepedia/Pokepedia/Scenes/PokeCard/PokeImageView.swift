//
//  PokeImageView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

struct PokeImageView: View {
    let state: PokeImageViewState
    
    var body: some View {
        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork\(state.shiny ? "/shiny" : "")/\(state.pokemon).png")) {
            image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 4)
            
        } placeholder: {
            ProgressView()
        }
        .frame(width: 350, height: 350)
        .background(Gradient(colors: [Color(""), Color(state.types[0].rawValue), Color("Dark_\(state.types[0].rawValue)")]))
        .clipShape(Circle())
        .padding(30)
    }
}

struct PokeImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokeImageView(state: PokeImageViewState(shiny: .constant(false), pokemon: 4, types: [.fire]))
    }
}
