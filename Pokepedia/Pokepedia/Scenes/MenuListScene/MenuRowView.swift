//
//  MenuRow.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import SwiftUI

struct MenuRowView: View {
    let url: String
    let name: String
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("# \(number)")
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                    Text(name)
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                } // HSTACK
            } // VSTACK
            Spacer()
        } // HSTACK
        .padding(10)
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(url: "https://pokeapi.co/api/v2/move/1/", name: "NAME")
    }
}
