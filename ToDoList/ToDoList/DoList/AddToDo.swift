//
//  AddToDoSheet.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//

import SwiftUI

struct AddToDoSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @State private var title: String = ""
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
            }
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // save
                        let remiderData = ToDoModel(name: title)
                        context.insert(remiderData)
                        // Assuming context.save() is necessary to persist the data
                        do {
                            try context.save()
                        } catch {
                            // Handle the error appropriately in your app
                            print("Failed to save Todo: \(error.localizedDescription)")
                        }
                        dismiss()
                    }
                }
            })
        }
    }
}

