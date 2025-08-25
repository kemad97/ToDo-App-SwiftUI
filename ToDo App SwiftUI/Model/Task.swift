//
//  Task.swift
//  ToDo App SwiftUI
//
//  Created by Kerolos on 25/08/2025.
//

import Foundation
import SwiftData

@Model
class Task {
    var id: UUID
    var title: String
    var isCompleted: Bool
    
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
