//
//  LocationSceneState.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import SwiftUI

struct LocationSceneState: DynamicProperty {
    @EnvironmentObject private var locationObject: LocationObservableObject
    
    let url: String
    
    var location: Location? {
        locationObject.location
    }
    
    var number: Int {
        Int(url.split(separator: "/")[5]) ?? 1
    }
    
    var region: String {
        location?.region.name ?? "unknown"
    }
    
    var name: String {
        location?.name ?? ""
    }
    
    func fetch() async {
       await locationObject.loadData(number: number)
    }
    
    var isLoaded: Bool {
        location != nil
    }
}
