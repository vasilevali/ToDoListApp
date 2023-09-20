//
//  TaskModel.swift
//  ToDoListApp
//
//  Created by Ilya Gavrilov on 05.08.2023.
//

import Foundation
import UIKit

struct TaskModel {
    let name: String
    let description: String?
    let executionAt: Date?
//    let executionAt: String?
    let priority: TaskPriority?
}
