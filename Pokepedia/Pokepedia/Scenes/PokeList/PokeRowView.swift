//
//  PokeRowView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI

struct PokeRowView: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemon.number).png")) {
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
                    Text("# \(pokemon.number)")
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                    Text(pokemon.name)
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                } // HSTACK
                ScrollView([.horizontal]) {
                    HStack {
                        ForEach(pokemon.types) { type in
                            Text(type.rawValue)
                                .fontWeight(.bold)
                                .padding(5)
                                .background(Color(hex: TypeColor.grass.rawValue))
                                .clipShape(Capsule())
                        } // FOREACH
                    } // HSTACK
                } // SCROLL
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
        PokeRowView(pokemon: Pokemon(number: 4, name: "Charmander", types: [.fire, .grass]))
    }
}
