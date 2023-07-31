//
//  CardTitleView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct CardTitleView: View {
    let number: Int
    let name: String
    
    var body: some View {
        HStack {
            Text("#\(number)")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .padding()
            //Spacer()
            Text(name)
                .fontWeight(.bold)
                .font(.system(size: 30))
        } // HSTACK
    }
}

struct CardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CardTitleView(number: 4, name: "Charmander")
    }
}
