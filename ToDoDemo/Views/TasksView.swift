//
//  TasksView.swift
//  ToDoDemo
//
//  Created by Melis Alsan on 30.07.2023.
//

import SwiftUI

struct TasksView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Mel's Todo's")
                .font(.title2)
                .bold()
            
            Text("Yeter hadi kalk da çalış .)")
            
            List {
                ForEach(realmManager.tasks , id: \.id) {
                    task in
                    
                    if !task.isInvalidated {
                        
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                    }
        
                        
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            .ignoresSafeArea()
           
         
          
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .preferredColorScheme(.dark)
        
        
        
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
