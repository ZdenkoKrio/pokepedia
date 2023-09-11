//
//  PokeRowView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 30.07.2023.
//

import SwiftUI
import SimpleToast

struct RowView: View {
    var state: RowViewState
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "\(state.imageLocation.rawValue)\(state.imgName).png")) {
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
                if state.rowType == .pokemon {
                    TypesView(state: TypesViewState(backgroundNumber: .constant(0), types: state.types))
                } // IF
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
            if state.rowType == .pokemon {
                await state.fetch()
            }
        } // TASK
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(state: RowViewState(url: "https://pokeapi.co/api/v2/pokemon/3/", name: "Ivisaur", rowType: .item, imageLocation: .pokemonIcon, imgName: "3", showToast: .constant(false), toastLabel: .constant(""), isFav: false))
    }
}
