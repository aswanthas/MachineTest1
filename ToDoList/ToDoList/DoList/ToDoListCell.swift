//
//  ToDoListCell.swift
//  ToDoList
//
//  Created by Aswanth K on 22/06/24.
//

import SwiftUI

struct ToDoListCell: View {
    var data: ToDoModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.headline)
                Text("Priority")
                    .font(.subheadline)
            }
            Spacer()
            
            if data.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    ToDoListCell(data: ToDoModel(name: "jj", isCompleted: false))
}
