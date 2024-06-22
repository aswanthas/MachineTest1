//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: ToDoModel.self)
        } catch {
            fatalError("Failed to create ModelContainer for ToDoModel.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DoToViewModel(modelContext: container.mainContext))
                .modelContainer(container)
        }
    }
}
