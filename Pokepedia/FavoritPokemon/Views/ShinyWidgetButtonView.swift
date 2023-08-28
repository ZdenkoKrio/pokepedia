//
//  ShinyButton.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 28.08.2023.
//

import SwiftUI

struct ShinyWidgetButtonView: View {
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


 struct ShinyWidgetButtonView_Previews: PreviewProvider {
 
 static var previews: some View {
     ShinyButtonView(state: ShinyButtonViewState(shiny: .constant(true)))
 }
 }
 

