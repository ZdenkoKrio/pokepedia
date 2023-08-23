//
//  CardTitleView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct CardTitleView: View {
    let state: CardTitleViewState
    
    var body: some View {
        HStack {
            Text("#\(state.number)")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            //Spacer()
            Text(state.name)
                .fontWeight(.bold)
                .font(.system(size: 30))
        } // HSTACK
    }
}

struct CardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CardTitleView(state: CardTitleViewState(number: 4, name: "Charmander"))
    }
}
