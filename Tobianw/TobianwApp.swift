//
//  TobianwApp.swift
//  Tobianw
//
//  Created by Holger Krupp on 26.05.24.
//

import SwiftUI
import SwiftData

@main
struct TobianApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Song.self,
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
        }
        .modelContainer(sharedModelContainer)
    }
}
