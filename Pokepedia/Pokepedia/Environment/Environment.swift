//
//  Environment.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 22.08.2023.
//

import SwiftUI

private struct Environment: ViewModifier {
    let objects: ObservableObjects
    let coordinator: Coordinator

    func body(content: Content) -> some View {
        content
            .environmentObject(objects.menuList)
            .environmentObject(objects.pokemon)
            .environmentObject(objects.species)
            .environmentObject(objects.evolutionChain)
            .environmentObject(objects.type)
            .environmentObject(objects.generation)
            .environmentObject(objects.move)
            .environmentObject(objects.item)
            .environmentObject(objects.location)
            .environmentObject(coordinator)
    }
}

extension View {
    func inject(objects: ObservableObjects, coordinator: Coordinator) -> some View {
        modifier(Environment(objects: objects, coordinator: coordinator))
    }

    func injectPreviewsEnvironment() -> some View {
        modifier(Environment(objects: .mock, coordinator: Coordinator()))
    }
}

