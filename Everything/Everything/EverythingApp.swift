//
//  EverythingApp.swift
//  Everything
//
//  Created by Patrick McGonigle on 4/18/24.
//

import SwiftUI
import SwiftData

@main
struct EverythingApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Bucket.self, Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
            // Global theme settings here
                .foregroundColor(.black)
        }
        .modelContainer(sharedModelContainer)
    }
}
