//
//  DoToViewModel.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
final class DoToViewModel: ObservableObject {
    
    var modelContext: ModelContext?
    
    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
    }
    
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers() async {
    }
    // Fetch reminders asynchronously

}
enum UserError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case failedToFetchData
    case failedToAddToDo
    case failedToRemoveToDo
    case failedToUpdateToDo
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid data"
        case .failedToFetchData:
            return "Failed to fetch reminders."
        case .failedToAddToDo:
            return "Failed to add reminder."
        case .failedToRemoveToDo:
            return "Failed to delete reminder."
        case .failedToUpdateToDo:
            return "Failed to update reminder"
        case .custom(let error):
            return error.localizedDescription
        }
    }
}

// MARK: Tried data manage
/*
 Currently this project data is fully Handled by view and SWiftData and it container directly
 */
class ToDoListViewModel: ObservableObject {
    @Published var todos: [ToDoModel] = []
    
    // Inject any necessary dependencies (e.g., API service, data storage context)
    // You can also use @EnvironmentObject for injecting these dependencies
    
    func fetchTodosIfNeeded() {
        // Check if SwiftData is empty
        if todos.isEmpty {
            // Call API to fetch todos
            fetchTodosFromAPI()
        } else {
            // SwiftData already has todos, no need to fetch from API
        }
    }
    
    private func fetchTodosFromAPI() {
        // Simulated API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Mock data
            let mockTodos = [
                ToDoModel(id: UUID(), name: "Task 1"),
                ToDoModel(id: UUID(), name: "Task 2"),
                ToDoModel(id: UUID(), name: "Task 3")
            ]
            self.todos = mockTodos
        }
    }
    
    func saveTodo(name: String) {
        let newTodo = ToDoModel(name: name)
        todos.append(newTodo)
        saveTodos()
    }
    
    func updateTodo(todo: ToDoModel) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
            saveTodos()
        }
    }
    
    func deleteTodo(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
        saveTodos()
    }
    
    private func saveTodos() {
        // Save to SwiftData or Core Data context
        // Example with SwiftData:
        // SwiftData.save(todos, forKey: "todos")
    }
}
