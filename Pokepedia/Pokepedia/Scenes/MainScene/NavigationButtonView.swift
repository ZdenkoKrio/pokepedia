//
//  NavigationButton.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct NavigationButtonView: View {
    let name: String
    
    var body: some View {
        Text("\(name)")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 120, height: 50)
            .background(Color.blue)
            .cornerRadius(20)
            .padding()
    }
}

struct NavigationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonView(name: "Pokemons")
    }
}
