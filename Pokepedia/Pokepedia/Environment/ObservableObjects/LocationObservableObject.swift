//
//  LocationObservableObject.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 11.09.2023.
//

import Foundation

final class LocationObservableObject: ObservableObject {
    @Published var location: Location?
    
    private let locationService: LocationService
    
    init(locationService: LocationService, location: Location? = nil) {
        self.locationService = locationService
        self.location = location
    }
    
    @MainActor
    func loadData(number: Int) async {
        do {
            self.location = try await locationService.location(number: number)
        } catch {
            print("\(ObservableObjectError.evolutionChain) : \(error)")
        }
    }
}
