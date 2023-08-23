//
//  EvolveScene.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 02.08.2023.
//

import SwiftUI

struct EvolveScene: View {
    let state: EvolveSceneState
    
    var body: some View {
        Text("EVOLVS")
    }
}

struct EvolveScene_Previews: PreviewProvider {
    static var previews: some View {
        EvolveScene(state: EvolveSceneState())
    }
}
