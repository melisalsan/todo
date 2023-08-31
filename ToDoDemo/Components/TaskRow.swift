//
//  TaskRow.swift
//  ToDoDemo
//
//  Created by Melis Alsan on 30.07.2023.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    
    
    var body: some View {
        
        HStack(spacing: 7) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            
            Text(task)
            
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do laundry", completed: true)
    }
}
