//
//  TaskListView.swift
//  ToDo App SwiftUI
//
//  Created by Kerolos on 25/08/2025.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [Task]   // auto-updates when data changes
    
    @StateObject private var taskVM = TaskViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Input Field
                HStack {
                    TextField("Enter new task", text: $taskVM.newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button {
                        taskVM.addTask(context: context)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.blue)
                    }
                    .disabled(taskVM.newTaskTitle.isEmpty)
                }
                .padding()
                
                // Task List
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(task.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    taskVM.toggleTask(task, context: context)
                                }
                            
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .black)
                                .foregroundStyle(task.isCompleted ? .secondary : .primary)
                        }
                    }
                   
                }
                .listStyle(.insetGrouped)

            }
            .navigationTitle("To-Do List ✅")
        }
    }
}

#Preview {
    TaskListView()
        .modelContainer(for: Task.self)   // Needed for SwiftData preview
}
