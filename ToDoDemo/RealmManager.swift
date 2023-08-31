//
//  RealmManager.swift
//  ToDoDemo
//
//  Created by Melis Alsan on 30.07.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init () {
        openRealm()
        getTasks()
        
    }
    
    
    func openRealm() {
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
            
        } catch {
            print("error opening realm babes: \(error)")
        }
        
        
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed" : false] as [String : Any])
                    
                    localRealm.add(newTask)
                    
                    getTasks()
                    
                    print("Added new task to realm: \(newTask), \(newTask.id)")
                    
                }
            } catch {
                print("Error adding task to Realm hun: \(error)")
            }
        }
    }
    
    func getTasks() {
        
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            
            tasks = []
            
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    
    func updateTask(id: ObjectId, completed: Bool ) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    
                    getTasks()
                    
                    print("Updated tasks baby with id \(id)! completed status: \(completed)")
                }
            } catch {
                print("error updating task hun \(id) to Realm: \(error)")
            }
            
            
        }
    }
    
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    
                    print("deleted task with id \(id)")
                }
                
            } catch {
                print("error deleting task hun \(id) from Realm: \(error)")
            }
            
            
        }
    }
}

