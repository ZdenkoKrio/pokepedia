//
//  PokeRowView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI
import SimpleToast

struct PokeRowView: View {
    var state: PokeRowViewState
    
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
                TypesView(state: TypesViewState(backgroundNumber: .constant(0), types: state.types))
            } // VSTACK
            Spacer()
            Image(systemName: state.isFav ? "star.fill" : "star")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .onTapGesture {
                    state.favoritToggle()
                }
        } // HSTACK
        .padding(10)
        .task {
            await state.fetch()
        }
    }
}

struct PokeRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokeRowView(state: PokeRowViewState(url: "https://pokeapi.co/api/v2/pokemon/3/", name: "Ivisaur", showToast: .constant(false), toastLabel: .constant(""), isFav: false))
    }
}
