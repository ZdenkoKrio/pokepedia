//
//  FilterScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 10.09.2023.
//

import SwiftUI
import SimpleToast

struct FilterScene: View {
    let state: FilterSceneState
    
    var body: some View {
        VStack {
            Button("Filters disabled") {
                state.toastLabel = "Loading all pokemons"
                state.showToast.toggle()
                Task {
                    await state.fetchPokemon()
                }
            }
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 200, height: 30)
            .padding(10)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            
            Text("Regions")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.vertical) {
                Grid {
                    ForEach(0...(state.regions.count / 3), id: \.self) { number in
                        GridRow {
                            ForEach((number * 3)...min(number * 3 + 2, state.regions.count - 1), id: \.self) { num in
                                Button("\(state.regions[num].name)") {
                                    state.toastLabel = "Loading \(state.regions[num].name) region pokemons"
                                    state.showToast.toggle()
                                    Task {
                                        await state.fetchRegionPokemons(region: state.regions[num].url)
                                    }
                                } // BUTTON
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 30)
                                .padding(5)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                            } // FOREACH
                        } // ROW
                    }
                } // GRID
                .padding()
            } // SCROLL
            .frame(height: 200)
            
            Text("Types")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.vertical) {
                Grid {
                    ForEach(0...(state.types.count / 3), id: \.self) { number in
                        GridRow {
                            ForEach((number * 3)...min(number * 3 + 2, state.types.count - 1), id: \.self) { num in
                                Button("\(state.types[num].name)") {
                                    state.toastLabel = "Loading \(state.types[num].name) type pokemons"
                                    state.showToast.toggle()
                                    Task {
                                        await state.fetchTypePokemons(type: state.types[num].url)
                                    }
                                } // BUTTON
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 30)
                                .padding(5)
                                .background(Color(state.types[num].name).cornerRadius(10))
                                .foregroundColor(.black)
                                .border(Color("Dark_\(state.types[num].name)"), width: 6)
                                .cornerRadius(20)
                            } // FOREACH
                        } // ROW
                    }
                } // GRID
                .padding()
            } // SCROLL
        } // VSTASCK
        .padding()
        .simpleToast(isPresented: state.$showToast, options: state.toastOptions) {
            Spacer()
            Label(state.toastLabel, systemImage: "")
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .padding(.bottom)
        } // TOAST
    }
}

struct FilterScene_Previews: PreviewProvider {
    static var previews: some View {
        FilterScene(state: FilterSceneState(showFilters: .constant(true), rows: .constant([]), regions: ListData.mockTypes.results, types: ListData.mockTypes.results))
    }
}
