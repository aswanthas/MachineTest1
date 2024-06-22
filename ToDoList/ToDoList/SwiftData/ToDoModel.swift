//
//  ToDoModel.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//

import Foundation
import SwiftData

@Model
class ToDoModel: Identifiable {
    let id: UUID
    var name: String
    var isCompleted: Bool
    init(id: UUID = UUID(), name: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.isCompleted = isCompleted
    }
}
