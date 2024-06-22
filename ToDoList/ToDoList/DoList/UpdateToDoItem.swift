//
//  UpdateToDoSheet.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//

import SwiftUI
struct UpdateToDoSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var data: ToDoModel
    var body: some View {
        NavigationStack {
            Form {
                TextField("Todo Name", text: $data.name)
                Toggle("Completed", isOn: $data.isCompleted)
            }
            .navigationTitle("Update Todo")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            })
        }
    }
}


