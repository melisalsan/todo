//
//  AddTaskView.swift
//  ToDoDemo
//
//  Created by Melis Alsan on 30.07.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    
    
    @State private var title: String = ""
    var body: some View {
        
        VStack (alignment: .leading, spacing: 20 ) {
            Text("Create a new task")
                .bold()
                .font(.title3)
                .frame(maxWidth: .infinity,  alignment: .leading)
            
            TextField("Enter your task here", text: $title )
                .textFieldStyle(.roundedBorder)
            
            Button{
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                   
                }
                dismiss()
                
            } label: {
                Text("Add Task")
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                    .padding()
                    .frame(maxWidth: .infinity)
                
            }
            
            Spacer()
            
            
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .foregroundColor(.white)

    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
