//
//  EvolutionButtonView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct EvolutionButtonView: View {
    var body: some View {
        Image("evolve")
            .resizable()
            .frame(width: 60, height: 80)
    }
}

struct EvolutionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionButtonView()
    }
}
