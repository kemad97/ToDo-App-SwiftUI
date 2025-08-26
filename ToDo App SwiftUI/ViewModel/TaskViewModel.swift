//
//  TaskViewModel.swift
//  ToDo App SwiftUI
//
//  Created by Kerolos on 25/08/2025.
//

import Foundation
import SwiftData

@MainActor
class TaskViewModel : ObservableObject {
    @Published var newTaskTitle : String = ""
    @Published var newTaskDescription : String = ""
    
    
    
    func addTask (context : ModelContext){
        guard  !newTaskTitle.isEmpty else {return}
        //guard  !newTaskDescription.isEmpty else {return}
        let task = Task(title:newTaskTitle , isCompleted: false)
        context.insert(task)
        newTaskTitle = ""
       // try?context.save()
        
    }
    
    func toggleTask(_ task: Task, context: ModelContext) {
        task.isCompleted.toggle()
        //try?context.save()
        
    }
    
}
