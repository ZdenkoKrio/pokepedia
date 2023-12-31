//
//  ShinyButtonView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 31.07.2023.
//

import SwiftUI

struct ShinyButtonView: View {
    let state: ShinyButtonViewState
    
    var body: some View {
        Button(state.shiny ? "Normal" : "Shiny") {state.shiny.toggle()}
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 80, height: 40)
            .background(Color.yellow)
            .cornerRadius(15)
            .padding()
    }
         
}


 struct ShinyButtonView_Previews: PreviewProvider {
 
 static var previews: some View {
     ShinyButtonView(state: ShinyButtonViewState(shiny: .constant(true)))
 }
 }
 
