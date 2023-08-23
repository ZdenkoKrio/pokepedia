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
        ScrollView([.horizontal]) {
            HStack {
                ForEach(state.types) { type in
                    Text(type.rawValue)
                        .fontWeight(.bold)
                        .padding(5)
                        .background(Color(type.rawValue))
                        .clipShape(Capsule())
                } // FOREACH
            } // HSTACK
        } // SCROLL
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        TypesView(state: TypesViewState(types: [.fire, .fire, .grass, .water]))
    }
}
