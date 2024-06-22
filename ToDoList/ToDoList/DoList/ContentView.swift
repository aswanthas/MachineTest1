//
//  ContentView.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var isShowItemSheet: Bool = false
    @State private var editToDo: ToDoModel?
    @Query var data: [ToDoModel]
    var body: some View {
        NavigationStack {
            List {
                ForEach(data) { item in
                    ToDoListCell(data: item)
                        .onTapGesture(perform: {
                            editToDo = item
                        })
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(data[index])
                    }
                })
            }
            .navigationTitle("ToDoList")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowItemSheet, content: {
                AddToDoSheet()
            })
            .sheet(item: $editToDo, content: { item in
                UpdateToDoSheet(data: item)
            })
            .toolbar {
                if !data.isEmpty {
                    Button("Add Task", systemImage: "plus") {
                        isShowItemSheet = true
                    }
                }
            }
            .overlay {
                if data.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Todo",
                              systemImage: "list.bullet.rectangle.portrait.fill")
                    }, description: {
                        Text("Start adding your Todo")
                    }, actions: {
                        Button("Add") {
                            isShowItemSheet = true
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
