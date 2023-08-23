//
//  PokeRowView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeRowView: View {
    let state: PokeRowViewState
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(state.number).png")) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4
                    )
            } placeholder: {
                EmptyView()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("# \(state.number)")
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                    Text(state.name)
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                } // HSTACK
                //TypesView(types: pokemon.types)
                //.defaultSrcllAnchor(.center)
            } // VSTACK
            VStack {
                Image(systemName: "star")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                Spacer()
            }
        } // HSTACK
        .padding(10)
        
    }
}

struct PokeRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokeRowView(state: PokeRowViewState(url: "https://pokeapi.co/api/v2/pokemon/3/", name: "Ivisaur"))
    }
}
