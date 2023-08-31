//
//  ContentView.swift
//  ToDoDemo
//
//  Created by Melis Alsan on 30.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
           
            TasksView()
                .environmentObject(realmManager)
            
         
            
            SmallAddButton()
                .padding(.horizontal)
                .onTapGesture {
                    showAddTaskView.toggle()
                    
                }
            
            
        }
        .sheet(isPresented: $showAddTaskView){
            AddTaskView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding()
        .foregroundColor(.white)
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
