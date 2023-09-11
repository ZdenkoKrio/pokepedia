//
//  TypeScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import SwiftUI

struct TypeScene: View {
    let state: TypeSceneState
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if state.isLoaded {
                    CardTitleView(state: CardTitleViewState(number: state.number, name: state.name))
                    HStack {
                        ForEach(["go", "masters", "gen8"], id: \.self) { artType in
                                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/msikma/pokesprite/master/misc/types/\(artType)/\(state.name).png")) {
                                    image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(radius: 4)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(20)
                        } // FOREACH
                    } // HSTACK
                    .padding(20)
                    
                    Section {
                        DisclosureGroup("Pokemon") {
                            ForEach(state.pokemon, id: \.url) { row in
                                    RowView(state: RowViewState(url: row.url, name: row.name.capitalized, rowType: .pokemon,
                                                                imageLocation: .pokemonIcon, imgName: row.name.lowercased(),
                                                                showToast: state.$showToast, toastLabel: state.$toastLabel,
                                                                isFav: state.isFavourite(name: row.name)))
                                    .padding()
                                    Divider()
                                } // EACH
                        } // DISGROUP
                        .padding()
                    } // SECTION
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    
                    Section {
                        DisclosureGroup("Moves") {
                            ForEach(state.moves, id: \.url) { row in
                                RowView(state: RowViewState(url: row.url, name: row.name.capitalized, rowType: .move,
                                                            imageLocation: .movesIcon, imgName: row.name,
                                                            showToast: state.$showToast, toastLabel: state.$toastLabel,
                                                            isFav: state.isFavourite(name: row.name)))
                                .padding()
                                Divider()
                            } // EACH
                        } // DISGROUP
                        .padding()
                    } // SECTION
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                } else {
                    ProgressView()
                } // ELSE
            } // VSTACK
        } // SCROLL
        .task {
            await state.fetch()
        }
    }
}

struct TypeScene_Previews: PreviewProvider {
    static var previews: some View {
        TypeScene(state: TypeSceneState(url: "https://pokeapi.co/api/v2/type/4/"))
    }
}
