//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 05/08/24.
//

import SwiftUI

@main
struct RecipeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
