//
//  TypesView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct TypesView: View {
    let types: [PossibleTypes]
    
    var body: some View {
        ScrollView([.horizontal]) {
            HStack {
                ForEach(types) { type in
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
        TypesView(types: [.fire, .fire, .grass, .water])
    }
}
