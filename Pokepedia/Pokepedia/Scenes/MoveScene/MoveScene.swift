//
//  MoveScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct MoveScene: View {
    let state: MoveSceneState
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                if state.isLoaded {
                    CardTitleView(state: CardTitleViewState(number: state.number, name: state.name))
                
                    Section {
                        StatRowView(name: "accuracy", value: String(state.accuracy))
                        StatRowView(name: "accuracy", value: String(state.power))
                        StatRowView(name: "accuracy", value: String(state.pp))
                        StatRowView(name: "accuracy", value: String(state.priority))
                        StatRowView(name: "accuracy", value: state.type)
                    }
                    .padding()
                    .background(.secondary)
                    .cornerRadius(20)
                
                    Section {
                        DisclosureGroup("LearnedByPokemon") {
                            ForEach(state.learnedByPokemon, id: \.url) { row in
                                RowView(state: RowViewState(url: row.url, name: row.name.capitalized, rowType: .pokemon,
                                                            imageLocation: .pokemonIcon, imgName: row.name,
                                                            showToast: state.$showToast, toastLabel: state.$toastLabel,
                                                            isFav: state.isFavourite(name: row.name)))
                                .padding()
                                Divider()
                            } // EACH
                        } // DISGROUP
                        .padding()
                    } // SECTION
                
                    Section {
                        ForEach(state.effects, id: \.effect) { entry in
                            Text("Effect")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("\(entry.effect)")
                        
                            Text("Short effect")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("\(entry.shortEffect ?? "Doesnt have short effect.")")
                            Divider()
                        } // EACH
                        .padding()
                    } // SECTION
                
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

struct MoveScene_Previews: PreviewProvider {
    static var previews: some View {
        MoveScene(state: MoveSceneState(url: ""))
    }
}
