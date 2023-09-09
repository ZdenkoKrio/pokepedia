//
//  TypesView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct TypesView: View {
    let state: TypesViewState
    
    var body: some View {
        HStack {
            ForEach(Array(state.types.enumerated()), id: \.element) { index, type in
                Button("\(type.rawValue)") {
                    state.setBackground(num: index)
                } // BUTTON
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color(type.rawValue).cornerRadius(20))
                    .foregroundColor(.white)
                    .border(Color("Dark_\(type.rawValue)"), width: 4)
                    .cornerRadius(20)
            } // FOREACH
        } // HSTACK
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(state: TypesViewState(backgroundNumber: .constant(0), types: [.fire, .fire, .grass, .water]))
    }
}
