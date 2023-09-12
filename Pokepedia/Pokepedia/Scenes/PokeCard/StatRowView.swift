//
//  StatRowView.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 12.09.2023.
//

import SwiftUI

struct StatRowView: View {
    let name: String
    let value: String
    
    var body: some View {
        HStack {
            Text(name.capitalized)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(value)")
                .font(.title2)
                .fontWeight(.bold)
        } // HSTACK
        .padding(5)
    }
}

struct StatRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatRowView(name: "HP", value: "222")
    }
}
