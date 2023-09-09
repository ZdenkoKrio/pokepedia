//
//  MainScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct MainScene: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack {
            ZStack {
                HStack {
                    VStack {
                        NavigationLink(destination: coordinator.pokeListScene) {
                            NavigationButtonView(name: "Pokemons")
                        } // LINK
                        NavigationLink(destination: coordinator.pokeListScene) {
                            NavigationButtonView(name: "Moves")
                        } // LINK
                        NavigationLink(destination: coordinator.pokeListScene) {
                            NavigationButtonView(name: "Types")
                        } // LINK
                        Spacer()
                    } // VSTACK
                    .frame(width: 135, height: 300)
                    Spacer()
                } // HSTACK
                
                VStack {
                    Image("pokemon")
                        .resizable()
                        .frame(height: 130)
                        .padding()
                    HStack {
                        
                        Spacer()
                        Image("ash")
                            .resizable()
                            .frame(width: 290)
                            .padding()
                    } // HSTACK
                    Spacer()
                } // VSTACK
            } // ZSTACK
        } // NAVIGATION
    }
}

struct MainScene_Previews: PreviewProvider {
    static var previews: some View {
        MainScene()
            .injectPreviewsEnvironment()
    }
}
